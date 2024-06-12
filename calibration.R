```{r RHESSys Calibration Parameter Setup}
setwd(system.file("extdata/", package = "RHESSysIOinR"))


input_rhessys = IOin_rhessys_input(
  version = rh_path,
  tec_file = "tecfiles/tec_daily",
  world_file = "CWWS32dsm.world.Y2018M11D1H1.state.Y2018M11D1H1.state",
  world_hdr_prefix = "CWWS32",
  flowtable = "CWWS32.flow",
  start = "2013 11 1 1",
  end = "2018 11 1 1",
  output_folder = "out",
  output_prefix = "cwws32",
  commandline_options = c("-g"))

input_tec_data = IOin_tec_std(start = "2015 11 1 1",
                              end = "2018 11 1 1",
                              output_state = FALSE)

input_hdr = IOin_hdr(
  basin = "defs/basin.def",
  hillslope = "defs/hillslope.def",
  zone = "defs/zone.def",
  soil = c("defs/soil_clay.def","defs/soil_clayloam.def","defs/soil_loam.def","defs/soil_loamysand.def","defs/soil_rock.def","defs/soil_sand.def","defs/soil_sandyclay.def","defs/soil_sandyclayloam.def","defs/soil_sandyloam.def","defs/soil_silt.def","defs/soil_siltyclay.def","defs/soil_siltyclayloam.def","defs/soil_siltyloam.def","defs/soil_water.def", "defs/soil_shallowloam.def", "defs/soil_shallowsandyclayloam.def", "defs/soil_shallowsandyloam.def"),
  landuse = c("defs/lu_undev.def","defs/lu_agriculture.def","defs/lu_raingarden.def","defs/lu_urban.def"),
  stratum = c("defs/veg_deciduous/veg_deciduous.def","defs/veg_evergreen/veg_evergreen.def","defs/veg_deciduous_BES.def","defs/veg_eucalypt.def","defs/veg_grass.def","defs/veg_lawn_2cm.def","defs/veg_lawn_5cm.def","defs/veg_lawn_10cm.def","defs/veg_nonveg.def"),
  basestations = "clim/cwtws32local.base")



n <- 5
# 
# 
# parameterlists<- list(list(input_hdr$soil_def[1], "m_z", runif(n, 0.1, 1)),
#   list(input_hdr$soil_def[1], "Ksat_0", runif(n, 0.1, 2000)),
#   list(input_hdr$soil_def[1], "soil_depth", runif(n, 0.1, 1)),
#   list(input_hdr$soil_def[1], "m_z", runif(n, 0.01, 1)),
#   list(input_hdr$soil_def[1], "ksat0_v",runif(n, 0.1, 3)),
#   list(input_hdr$soil_def[1], "sat_to_gw_coeff", runif(n, 0, .7)),
#   list(input_hdr$soil_def[1], "gw_loss_coeff", runif(n, 0, .7)),
#   list(input_hdr$soil_def[1], "pore_size_index", runif(n, 0, .7)),
#   list(input_hdr$soil_def[1], "psi_air_entry", runif(n, 0, .7)),
#   
#   list(input_hdr$stratum_def[1], "epc.proj_sla", runif(n, 0, .7)),
#   list(input_hdr$stratum_def[1], "epc.shade_sla_mult", runif(n, 0, .7)),
#   list(input_hdr$stratum_def[1], "epc.flnr", runif(n, 0, .7))
# )


# 
# parameterlists<- list(list(input_hdr$soil_def, "m_z", runif(n, 0.1, 1)),
#   list(input_hdr$soil_def, "Ksat_0", runif(n, 0.1, 2000)),
#   list(input_hdr$soil_def, "soil_depth", runif(n, 0.1, 1)),
#   list(input_hdr$soil_def, "m_v", runif(n, 0.01, 1)),
#   list(input_hdr$soil_def, "ksat0_v",runif(n, 0.1, 3)),
#   list(input_hdr$soil_def, "sat_to_gw_coeff", runif(n, 0, .7)),
#   list(input_hdr$soil_def, "gw_loss_coeff", runif(n, 0, .7)),
#   list(input_hdr$soil_def, "pore_size_index", runif(n, 0, .7)),
#   list(input_hdr$soil_def, "psi_air_entry", runif(n, 0, .7)),
#   
#   list(input_hdr$stratum_def, "epc.proj_sla", runif(n, 0, .7)),
#   list(input_hdr$stratum_def, "epc.shade_sla_mult", runif(n, 0, .7)),
#   list(input_hdr$stratum_def, "epc.flnr", runif(n, 0, .7))
# )




parameterlists<- list(list("defs/soil_sandyloam.def", "m", runif(n, 0.1, 1)),
                      list("defs/soil_sandyloam.def", "Ksat_0", runif(n, 0.1, 2000)),
                      list("defs/soil_sandyloam.def", "m_z", runif(n, 0.1, 1)),
                      list("defs/soil_sandyloam.def", "pore_size_index", runif(n, 0.01, 1)),
                      list("defs/soil_sandyloam.def", "psi_air_entry",runif(n, 0.1, 3)),
                      list("defs/soil_sandyloam.def", "sat_to_gw_coeff", runif(n, 0, .7)),
                      list("defs/hill.def", "gw_loss_coeff", runif(n, 0, .7))
)






input_def_pars_latin_hypercube = IOin_def_pars_latin_hypercube(parameterlists)

run_rhessys_multi(
  input_rhessys = input_rhessys,
  hdr_files = input_hdr,
  tec_data = input_tec_data,
  def_pars = input_def_pars_latin_hypercube,
  output_filter = output_filter
)






```