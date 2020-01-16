connection: "red_flight"

include: "/views/flights_by_day.view"

explore: flights_by_day {
  view_name: flights_by_day
}

















# I've commented out all these lines so that my imported project would work in
# https://docsexamples.dev.looker.com/projects/e_faa_map_layer/files/e_faa_map_layer.model.lkml


# e_flights_bb comment

# include all the views
# include: "*.view"

# # include all the dashboards
# # include: "*.dashboard"
#
# explore: accidents {}
#
# explore: aircraft {}
#
# explore: aircraft_models {}
#
# explore: airports {}
#
# explore: cal454 {}
#
# explore: carriers {}
#
# explore: flights {}
#
# explore: ontime {}
#
# explore: temp2 {}
