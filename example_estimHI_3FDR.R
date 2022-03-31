## This is an example of use of the estimHI_3FDR function

library(MCSPCD)

data(data_MCSPCD_3FDR)

## Estimation of health indicators with 3 binary risk factors :
W0 <- estimHI_3FDR(t=2040,         # year of projections                   
                   intervention=0,  # this is the scenario without intervention     
                   year_intervention=2020, # year of intervention, not used in this case            
                   nb_people=10000,        # we draw a sample of 10000 subjects            
                   data_pop=pop,           # the number of people in the studied population            
                   gender="W",             # we study the population of woman        
                   data_a01_values=a01_constant_values, # dementia incidence
                   data_a02_values=a02_constant_values, # mortality
                   data_theta01_1_values=theta01_HTA,   # RR (relative risk) of high blood pressure on dementia
                   data_theta01_2_values=theta01_DIAB,  # RR of diabetes on dementia
                   data_theta01_3_values=theta01_INACT, # RR of physical inactivity on dementia
                   data_theta02_1_values=theta02_HTA,   # RR of high blood pressure on mortality for people without dementia
                   data_theta02_2_values=theta02_DIAB,  # RR of diabetes on mortality for people without dementia       
                   data_theta02_3_values=theta02_INACT, # RR of physical inactivity on mortality for people without dementia
                   data_theta12_1_values=theta12_HTA,   # RR of high blood pressure on mortality for people with dementia
                   data_theta12_2_values=theta12_DIAB,  # RR of diabetes on mortality for people with dementia         
                   data_theta12_3_values=theta12_INACT, # RR of physical inactivity on mortality for people with dementia
                   data_prev_0_values=prev_0_values # prevalence of the HTA-/DIAB-/INACT- status at 65 years old
                   data_prev_1_values=prev_1_values # prevalence of the HTA+/DIAB-/INACT- status at 65 years old
                   data_prev_2_values=prev_2_values # prevalence of the HTA-/DIAB+/INACT- status at 65 years old
                   data_prev_3_values=prev_3_values # prevalence of the HTA-/DIAB-/INACT+ status at 65 years old
                   data_prev_4_values=prev_4_values # prevalence of the HTA+/DIAB+/INACT- status at 65 years old
                   data_prev_5_values=prev_5_values # prevalence of the HTA+/DIAB-/INACT+ status at 65 years old
                   data_prev_6_values=prev_6_values # prevalence of the HTA-/DIAB+/INACT+ status at 65 years old
                   data_prev_7_values=prev_7_values # prevalence of the HTA+/DIAB+/INACT+ status at 65 years old
                   data_incid_0_values=NULL,
		   data_incid_1_values=NULL,
                   data_incid_3_values=NULL,
                   data_incid_5_values=NULL,
                   incid_global=incid_glob,  # incidence of diabetes                  
                   theta1=theta1_F,          # RR of high blood pressure on diabetes
                   theta3=theta3_F,          # RR of physical inactivity on diabetes
                   data_rr_DvsND_values=rr_DvsND_values)  ## RR of dementia on mortality    



## Evaluation of the variability of these estimates :
## The variability is assessed with 100 Monte-Carlo draws of the parameters. The 100 set of parameters are included in the data_MCSPCD_3FDR data. 


library(doParallel)  
clustpar <- parallel::makeCluster(50) 
registerDoParallel(clustpar) # we use parallel computation on 50 cores
library(foreach)

