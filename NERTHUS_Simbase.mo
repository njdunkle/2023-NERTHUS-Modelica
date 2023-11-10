model NERTHUS_Simbase
  //
  // Load parameters for Nuclear and HeatTransport packages
  NERTHUS_Modelica.Nuclear.mPKE mPKE(Lam = 7.187e-04, lam = {1.240E-02, 3.05E-02, 1.11E-01, 3.01E-01, 1.140, 3.014}, beta = {0.00019917, 0.0010526, 0.001048, 0.0030109, 0.00079403, 0.00027303}, tauCoreNom = 15, tauLoopNom = 15.6) annotation(
    Placement(visible = true, transformation(origin = {-1323, 315}, extent = {{-409, -409}, {409, 409}}, rotation = 0)));
  NERTHUS_Modelica.Nuclear.DecayHeat decayheat(P = 557, DHYG1 = 9.635981959409105e-01, DHYG2 = 3.560674858154914e-02, DHYG3 = 7.950554775404400e-04, TotalFuelMass = 128795.4, DHlamG1 = 0.0945298, DHlamG2 = 0.00441957, DHlamG3 = 8.60979e-05) annotation(
    Placement(visible = true, transformation(origin = {-1181, -471}, extent = {{-463, -463}, {463, 463}}, rotation = 0)));
  NERTHUS_Modelica.Nuclear.ReactivityFeedback ReactivityFeedback(FuelTempSetPointNode1 = 649.2, FuelTempSetPointNode2 = 681.8, GrapTempSetPoint = 652.3, a_F = -7.0183e-05, a_G = -3.2492e-05, step_mag = 100*1e-5, omega = 0.01, sin_mag = 10*1e-5, stepInsertionTime = 3000, sinInsertionTime = 25000000) annotation(
    Placement(visible = true, transformation(origin = {-83, -1051}, extent = {{545, -545}, {-545, 545}}, rotation = 0)));
  NERTHUS_Modelica.Nuclear.Core Core(P = 557, TotalFuelMass = 128795.4, hAnom = 12.5325, m_FN1 = 3.15675e4, m_FN2 = 3.15675e4, m_GN = 4293180, cP_fuel = 0.0019665, cP_graphite = 0.001773, mdot_fuelNom = 4209, kFN1 = 0.465, kFN2 = 0.465, kG = 0.07, kHT_FN1 = 0.5, kHT_FN2 = 0.5, tauCoreToDHRS = 1) annotation(
    Placement(visible = true, transformation(origin = {-279, -117}, extent = {{-555, -555}, {555, 555}}, rotation = 0)));
  NERTHUS_Modelica.Nuclear.Poisons Poisons(lam_bubble = 0.005) annotation(
    Placement(visible = true, transformation(origin = {-1283, -1041}, extent = {{-555, -555}, {555, 555}}, rotation = 0)));
  NERTHUS_Modelica.HeatTransport.PrimaryHeatExchanger PHX(m_PN1_PHX = 12206.1, m_PN2_PHX = 12206.1, m_PN3_PHX = 12206.1, m_PN4_PHX = 12206.1, m_TN1_PHX = 1323.6, m_TN2_PHX = 1323.6, m_SN1_PHX = 3086, m_SN2_PHX = 3086, m_SN3_PHX = 3086, m_SN4_PHX = 3086, cP_pFluid_PHX = 0.0019665, cP_Tube_PHX = 0.00057779, cP_sFluid_PHX = 0.008830, m_dot_pFluidNom_PHX = 4209, m_dot_sFluidNom_PHX = 1543, hApnNom_PHX = 16.7643818720, hAsnNom_PHX = 16.7643818720, tauPHXtoPipe = 0.5, tauPHXtoSHX = 1) annotation(
    Placement(visible = true, transformation(origin = {1581, 125}, extent = {{-427, -427}, {427, 427}}, rotation = 0)));
  NERTHUS_Modelica.HeatTransport.SecondaryHeatExchanger SHX(m_PN1_SHX = 5400.5, m_PN2_SHX = 5400.5, m_PN3_SHX = 5400.5, m_PN4_SHX = 5400.5, m_TN1_SHX = 1940, m_TN2_SHX = 1940, m_SN1_SHX = 9292.25, m_SN2_SHX = 9292.25, m_SN3_SHX = 9292.25, m_SN4_SHX = 9292.25, cP_pFluid_SHX = 0.008830, cP_Tube_SHX = 0.00057779, cP_sFluid_SHX = 0.00154912, m_dot_pFluidNom_SHX = 1543, m_dot_sFluidNom_SHX = 3379, hApnNom_SHX = 88.608782940156843, hAsnNom_SHX = 88.608782940156843, tauSHXtoPHX = 1, tauSHXtoOTSG = 1) annotation(
    Placement(visible = true, transformation(origin = {1611, -610}, extent = {{-432, -432}, {432, 432}}, rotation = 0)));
  NERTHUS_Modelica.HeatTransport.DecayHeatRemovalSystem DHRS(m_DHRS = 4209, Cp_fluid = 0.0019665, m_dotNom_DHRS = 4209, m_Pi_C_PHX = 4209, DHRS_timeConstant = 10, DHRS_MaxPowerRm = 0.1*557, DHRS_PowerBleed = 0.01*557, DHRS_time = 2000000000, tauDHRStoPHX = 1) annotation(
    Placement(visible = true, transformation(origin = {-32, 754}, extent = {{-386, -386}, {386, 386}}, rotation = 0)));
  NERTHUS_Modelica.HeatTransport.PrimaryLoopPump PLP(freeConvectionFF = 0.05, primaryPumpK = 0.092, tripPrimaryPump = 3000) annotation(
    Placement(visible = true, transformation(origin = {618, 552}, extent = {{-262, -262}, {262, 262}}, rotation = 0)));
  NERTHUS_Modelica.HeatTransport.SecondaryLoopPump SLP(freeConvectionFF = 0.05, secondaryPumpK = 0.092, tripSecondaryPump = 2000000000) annotation(
    Placement(visible = true, transformation(origin = {596, -92}, extent = {{-232, -232}, {232, 232}}, rotation = 0)));
  NERTHUS_Modelica.HeatTransport.TertiaryLoopPump TLP(freeConvectionFF = 0.05, tertiaryPumpK = 0.092, tripTertiaryPump = 2000000000) annotation(
    Placement(visible = true, transformation(origin = {599, -669}, extent = {{-217, -217}, {217, 217}}, rotation = 0)));
  NERTHUS_Modelica.HeatTransport.Pipe Pipe(m_pi = 4209, Cp_fluidPi = 0.0019665, m_dotPiNom = 4209, m_Pi_PHX_C = 4209, tauPipeToCore = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-769, 719}, extent = {{481, -481}, {-481, 481}}, rotation = 0)));
  NERTHUS_Modelica.HeatTransport.OnceThroughSteamGenerator OTSG(
    rho_hitec = 1680,
    rho_tube = 8425.712,
    cP_hitec = 0.00154912,
    cP_Tube_OTSG = 456.056e-6,
    cP_SH1 = 0.002573333673413,
    cP_SH2 = 0.003687517297276,
    cP_fdw = 0.004393935709417,
    cP_SC = 0.005121564867136,
    m_dot_hitecNom = 3379,
    m_dot_fdwNom = 1.925004320027648e+02,
    h_pw = 9101.343578935E-6,
    h_wsh = 5732.378387768E-6,
    h_wb = 13349.334646671E-6,
    h_wsc = 8385.005556375E-6,
    tauOTSGtoSHX = 1,
    L_sc_initial = 1.4469,
    L_b_initial = 2.3645,
    L_sh_initial = 4.723,
    L_OTSG = 8.5344,
    D_inner = 0.0141478,
    D_outer = 0.015875,
    A_flow = 1.2245,
    N_tubes = 6546,
    pi = 2*Modelica.Math.asin(1.0)
    ) annotation(
    Placement(visible = true, transformation(origin = {1747, -1257}, extent = {{479, 479}, {-479, -479}}, rotation = -180)));

