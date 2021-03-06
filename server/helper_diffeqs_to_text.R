diffeq_to_text <- function(list_of_diffeqs, list_of_vars){
  output <- "" #initialize output
  for (i in seq(length(list_of_diffeqs))) {
    current_eqn <- paste0("d", list_of_vars[i], " <- ", list_of_diffeqs[i])
    output <- paste0(output, current_eqn, "\n ")
  }
  #print(output)
  return(output)
}

rateEqns_to_text <- function(rate_equations)
{
  output <- ""
  for (i in seq(length(rate_equations)))
  {
    output <- paste0(output, rate_equations[i], "\n ")
  }
  #print(output)
  return(output)
}

output_var_for_ode_solver <- function(list_of_vars){
  output <- paste0("d", list_of_vars, collapse = ", ")
  output <- paste0("c(", output, ")")
  
  return(output)
}

output_param_for_ode_solver <- function(param_vars, param_values){
  output <-  as.numeric(param_values)
  # print(output)
  # print(typeof(output))
  # print(param_vars)
  # print(length(output))
  # print(length(param_vars))
  names(output) <- param_vars
  return(output)
}

output_ICs_for_ode_solver <- function(IC_vars, IC_values){
  output <-  as.numeric(IC_values)
  print(output)
  print(typeof(output))
  print(IC_vars)
  print(length(output))
  print(length(IC_vars))
  names(output) <- IC_vars
  return(output)
}