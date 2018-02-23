clear all 
close all 
clc 

%% Le but étant ici d'explorer, a travers les données de Temperature du projet
% Occiput, la capacité à représenter, par le modéle, la variabilité naturelle et
% les limite de cette capacités avec l'utilisation des 50 membres du
% modèle.

%Pour cela :
% - On charge les données.
% - On filtre les nan
% - On entraine un modele de classification de profil (PCM) avec un certain
% nombre de classe ( basée sur un GMM)
% - On normalise les Temperature, calcul les percentile a 50% et +/- 1
% sigma
% - On calcul un histogramme des temperature en fct des profondeur et on y
% représente les percentiles et le profil in situ pour comparaison.

%% load data

ncdisp('ORCA025.L75-OCCITENS.y2014m06_EDWregion.nc') ;

depth = ncread('ORCA025.L75-OCCITENS.y2014m06_EDWregion.nc','DEPTH') ;
t_insitu = ncread('ORCA025.L75-OCCITENS.y2014m06_EDWregion.nc','TEMP') ;

lat = ncread('ORCA025.L75-OCCITENS.y2014m06_EDWregion.nc','LATITUDE') ;
lon = ncread('ORCA025.L75-OCCITENS.y2014m06_EDWregion.nc','LONGITUDE') ;

t_model=ncread('ORCA025.L75-OCCITENS.y2014m06_EDWregion.nc','POTM_Hx') ;


%% on prévisualise les données

nbr = 50 ; % nombre de membre

plot(lon,lat,'o'); grid on 

figure
plot(t_insitu(:,:,1),-depth) ; grid on % plot de l'emsemble des profil in situ

% choix du point de la grille
l=400 ;

for i = 1:nbr 
plot(t_model(:,l,i),-depth(:,l)); grid on;  hold on 
end

%% on rajoute les fonction de PCM ete retire les nan

addpath(fullfile('pcm','matlab','src'));
addpath(fullfile('pcm','matlab','lib','netlab3_3'));

% on filtre les nan dans les temperature et profondeur
t_modelc = t_model(:,l,:) ;
ind = isnan(t_modelc) ;
t_modeln = t_modelc(ind==0) ;
t_modeln = reshape(t_modeln,length(t_modeln)/nbr,nbr) ; 


t_insituc = t_insitu(:,l,:) ;
ind = isnan(t_insituc) ; 
t_insitun = t_insituc(ind==0) ;
t_insitun = reshape(t_insitun,length(t_insitun)/nbr,nbr) ; 


inddpt= isnan(depth(:,l));
depthnan = depth(inddpt==0,l) ;


%% PCM training

K = 3; % Number of class to fit
PCM = pcmtrain(t_modeln, K, 'full', depthnan, 'maxvar',0.9);
% 'full' defines the Gaussian class covariance matrix shape
% 'maxvar'=inf is the maximum variance to be retained during compression step, it is an option and 
%	is used here only because we have random data hard to reduce

% on recupère les activation pour les weight
[prob lab acti] = pcmpredict(PCM, depthnan, t_modeln);

% normalise les temperatures
tnorm = (t_modeln-repmat(PCM.X_ave,1,50))./PCM.X_std ;
t_insitunorm = (t_insitun-repmat(PCM.X_ave,1,50))./PCM.X_std ;


% percentile
prcentil = pcmprctile(PCM,depthnan,tnorm,50,'WEIGHT',acti) ;
spread1= pcmprctile(PCM,depthnan,tnorm,15.86,'WEIGHT',acti) ;
spread2= pcmprctile(PCM,depthnan,tnorm,84.13,'WEIGHT',acti) ;


% calcul du spread
spread = spread2-spread1 ;
maxspread = squeeze(prcentil(:,1,:))+spread ;
minspread = squeeze(prcentil(:,1,:))-spread ;
 

%% plot de l'histogramme en fonction des profondeurs avec la médianne des
% classe et le spread pour 1 sigma.

figure
for i = 1:1:length(depthnan)
    counts = histogram(tnorm(i,:),-3:0.2:5); 
    nbcount(i,:)=counts.Values ;
    
end

figure
pcolor(-2.9:0.2:4.9,-depthnan, nbcount) ; colorbar
xlabel('temperature'); ylabel('depth')
shading interp
hold on 
plot(squeeze(prcentil),-depthnan,'k','linewidth',1); grid on ; hold on 
plot(squeeze(spread1),-depthnan,'m',squeeze(spread2),-depthnan,'r')

plot(t_insitunorm(:,1),-depthnan,'w','linewidth',2) ;