NERTHUS_Modelica.HeatTransport.FeedwaterPump FWP(
    freeConvectionFF = 0.05,
    FeedwaterPumpK = 0.092,
    tripFeedwaterPump = 3240
    ) annotation(
    Placement(visible = true, transformation(origin = {508, -1250}, extent = {{-234, -234}, {234, 234}}, rotation = 0)));
  // Connections between modules
equation
  connect(PLP.primaryFF, Core.fuelFlowFraction) annotation(
    Line(points = {{618, 400.04}, {-501, 400.04}, {-501, -560.96}}, color = {245, 121, 0}));
  connect(PLP.primaryFF, DHRS.fuelFlowFrac) annotation(
    Line(points = {{618, 400.04}, {-264, 400.04}, {-264, 677.04}}, color = {245, 121, 0}));
  connect(PLP.primaryFF, Pipe.fuelFlowFrac) annotation(
    Line(points = {{618, 400.04}, {-538, 400.04}, {-538, 662.04}}, color = {245, 121, 0}));
  connect(PLP.primaryFF, mPKE.fuelFlowFrac) annotation(
    Line(points = {{618, 400.04}, {-1184, 400.04}, {-1184, 479.04}}, color = {245, 121, 0}));
  connect(PLP.primaryFF, PHX.primaryFF) annotation(
    Line(points = {{618, 400.04}, {1282, 400.04}, {1282, 338.04}}, color = {245, 121, 0}));
  connect(SLP.secondaryFF, SHX.secondaryFF) annotation(
    Line(points = {{596, -231.2}, {1309, -231.2}, {1309, -394.2}}, color = {245, 121, 0}));
  connect(SLP.secondaryFF, PHX.secondaryFF) annotation(
    Line(points = {{596, -231.2}, {2136, -231.2}, {2136, -88.2}}, color = {245, 121, 0}));
  connect(TLP.tertiaryFF, SHX.tertiaryFF) annotation(
    Line(points = {{599, -799.2}, {2173, -799.2}, {2173, -826.2}}, color = {245, 121, 0}));