IC_W0 <- foreach(it=1:100,.combine=cbind,.errorhandling="pass",.packages="MCSPCD") %dopar% {
    data(data_MCSPCD_3FDR)

    estimHI_3FDR(t=2040,                           
		 intervention=0,        
		 year_intervention=2020,           
		 nb_people=10000,                  
		 data_pop=pop,                     
		 gender="W",                      
		 data_a01_values=a01_constant[c((1+40*(it-1)):(40*it),4000+(1+40*(it-1)):(40*it)),],            
		 data_a02_values=a02_constant[c((1+40*(it-1)):(40*it),4000+(1+40*(it-1)):(40*it)),],            
		 data_theta01_1_values=theta01_HTA_var[c((1+41*(it-1)):(41*it),4100+(1+41*(it-1)):(41*it)),],   
		 data_theta01_2_values=theta01_DIAB_var[c((1+41*(it-1)):(41*it),4100+(1+41*(it-1)):(41*it)),],  
		 data_theta01_3_values=theta01_INACT_var[c((1+41*(it-1)):(41*it),4100+(1+41*(it-1)):(41*it)),], 
		 data_theta02_1_values=theta02_HTA_var[c((1+41*(it-1)):(41*it),4100+(1+41*(it-1)):(41*it)),],   
		 data_theta02_2_values=theta02_DIAB_var[c((1+41*(it-1)):(41*it),4100+(1+41*(it-1)):(41*it)),],  
		 data_theta02_3_values=theta02_INACT_var[c((1+41*(it-1)):(41*it),4100+(1+41*(it-1)):(41*it)),], 
		 data_theta12_1_values=theta12_HTA_var[c((1+41*(it-1)):(41*it),4100+(1+41*(it-1)):(41*it)),],   
		 data_theta12_2_values=theta12_DIAB_var[c((1+41*(it-1)):(41*it),4100+(1+41*(it-1)):(41*it)),],  
		 data_theta12_3_values=theta12_INACT_var[c((1+41*(it-1)):(41*it),4100+(1+41*(it-1)):(41*it)),], 
		 data_prev_0_values=prev0[(1+82*(it-1)):(82*it),],
		 data_prev_1_values=prev1[(1+82*(it-1)):(82*it),],
		 data_prev_2_values=prev2[(1+82*(it-1)):(82*it),],
		 data_prev_3_values=prev3[(1+82*(it-1)):(82*it),],
		 data_prev_4_values=prev4[(1+82*(it-1)):(82*it),],
		 data_prev_5_values=prev5[(1+82*(it-1)):(82*it),],
		 data_prev_6_values=prev6[(1+82*(it-1)):(82*it),],
		 data_prev_7_values=prev7[(1+82*(it-1)):(82*it),],
		 incid_global=incid_glob_var[c((1+40*(it-1)):(40*it),4000+(1+40*(it-1)):(40*it)),],
		 theta1=theta1_F_var[it],  
		 theta3=theta3_F_var[it],  
		 data_rr_DvsND_values=rr_DvsND[c((1+40*(it-1)):(40*it),4000+(1+40*(it-1)):(40*it)),])
}




## Results :

## Function to get some indicators returned by the estimHI_3FDR function :
resultsIC <- function(res,resIC)
{
    results <- function(x)
    {
        return(c(round(x$list_prevalence_disease$number_prevalence[1]),
                 x$list_survival$number_survival,
                 x$list_prevalence_disease$prev_rate_disease[1]*100,
                 x$ll_prob_disease[1]*100,
                 x$list_LE_without_disease$life_expectancy_w_dis[1,2],
                 x$average_age_disease[1],
                 x$list_number_years_disease$number_years_disease[1,2],
                 x$list_overall_LE$life_expectancy[1,2],
                 x$average_age_incident[1]))
    }
    
    res1 <- results(res)
    resn <- apply(resIC,2,results)
    
    se <- apply(resn,1,sd)
    binf <- res1 - 1.96*se
    bsup <- res1 + 1.96*se

    z <- cbind(res1,binf,bsup)
    print(xtable(z,digits=matrix(rep(c(0,0,2,2,2,2,2,2,2),4),9,4)))
}
## Function to plot the prevalence rate and its point by point confidence intervals :
plotIC <- function(res,resIC,add=FALSE,col=1,main="",lty=1)
{
    prev1 <- res$list_prevalence_disease$prev_rate_disease_age[,2]
    if(!missing(resIC)){
    prevn <- apply(resIC,2,function(x){return(x[5][[1]][[3]][,2])})
    
    se <- apply(prevn,1,sd)
    binf <- prev1 - 1.96*se
    bsup <- prev1 + 1.96*se
    }
    rgbcol <- col2rgb(col)/255
    color <- rgb(rgbcol[1],rgbcol[2],rgbcol[3],alpha=0.15)

    if(add==FALSE) {
        plot(res$list_prevalence_disease$prev_rate_disease_age[,1],prev1*100,type="l",col=col,lwd=2,main=main,xlab="age",ylab="prevalence (%)",ylim=c(0,100),lty=lty)
    } else {
        lines(res$list_prevalence_disease$prev_rate_disease_age[,1],res$list_prevalence_disease$prev_rate_disease_age[,2]*100,col=col,lwd=2,lty=lty)       
    }
    if(!missing(resIC)){
        polygon(x=c(66:99,99:66),y=c(binf,rev(bsup))*100,border=NA,col=color)
    }
}

## Results for the woman population, without intervention :
resultsIC(W0, IC_W0)
plotIC(W0, IC_W0, main="Women without intervention")




