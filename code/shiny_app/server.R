
library(shiny)

shinyServer( function(input, output, session) {
  #Dynamic UI
  output$data_in <- renderUI({
    output <- tagList()
    output [[1]] <- sliderInput("param2", label = "Gov Bonds (\\( i \\))"  ,
                min = 0.001, max = 0.2, value = gov_bonds_so)
    output [[2]] <- sliderInput("param2_1", label = "SD = ",
                min = 0.0000001, max = 0.4 * gov_bonds_so, value = 0.1 * gov_bonds_so)
    output [[3]] <- sliderInput("param3", label = "Inflation (\\( \\pi \\) ) = ",
                min = 0.001, max = 0.2, value = inflation_so)
    output [[4]] <- sliderInput("param3_1", label = "SD = ",
                min = 0.0000001, max = 0.4 * inflation_so, value = 0.1 * inflation_so)
    output [[5]] <- sliderInput("param4", label = "Agri Wages (\\( w_{ag} \\))",
                min = wage_ag_so / 2, max = 2 * wage_ag_so, value = wage_ag_so)
    output [[6]] <- sliderInput("param4_1", label = "SD = ",
                min = 0.0000001* wage_ag_so, max = 1 * wage_ag_so, value = 0.1 * wage_ag_so)
    output [[7]] <- sliderInput("param5", label = "Work-non ag-Wages  (\\( w_{ww} \\))",
                min = wage_ww_so / 2, max = 2 * wage_ww_so, value = wage_ww_so)
    output [[8]] <- sliderInput("param5_1", label = "SD = ",
                min = 0.0000001* wage_ww_so, max = 1 * wage_ww_so, value = 0.1 * wage_ww_so)
    output [[9]] <- sliderInput("param6", label = "Profits se = ",
                min = profits_se_so / 2, max = 2 * profits_se_so, value = profits_se_so)
    output [[10]] <- sliderInput("param6_1", label = "SD = ",
                min = 0.000001* profits_se_so, max = 1 * profits_se_so, value = 0.1 * profits_se_so)
    output [[11]] <- sliderInput("param7", label = "Hours se (>0) = ",
                min = hours_se_cond_so / 2, max = 2 * hours_se_cond_so, value = hours_se_cond_so)
    output [[12]] <- sliderInput("param7_1", label = "SD = ",
                min = 0.000001* hours_se_cond_so, max = 1 * hours_se_cond_so, value = 0.1 * hours_se_cond_so)
  
    output [[13]] <- sliderInput("param8", label = "H_ag = ",
                min = hours_ag_so / 2, max = 2 * hours_ag_so, value = hours_ag_so)
    output [[14]] <- sliderInput("param8_1", label = "SD = ",
                min = 0.000001* hours_ag_so, max = 1 * hours_ag_so, value = 0.1 * hours_ag_so)
    output [[15]] <- sliderInput("param9", label = "H_ww = ",
                min = hours_ww_so / 2, max = 2 * hours_ww_so, value = hours_ww_so)
    output [[16]] <- sliderInput("param9_1", label = "SD = ",
                min = 0.000001* hours_ww_so, max = 1 * hours_ww_so, value = 0.1 * hours_ww_so)
    output [[17]] <- sliderInput("param10", label = "H_se = ",
                min = hours_se_so / 2, max = 2 * hours_se_so, value = hours_se_so)
    output [[18]] <- sliderInput("param10_1", label = "SD = ",
                min = 0.000001* hours_se_so, max = 1 * hours_se_so, value = 0.1 * hours_se_so)
    output [[19]] <- sliderInput("param11", label = "Exchange rate = ",
                min = ex_rate_so / 2, max = 2 * ex_rate_so, value = ex_rate_so)
    output [[20]] <- sliderInput("param11_1", label = "SD = ",
                min = 0.000001* ex_rate_so, max = 1 * ex_rate_so, value = 0.1 * ex_rate_so)
    output [[21]] <- sliderInput("param12", label = "growth = ",
                min = growth_rate_so / 2, max = 2 * growth_rate_so, value = growth_rate_so)
    output [[22]] <- sliderInput("param12_1", label = "SD = ",
                min = 0.000001* growth_rate_so, max = 1 * growth_rate_so, value = 0.1 * growth_rate_so)
    output [[23]] <- sliderInput("param13", label = "Coverage (R) = ",
                min = coverage_so / 2, max = 2 * coverage_so, value = coverage_so)
    output [[24]] <- sliderInput("param13_1", label = "SD = ",
                min = 0.000001* coverage_so, max = 1 * coverage_so, value = 0.1 * coverage_so)
    output [[25]] <- sliderInput("param15", label = "Tax rate = ",
                min = tax_so / 2, max = 2 * tax_so, value = tax_so, step = 0.001)
    output [[26]] <- sliderInput("param15_1", label = "SD = ",
                min = 0.00001* tax_so, max = 1 * tax_so, value = 0.1 * tax_so)
    output [[27]] <- sliderInput("param16", label = "Costs ot T (local $) = ",
                min = unit_cost_local_so / 2, max = 2 * unit_cost_local_so,
                value = unit_cost_local_so, pre = "$", animate = 
                  animationOptions(interval = 3000, loop = TRUE))
    output [[28]] <- sliderInput("param16_1", label = "SD = ",
                min = 0.000001* unit_cost_local_so, max = 1 * unit_cost_local_so, value = 0.1 * unit_cost_local_so)
    output [[29]] <- sliderInput("param17", label = "Years of T = ",
                min = years_of_treat_so / 2, max = 2 * years_of_treat_so, value = years_of_treat_so)
    output [[30]] <- sliderInput("param17_1", label = "SD = ",
                min = 0.000001* years_of_treat_so, max = 1 * years_of_treat_so, value = 0.1 * years_of_treat_so)
    
    withMathJax(
    if (input$policy_est == "Fiscal effects, 2016(W@W) B & C, no ext") {
        lapply( 1:30, function(x) output[[x]] )
    } else if (input$policy_est == "Fiscal effects, 2016(W@W) B & C, yes ext") {
        lapply( 1:30, function(x) output[[x]] )
    } else if (input$policy_est == "Total effects, 2016(W@W) B & C, no ext") {
        lapply( 1:30, function(x) output[[x]] )
    } else if (input$policy_est == "Total effects, 2016(W@W) B & C, yes ext") {
        lapply( 1:30, function(x) output[[x]] )
    } else if (input$policy_est == "Fiscal effects, 2019(KLPS4) B & 2016(W@W) C, no ext") {
        lapply( 1:30, function(x) output[[x]] )
    } else if (input$policy_est == "Total effects, 2019(KLPS4) B & 2016(W@W) C, no ext") {
        lapply( 1:30, function(x) output[[x]] )
    } else if (input$policy_est == "Total effects, 2016(W@W) B & EA C, no ext") {
        lapply( 1:30, function(x) output[[x]] )
    } else if (input$policy_est == "Total effects, 2016(W@W) B & EA C, ext") {
        lapply( 1:30, function(x) output[[x]] )
    } else if (input$policy_est == "Total effects, 2019(KLPS4) B & EA C, no ext") {
        lapply( 1:30, function(x) output[[x]] )
    } else if (input$policy_est == "CEA for total effects, 2019(KLPS4) B & EA C, no ext") {
        lapply( 1:30, function(x) output[[x]] )
    } else if (input$policy_est == "RCEA to cash for total effects, 2019(KLPS4) B & EA C, no ext") {
        lapply( 1:30, function(x) output[[x]] )
    }
    )
    
  })
  
  output$research_in <- renderUI({
    output2 <- tagList()
    output2 [[1]] <- numericInput("param18_1", label = h3("Lambda 1_m = "), value = lambda1_so[1])
    output2 [[2]] <- numericInput("param18_1_1", label = h3("sd = "), value = 0.17)
    output2 [[3]] <- numericInput("param18_2", label = h3("Lambda 1_f = "), value = lambda1_so[2])
    output2 [[4]] <- numericInput("param18_2_1", label = h3("sd = "), value = 0.17)
    output2 [[5]] <- sliderInput("param19", label = "Lambda 2 = ",
                min = 0, max = 2 * lambda2_so, value = lambda2_so * 1)
    output2 [[6]] <- sliderInput("param19_1", label = "SD = ",
                min = 0.0000001* lambda2_so, max = 1 * lambda2_so, value = 0.1 * lambda2_so)
    output2 [[7]] <- sliderInput("param20", label = "Take-up = ",
                min = q_full_so / 2, max = 2 * q_full_so, value = q_full_so)
    output2 [[8]] <- sliderInput("param20_1", label = "SD = ",
                min = 0.00000001* q_full_so, max = 1 * q_full_so, value = 0.1 * q_full_so)
    output2 [[9]] <- sliderInput("param28", label = "Take-up with no subsidy = ",
                min = q_zero_so / 2, max = 2 * q_zero_so, value = q_zero_so)
    output2 [[10]] <- sliderInput("param28_1", label = "SD = ",
                min = 0.00000001* q_zero_so, max = 1 * q_zero_so, value = 0.1 * q_zero_so)
    output2 [[11]] <- sliderInput("param26", label = "x * Delta E = ",
                min = 0.0000001, max = 4, value = delta_ed_par_so)
    output2 [[12]] <- sliderInput("param26_1", label = "SD = ",
                min = 0.0000001, max = 4, value = delta_ed_par_so * 0.1)
    output2 [[13]] <- sliderInput("param27", label = "x * Delta E (ext)  = ",
                min = 0.0000001, max = 4, value = delta_ed_ext_par_so)
    output2 [[14]] <- sliderInput("param27_1", label = "SD = ",
                min = 0.0000001, max = 4, value = delta_ed_ext_par_so * 0.1) 
    
    withMathJax(
      if (input$policy_est == "Fiscal effects, 2016(W@W) B & C, no ext") {
        lapply( 1:14, function(x) output2[[x]] )
      } else if (input$policy_est == "Fiscal effects, 2016(W@W) B & C, yes ext") {
        lapply( 1:14, function(x) output2[[x]] )
      } else if (input$policy_est == "Total effects, 2016(W@W) B & C, no ext") {
        lapply( 1:14, function(x) output2[[x]] )
      } else if (input$policy_est == "Total effects, 2016(W@W) B & C, yes ext") {
        lapply( 1:14, function(x) output2[[x]] )
      } else if (input$policy_est == "Fiscal effects, 2019(KLPS4) B & 2016(W@W) C, no ext") {
        lapply( 1:14, function(x) output2[[x]] )
      } else if (input$policy_est == "Total effects, 2019(KLPS4) B & 2016(W@W) C, no ext") {
        lapply( 1:14, function(x) output2[[x]] )
      } else if (input$policy_est == "Total effects, 2016(W@W) B & EA C, no ext") {
        lapply( 1:14, function(x) output2[[x]] )
      } else if (input$policy_est == "Total effects, 2016(W@W) B & EA C, ext") {
        lapply( 1:14, function(x) output2[[x]] )
      } else if (input$policy_est == "Total effects, 2019(KLPS4) B & EA C, no ext") {
        lapply( 1:14, function(x) output2[[x]] )
      } else if (input$policy_est == "CEA for total effects, 2019(KLPS4) B & EA C, no ext") {
        lapply( 1:14, function(x) output2[[x]] )
      } else if (input$policy_est == "RCEA to cash for total effects, 2019(KLPS4) B & EA C, no ext") {
        lapply( 1:14, function(x) output2[[x]] )
      }
    )
    
  })  
  
  
  reactive.data1 <- reactive( {
    sim.data1(
      nsims = as.numeric(input$param1),                                                    
      gov_bonds_var2 = as.numeric(input$param2),                                           
      gov_bonds_var2_sd = as.numeric(input$param2_1),                                      
      inflation_var2 = as.numeric(input$param3),                                           
      inflation_var2_sd = as.numeric(input$param3_1),                                      
      wage_ag_var2 = as.numeric(input$param4),                                             
      wage_ag_var2_sd = as.numeric(input$param4_1),                                        
      wage_ww_var2 = as.numeric(input$param5),                                             
      wage_ww_var2_sd = as.numeric(input$param5_1),                                        
      profits_se_var2 = as.numeric(input$param6),                                          
      profits_se_var2_sd = as.numeric(input$param6_1),                                     
      hours_se_cond_var2 = as.numeric(input$param7),                                       
      hours_se_cond_var2_sd = as.numeric(input$param7_1),                                  
      hours_ag_var2 = as.numeric(input$param8),                                            
      hours_ag_var2_sd = as.numeric(input$param8_1),                                       
      hours_ww_var2 = as.numeric(input$param9),                                            
      hours_ww_var2_sd = as.numeric(input$param9_1),                                       
      hours_se_var2 = as.numeric(input$param10),                                           
      hours_se_var2_sd = as.numeric(input$param10_1),                                      
      ex_rate_var2 = as.numeric(input$param11),                                            
      ex_rate_var2_sd = as.numeric(input$param11_1),                                       
      growth_rate_var2 = as.numeric(input$param12),                                        
      growth_rate_var2_sd = as.numeric(input$param12_1),  
      coverage_var2 = as.numeric(input$param13), 
      coverage_var2_sd = as.numeric(input$param13_1),
      tax_var2 = as.numeric(input$param15),                                                 
      tax_var2_sd = as.numeric(input$param15_1),                                            
      unit_cost_local_var2 = as.numeric(input$param16),                                           
      unit_cost_local_var2_sd = as.numeric(input$param16_1),                                           
      years_of_treat_var2 = as.numeric(input$param17),                                          
      years_of_treat_var2_sd = as.numeric(input$param17_1),                                          
      lambda1_var2 = c(as.numeric(input$param18_1), as.numeric(input$param18_2)),                                          
      lambda1_var2_sd = c(as.numeric(input$param18_1_1), as.numeric(input$param18_2_1)),                                     
      lambda2_var2 = as.numeric(input$param19),                                             
      lambda2_var2_sd = as.numeric(input$param19_1),                                        
      q_full_var2 = as.numeric(input$param20),                                              
      q_full_var2_sd = as.numeric(input$param20_1),                                           
      coef_exp_var2 = c(as.numeric(input$param21_1), as.numeric(input$param21_2)),                      
      teach_sal_var2 = as.numeric(input$param22),                                             
      teach_sal_var2_sd = as.numeric(input$param22_1),                                        
      teach_ben_var2 = as.numeric(input$param23),                                             
      teach_ben_var2_sd = as.numeric(input$param23_1),                                        
      n_students_var2 = as.numeric(input$param24),                                            
      n_students_var2_sd = as.numeric(input$param24_1),                                       
      delta_ed_var2 = as.numeric(input$param26),                                              
      delta_ed_var2_sd = as.numeric(input$param26_1),                                             
      delta_ed_ext_var2 = as.numeric(input$param27),                                              
      delta_ed_ext_var2_sd = as.numeric(input$param27_1),                                               
      q_zero_var2 = as.numeric(input$param28),                                                
      q_zero_var2_sd = as.numeric(input$param28_1), 
      lambda1_new_var2 = c(as.numeric(input$param29_1), as.numeric(input$param29_2), 
                           as.numeric(input$param29_3)),                   
      lambda1_new_var2_sd = c(as.numeric(input$param29_1_1), as.numeric(input$param29_2_1), 
                              as.numeric(input$param29_3_1)),             
      alpha_0_var2 = as.numeric(input$param30),    
      alpha_0_var2_sd = as.numeric(input$param30_1), 
      alpha_r_var2 = as.numeric(input$param31),    
      alpha_r_var2_sd = as.numeric(input$param31_1),                                                                         
      counts_par_var2 = as.numeric(input$param32), 
      counts_par_var2_sd = as.numeric(input$param32_1),
      staff_time_var2 = as.numeric(input$param33), 
      staff_time_var2_sd = as.numeric(input$param33_1), 
      costs_par_var2 = as.numeric(input$param34), 
      costs_par_var2_sd = as.numeric(input$param34_1) 
      )
    } 
  )
  
  ################
  ###### Results/Viz
  ################
  # THINK ABOUT WRAPPING THE OUTPUT IN ONE COMMOMN FUNCTION ACROSS DD AND APP
  output$plot1 <- renderPlot({      
    npv_sim_all <- reactive.data1()
    
    total_time <- npv_sim_all$total_time
    position <- which( policy_estimates_text == input$policy_est)
    npv_sim <- npv_sim_all[[ policy_estimates[position] ]]    
    npv_for_text <- paste("Median NPV:\n ", round(median(npv_sim), 2))
    npv_for_text2 <- paste("SD NPV:\n ", round(sd(npv_sim), 2))
    
    plot1 <- ggplot() +
      geom_density(aes(x = npv_sim,
                       alpha = 1/2), kernel = "gau") +
      geom_vline(xintercept = c(0, median(npv_sim)), col="blue") +
      coord_cartesian(xlim = c(-10, 400)) +
      guides(alpha = "none", colour="none") +
      labs(y = NULL,
           x = "NPV" ,
           title = paste0("Distribution of NPV of ", policy_estimates_text[position]
           ),
           subtitle = paste0("N = ", input$param1, " simulations. Takes ",
                             round(total_time, 1)," ",attributes(total_time)$unit )  )+
      annotate("text", x = 1.5 * median(npv_sim), y = 0.012, label = npv_for_text, size = 6)+
      annotate("text", x = 1.5 * median(npv_sim), y = 0.004, label = npv_for_text2, size = 6)+
      theme(axis.ticks = element_blank(), axis.text.y = element_blank())
    if (input$rescale == TRUE) {
      plot1 <- suppressMessages( plot1 + coord_cartesian(xlim = 1.2 * c( min( c(-1, npv_sim) ), max( c(100, npv_sim) ))) )
      }
    print(plot1)  
    }, height = 800, width = 800 )

})