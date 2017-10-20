Bundler.require
require_relative 'lib/blender_solution.rb'

expected_chemicals = {
  c1: {min: 300.0, max: 600.0},
  c2: {min: 250.0, max: 500.0},
  c3: {min: 400.0, max: 800.0},
  c4: {min: 330.0, max: 660.0},
  c5: {min: 50.0, max: 100.0}
}

ores = {
  socal_pedra: {price: 20.0, chemicals: {c1: 20.0, c2: 17.0, c3: 30.0, c4: 0.0, c5: 0.0}},
  ore_b: {price: 16.0, chemicals: {c1: 15.0, c2: 0.0, c3: 10.0, c4: 18.0, c5: 7.0}},
  ore_c: {price: 11.0, chemicals: {c1: 0.0, c2: 10.0, c3: 10.0, c4: 20.0, c5: 0.0}},
  ore_d: {price: 10.0, chemicals: {c1: 8.0, c2: 8.0, c3: 8.0, c4: 8.0, c5: 8.0}},
  ore_e: {price: 8.0, chemicals: {c1: 9.0, c2: 5.0, c3: 0.0, c4: 0.0, c5: 12.0}},
  ore_f: {price: 7.0, chemicals: {c1: 2.0, c2: 13.0, c3: 1.0, c4: 3.0, c5: 8.0}},
  ore_g: {price: 4.0, chemicals: {c1: 3.0, c2: 0.0, c3: 0.0, c4: 8.0, c5: 3.0}}
}

raw_materials = [
  {name: :socal_pedra, price: 20, composition: {h2o: 0.08, pf: 0.04, tp205: 0.27, cao: 0.42, mgo: 0.0054, sio2: 0.0025, b: 0, zn: 0, cu: 0, pk: 0, mn: 0.0037, fe2o3: 0.0462}},
  {name: :fosf_fronteira, price: 20, composition: {h2o: 0.07, pf: 0.03, tp205: 0.24, cao: 0.35, mgo: 0, sio2: 0.2, b: 0, zn: 0, cu: 0, pk: 0, mn: 0, fe2o3: 0.05}}
  {name: :fosf_granulado, price: 20, composition: {h2o: 0.13, pf: 0.08, tp205: 0.28, cao: 0.23, mgo: 0.01, sio2: 0.05, b: 0, zn: 0, cu: 0, pk: 0, mn: 0.0035, fe2o3: 0.1024}}
  {name: :briquete, price: 20, composition: {h2o: 0.1, pf: 0.14, tp205: 0.18, cao: 0.19, mgo: 0.0042, sio2: 0.05, b: 0, zn: 0, cu: 0, pk: 0, mn: 0.013, fe2o3: 0.01}}
  {name: :briquete_25, price: 20, composition: {h2o: 0.15, pf: 0.08, tp205: 0.25, cao: 0.28, mgo: 0.0042, sio2: 0.05, b: 0, zn: 0, cu: 0, pk: 0, mn: 0.013, fe2o3: 0.08}}
  {name: :serpentinito, price: 20, composition: {h2o: 0.025, pf: 0.08, tp205: 0, cao: 0.138, mgo: 0.29, sio2: 0.5, b: 0, zn: 0, cu: 0, pk: 0, mn: 0, fe2o3: 0.08}}
  {name: :dolomita_britada, price: 20, composition: {h2o: 0.01, pf: 0.4649, tp205: 0, cao: 0.33, mgo: 0.18, sio2: 0, b: 0, zn: 0, cu: 0, pk: 0, mn: 0, fe2o3: 0.02}}
  {name: :rocha_potassica, price: 20, composition: {h2o: 0.05, pf: 0.05, tp205: 0, cao: 0.008, mgo: 0, sio2: 0.58, b: 0, zn: 0, cu: 0, pk: 0.1, mn: 0, fe2o3: 0.06}}
  {name: :calc_calcito, price: 20, composition: {h2o: 0.03, pf: 0.4354, tp205: 0, cao: 0.5, mgo: 0.002, sio2: 0, b: 0, zn: 0, cu: 0, pk: 0, mn: 0, fe2o3: 0.02}}
  {name: :micro, price: 20, composition: {h2o: 0.08, pf: 0.17, tp205: 0, cao: 0, mgo: 0, sio2: 0, b: 0.04, zn: 0.275, cu: 0.025, pk: 0, mn: 0, fe2o3: 0}}
  {name: :magnesio_bruto, price: 20, composition: {h2o: 0.061, pf: 0.05, tp205: 0, cao: 0, mgo: 0.6, sio2: 0, b: 0, zn: 0, cu: 0, pk: 0, mn: 0, fe2o3: 0.02}}
  {name: :olivina_azul, price: 20, composition: {h2o: 0.04, pf: 0, tp205: 0, cao: 0.0176, mgo: 0.33, sio2: 0.57, b: 0, zn: 0, cu: 0, pk: 0, mn: 0, fe2o3: 0.0387}}
]


factory = Gimuby.get_factory
factory.optimal_population = true
optimizer = factory.get_population {next BlenderSolution.new(expected_chemicals, ores)}

1000.times do
  optimizer.generation_step
end

p optimizer.get_best_solution.solution
p optimizer.get_best_solution.evaluate