//  connect(FWP.feedwaterFF, OTSG.feedwaterFF) annotation(
//    Line(points = {{474, -2459}, {759, -2459}, {759, -2494}, {868, -2494}}, color = {245, 121, 0}));
  connect(Poisons.Poison_react, ReactivityFeedback.Poison_react) annotation(
    Line(points = {{-1172, -1263}, {-452.5, -1263}, {-452.5, -1225}, {-225, -1225}}, color = {78, 154, 6}));
  connect(Core.nPop, mPKE.n_population) annotation(
    Line(points = {{-723, 204.9}, {-1323, 204.9}, {-1323, 159.9}}, color = {20, 36, 248}));
  connect(mPKE.n_population, decayheat.nPop) annotation(
    Line(points = {{-1323, 159.58}, {-1329, 159.58}, {-1329, -369.42}}, color = {20, 36, 248}));
  connect(mPKE.n_population, Poisons.n_population) annotation(
    Line(points = {{-1323, 159.58}, {-1505, 159.58}, {-1505, -1263}}, color = {20, 36, 248}));
  connect(decayheat.decayHeat_Out, Core.P_decay) annotation(
    Line(points = {{-1014.32, -609.9}, {-802.82, -609.9}, {-802.82, -149.9}, {-723.32, -149.9}}, color = {0, 225, 255}));
  connect(decayheat.decayHeat_Out, Pipe.PiDecay_Heat) annotation(
    Line(points = {{-1014.32, -609.9}, {-538.32, -609.9}, {-538.32, 1008.1}}, color = {0, 225, 255}));
  connect(decayheat.decayHeat_Out, DHRS.DHRS_DecayHeat) annotation(
    Line(points = {{-1014.32, -609.9}, {-264.32, -609.9}, {-264.32, 986.1}}, color = {0, 225, 255}));
  connect(decayheat.decayHeat_Out, PHX.P_decay) annotation(
    Line(points = {{-1014.32, -609.9}, {1700.68, -609.9}, {1700.68, 338.1}}, color = {0, 225, 255}));
  connect(ReactivityFeedback.feedback, mPKE.feedback) annotation(
    Line(points = {{-224.7, -942}, {-1322.7, -942}, {-1322.7, 479}}, color = {78, 154, 6}));
  connect(Core.fuelNode1, ReactivityFeedback.fuelNode1) annotation(
    Line(points = {{-1.5, -516.6}, {135, -516.6}, {135, -865.6}}));
  connect(Core.fuelNode2, ReactivityFeedback.fuelNode2) annotation(
    Line(points = {{-1.5, -283.5}, {135, -283.5}, {135, -1051}}));
  connect(Core.grapNode, ReactivityFeedback.grapNode) annotation(
    Line(points = {{-1.5, -28.2}, {135, -28.2}, {135, -1215.2}}));
  connect(Core.temp_Out, DHRS.DHRS_tempIN) annotation(
    Line(points = {{-1.5, 177.15}, {-264, 177.15}, {-264, 839.15}}));
  connect(DHRS.DHRS_TempOUT, PHX.T_in_pFluid_PHX) annotation(
    Line(points = {{137.84, 838.92}, {1144.84, 838.92}, {1144.84, 253.92}}));
  connect(PHX.T_out_pFluid_PHX, Pipe.PiTemp_IN) annotation(
    Line(points = {{2272.74, 253.1}, {-538.26, 253.1}, {-538.26, 844.1}}));
  connect(Pipe.PiTemp_Out, Core.temp_In) annotation(
    Line(points = {{-903.68, 844.06}, {-722.68, 844.06}, {-722.68, -505.44}}));
  connect(SHX.T_out_pFluid_SHX, PHX.T_in_sFluid_PHX) annotation(
    Line(points = {{2310.84, -480.4}, {2310.84, -206.4}, {2272.84, -206.4}, {2272.84, -12.4}}));
  connect(PHX.T_out_sFluid_PHX, SHX.T_in_pFluid_SHX) annotation(
    Line(points = {{1154, -3.1}, {1154, -199.6}, {1170, -199.6}, {1170, -480.1}}));
  connect(OTSG.T_out_hitec_OTSG, SHX.T_in_sFluid_SHX) annotation(
    Line(points = {{2485, -1113}, {2310.66, -1113}, {2310.66, -747.3}}));
  connect(OTSG.tertiaryFF, TLP.tertiaryFF) annotation(
    Line(points = {{904, -979}, {599.96, -979}, {599.96, -799.18}}));
  connect(OTSG.T_in_hitec_OTSG, SHX.T_out_sFluid_SHX) annotation(
    Line(points = {{904, -1113}, {1179.96, -1113}, {1179.96, -739.3}}));
  connect(FWP.feedwaterFF, OTSG.feedwaterFF) annotation(
    Line(points = {{508, -1390.4}, {904, -1390.4}, {904, -1544}}, color = {245, 121, 0}));
  annotation(
    Diagram(coordinateSystem(extent = {{-1800, 1120}, {2740, -1740}})),
    version = "",
    uses,
    experiment(StartTime = 0, StopTime = 8000, Tolerance = 1e-06, Interval = 0.01));
end NERTHUS_Simbase;
