patch.streamflow + hill.gw.Qout


p <- build_output_filter(timestep = "daily", output_format= "csv", output_path = "/test", output_filename = "testbasinstreamflow", spatial_level = "basin",spatial_ID = "1", variables = "base_flow" )

p
