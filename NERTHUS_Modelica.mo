package NERTHUS_Modelica
  package HeatTransport
    // Parameters and equations for all heat exchangers and pumps

    model PrimaryHeatExchanger
      // PHX parameters and equations
      // Parameter declaration
      parameter NERTHUS_Modelica.Units.Mass m_PN1_PHX; // Fuel Salt node 1 mass
      parameter NERTHUS_Modelica.Units.Mass m_PN2_PHX; // Fuel Salt node 2 mass
      parameter NERTHUS_Modelica.Units.Mass m_PN3_PHX; // Fuel Salt node 3 mass
      parameter NERTHUS_Modelica.Units.Mass m_PN4_PHX; // Fuel Salt node 4 mass
      parameter NERTHUS_Modelica.Units.Mass m_TN1_PHX; // PHX Tubing node 1 mass
      parameter NERTHUS_Modelica.Units.Mass m_TN2_PHX; // PHX Tubing node 2 mass
      parameter NERTHUS_Modelica.Units.Mass m_SN1_PHX; // Secondary Side node 1 mass
      parameter NERTHUS_Modelica.Units.Mass m_SN2_PHX; // Secondary Side node 2 mass
      parameter NERTHUS_Modelica.Units.Mass m_SN3_PHX; // Secondary Side node 3 mass
      parameter NERTHUS_Modelica.Units.Mass m_SN4_PHX; // Secondary Side node 4 mass
      parameter NERTHUS_Modelica.Units.SpecificHeatCapacity cP_pFluid_PHX;
      // Fuel salt specific heat [MJ/(kg*C)]
      parameter NERTHUS_Modelica.Units.SpecificHeatCapacity cP_Tube_PHX;
      // PHX Tubing specific heat [MJ/(kg*C)]
      parameter NERTHUS_Modelica.Units.SpecificHeatCapacity cP_sFluid_PHX;
      // Coolant salt specific heat [MJ/(kg*C)]
      parameter NERTHUS_Modelica.Units.MassFlowRate m_dot_pFluidNom_PHX;
      // Fuel salt nominal flow rate
      parameter NERTHUS_Modelica.Units.MassFlowRate m_dot_sFluidNom_PHX;
      // Coolant salt nominal flow rate
      parameter NERTHUS_Modelica.Units.Convection hApnNom_PHX;
      // PHX primary side heat transfer coefficient [MJ/(s*C)]
      parameter NERTHUS_Modelica.Units.Convection hAsnNom_PHX;
      // PHX secondary side heat transfer coefficient [MJ/(s*C)]
      parameter NERTHUS_Modelica.Units.ResidentTime tauPHXtoPipe;
      // Avg travel time from PHX to pipe
      parameter NERTHUS_Modelica.Units.ResidentTime tauPHXtoSHX;
      // Avg travel time from PHX to SHX
      parameter NERTHUS_Modelica.Units.Temperature T_PN1_PHX_initial = 683.1;
      parameter NERTHUS_Modelica.Units.Temperature T_PN2_PHX_initial = 644.3;
      parameter NERTHUS_Modelica.Units.Temperature T_PN3_PHX_initial = 630.3;
      parameter NERTHUS_Modelica.Units.Temperature T_PN4_PHX_initial = 616.6;
      parameter NERTHUS_Modelica.Units.Temperature T_TN1_PHX_initial = 639.3;
      parameter NERTHUS_Modelica.Units.Temperature T_TN2_PHX_initial = 612.7;
      parameter NERTHUS_Modelica.Units.Temperature T_SN1_PHX_initial = 595.1;
      parameter NERTHUS_Modelica.Units.Temperature T_SN2_PHX_initial = 603.8;
      parameter NERTHUS_Modelica.Units.Temperature T_SN3_PHX_initial = 615.6;
      parameter NERTHUS_Modelica.Units.Temperature T_SN4_PHX_initial = 627.3;
      // Variable declaration
      NERTHUS_Modelica.Units.ResidentTime varTauPHXtoPipe;
      NERTHUS_Modelica.Units.ResidentTime varTauPHXtoSHX;
      NERTHUS_Modelica.Units.MassFlowRate m_dot_pFluid_PHX;
      NERTHUS_Modelica.Units.MassFlowRate m_dot_sFluid_PHX;
      NERTHUS_Modelica.Units.Convection hApn_PHX;
      NERTHUS_Modelica.Units.Convection hAsn_PHX;
      NERTHUS_Modelica.Units.Temperature T_PN1_PHX;
      NERTHUS_Modelica.Units.Temperature T_PN2_PHX;
      NERTHUS_Modelica.Units.Temperature T_PN3_PHX;
      NERTHUS_Modelica.Units.Temperature T_PN4_PHX;
      NERTHUS_Modelica.Units.Temperature T_TN1_PHX;
      NERTHUS_Modelica.Units.Temperature T_TN2_PHX;
      NERTHUS_Modelica.Units.Temperature T_SN1_PHX;
      NERTHUS_Modelica.Units.Temperature T_SN2_PHX;
      NERTHUS_Modelica.Units.Temperature T_SN3_PHX;
      NERTHUS_Modelica.Units.Temperature T_SN4_PHX;
      NERTHUS_Modelica.Units.ReactorPower P_primaryLoop;
      // Connections to other modules
      input NERTHUS_Modelica.Connectors.Temp_In T_in_pFluid_PHX annotation(
        Placement(visible = true, transformation(origin = {-100, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-102, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      input NERTHUS_Modelica.Connectors.Temp_In T_in_sFluid_PHX annotation(
        Placement(visible = true, transformation(origin = {160, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {162, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      output NERTHUS_Modelica.Connectors.Temp_Out T_out_sFluid_PHX annotation(
        Placement(visible = true, transformation(origin = {-100, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      output NERTHUS_Modelica.Connectors.Temp_Out T_out_pFluid_PHX annotation(
        Placement(visible = true, transformation(origin = {160, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {162, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      input NERTHUS_Modelica.Connectors.DecayHeat_In P_decay annotation(
        Placement(visible = true, transformation(origin = {30, 50}, extent = {{-18, -18}, {18, 18}}, rotation = 0), iconTransformation(origin = {28, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      input NERTHUS_Modelica.Connectors.FlowFraction_In primaryFF annotation(
        Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-18, -18}, {18, 18}}, rotation = 0), iconTransformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      input NERTHUS_Modelica.Connectors.FlowFraction_In secondaryFF annotation(
        Placement(visible = true, transformation(origin = {130, -50}, extent = {{-18, -18}, {18, 18}}, rotation = 0), iconTransformation(origin = {130, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    initial equation
      T_PN1_PHX = T_PN1_PHX_initial;
      T_PN2_PHX = T_PN2_PHX_initial;
      T_PN3_PHX = T_PN3_PHX_initial;
      T_PN4_PHX = T_PN4_PHX_initial;
      T_TN1_PHX = T_TN1_PHX_initial;
      T_TN2_PHX = T_TN2_PHX_initial;
      T_SN1_PHX = T_SN1_PHX_initial;
      T_SN2_PHX = T_SN2_PHX_initial;
      T_SN3_PHX = T_SN3_PHX_initial;
      T_SN4_PHX = T_SN4_PHX_initial;
    equation
      m_dot_pFluid_PHX = m_dot_pFluidNom_PHX*primaryFF.FF;
      m_dot_sFluid_PHX = m_dot_sFluidNom_PHX*secondaryFF.FF;
      varTauPHXtoPipe = tauPHXtoPipe/primaryFF.FF;
      varTauPHXtoSHX = tauPHXtoSHX/secondaryFF.FF;
// CHECK ON THIS NEXT PART LATER
      hApn_PHX = hApnNom_PHX*(0.8215*primaryFF.FF^6 - 4.108*primaryFF.FF^5 + 7.848*primaryFF.FF^4 - 7.165*primaryFF.FF^3 + 3.004*primaryFF.FF^2 + 0.5903*primaryFF.FF + 0.008537);
      hAsn_PHX = hAsnNom_PHX*(0.8215*secondaryFF.FF^6 - 4.108*secondaryFF.FF^5 + 7.848*secondaryFF.FF^4 - 7.165*secondaryFF.FF^3 + 3.004*secondaryFF.FF^2 + 0.5903*secondaryFF.FF + 0.008537);
// END CHECK
      m_PN1_PHX*cP_pFluid_PHX*der(T_PN1_PHX) = m_dot_pFluid_PHX*cP_pFluid_PHX*(T_in_pFluid_PHX.T - T_PN1_PHX) - hApn_PHX*(T_PN1_PHX - T_TN1_PHX) + P_decay.Q*m_PN1_PHX;
      m_PN2_PHX*cP_pFluid_PHX*der(T_PN2_PHX) = m_dot_pFluid_PHX*cP_pFluid_PHX*(T_PN1_PHX - T_PN2_PHX) - hApn_PHX*(T_PN1_PHX - T_TN1_PHX) + P_decay.Q*m_PN2_PHX;
      m_PN3_PHX*cP_pFluid_PHX*der(T_PN3_PHX) = m_dot_pFluid_PHX*cP_pFluid_PHX*(T_PN2_PHX - T_PN3_PHX) - hApn_PHX*(T_PN3_PHX - T_TN2_PHX) + P_decay.Q*m_PN3_PHX;
      m_PN4_PHX*cP_pFluid_PHX*der(T_PN4_PHX) = m_dot_pFluid_PHX*cP_pFluid_PHX*(T_PN3_PHX - T_PN4_PHX) - hApn_PHX*(T_PN3_PHX - T_TN2_PHX) + P_decay.Q*m_PN4_PHX;
      m_TN1_PHX*cP_Tube_PHX*der(T_TN1_PHX) = 2*hApn_PHX*(T_PN1_PHX - T_TN1_PHX) - 2*hAsn_PHX*(T_TN1_PHX - T_SN3_PHX);
      m_TN2_PHX*cP_Tube_PHX*der(T_TN2_PHX) = 2*hApn_PHX*(T_PN3_PHX - T_TN2_PHX) - 2*hAsn_PHX*(T_TN2_PHX - T_SN1_PHX);
      m_SN1_PHX*cP_sFluid_PHX*der(T_SN1_PHX) = m_dot_sFluid_PHX*cP_sFluid_PHX*(T_in_sFluid_PHX.T - T_SN1_PHX) + hAsn_PHX*(T_TN2_PHX - T_SN1_PHX);
      m_SN2_PHX*cP_sFluid_PHX*der(T_SN2_PHX) = m_dot_sFluid_PHX*cP_sFluid_PHX*(T_SN1_PHX - T_SN2_PHX) + hAsn_PHX*(T_TN2_PHX - T_SN1_PHX);
      m_SN3_PHX*cP_sFluid_PHX*der(T_SN3_PHX) = m_dot_sFluid_PHX*cP_sFluid_PHX*(T_SN2_PHX - T_SN3_PHX) + hAsn_PHX*(T_TN1_PHX - T_SN3_PHX);
      m_SN4_PHX*cP_sFluid_PHX*der(T_SN4_PHX) = m_dot_sFluid_PHX*cP_sFluid_PHX*(T_SN3_PHX - T_SN4_PHX) + hAsn_PHX*(T_TN1_PHX - T_SN3_PHX);
    //  T_out_pFluid_PHX.T = 616.7;
    //  T_out_sFluid_PHX.T = 650.7;
      T_out_pFluid_PHX.T = delay(T_PN4_PHX, varTauPHXtoPipe, 5000);
      T_out_sFluid_PHX.T = delay(T_SN4_PHX, varTauPHXtoSHX, 5000);
      P_primaryLoop = m_dot_pFluid_PHX*cP_pFluid_PHX*(T_in_pFluid_PHX.T - T_out_pFluid_PHX.T) + P_decay.Q*4*m_PN1_PHX;
      annotation(
        Diagram(graphics = {Rectangle(origin = {30.2864, 0.0340212}, extent = {{-149.242, 59.993}, {149.242, -59.993}}), Rectangle(origin = {-60, 30}, lineColor = {170, 0, 0}, fillColor = {170, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {120, 30}, lineColor = {170, 0, 0}, fillColor = {170, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {0, 30}, lineColor = {170, 0, 0}, fillColor = {170, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-59.95, -29.61}, lineColor = {0, 85, 255}, fillColor = {0, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-19.63, -9.61}, {19.63, 9.61}}), Rectangle(origin = {-0.12, -29.82}, lineColor = {0, 85, 255}, fillColor = {0, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-19.88, 9.82}, {19.88, -9.82}}), Rectangle(origin = {59.8, -29.85}, lineColor = {0, 85, 255}, fillColor = {0, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-19.8, 9.85}, {19.8, -9.85}}), Rectangle(origin = {119.85, -29.89}, lineColor = {0, 85, 255}, fillColor = {0, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-19.85, 9.89}, {19.85, -9.89}}), Rectangle(origin = {89.92, -1.05}, lineColor = {136, 138, 133}, fillColor = {136, 138, 133}, fillPattern = FillPattern.Solid, extent = {{-49.92, 8.83}, {49.92, -8.83}}), Rectangle(origin = {60, 30}, lineColor = {170, 0, 0}, fillColor = {170, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-30.08, -1.05}, lineColor = {136, 138, 133}, fillColor = {136, 138, 133}, fillPattern = FillPattern.Solid, extent = {{-49.92, 8.83}, {49.92, -8.83}}), Text(origin = {-100, 8}, extent = {{-14, 6}, {14, -6}}, textString = "Tp_IN"), Text(origin = {-100, -50}, extent = {{-14, 6}, {14, -6}}, textString = "Ts_OUT"), Text(origin = {160, -50}, extent = {{-14, 6}, {14, -6}}, textString = "Ts_IN"), Text(origin = {162, 12}, extent = {{-14, 6}, {14, -6}}, textString = "Tp_OUT"), Text(origin = {147, 50}, extent = {{59, -14}, {-59, 14}}, textString = "PHX")}, coordinateSystem(extent = {{-120, 80}, {220, -80}})),
        Icon(graphics = {Rectangle(origin = {30.2864, 0.0340212}, extent = {{-149.242, 59.993}, {149.242, -59.993}}), Rectangle(origin = {-60, 30}, lineColor = {170, 0, 0}, fillColor = {170, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {120, 30}, lineColor = {170, 0, 0}, fillColor = {170, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {0, 30}, lineColor = {170, 0, 0}, fillColor = {170, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-59.95, -29.61}, lineColor = {0, 85, 255}, fillColor = {0, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-19.63, -9.61}, {19.63, 9.61}}), Rectangle(origin = {-0.12, -29.82}, lineColor = {0, 85, 255}, fillColor = {0, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-19.88, 9.82}, {19.88, -9.82}}), Rectangle(origin = {59.8, -29.85}, lineColor = {0, 85, 255}, fillColor = {0, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-19.8, 9.85}, {19.8, -9.85}}), Rectangle(origin = {119.85, -29.89}, lineColor = {0, 85, 255}, fillColor = {0, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-19.85, 9.89}, {19.85, -9.89}}), Rectangle(origin = {89.92, -1.05}, lineColor = {136, 138, 133}, fillColor = {136, 138, 133}, fillPattern = FillPattern.Solid, extent = {{-49.92, 8.83}, {49.92, -8.83}}), Rectangle(origin = {60, 30}, lineColor = {170, 0, 0}, fillColor = {170, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-30.08, -1.05}, lineColor = {136, 138, 133}, fillColor = {136, 138, 133}, fillPattern = FillPattern.Solid, extent = {{-49.92, 8.83}, {49.92, -8.83}}), Text(origin = {-100, 8}, extent = {{-14, 6}, {14, -6}}, textString = "Tp_IN"), Text(origin = {-100, -50}, extent = {{-14, 6}, {14, -6}}, textString = "Ts_OUT"), Text(origin = {160, -50}, extent = {{-14, 6}, {14, -6}}, textString = "Ts_IN"), Text(origin = {162, 12}, extent = {{-14, 6}, {14, -6}}, textString = "Tp_OUT"), Text(origin = {147, 50}, extent = {{59, -14}, {-59, 14}}, textString = "PHX")}));
    end PrimaryHeatExchanger;

    model SecondaryHeatExchanger
      // SHX parameters and equations
      // Parameter declaration
      parameter NERTHUS_Modelica.Units.Mass m_PN1_SHX;
      // Hot side (coolant salt from PHX) node 1 mass
      parameter NERTHUS_Modelica.Units.Mass m_PN2_SHX;
      // Hot side (coolant salt from PHX) node 2 mass
      parameter NERTHUS_Modelica.Units.Mass m_PN3_SHX;
      // Hot side (coolant salt from PHX) node 3 mass
      parameter NERTHUS_Modelica.Units.Mass m_PN4_SHX;
      // Hot side (coolant salt from PHX) node 4 mass
      parameter NERTHUS_Modelica.Units.Mass m_TN1_SHX;
      // SHX Tubing node 1 mass
      parameter NERTHUS_Modelica.Units.Mass m_TN2_SHX;
      // SHX Tubing node 2 mass
      parameter NERTHUS_Modelica.Units.Mass m_SN1_SHX;
      // Cold Side (Hitec salt from OTSG) node 1 mass
      parameter NERTHUS_Modelica.Units.Mass m_SN2_SHX;
      // Cold Side (Hitec salt from OTSG) node 2 mass
      parameter NERTHUS_Modelica.Units.Mass m_SN3_SHX;
      // Cold Side (Hitec salt from OTSG) node 3 mass
      parameter NERTHUS_Modelica.Units.Mass m_SN4_SHX;
      // Cold Side (Hitec salt from OTSG) node 4 mass
      parameter NERTHUS_Modelica.Units.SpecificHeatCapacity cP_pFluid_SHX;
      // Fuel salt specific heat [MJ/(kg*C)]
      parameter NERTHUS_Modelica.Units.SpecificHeatCapacity cP_Tube_SHX;
      // PHX Tubing specific heat [MJ/(kg*C)]
      parameter NERTHUS_Modelica.Units.SpecificHeatCapacity cP_sFluid_SHX;
      // Coolant salt specific heat [MJ/(kg*C)]
      parameter NERTHUS_Modelica.Units.MassFlowRate m_dot_pFluidNom_SHX;
      // Fuel salt nominal flow rate
      parameter NERTHUS_Modelica.Units.MassFlowRate m_dot_sFluidNom_SHX;
      // Coolant salt nominal flow rate
      parameter NERTHUS_Modelica.Units.Convection hApnNom_SHX;
      // PHX primary side heat transfer coefficient [MJ/(s*C)]
      parameter NERTHUS_Modelica.Units.Convection hAsnNom_SHX;
      // PHX secondary side heat transfer coefficient [MJ/(s*C)]
      parameter NERTHUS_Modelica.Units.ResidentTime tauSHXtoPHX;
      // Avg travel time from SHX to pipe
      parameter NERTHUS_Modelica.Units.ResidentTime tauSHXtoOTSG;
      // Avg travel time from SHX to PHX
      parameter NERTHUS_Modelica.Units.Temperature T_PN1_SHX_initial = 693.7;
      parameter NERTHUS_Modelica.Units.Temperature T_PN2_SHX_initial = 736.7;
      parameter NERTHUS_Modelica.Units.Temperature T_PN3_SHX_initial = 673.3;
      parameter NERTHUS_Modelica.Units.Temperature T_PN4_SHX_initial = 609.8;
      parameter NERTHUS_Modelica.Units.Temperature T_TN1_SHX_initial = 646.6;
      parameter NERTHUS_Modelica.Units.Temperature T_TN2_SHX_initial = 609.8;
      parameter NERTHUS_Modelica.Units.Temperature T_SN1_SHX_initial = 653.7;
      parameter NERTHUS_Modelica.Units.Temperature T_SN2_SHX_initial = 818.9;
      parameter NERTHUS_Modelica.Units.Temperature T_SN3_SHX_initial = 706.9;
      parameter NERTHUS_Modelica.Units.Temperature T_SN4_SHX_initial = 595.0;
      // Variable declaration
      NERTHUS_Modelica.Units.ResidentTime varTauSHXtoOTSG;
      NERTHUS_Modelica.Units.ResidentTime varTauSHXtoPHX;
      NERTHUS_Modelica.Units.MassFlowRate m_dot_pFluid_SHX;
      NERTHUS_Modelica.Units.MassFlowRate m_dot_sFluid_SHX;
      NERTHUS_Modelica.Units.Convection hApn_SHX;
      NERTHUS_Modelica.Units.Convection hAsn_SHX;
      NERTHUS_Modelica.Units.Temperature T_PN1_SHX;
      NERTHUS_Modelica.Units.Temperature T_PN2_SHX;
      NERTHUS_Modelica.Units.Temperature T_PN3_SHX;
      NERTHUS_Modelica.Units.Temperature T_PN4_SHX;
      NERTHUS_Modelica.Units.Temperature T_TN1_SHX;
      NERTHUS_Modelica.Units.Temperature T_TN2_SHX;
      NERTHUS_Modelica.Units.Temperature T_SN1_SHX;
      NERTHUS_Modelica.Units.Temperature T_SN2_SHX;
      NERTHUS_Modelica.Units.Temperature T_SN3_SHX;
      NERTHUS_Modelica.Units.Temperature T_SN4_SHX;
      NERTHUS_Modelica.Units.ReactorPower P_TertiaryLoop;
      NERTHUS_Modelica.Units.ReactorPower P_SecondaryLoop;
      // Connections to other modules
      input NERTHUS_Modelica.Connectors.Temp_In T_in_pFluid_SHX annotation(
        Placement(visible = true, transformation(origin = {-100, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-102, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      input NERTHUS_Modelica.Connectors.Temp_In T_in_sFluid_SHX annotation(
        Placement(visible = true, transformation(origin = {160, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {162, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      output NERTHUS_Modelica.Connectors.Temp_Out T_out_sFluid_SHX annotation(
        Placement(visible = true, transformation(origin = {-100, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      output NERTHUS_Modelica.Connectors.Temp_Out T_out_pFluid_SHX annotation(
        Placement(visible = true, transformation(origin = {160, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {162, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      input NERTHUS_Modelica.Connectors.FlowFraction_In secondaryFF annotation(
        Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-18, -18}, {18, 18}}, rotation = 0), iconTransformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      input NERTHUS_Modelica.Connectors.FlowFraction_In tertiaryFF annotation(
        Placement(visible = true, transformation(origin = {130, -50}, extent = {{-18, -18}, {18, 18}}, rotation = 0), iconTransformation(origin = {130, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    initial equation
      T_PN1_SHX = T_PN1_SHX_initial;
      T_PN2_SHX = T_PN2_SHX_initial;
      T_PN3_SHX = T_PN3_SHX_initial;
      T_PN4_SHX = T_PN4_SHX_initial;
      T_TN1_SHX = T_TN1_SHX_initial;
      T_TN2_SHX = T_TN2_SHX_initial;
      T_SN1_SHX = T_SN1_SHX_initial;
      T_SN2_SHX = T_SN2_SHX_initial;
      T_SN3_SHX = T_SN3_SHX_initial;
      T_SN4_SHX = T_SN4_SHX_initial;
    equation
      m_dot_pFluid_SHX = m_dot_pFluidNom_SHX*secondaryFF.FF;
      m_dot_sFluid_SHX = m_dot_sFluidNom_SHX*tertiaryFF.FF;
  varTauSHXtoPHX = tauSHXtoPHX/secondaryFF.FF;
  varTauSHXtoOTSG = tauSHXtoOTSG/tertiaryFF.FF;
// CHECK ON THIS NEXT PART LATER
      hApn_SHX = hApnNom_SHX*(0.8215*secondaryFF.FF^6 - 4.108*secondaryFF.FF^5 + 7.848*secondaryFF.FF^4 - 7.165*secondaryFF.FF^3 + 3.004*secondaryFF.FF^2 + 0.5903*secondaryFF.FF + 0.008537);
      hAsn_SHX = hAsnNom_SHX*(0.8215*tertiaryFF.FF^6 - 4.108*tertiaryFF.FF^5 + 7.848*tertiaryFF.FF^4 - 7.165*tertiaryFF.FF^3 + 3.004*tertiaryFF.FF^2 + 0.5903*tertiaryFF.FF + 0.008537);
// END CHECK
      m_PN1_SHX*cP_pFluid_SHX*der(T_PN1_SHX) = m_dot_pFluid_SHX*cP_pFluid_SHX*(T_in_pFluid_SHX.T - T_PN1_SHX) - hApn_SHX*(T_PN1_SHX - T_TN1_SHX);
      m_PN2_SHX*cP_pFluid_SHX*der(T_PN2_SHX) = m_dot_pFluid_SHX*cP_pFluid_SHX*(T_PN1_SHX - T_PN2_SHX) - hApn_SHX*(T_PN1_SHX - T_TN1_SHX);
      m_PN3_SHX*cP_pFluid_SHX*der(T_PN3_SHX) = m_dot_pFluid_SHX*cP_pFluid_SHX*(T_PN2_SHX - T_PN3_SHX) - hApn_SHX*(T_PN3_SHX - T_TN2_SHX);
      m_PN4_SHX*cP_pFluid_SHX*der(T_PN4_SHX) = m_dot_pFluid_SHX*cP_pFluid_SHX*(T_PN3_SHX - T_PN4_SHX) - hApn_SHX*(T_PN3_SHX - T_TN2_SHX);
      m_TN1_SHX*cP_Tube_SHX*der(T_TN1_SHX) = 2*hApn_SHX*(T_PN1_SHX - T_TN1_SHX) - 2*hAsn_SHX*(T_TN1_SHX - T_SN3_SHX);
      m_TN2_SHX*cP_Tube_SHX*der(T_TN2_SHX) = 2*hApn_SHX*(T_PN3_SHX - T_TN2_SHX) - 2*hAsn_SHX*(T_TN2_SHX - T_SN1_SHX);
      m_SN1_SHX*cP_sFluid_SHX*der(T_SN1_SHX) = m_dot_sFluid_SHX*cP_sFluid_SHX*(T_in_sFluid_SHX.T - T_SN1_SHX) + hAsn_SHX*(T_TN2_SHX - T_SN1_SHX);
      m_SN2_SHX*cP_sFluid_SHX*der(T_SN2_SHX) = m_dot_sFluid_SHX*cP_sFluid_SHX*(T_SN1_SHX - T_SN2_SHX) + hAsn_SHX*(T_TN2_SHX - T_SN1_SHX);
      m_SN3_SHX*cP_sFluid_SHX*der(T_SN3_SHX) = m_dot_sFluid_SHX*cP_sFluid_SHX*(T_SN2_SHX - T_SN3_SHX) + hAsn_SHX*(T_TN1_SHX - T_SN3_SHX);
      m_SN4_SHX*cP_sFluid_SHX*der(T_SN4_SHX) = m_dot_sFluid_SHX*cP_sFluid_SHX*(T_SN3_SHX - T_SN4_SHX) + hAsn_SHX*(T_TN1_SHX - T_SN3_SHX);
      T_out_pFluid_SHX.T = delay(T_PN4_SHX, varTauSHXtoPHX, 5000);
      T_out_sFluid_SHX.T = delay(T_SN4_SHX, varTauSHXtoOTSG, 5000);
    //  T_out_pFluid_SHX.T = 609.8;
    //  T_out_sFluid_SHX.T = 595;
      P_SecondaryLoop = m_dot_pFluid_SHX*cP_pFluid_SHX*(T_in_pFluid_SHX.T - T_PN4_SHX);
      P_TertiaryLoop = m_dot_sFluid_SHX*cP_sFluid_SHX*(T_SN4_SHX - T_in_sFluid_SHX.T);
      annotation(
        Diagram(graphics = {Rectangle(origin = {30.2864, 0.0340212}, extent = {{-149.242, 59.993}, {149.242, -59.993}}), Rectangle(origin = {-60, 30}, lineColor = {255, 170, 0}, fillColor = {255, 170, 0}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {120, 30}, lineColor = {255, 170, 0}, fillColor = {255, 170, 0}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {0, 30}, lineColor = {255, 170, 0}, fillColor = {255, 170, 0}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-59.95, -29.61}, lineColor = {170, 85, 255}, fillColor = {170, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-19.63, -9.61}, {19.63, 9.61}}), Rectangle(origin = {-0.12, -29.82}, lineColor = {170, 85, 255}, fillColor = {170, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-19.88, 9.82}, {19.88, -9.82}}), Rectangle(origin = {59.8, -29.85}, lineColor = {170, 85, 255}, fillColor = {170, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-19.8, 9.85}, {19.8, -9.85}}), Rectangle(origin = {119.85, -29.89}, lineColor = {170, 85, 255}, fillColor = {170, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-19.85, 9.89}, {19.85, -9.89}}), Rectangle(origin = {89.92, -1.05}, lineColor = {136, 138, 133}, fillColor = {136, 138, 133}, fillPattern = FillPattern.Solid, extent = {{-49.92, 8.83}, {49.92, -8.83}}), Rectangle(origin = {60, 30}, lineColor = {255, 170, 0}, fillColor = {255, 170, 0}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-30.08, -1.05}, lineColor = {136, 138, 133}, fillColor = {136, 138, 133}, fillPattern = FillPattern.Solid, extent = {{-49.92, 8.83}, {49.92, -8.83}}), Text(origin = {-100, 8}, extent = {{-14, 6}, {14, -6}}, textString = "Tp_IN"), Text(origin = {-100, -50}, extent = {{-14, 6}, {14, -6}}, textString = "Ts_OUT"), Text(origin = {160, -50}, extent = {{-14, 6}, {14, -6}}, textString = "Ts_IN"), Text(origin = {162, 12}, extent = {{-14, 6}, {14, -6}}, textString = "Tp_OUT"), Text(origin = {147, 50}, extent = {{59, -14}, {-59, 14}}, textString = "SHX")}, coordinateSystem(extent = {{-120, 80}, {220, -80}})),
        Icon(graphics = {Rectangle(origin = {30.2864, 0.0340212}, extent = {{-149.242, 59.993}, {149.242, -59.993}}), Rectangle(origin = {-60, 30}, lineColor = {255, 170, 0}, fillColor = {255, 170, 0}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {120, 30}, lineColor = {255, 170, 0}, fillColor = {255, 170, 0}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {0, 30}, lineColor = {255, 170, 0}, fillColor = {255, 170, 0}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-59.95, -29.61}, lineColor = {170, 85, 255}, fillColor = {170, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-19.63, -9.61}, {19.63, 9.61}}), Rectangle(origin = {-0.12, -29.82}, lineColor = {170, 85, 255}, fillColor = {170, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-19.88, 9.82}, {19.88, -9.82}}), Rectangle(origin = {59.8, -29.85}, lineColor = {170, 85, 255}, fillColor = {170, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-19.8, 9.85}, {19.8, -9.85}}), Rectangle(origin = {119.85, -29.89}, lineColor = {170, 85, 255}, fillColor = {170, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-19.85, 9.89}, {19.85, -9.89}}), Rectangle(origin = {89.92, -1.05}, lineColor = {136, 138, 133}, fillColor = {136, 138, 133}, fillPattern = FillPattern.Solid, extent = {{-49.92, 8.83}, {49.92, -8.83}}), Rectangle(origin = {60, 30}, lineColor = {255, 170, 0}, fillColor = {255, 170, 0}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-30.08, -1.05}, lineColor = {136, 138, 133}, fillColor = {136, 138, 133}, fillPattern = FillPattern.Solid, extent = {{-49.92, 8.83}, {49.92, -8.83}}), Text(origin = {-100, 8}, extent = {{-14, 6}, {14, -6}}, textString = "Tp_IN"), Text(origin = {-100, -50}, extent = {{-14, 6}, {14, -6}}, textString = "Ts_OUT"), Text(origin = {160, -50}, extent = {{-14, 6}, {14, -6}}, textString = "Ts_IN"), Text(origin = {162, 12}, extent = {{-14, 6}, {14, -6}}, textString = "Tp_OUT"), Text(origin = {147, 50}, extent = {{59, -14}, {-59, 14}}, textString = "SHX")}),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
    end SecondaryHeatExchanger;

    model OnceThroughSteamGenerator
      // OTSG parameters and equations
      
      // Parameter declaration
      //parameter NERTHUS_Modelica.Units.Mass M_sh_initial; // Starting total superheated steam mass
      parameter NERTHUS_Modelica.Units.Density rho_hitec;
      parameter NERTHUS_Modelica.Units.Density rho_tube;
      parameter NERTHUS_Modelica.Units.Density rho_SC = 778.8648; // Density of subcooled fluid in neighbor node to saturated boiling
      parameter NERTHUS_Modelica.Units.Density rho_sh = 45.05219; 
      parameter NERTHUS_Modelica.Units.SpecificHeatCapacity cP_hitec; // Hitec salt specific heat [MJ/(kg*C)]
      parameter NERTHUS_Modelica.Units.SpecificHeatCapacity cP_Tube_OTSG; // OTSG Tubing specific heat [MJ/(kg*C)]
      parameter NERTHUS_Modelica.Units.SpecificHeatCapacity cP_SH1; 
      parameter NERTHUS_Modelica.Units.SpecificHeatCapacity cP_SH2; 
      parameter NERTHUS_Modelica.Units.SpecificHeatCapacity cP_fdw; // Specific heat of subcooled fluid at OTSG inlet
      parameter NERTHUS_Modelica.Units.SpecificHeatCapacity cP_SC; // Specific heat of subcooled fluid in neighbor node to saturated boiling
      parameter NERTHUS_Modelica.Units.MassFlowRate m_dot_hitecNom; // Hitec salt nominal flow rate
      parameter NERTHUS_Modelica.Units.MassFlowRate m_dot_fdwNom; // Feedwater nominal flow rate
      //parameter NERTHUS_Modelica.Units.MassFlowRate m_dot_BNom; // Saturated boiling domain nominal flow rate
      parameter NERTHUS_Modelica.Units.Convection h_pw; // OTSG primary side to tubes heat transfer coefficient [MJ/(s*C)]
      parameter NERTHUS_Modelica.Units.Convection h_wsh; // OTSG tubes to superheated steam heat transfer coefficient [MJ/(s*C)]
      parameter NERTHUS_Modelica.Units.Convection h_wb; // OTSG tubes to saturated boiling heat transfer coefficient [MJ/(s*C)]
      parameter NERTHUS_Modelica.Units.Convection h_wsc; // OTSG tubes to subcooled fluid heat transfer coefficient [MJ/(s*C)]
      parameter NERTHUS_Modelica.Units.ResidentTime tauOTSGtoSHX; // Avg travel time from PHX to SHX
    //  parameter NERTHUS_Modelica.Units.Temperature T_fdw_initial = 180;
      parameter NERTHUS_Modelica.Units.Temperature T_fdw = 180;
      parameter NERTHUS_Modelica.Units.Temperature T_PN1_OTSG_initial = 605.5;
      parameter NERTHUS_Modelica.Units.Temperature T_PN2_OTSG_initial = 579.6;
      parameter NERTHUS_Modelica.Units.Temperature T_PN3_OTSG_initial = 557.5;
      parameter NERTHUS_Modelica.Units.Temperature T_PN4_OTSG_initial = 537.3;
      parameter NERTHUS_Modelica.Units.Temperature T_PN5_OTSG_initial = 523.9;
      parameter NERTHUS_Modelica.Units.Temperature T_PN6_OTSG_initial = 507.3;
      parameter NERTHUS_Modelica.Units.Temperature T_TN1_OTSG_initial = 583.4;
      parameter NERTHUS_Modelica.Units.Temperature T_TN2_OTSG_initial = 542.1;
      parameter NERTHUS_Modelica.Units.Temperature T_TN3_OTSG_initial = 408.7;
      parameter NERTHUS_Modelica.Units.Temperature T_TN4_OTSG_initial = 401.0;
      parameter NERTHUS_Modelica.Units.Temperature T_TN5_OTSG_initial = 416.0;
      parameter NERTHUS_Modelica.Units.Temperature T_TN6_OTSG_initial = 368.8;
      parameter NERTHUS_Modelica.Units.Temperature T_SH1_OTSG_initial = 594.7;
      parameter NERTHUS_Modelica.Units.Temperature T_SH2_OTSG_initial = 537.6;
      parameter NERTHUS_Modelica.Units.Temperature T_sat_OTSG_initial = 327.8;
      parameter NERTHUS_Modelica.Units.Temperature T_SC2_OTSG_initial = 250.1;
      parameter NERTHUS_Modelica.Units.Temperature X_5 = 2.469804064618581e+02; // Saturated boiling temperature at zero pressure [C]
      parameter NERTHUS_Modelica.Units.TsatConstant K_5 = 6.473415732352336; // Saturated boiling temperature change per pressure [C/Psat]
      parameter NERTHUS_Modelica.Units.X_4 X_4 = 1.942396453493191; // Hfg = Hg - Hf (Specific enthalpy as a saturated gas/vapor minus specific enthalpy as a saturated fluid)
      parameter NERTHUS_Modelica.Units.K_4 K_4 = -0.062356611803191; // Ptable polyfitted with Hfg_table
      parameter NERTHUS_Modelica.Units.K_sc K_sc = -17.615718797133468; // Thermal conductivity constant(?)
      parameter NERTHUS_Modelica.Units.Number K_1 = 11.632248097704855;
      parameter NERTHUS_Modelica.Units.Number K_b = 12.834854076292217;
      parameter NERTHUS_Modelica.Units.Length L_sc_initial;
      parameter NERTHUS_Modelica.Units.Length L_b_initial;
      parameter NERTHUS_Modelica.Units.Length L_sh_initial;
      parameter NERTHUS_Modelica.Units.Length L_OTSG;
      parameter NERTHUS_Modelica.Units.Length D_inner; // Inner diameter of the tubes
      parameter NERTHUS_Modelica.Units.Length D_outer; // Outer diameter of the tubes
      parameter NERTHUS_Modelica.Units.Area A_flow; // Cross-sectional area of flow on secondary side [m^2]
      parameter NERTHUS_Modelica.Units.Number N_tubes;
      parameter NERTHUS_Modelica.Units.Number pi;
      parameter NERTHUS_Modelica.Units.EnthalpyChange dHs_dPs = -0.042433622114357; // Superheated steam Specific enthalpy change per pressure change
      parameter NERTHUS_Modelica.Units.CompressibilityFactor Z_ss = 0.76634; // Compressibility factor at 570K and 60 atm
      parameter NERTHUS_Modelica.Units.UniversalGasConstant R_ugc = 8.3114462e-6; // Universal gas constant [MJ/(mol*C)]
      parameter NERTHUS_Modelica.Units.MolarMass MM_stm = 0.018; // Molar mass of steam
      parameter NERTHUS_Modelica.Units.Pressure P_setpoint = 12.5; // Nominal secondary side pressure [MPa]
      // Variable declaration
      NERTHUS_Modelica.Units.ResidentTime varTauOTSGtoSHX;
      NERTHUS_Modelica.Units.MassFlowRate m_dot_fdw;
      NERTHUS_Modelica.Units.MassFlowRate m_dot_hitec;
      NERTHUS_Modelica.Units.MassFlowRate m_dot_SC;
      NERTHUS_Modelica.Units.MassFlowRate m_dot_B;
      NERTHUS_Modelica.Units.MassFlowRate m_dot_SH;
    //  NERTHUS_Modelica.Units.Temperature T_fdw;
      NERTHUS_Modelica.Units.Temperature T_PN1;
      NERTHUS_Modelica.Units.Temperature T_PN2;
      NERTHUS_Modelica.Units.Temperature T_PN3;
      NERTHUS_Modelica.Units.Temperature T_PN4;
      NERTHUS_Modelica.Units.Temperature T_PN5;
      NERTHUS_Modelica.Units.Temperature T_PN6;
      NERTHUS_Modelica.Units.Temperature T_TN1;
      NERTHUS_Modelica.Units.Temperature T_TN2;
      NERTHUS_Modelica.Units.Temperature T_TN3;
      NERTHUS_Modelica.Units.Temperature T_TN4;
      NERTHUS_Modelica.Units.Temperature T_TN5;
      NERTHUS_Modelica.Units.Temperature T_TN6;
      NERTHUS_Modelica.Units.Temperature T_SH1;
      NERTHUS_Modelica.Units.Temperature T_SH2;
      NERTHUS_Modelica.Units.Temperature T_sat;
      NERTHUS_Modelica.Units.Temperature T_SC2;
      NERTHUS_Modelica.Units.Density rho_b;
      NERTHUS_Modelica.Units.Pressure P_stm;
      NERTHUS_Modelica.Units.Length L_sc;
      NERTHUS_Modelica.Units.Length L_b;
      NERTHUS_Modelica.Units.Length L_sh;
      NERTHUS_Modelica.Units.Mass M_sh;
      NERTHUS_Modelica.Units.ReactorPower P_OTSG_Primary;
      
      // Connections to other modules
      input NERTHUS_Modelica.Connectors.Temp_In T_in_hitec_OTSG annotation(
        Placement(visible = true, transformation(origin = {-176, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-176, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      output NERTHUS_Modelica.Connectors.Temp_Out T_out_hitec_OTSG annotation(
        Placement(visible = true, transformation(origin = {154, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {154, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      input NERTHUS_Modelica.Connectors.FlowFraction_In tertiaryFF annotation(
        Placement(visible = true, transformation(origin = {-176, 58}, extent = {{-18, -18}, {18, 18}}, rotation = 0), iconTransformation(origin = {-176, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      input NERTHUS_Modelica.Connectors.FlowFraction_In feedwaterFF annotation(
        Placement(visible = true, transformation(origin = {-176, -60}, extent = {{-18, -18}, {18, 18}}, rotation = 0), iconTransformation(origin = {-176, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      
    initial equation
// Need: Initial lengths (L_sc, L_b, and L_sh), initial temps, initial pressures,
//m_dot_B = m_dot_BNom;
      T_PN1 = T_PN1_OTSG_initial;
      T_PN2 = T_PN2_OTSG_initial;
      T_PN3 = T_PN3_OTSG_initial;
      T_PN4 = T_PN4_OTSG_initial;
      T_PN5 = T_PN5_OTSG_initial;
      T_PN6 = T_PN6_OTSG_initial;
      T_TN1 = T_TN1_OTSG_initial;
      T_TN2 = T_TN2_OTSG_initial;
      T_TN3 = T_TN3_OTSG_initial;
      T_TN4 = T_TN4_OTSG_initial;
      T_TN5 = T_TN5_OTSG_initial;
      T_TN6 = T_TN6_OTSG_initial;
      T_SH1 = T_SH1_OTSG_initial;
      T_SH2 = T_SH2_OTSG_initial;
    //  T_sat = T_sat_OTSG_initial;
      T_SC2 = T_SC2_OTSG_initial;
    //  T_fdw = T_fdw_initial;
      L_sc = L_sc_initial;
      L_b = L_b_initial;
      L_sh = L_sh_initial;
    //  der(L_sc) = 0;
    //  der(L_b) = 0;
    //  der(L_sh) = 0;
      P_stm = P_setpoint;
      M_sh = A_flow * rho_sh * L_sh_initial;
    //  m_dot_SC = m_dot_fdwNom;
    //  m_dot_B = m_dot_fdwNom;
    //  m_dot_SH = m_dot_fdwNom;
      
    equation
      m_dot_fdw = m_dot_fdwNom*feedwaterFF.FF;
      m_dot_hitec = m_dot_hitecNom*tertiaryFF.FF;
      varTauOTSGtoSHX = tauOTSGtoSHX/tertiaryFF.FF; // Check
      
// Primary Side Nodes
      der(T_PN1)*(N_tubes*pi*(D_inner^2)*0.25*L_sh*0.5*rho_hitec*cP_hitec) = ((m_dot_hitec*cP_hitec*(T_in_hitec_OTSG.T - T_PN1)) + (h_pw*N_tubes*pi*D_inner*L_sh*0.5*(T_TN1 - T_PN1))); // Primary side node #1 temperature eqn
      der(T_PN2)*(N_tubes*pi*(D_inner^2)*0.25*L_sh*0.5*rho_hitec*cP_hitec) = ((m_dot_hitec*cP_hitec*(T_PN1 - T_PN2)) + (h_pw*N_tubes*pi*D_inner*L_sh*0.5*(T_TN2 - T_PN2))); // Primary side node #2 temperature eqn
      der(T_PN3)*(N_tubes*pi*(D_inner^2)*0.25*L_b*0.5*rho_hitec*cP_hitec) = ((m_dot_hitec*cP_hitec*(T_PN2 - T_PN3)) + (h_pw*N_tubes*pi*D_inner*L_b*0.5*(T_TN3 - T_PN3))); // Primary side node #3 temperature eqn
      der(T_PN4)*(N_tubes*pi*(D_inner^2)*0.25*L_b*0.5*rho_hitec*cP_hitec) = ((m_dot_hitec*cP_hitec*(T_PN3 - T_PN4)) + (h_pw*N_tubes*pi*D_inner*L_b*0.5*(T_TN4 - T_PN4))); // Primary side node #4 temperature eqn
      der(T_PN5)*(N_tubes*pi*(D_inner^2)*0.25*L_sc*0.5*rho_hitec*cP_hitec) = ((m_dot_hitec*cP_hitec*(T_PN4 - T_PN5)) + (h_pw*N_tubes*pi*D_inner*L_sc*0.5*(T_TN5 - T_PN5))); // Primary side node #5 temperature eqn
      der(T_PN6)*(N_tubes*pi*(D_inner^2)*0.25*L_sc*0.5*rho_hitec*cP_hitec) = ((m_dot_hitec*cP_hitec*(T_PN5 - T_PN6)) + (h_pw*N_tubes*pi*D_inner*L_sc*0.5*(T_TN6 - T_PN6))); // Primary side node #6 temperature eqn
      
      T_out_hitec_OTSG.T = delay(T_PN6, varTauOTSGtoSHX, 5000);
    //  T_out_hitec_OTSG.T = 488.6;
      
//// Tube Nodes
      der(T_TN1)*(N_tubes*pi*(D_outer^2 - D_inner^2)*0.25*L_sh*0.5*rho_tube*cP_Tube_OTSG) = (h_pw*(N_tubes*pi*D_inner*L_sh*0.5)*(T_PN1 - T_TN1) + h_wsh*(N_tubes*pi*D_outer*L_sh*0.5)*(T_SH1 - T_TN1)); // Tubing node #1 temperature eqn
      der(T_TN2)*(N_tubes*pi*(D_outer^2 - D_inner^2)*0.25*L_sh*0.5*rho_tube*cP_Tube_OTSG) = (h_pw*(N_tubes*pi*D_inner*L_sh*0.5)*(T_PN2 - T_TN2) + h_wsh*(N_tubes*pi*D_outer*L_sh*0.5)*(T_SH2 - T_TN2)); // Tubing node #2 temperature eqn
      der(T_TN3)*(N_tubes*pi*(D_outer^2 - D_inner^2)*0.25*L_b*0.5*rho_tube*cP_Tube_OTSG) = (h_pw*(N_tubes*pi*D_inner*L_b*0.5)*(T_PN3 - T_TN3) + h_wb*(N_tubes*pi*D_outer*L_b*0.5)*(T_sat - T_TN3)); // Tubing node #3 temperature eqn
      der(T_TN4)*(N_tubes*pi*(D_outer^2 - D_inner^2)*0.25*L_b*0.5*rho_tube*cP_Tube_OTSG) = (h_pw*(N_tubes*pi*D_inner*L_b*0.5)*(T_PN4 - T_TN4) + h_wb*(N_tubes*pi*D_outer*L_b*0.5)*(T_sat - T_TN4)); // Tubing node #4 temperature eqn
      der(T_TN5)*(N_tubes*pi*(D_outer^2 - D_inner^2)*0.25*L_sc*0.5*rho_tube*cP_Tube_OTSG) = (h_pw*(N_tubes*pi*D_inner*L_sc*0.5)*(T_PN5 - T_TN5) + h_wsc*(N_tubes*pi*D_outer*L_sc*0.5)*(T_sat - T_TN5)); // Tubing node #5 temperature eqn
      der(T_TN6)*(N_tubes*pi*(D_outer^2 - D_inner^2)*0.25*L_sc*0.5*rho_tube*cP_Tube_OTSG) = (h_pw*(N_tubes*pi*D_inner*L_sc*0.5)*(T_PN6 - T_TN6) + h_wsc*(N_tubes*pi*D_outer*L_sc*0.5)*(T_SC2 - T_TN6)); // Tubing node #6 temperature eqn
      
    //  T_TN1 = 583.4;
    //  T_TN2 = 542.1;
    //  T_TN3 = 408.7;
    //  T_TN4 = 401.0;
    //  T_TN5 = 416.0;
    //  T_TN6 = 368.8;
      
//// Secondary Side Nodes
    //  if T_SH2 > 50 then
      der(T_SH1)*(M_sh*0.5*cP_SH1) = (h_wsh*(N_tubes*pi*D_outer*L_sh*0.5)*(T_TN1 - T_SH1) + (m_dot_SH*cP_SH1*(T_SH2 - T_SH1)) + (cP_SH1*(T_SH2 - T_SH1)*der(M_sh)*0.5) + (A_flow*L_sh*0.5*dHs_dPs)*der(P_stm)); // Superheated steam node #1 (outlet) temperature eqn
      der(T_SH2)*(M_sh*0.5*cP_SH2) = (h_wsh*(N_tubes*pi*D_outer*L_sh*0.5)*(T_TN2 - T_SH2) + (m_dot_B*cP_SH2*(T_sat - T_SH2)) + (A_flow*L_sh*0.5 - M_sh*0.5*dHs_dPs)*der(P_stm)); // Superheated steam node #2 temperature eqn
      T_sat = X_5 + K_5*P_stm; // Saturated boiling temp eqn
    //  else
    //  der(T_SH1)*(M_sh*0.5*cP_SC) = (h_wsc*(N_tubes*pi*D_outer*L_sh*0.5)*(T_TN1 - T_SH1) + (m_dot_SH*cP_SC*(T_SH2 - T_SH1)) + (cP_SC*(T_SH2 - T_SH1)*der(M_sh)*0.5) + (A_flow*L_sh*0.5*dHs_dPs)*der(P_stm)); // Superheated steam node #1 (outlet) temperature eqn
    //  der(T_SH2)*(M_sh*0.5*cP_SC) = (h_wsc*(N_tubes*pi*D_outer*L_sh*0.5)*(T_TN2 - T_SH2) + (m_dot_B*cP_SC*(T_SC2 - T_SH2)) + (A_flow*L_sh*0.5 - M_sh*0.5*dHs_dPs)*der(P_stm)); // Superheated steam node #2 temperature eqn
    //  der(T_sat) = ((h_wsc*(N_tubes*pi*D_outer*L_b*0.5)*(T_TN3-T_sat) + (cP_SC*m_dot_SC*T_SC2) - cP_SC*((m_dot_SC+m_dot_B)*0.5*T_sat) + A_flow*L_b*0.5*der(P_stm)) * (2/(A_flow * rho_SC *cP_SC)) - T_SC2*der(L_b))*(1/L_b);
    //  end if;
      
      der(T_SC2) = ((h_wsc*(N_tubes*pi*D_outer*L_sc*0.5)*(T_TN6-T_SC2) + (cP_fdw*m_dot_fdw*T_fdw) - cP_SC*((m_dot_fdw+m_dot_SC)*0.5*T_SC2) + A_flow*L_sc*0.5*der(P_stm)) * (2/(A_flow * rho_SC *cP_SC)) - T_SC2*der(L_sc))*(1/L_sc); // Subcooled fluid node temperature eqn
    
    //  der(P_stm) = 0;
      der(P_stm)*A_flow*L_sh = ((Z_ss*R_ugc)*(der(M_sh)*(T_SH1 + T_SH2) + M_sh*(der(T_SH1) + der(T_SH2)))/(2*MM_stm)) - (P_stm*A_flow*der(L_sh)); // Secondary side pressure. T_sh1 is OTSG outlet. Assumption: P_subcooled = P_stmuratedboiling = P_superheated
      rho_b = 25.884875705 + 12.835*P_stm; // Two-phase boiling density eqn
      der(L_sc) = (1/(A_flow * 0.5 * rho_SC * cP_SC * (T_SC2 - T_sat))) * (h_wsc * N_tubes * pi * D_outer * L_sc * 0.5 * (T_TN5 - T_sat) + cP_SC * (m_dot_fdw * T_SC2 - (m_dot_fdw + m_dot_SC) * 0.5 * T_sat) - A_flow * L_sc * 0.5 * (K_sc * cP_SC * (T_SC2 - 2 * T_sat) - 1) * der(P_stm) - (A_flow * rho_SC * cP_SC * K_1 * L_sc * 0.5 * der(P_stm))); // Subcooled domain length eqn
      //der(L_sc) = 0;
      //der(L_b) = 0;
      der(L_b)*A_flow*rho_b = m_dot_SC - m_dot_B - (A_flow*L_b*K_b*der(P_stm)); // Boiling domain length eqn
      L_sh = L_OTSG - L_b - L_sc; // Total OTSG length eqn
    //  der(L_sh) = -der(L_b) - der(L_sc); // Superheated domain length eqn
      m_dot_SH = m_dot_fdw * P_stm / P_setpoint; // Flow rate out of superheated domain (and OTSG)
      m_dot_SC = m_dot_fdw - (rho_SC*A_flow*der(L_sc)) - (A_flow*L_sc*K_sc*der(P_stm)); // Flow rate out of subcooled domain
      m_dot_B = (h_wb*(N_tubes*pi*D_outer*L_b)*(T_TN3*0.5 + T_TN4*0.5 - T_sat))/(X_4 + K_4*P_stm); // Flow rate out of boiling domain
    //  m_dot_SC = 1.925004320027648e+02;
    //  m_dot_B = 1.925004320027648e+02;
      der(M_sh) = m_dot_B - m_dot_SH; // Rate of steam mass change
      
      P_OTSG_Primary = m_dot_hitec*cP_hitec*(T_in_hitec_OTSG.T - T_PN6);
      
    annotation(
        Diagram(graphics = {Rectangle(origin = {-5, -2}, extent = {{-185, 74}, {185, -74}}), Rectangle(origin = {-128, 30}, lineColor = {236, 127, 211}, fillColor = {236, 127, 211}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-128, -30}, lineColor = {127, 236, 152}, fillColor = {127, 236, 152}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-80, 30}, lineColor = {236, 127, 211}, fillColor = {236, 127, 211}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-32, 30}, lineColor = {236, 127, 211}, fillColor = {236, 127, 211}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {16, 30}, lineColor = {236, 127, 211}, fillColor = {236, 127, 211}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {64, 30}, lineColor = {236, 127, 211}, fillColor = {236, 127, 211}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {112, 30}, lineColor = {236, 127, 211}, fillColor = {236, 127, 211}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-80, -30}, lineColor = {127, 236, 152}, fillColor = {127, 236, 152}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {16, -30}, lineColor = {127, 236, 152}, fillColor = {127, 236, 152}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-32, -30}, lineColor = {127, 236, 152}, fillColor = {127, 236, 152}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {112, -30}, lineColor = {127, 236, 152}, fillColor = {127, 236, 152}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {64, -30}, lineColor = {127, 236, 152}, fillColor = {127, 236, 152}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-128, 0}, lineColor = {136, 138, 133}, fillColor = {136, 138, 133}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-80, 0}, lineColor = {136, 138, 133}, fillColor = {136, 138, 133}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {16, 0}, lineColor = {136, 138, 133}, fillColor = {136, 138, 133}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-32, 0}, lineColor = {136, 138, 133}, fillColor = {136, 138, 133}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {112, 0}, lineColor = {136, 138, 133}, fillColor = {136, 138, 133}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {64, 0}, lineColor = {136, 138, 133}, fillColor = {136, 138, 133}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Text(origin = {-10, 58}, extent = {{-38, 16}, {38, -16}}, textString = "OTSG")}, coordinateSystem(extent = {{-200, 80}, {220, -80}})),
        Icon(graphics = {Rectangle(origin = {-5, -2}, extent = {{-185, 74}, {185, -74}}), Rectangle(origin = {-128, 30}, lineColor = {236, 127, 211}, fillColor = {236, 127, 211}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-128, -30}, lineColor = {127, 236, 152}, fillColor = {127, 236, 152}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-80, 30}, lineColor = {236, 127, 211}, fillColor = {236, 127, 211}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-32, 30}, lineColor = {236, 127, 211}, fillColor = {236, 127, 211}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {16, 30}, lineColor = {236, 127, 211}, fillColor = {236, 127, 211}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {64, 30}, lineColor = {236, 127, 211}, fillColor = {236, 127, 211}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {112, 30}, lineColor = {236, 127, 211}, fillColor = {236, 127, 211}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-80, -30}, lineColor = {127, 236, 152}, fillColor = {127, 236, 152}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {16, -30}, lineColor = {127, 236, 152}, fillColor = {127, 236, 152}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-32, -30}, lineColor = {127, 236, 152}, fillColor = {127, 236, 152}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {112, -30}, lineColor = {127, 236, 152}, fillColor = {127, 236, 152}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {64, -30}, lineColor = {127, 236, 152}, fillColor = {127, 236, 152}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-128, 0}, lineColor = {136, 138, 133}, fillColor = {136, 138, 133}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-80, 0}, lineColor = {136, 138, 133}, fillColor = {136, 138, 133}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {16, 0}, lineColor = {136, 138, 133}, fillColor = {136, 138, 133}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {-32, 0}, lineColor = {136, 138, 133}, fillColor = {136, 138, 133}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {112, 0}, lineColor = {136, 138, 133}, fillColor = {136, 138, 133}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Rectangle(origin = {64, 0}, lineColor = {136, 138, 133}, fillColor = {136, 138, 133}, fillPattern = FillPattern.Solid, extent = {{-20, 10}, {20, -10}}), Text(origin = {-10, 58}, extent = {{-38, 16}, {38, -16}}, textString = "OTSG")}));
end OnceThroughSteamGenerator;

    model DecayHeatRemovalSystem
      // DHRS parameters and equations
      // Parameter declaration
      parameter NERTHUS_Modelica.Units.Mass m_DHRS;
      parameter NERTHUS_Modelica.Units.SpecificHeatCapacity Cp_fluid;
      parameter NERTHUS_Modelica.Units.MassFlowRate m_dotNom_DHRS;
      parameter NERTHUS_Modelica.Units.Mass m_Pi_C_PHX;
      parameter NERTHUS_Modelica.Units.DHRStimeConstant DHRS_timeConstant;
      parameter NERTHUS_Modelica.Units.HeatFlowRate DHRS_MaxPowerRm;
      parameter NERTHUS_Modelica.Units.HeatFlowRate DHRS_PowerBleed;
      parameter NERTHUS_Modelica.Units.InitiationTime DHRS_time;
      parameter NERTHUS_Modelica.Units.ResidentTime tauDHRStoPHX;
      // Variable declaration
      NERTHUS_Modelica.Units.ResidentTime varTauDHRStoPHX;
      NERTHUS_Modelica.Units.MassFlowRate m_dot_DHRS;
      NERTHUS_Modelica.Units.Temperature DHRS_Temp;
      NERTHUS_Modelica.Units.HeatFlowRate DHRS_PowerRm;
      // Connections to other modules
      input NERTHUS_Modelica.Connectors.Temp_In DHRS_tempIN annotation(
        Placement(visible = true, transformation(origin = {-60, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      input NERTHUS_Modelica.Connectors.DecayHeat_In DHRS_DecayHeat annotation(
        Placement(visible = true, transformation(origin = {-60, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      output NERTHUS_Modelica.Connectors.Temp_Out DHRS_TempOUT annotation(
        Placement(visible = true, transformation(origin = {44, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {44, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      input NERTHUS_Modelica.Connectors.FlowFraction_In fuelFlowFrac annotation(
        Placement(visible = true, transformation(origin = {-60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    initial equation
      DHRS_TempOUT.T = 681.8;
    equation
      m_dot_DHRS = m_dotNom_DHRS*fuelFlowFrac.FF;
      varTauDHRStoPHX = tauDHRStoPHX/fuelFlowFrac.FF;
      DHRS_PowerRm = (DHRS_MaxPowerRm - DHRS_PowerBleed)/(1 + exp(log(1/1E-3 - 1)*(1 - (time - DHRS_time)/DHRS_timeConstant))) + DHRS_PowerBleed;
      m_DHRS*Cp_fluid*der(DHRS_Temp) = m_dot_DHRS*Cp_fluid*(DHRS_tempIN.T - DHRS_Temp) + 12.171*DHRS_DecayHeat.Q*m_Pi_C_PHX - DHRS_PowerRm;
      DHRS_TempOUT.T = delay(DHRS_Temp, varTauDHRStoPHX, 5000);
      annotation(
        Diagram(graphics = {Rectangle(origin = {-10, 20}, extent = {{-70, 60}, {70, -60}}), Text(origin = {-57, 5}, extent = {{-15, 11}, {15, -11}}, textString = "Temp IN"), Text(origin = {41, 5}, extent = {{-15, 11}, {15, -11}}, textString = "Temp OUT"), Text(origin = {-57, 47}, extent = {{-15, 11}, {15, -11}}, textString = "Decay Heat"), Text(origin = {31, 66}, extent = {{-31, 12}, {31, -12}}, textString = "DHRS")}),
        Icon(graphics = {Text(origin = {31, 66}, extent = {{-31, 12}, {31, -12}}, textString = "DHRS"), Rectangle(origin = {-10, 20}, extent = {{-70, 60}, {70, -60}}), Text(origin = {-57, 47}, extent = {{-15, 11}, {15, -11}}, textString = "Decay Heat"), Text(origin = {-57, 5}, extent = {{-15, 11}, {15, -11}}, textString = "Temp IN"), Text(origin = {41, 5}, extent = {{-15, 11}, {15, -11}}, textString = "Temp OUT")}));
    end DecayHeatRemovalSystem;

    model PrimaryLoopPump
      // Fuel Salt Pump parameters and equations
      parameter NERTHUS_Modelica.Units.FlowFraction freeConvectionFF;
      parameter NERTHUS_Modelica.Units.PumpConstant primaryPumpK;
      parameter NERTHUS_Modelica.Units.InitiationTime tripPrimaryPump;
      output NERTHUS_Modelica.Connectors.FlowFraction_Out primaryFF annotation(
        Placement(visible = true, transformation(origin = {0, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, -58}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    initial equation
  primaryFF.FF = 1;
    equation
      primaryFF.FF = (1 - freeConvectionFF)*exp(-primaryPumpK*delay(time, tripPrimaryPump)) + freeConvectionFF;
      annotation(
        Diagram(graphics = {Rectangle(lineColor = {245, 121, 0}, lineThickness = 1, extent = {{-60, 60}, {60, -60}}), Text(origin = {2, 6}, extent = {{-42, 16}, {42, -16}}, textString = "Primary Pump")}),
        Icon(graphics = {Rectangle(origin = {0, -20}, lineColor = {245, 121, 0}, lineThickness = 1, extent = {{-60, 60}, {60, -60}}), Text(origin = {4, -20}, extent = {{-42, 16}, {42, -16}}, textString = "Primary Pump")}));
    end PrimaryLoopPump;

    model SecondaryLoopPump
      // Coolant Salt Pump parameters and equations
      parameter NERTHUS_Modelica.Units.FlowFraction freeConvectionFF;
      parameter NERTHUS_Modelica.Units.PumpConstant secondaryPumpK;
      parameter NERTHUS_Modelica.Units.InitiationTime tripSecondaryPump;
      output NERTHUS_Modelica.Connectors.FlowFraction_Out secondaryFF annotation(
        Placement(visible = true, transformation(origin = {-1.77636e-15, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {1.77636e-15, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    initial equation
    secondaryFF.FF = 1;
    equation
      secondaryFF.FF = (1 - freeConvectionFF)*exp(-secondaryPumpK*delay(time, tripSecondaryPump)) + freeConvectionFF;
      annotation(
        Diagram(graphics = {Rectangle(lineColor = {0, 85, 0}, lineThickness = 1, extent = {{-60, 60}, {60, -60}}), Text(origin = {2, 6}, extent = {{-42, 16}, {42, -16}}, textString = "Secondary Pump")}),
        Icon(graphics = {Rectangle(origin = {0, -20}, lineColor = {245, 121, 0}, lineThickness = 1, extent = {{-60, 60}, {60, -60}}), Text(origin = {4, -20}, extent = {{-42, 16}, {42, -16}}, textString = "Secondary Pump")}));
    end SecondaryLoopPump;

    model TertiaryLoopPump
      // Hitec Salt Pump parameters and equations
      parameter NERTHUS_Modelica.Units.FlowFraction freeConvectionFF;
      parameter NERTHUS_Modelica.Units.PumpConstant tertiaryPumpK;
      parameter NERTHUS_Modelica.Units.InitiationTime tripTertiaryPump;
      output NERTHUS_Modelica.Connectors.FlowFraction_Out tertiaryFF annotation(
        Placement(visible = true, transformation(origin = {-1.77636e-15, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {1.77636e-15, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    initial equation
  tertiaryFF.FF = 1;
    equation
      tertiaryFF.FF = (1 - freeConvectionFF)*exp(-tertiaryPumpK*delay(time, tripTertiaryPump)) + freeConvectionFF;
      annotation(
        Diagram(graphics = {Rectangle(lineColor = {85, 85, 255}, lineThickness = 1, extent = {{-60, 60}, {60, -60}}), Text(origin = {2, 6}, extent = {{-42, 16}, {42, -16}}, textString = "Tertiary Pump")}),
        Icon(graphics = {Rectangle(origin = {0, -20}, lineColor = {245, 121, 0}, lineThickness = 1, extent = {{-60, 60}, {60, -60}}), Text(origin = {4, -20}, extent = {{-42, 16}, {42, -16}}, textString = "Tertiary Pump")}));
    end TertiaryLoopPump;

    model FeedwaterPump
  // Feedwater Pump parameters and equations
      parameter NERTHUS_Modelica.Units.FlowFraction freeConvectionFF;
      parameter NERTHUS_Modelica.Units.PumpConstant FeedwaterPumpK;
      parameter NERTHUS_Modelica.Units.InitiationTime tripFeedwaterPump;
      output NERTHUS_Modelica.Connectors.FlowFraction_Out feedwaterFF annotation(
        Placement(visible = true, transformation(origin = {-1.77636e-15, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {1.77636e-15, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    initial equation
      feedwaterFF.FF = 1;
    equation
      feedwaterFF.FF = (1 - freeConvectionFF)*exp(-FeedwaterPumpK*delay(time, tripFeedwaterPump)) + freeConvectionFF;
      annotation(
        Diagram(graphics = {Rectangle(lineColor = {85, 85, 255}, lineThickness = 1, extent = {{-60, 60}, {60, -60}}), Text(origin = {2, 6}, extent = {{-42, 16}, {42, -16}}, textString = "Feedwater Pump")}),
        Icon(graphics = {Rectangle(origin = {0, -20}, lineColor = {245, 121, 0}, lineThickness = 1, extent = {{-60, 60}, {60, -60}}), Text(origin = {4, -20}, extent = {{-42, 16}, {42, -16}}, textString = "Feedwater Pump")}));
    end FeedwaterPump;

    model Pipe
      // Pipe segment parameters and equations
      parameter NERTHUS_Modelica.Units.Mass m_pi;
      parameter NERTHUS_Modelica.Units.SpecificHeatCapacity Cp_fluidPi;
      parameter NERTHUS_Modelica.Units.MassFlowRate m_dotPiNom;
      parameter NERTHUS_Modelica.Units.Mass m_Pi_PHX_C;
      parameter NERTHUS_Modelica.Units.ResidentTime tauPipeToCore;
      NERTHUS_Modelica.Units.ResidentTime vartauPipeToCore;
      NERTHUS_Modelica.Units.MassFlowRate m_dotPi;
      NERTHUS_Modelica.Units.Temperature Pipe_Temp;
      input NERTHUS_Modelica.Connectors.Temp_In PiTemp_IN annotation(
        Placement(visible = true, transformation(origin = {-48, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-48, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      input NERTHUS_Modelica.Connectors.DecayHeat_In PiDecay_Heat annotation(
        Placement(visible = true, transformation(origin = {-48, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-48, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      output NERTHUS_Modelica.Connectors.Temp_Out PiTemp_Out annotation(
        Placement(visible = true, transformation(origin = {28, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {28, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      input NERTHUS_Modelica.Connectors.FlowFraction_In fuelFlowFrac annotation(
        Placement(visible = true, transformation(origin = {-48, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-48, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    initial equation
      PiTemp_Out.T = 614.6;
    equation
      m_dotPi = m_dotPiNom*fuelFlowFrac.FF;
      vartauPipeToCore = tauPipeToCore/fuelFlowFrac.FF;
      m_pi*Cp_fluidPi*der(Pipe_Temp) = m_dotPi*Cp_fluidPi*(PiTemp_IN.T - Pipe_Temp) + PiDecay_Heat.Q*m_Pi_PHX_C; //12.171*
      PiTemp_Out.T = delay(Pipe_Temp, vartauPipeToCore, 5000);
    //  PiTemp_Out.T = PiTemp_IN.T;
    //  PiTemp_Out.T = 614.6;
      annotation(
        Diagram(graphics = {Rectangle(origin = {-10, 24}, extent = {{-54, 50}, {54, -50}}), Text(origin = {-46, 11}, extent = {{-14, 9}, {14, -9}}, textString = "Temp IN"), Text(origin = {26, 11}, extent = {{-14, 9}, {14, -9}}, textString = "Temp OUT"), Text(origin = {12, 66}, extent = {{-24, 30}, {24, -30}}, textString = "PipeNode"), Text(origin = {-46, 47}, extent = {{-14, 9}, {14, -9}}, textString = "Decay Heat")}),
        Icon(graphics = {Text(origin = {26, 11}, extent = {{-14, 9}, {14, -9}}, textString = "Temp OUT"), Text(origin = {12, 66}, extent = {{-24, 30}, {24, -30}}, textString = "PipeNode"), Text(origin = {-46, 11}, extent = {{-14, 9}, {14, -9}}, textString = "Temp IN"), Text(origin = {-46, 47}, extent = {{-14, 9}, {14, -9}}, textString = "Decay Heat"), Rectangle(origin = {-10, 24}, extent = {{-54, 50}, {54, -50}})}));
    end Pipe;

    model UHX
  parameter NERTHUS_Modelica.Units.Mass m_PN1UHX;
      parameter NERTHUS_Modelica.Units.ReactorPower UHXP;
      parameter NERTHUS_Modelica.Units.SpecificHeatCapacity cP_pFluidUHX;
      parameter NERTHUS_Modelica.Units.MassFlowRate m_dot_pFluidUHXnom;
      parameter NERTHUS_Modelica.Units.ResidentTime tauUHXtoSHX;
      parameter NERTHUS_Modelica.Units.InitiationTime tripUHX;
      parameter NERTHUS_Modelica.Units.Demand SetDemand;
      NERTHUS_Modelica.Units.MassFlowRate m_dot_pFluidUHX;
      NERTHUS_Modelica.Units.ResidentTime varTauUHXtoSHX;
      NERTHUS_Modelica.Units.Temperature UHXtemp;
      NERTHUS_Modelica.Units.Demand PowerDemand;
      input NERTHUS_Modelica.Connectors.Temp_In UHXtemp_In annotation(
        Placement(visible = true, transformation(origin = {-70, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-70, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      output NERTHUS_Modelica.Connectors.Temp_Out UHXtemp_Out annotation(
        Placement(visible = true, transformation(origin = {26, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {26, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      input NERTHUS_Modelica.Connectors.FlowFraction_In tertiaryFF annotation(
        Placement(visible = true, transformation(origin = {-68, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    initial equation
      //UHXtemp_Out.T = 507.3;
      //UHXtemp = 507.3;
    equation
      PowerDemand = if time < tripUHX then 1 else SetDemand;
      varTauUHXtoSHX = tauUHXtoSHX / tertiaryFF.FF;
      m_dot_pFluidUHX = m_dot_pFluidUHXnom * tertiaryFF.FF;
      //m_PN1UHX * cP_pFluidUHX * der(UHXtemp) = m_dot_pFluidUHX * cP_pFluidUHX * (UHXtemp_In.T - UHXtemp) - UHXP * PowerDemand;
      UHXtemp = UHXtemp_In.T - (UHXP / (m_dot_pFluidUHX * cP_pFluidUHX)); // Simplified UHX eqn for debugging
      UHXtemp_Out.T = delay(UHXtemp, varTauUHXtoSHX, 5000);
      
      annotation(
        Diagram(graphics = {Rectangle(origin = {-20, 0}, extent = {{-60, 60}, {60, -60}}), Text(origin = {-64, -14}, extent = {{-14, 12}, {14, -12}}, textString = "Temp In"), Text(origin = {24, -14}, extent = {{-14, 12}, {14, -12}}, textString = "Temp Out"), Text(origin = {8, 44}, extent = {{-34, 18}, {34, -18}}, textString = "UHX")}),
        Icon(graphics = {Text(origin = {8, 44}, extent = {{-34, 18}, {34, -18}}, textString = "UHX"), Rectangle(origin = {-20, 0}, extent = {{-60, 60}, {60, -60}}), Text(origin = {24, -14}, extent = {{-14, 12}, {14, -12}}, textString = "Temp Out"), Text(origin = {-64, -14}, extent = {{-14, 12}, {14, -12}}, textString = "Temp In")}));
    end UHX;
  end HeatTransport;

  package Nuclear
    // Parameters and equations for reactivity effects (mPKE), decay heat, and poisons

    model mPKE
      // MSR Point Kinetic Equations
      // Parameter declaration
      parameter NERTHUS_Modelica.Units.NeutronGenerationTime Lam;
      parameter NERTHUS_Modelica.Units.PrecursorDecayConstant lam[6];
      parameter NERTHUS_Modelica.Units.DelayedNeutronFrac beta[6];
      parameter NERTHUS_Modelica.Units.ResidentTime tauCoreNom;
      parameter NERTHUS_Modelica.Units.ResidentTime tauLoopNom;
    //  parameter NERTHUS_Modelica.Units.Reactivity rho0;
    //  parameter NERTHUS_Modelica.Units.Frequency testeqn_left;
    //  parameter NERTHUS_Modelica.Units.Frequency testeqn_right;
      //Variable declaration
      NERTHUS_Modelica.Units.ResidentTime varTauCore;
      //NERTHUS_Modelica.Units.ResidentTime maxTauCore;
      NERTHUS_Modelica.Units.ResidentTime varTauLoop;
      //NERTHUS_Modelica.Units.ResidentTime maxTauLoop;
      NERTHUS_Modelica.Units.PrecursorConc CG1;
      NERTHUS_Modelica.Units.PrecursorConc CG2;
      NERTHUS_Modelica.Units.PrecursorConc CG3;
      NERTHUS_Modelica.Units.PrecursorConc CG4;
      NERTHUS_Modelica.Units.PrecursorConc CG5;
      NERTHUS_Modelica.Units.PrecursorConc CG6;
      NERTHUS_Modelica.Units.PrecursorReturn CG1Return;
      NERTHUS_Modelica.Units.PrecursorReturn CG2Return;
      NERTHUS_Modelica.Units.PrecursorReturn CG3Return;
      NERTHUS_Modelica.Units.PrecursorReturn CG4Return;
      NERTHUS_Modelica.Units.PrecursorReturn CG5Return;
      NERTHUS_Modelica.Units.PrecursorReturn CG6Return;
      NERTHUS_Modelica.Units.Reactivity reactivity;
      NERTHUS_Modelica.Units.Frequency testeqn_left;
      NERTHUS_Modelica.Units.Frequency testeqn_right;
      NERTHUS_Modelica.Units.DelayedNeutronFrac bterm[6];
      NERTHUS_Modelica.Units.Reactivity rho0;// = 0.0015117423603888;
      //NERTHUS_Modelica.Units.Reactivity rho0_effective;
      input NERTHUS_Modelica.Connectors.Reactivity feedback annotation(
        Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      output NERTHUS_Modelica.Connectors.NominalNeutronPopulation n_population annotation(
        Placement(visible = true, transformation(origin = {0, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      input NERTHUS_Modelica.Connectors.FlowFraction_In fuelFlowFrac annotation(
        Placement(visible = true, transformation(origin = {34, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {34, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        
    initial equation
      n_population.n = 1;
      //der(n_population.n) = 0;
      CG1 = (beta[1] / Lam) * (1.0 / (lam[1] - (exp(-lam[1] * tauLoopNom) - 1.0) / tauCoreNom));
      CG2 = (beta[2] / Lam) * (1.0 / (lam[2] - (exp(-lam[2] * tauLoopNom) - 1.0) / tauCoreNom));
      CG3 = (beta[3] / Lam) * (1.0 / (lam[3] - (exp(-lam[3] * tauLoopNom) - 1.0) / tauCoreNom));
      CG4 = (beta[4] / Lam) * (1.0 / (lam[4] - (exp(-lam[4] * tauLoopNom) - 1.0) / tauCoreNom));
      CG5 = (beta[5] / Lam) * (1.0 / (lam[5] - (exp(-lam[5] * tauLoopNom) - 1.0) / tauCoreNom));
      CG6 = (beta[6] / Lam) * (1.0 / (lam[6] - (exp(-lam[6] * tauLoopNom) - 1.0) / tauCoreNom));
      bterm[1] = beta[1]/(1.0 + ((1.0 - exp(-lam[1]*tauLoopNom))/(lam[1]*tauCoreNom)));
      bterm[2] = beta[2]/(1.0 + ((1.0 - exp(-lam[2]*tauLoopNom))/(lam[2]*tauCoreNom)));
      bterm[3] = beta[3]/(1.0 + ((1.0 - exp(-lam[3]*tauLoopNom))/(lam[3]*tauCoreNom)));
      bterm[4] = beta[4]/(1.0 + ((1.0 - exp(-lam[4]*tauLoopNom))/(lam[4]*tauCoreNom)));
      bterm[5] = beta[5]/(1.0 + ((1.0 - exp(-lam[5]*tauLoopNom))/(lam[5]*tauCoreNom)));
      bterm[6] = beta[6]/(1.0 + ((1.0 - exp(-lam[6]*tauLoopNom))/(lam[6]*tauCoreNom)));
      //rho0 = sum(beta) + bterm1 + bterm2 + bterm3 + bterm4 + bterm5 + bterm6;
      rho0 = sum(beta) - sum(bterm);
      
    equation
      //reactivity = feedback.rho + 0.002465140767843;
      //reactivity = feedback.rho + 0.001487835006110; //Number added is rho0 (reactivity loss from circulating fuel) FIX LATER ***
      testeqn_right = (lam[1]*CG1) + (lam[2]*CG2) + (lam[3]*CG3) + (lam[4]*CG4) + (lam[5]*CG5) + (lam[6]*CG6);
      testeqn_left = ((reactivity-sum(beta))/Lam*n_population.n);
      bterm[1] = beta[1]/(1.0 + ((1.0 - exp(-lam[1]*varTauLoop))/(lam[1]*varTauCore)));
      bterm[2] = beta[2]/(1.0 + ((1.0 - exp(-lam[2]*varTauLoop))/(lam[2]*varTauCore)));
      bterm[3] = beta[3]/(1.0 + ((1.0 - exp(-lam[3]*varTauLoop))/(lam[3]*varTauCore)));
      bterm[4] = beta[4]/(1.0 + ((1.0 - exp(-lam[4]*varTauLoop))/(lam[4]*varTauCore)));
      bterm[5] = beta[5]/(1.0 + ((1.0 - exp(-lam[5]*varTauLoop))/(lam[5]*varTauCore)));
      bterm[6] = beta[6]/(1.0 + ((1.0 - exp(-lam[6]*varTauLoop))/(lam[6]*varTauCore)));
      rho0 = sum(beta) - sum(bterm);
      reactivity = feedback.rho + rho0;
      der(n_population.n) = ((reactivity-sum(beta))/Lam*n_population.n) + (lam[1]*CG1) + (lam[2]*CG2) + (lam[3]*CG3) + (lam[4]*CG4) + (lam[5]*CG5) + (lam[6]*CG6);
    //  n_population.n = 1;
      varTauCore = tauCoreNom / fuelFlowFrac.FF;
      varTauLoop = tauLoopNom / fuelFlowFrac.FF;
      CG1Return = delay(CG1,varTauLoop,5000)*exp(-lam[1]*varTauLoop)/varTauCore;
      CG2Return = delay(CG2,varTauLoop,5000)*exp(-lam[2]*varTauLoop)/varTauCore;
      CG3Return = delay(CG3,varTauLoop,5000)*exp(-lam[3]*varTauLoop)/varTauCore;
      CG4Return = delay(CG4,varTauLoop,5000)*exp(-lam[4]*varTauLoop)/varTauCore;
      CG5Return = delay(CG5,varTauLoop,5000)*exp(-lam[5]*varTauLoop)/varTauCore;
      CG6Return = delay(CG6,varTauLoop,5000)*exp(-lam[6]*varTauLoop)/varTauCore;
      der(CG1) = (beta[1]*n_population.n)/Lam - (lam[1]*CG1) - (CG1/varTauCore) + CG1Return;
      der(CG2) = (beta[2]*n_population.n)/Lam - (lam[2]*CG2) - (CG2/varTauCore) + CG2Return;
      der(CG3) = (beta[3]*n_population.n)/Lam - (lam[3]*CG3) - (CG3/varTauCore) + CG3Return;
      der(CG4) = (beta[4]*n_population.n)/Lam - (lam[4]*CG4) - (CG4/varTauCore) + CG4Return;
      der(CG5) = (beta[5]*n_population.n)/Lam - (lam[5]*CG5) - (CG5/varTauCore) + CG5Return;
      der(CG6) = (beta[6]*n_population.n)/Lam - (lam[6]*CG6) - (CG6/varTauCore) + CG6Return;
      annotation(
        Diagram(graphics = {Rectangle(origin = {2, 0}, lineColor = {20, 36, 248}, fillColor = {20, 36, 248}, lineThickness = 0.5, extent = {{-50, 50}, {50, -50}}), Text(origin = {3, 1}, extent = {{37, -27}, {-37, 27}}, textString = "mPKE")}),
        Icon(graphics = {Rectangle(origin = {2, 0}, lineColor = {20, 36, 248}, fillColor = {20, 36, 248}, lineThickness = 0.5, extent = {{-50, 50}, {50, -50}}), Text(origin = {3, 1}, extent = {{37, -27}, {-37, 27}}, textString = "mPKE")}));
        
    end mPKE;

    model DecayHeat
      // Decay Heat in fuel salt equations
      parameter NERTHUS_Modelica.Units.ReactorPower P;
      parameter NERTHUS_Modelica.Units.DecayHeatYield DHYG1;
      parameter NERTHUS_Modelica.Units.DecayHeatYield DHYG2;
      parameter NERTHUS_Modelica.Units.DecayHeatYield DHYG3;
      parameter NERTHUS_Modelica.Units.Mass TotalFuelMass;
      parameter NERTHUS_Modelica.Units.DecayHeatPrecursorDecayConstant DHlamG1;
      parameter NERTHUS_Modelica.Units.DecayHeatPrecursorDecayConstant DHlamG2;
      parameter NERTHUS_Modelica.Units.DecayHeatPrecursorDecayConstant DHlamG3;
      parameter NERTHUS_Modelica.Units.FissFactor FissFactor = 2.464783802008740e-03;
    //  parameter NERTHUS_Modelica.Units.FissFactor FissFactor = 2.483783802008740e-03;
      NERTHUS_Modelica.Units.HeatTransferFraction DHG1;
      NERTHUS_Modelica.Units.HeatTransferFraction DHG2;
      NERTHUS_Modelica.Units.HeatTransferFraction DHG3;
      input NERTHUS_Modelica.Connectors.NominalNeutronPopulation nPop annotation(
        Placement(visible = true, transformation(origin = {1, 33}, extent = {{-19, -19}, {19, 19}}, rotation = 0), iconTransformation(origin = {-32, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      output NERTHUS_Modelica.Connectors.DecayHeat_Out decayHeat_Out annotation(
        Placement(visible = true, transformation(origin = {1, -31}, extent = {{-23, -23}, {23, 23}}, rotation = 0), iconTransformation(origin = {36, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    initial equation
      DHG1 = 0.025125;
      DHG2 = 0.0198578;
      DHG3 = 0.0227606;
    equation
      der(DHG1) = nPop.n * DHYG1 * FissFactor - DHlamG1 * DHG1;
      der(DHG2) = nPop.n * DHYG2 * FissFactor - DHlamG2 * DHG2;
      der(DHG3) = nPop.n * DHYG3 * FissFactor - DHlamG3 * DHG3;
      decayHeat_Out.Q = (DHG1 + DHG2 + DHG3) * P / TotalFuelMass;
//decayHeat_Out.Q = 0.066*P/TotalFuelMass;
//decayHeat_Out.Q = 0;
      annotation(
        Diagram(graphics = {Rectangle(origin = {2, 0}, lineColor = {0, 225, 255}, lineThickness = 0.75, extent = {{-50, 50}, {50, -50}}), Text(origin = {3, 0}, extent = {{-45, 46}, {45, -46}}, textString = "Decay Heat")}),
        Icon(graphics = {Text(origin = {19, 41}, extent = {{-29, 33}, {29, -33}}, textString = "Decay Heat"), Rectangle(origin = {2, 0}, lineColor = {0, 225, 255}, lineThickness = 0.75, extent = {{-50, 50}, {50, -50}}), Text(origin = {1, 36}, extent = {{1, 2}, {-1, -2}}, textString = "text"), Text(origin = {-31, 9}, extent = {{-13, 5}, {13, -5}}, textString = "n(t)/n_0"), Text(origin = {19, -43}, extent = {{-31, 5}, {31, -5}}, textString = "Specific Decay Heat")}));
      
    end DecayHeat;

    model ReactivityFeedback
      // Fuel temperature reactivity feedback, graphite temperature reactivity feedback, external reactivity, and total reactivity
      parameter NERTHUS_Modelica.Units.Temperature FuelTempSetPointNode1;
      parameter NERTHUS_Modelica.Units.Temperature FuelTempSetPointNode2;
      parameter NERTHUS_Modelica.Units.Temperature GrapTempSetPoint;
      parameter NERTHUS_Modelica.Units.TemperatureReactivityCoef a_F;
      parameter NERTHUS_Modelica.Units.TemperatureReactivityCoef a_G;
      parameter NERTHUS_Modelica.Units.Reactivity step_mag;
      parameter NERTHUS_Modelica.Units.Frequency omega;
      parameter NERTHUS_Modelica.Units.Reactivity sin_mag;
      parameter NERTHUS_Modelica.Units.InitiationTime stepInsertionTime;
      parameter NERTHUS_Modelica.Units.InitiationTime sinInsertionTime;
      NERTHUS_Modelica.Units.Reactivity FuelTempFeedbackNode1;
      NERTHUS_Modelica.Units.Reactivity FuelTempFeedbackNode2;
      NERTHUS_Modelica.Units.Reactivity GrapTempFeedback;
      NERTHUS_Modelica.Units.Reactivity TotalTempFeedback;
      NERTHUS_Modelica.Units.Reactivity ReactExternalStep;
      NERTHUS_Modelica.Units.Reactivity ReactExternalSin;
      input NERTHUS_Modelica.Connectors.Temp_In fuelNode1 annotation(
        Placement(visible = true, transformation(origin = {-40, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-40, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      input NERTHUS_Modelica.Connectors.Temp_In fuelNode2 annotation(
        Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      input NERTHUS_Modelica.Connectors.Temp_In grapNode annotation(
        Placement(visible = true, transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      output NERTHUS_Modelica.Connectors.Reactivity feedback annotation(
        Placement(visible = true, transformation(origin = {26, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {26, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      input NERTHUS_Modelica.Connectors.Reactivity Poison_react annotation(
        Placement(visible = true, transformation(origin = {26, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {26, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    initial equation
      ReactExternalStep = 0;
      ReactExternalSin = 0;
      FuelTempFeedbackNode1 = 0;
      FuelTempFeedbackNode2 = 0;
      GrapTempFeedback = 0;
      TotalTempFeedback = 0;
    equation
      ReactExternalStep = 0 + (if time < stepInsertionTime then 0 else step_mag);
      ReactExternalSin = 0 + (if time < sinInsertionTime then 0 else sin_mag * sin(omega * time));
      FuelTempFeedbackNode1 = (fuelNode1.T - FuelTempSetPointNode1) * (a_F / 2);
      FuelTempFeedbackNode2 = (fuelNode2.T - FuelTempSetPointNode2) * (a_F / 2);
      GrapTempFeedback = (grapNode.T - GrapTempSetPoint) * a_G;
      TotalTempFeedback = FuelTempFeedbackNode1 + FuelTempFeedbackNode2 + GrapTempFeedback + ReactExternalSin + ReactExternalStep + Poison_react.rho;
      //TotalTempFeedback = FuelTempFeedbackNode1 + FuelTempFeedbackNode2 + GrapTempFeedback + ReactExternalSin + ReactExternalStep;
      feedback.rho = TotalTempFeedback;
      annotation(
        Diagram(graphics = {Rectangle(origin = {0, 2}, extent = {{-50, 50}, {50, -50}}), Text(origin = {13, 40}, extent = {{-31, 24}, {31, -24}}, textString = "Feedback"), Text(origin = {-32, 22}, extent = {{-16, 6}, {16, -6}}, textString = "Temp_FuelN1"), Text(origin = {-32, -12}, extent = {{-16, 6}, {16, -6}}, textString = "Temp_FuelN2"), Text(origin = {-32, -40}, extent = {{-16, 6}, {16, -6}}, textString = "Temp_GrapN1"), Text(origin = {26, 10}, extent = {{-16, 6}, {16, -6}}, textString = "Total_Feedback"), Text(origin = {26, -40}, extent = {{-12, 4}, {12, -4}}, textString = "Poison React")}),
        Icon(graphics = {Rectangle(origin = {0, 2}, extent = {{-50, 50}, {50, -50}}), Text(origin = {13, 40}, extent = {{-31, 24}, {31, -24}}, textString = "Feedback"), Text(origin = {-32, 22}, extent = {{-16, 6}, {16, -6}}, textString = "Temp_FuelN1"), Text(origin = {-32, -12}, extent = {{-16, 6}, {16, -6}}, textString = "Temp_FuelN2"), Text(origin = {-32, -40}, extent = {{-16, 6}, {16, -6}}, textString = "Temp_GrapN1"), Text(origin = {26, 10}, extent = {{-16, 6}, {16, -6}}, textString = "Total_Feedback"), Text(origin = {26, -40}, extent = {{-12, 4}, {12, -4}}, textString = "Poison React")}));
      
    end ReactivityFeedback;

    model Core
      // Fission power, decay power, nominal power, and core flow
      parameter NERTHUS_Modelica.Units.ReactorPower P;
      parameter NERTHUS_Modelica.Units.Mass TotalFuelMass;
      parameter NERTHUS_Modelica.Units.Convection hAnom;
      parameter NERTHUS_Modelica.Units.Mass m_FN1;
      parameter NERTHUS_Modelica.Units.Mass m_FN2;
      parameter NERTHUS_Modelica.Units.Mass m_GN;
      parameter NERTHUS_Modelica.Units.SpecificHeatCapacity cP_fuel;
      parameter NERTHUS_Modelica.Units.SpecificHeatCapacity cP_graphite;
      parameter NERTHUS_Modelica.Units.MassFlowRate mdot_fuelNom;
      parameter NERTHUS_Modelica.Units.VolumeImportance kFN1;
      parameter NERTHUS_Modelica.Units.VolumeImportance kFN2;
      parameter NERTHUS_Modelica.Units.VolumeImportance kG;
      parameter NERTHUS_Modelica.Units.HeatTransferFraction kHT_FN1;
      parameter NERTHUS_Modelica.Units.HeatTransferFraction kHT_FN2;
      parameter NERTHUS_Modelica.Units.ResidentTime tauCoreToDHRS;
      parameter NERTHUS_Modelica.Units.Temperature fuelNode1_initial = 649.2;
      parameter NERTHUS_Modelica.Units.Temperature fuelNode2_initial = 681.8;
      parameter NERTHUS_Modelica.Units.Temperature grapNode_initial = 652.3;
    
      NERTHUS_Modelica.Units.ResidentTime varTauCoreToDHRS;
      //NERTHUS_Modelica.Units.ResidentTime maxTauCoreToDHRS;
      NERTHUS_Modelica.Units.NominalPower FissionPower;
      NERTHUS_Modelica.Units.NominalPower DecayPower;
      NERTHUS_Modelica.Units.NominalPower NomPower;
      NERTHUS_Modelica.Units.MassFlowRate mdot_fuel;
      NERTHUS_Modelica.Units.Convection hA;
    //  NERTHUS_Modelica.Units.ReactorPower P_CorePower;
    
      input NERTHUS_Modelica.Connectors.Temp_In temp_In annotation(
        Placement(visible = true, transformation(origin = {-76, -70}, extent = {{-18, -18}, {18, 18}}, rotation = 0), iconTransformation(origin = {-80, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      input NERTHUS_Modelica.Connectors.DecayHeat_In P_decay annotation(
        Placement(visible = true, transformation(origin = {-77, -7}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {-80, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      input NERTHUS_Modelica.Connectors.NominalNeutronPopulation nPop annotation(
        Placement(visible = true, transformation(origin = {-80, 50}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-80, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      output NERTHUS_Modelica.Connectors.Temp_Out temp_Out annotation(
        Placement(visible = true, transformation(origin = {44, 60}, extent = {{-18, -18}, {18, 18}}, rotation = 0), iconTransformation(origin = {50, 53}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
      output NERTHUS_Modelica.Connectors.Temp_Out fuelNode1 annotation(
        Placement(visible = true, transformation(origin = {45, -78}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {50, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      output NERTHUS_Modelica.Connectors.Temp_Out fuelNode2 annotation(
        Placement(visible = true, transformation(origin = {45, -40}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      output NERTHUS_Modelica.Connectors.Temp_Out grapNode annotation(
        Placement(visible = true, transformation(origin = {44, 16}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {50, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      input NERTHUS_Modelica.Connectors.FlowFraction_In fuelFlowFraction annotation(
        Placement(visible = true, transformation(origin = {-40, -80}, extent = {{-18, -18}, {18, 18}}, rotation = 0), iconTransformation(origin = {-40, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    
    initial equation
      fuelNode2.T = fuelNode2_initial;
      fuelNode1.T = fuelNode1_initial;
      grapNode.T = grapNode_initial;
    
    ////  NomPower = 1;
    //  FissionPower = nPop.n * (1 - 0.068);
    ////  DecayPower = 0.068;
    //  DecayPower = P_decay.Q / P * TotalFuelMass;
    //  NomPower = FissionPower + DecayPower;
    
    equation
      FissionPower = nPop.n * (1 - 0.0677434);
      DecayPower = P_decay.Q / P * TotalFuelMass;
      NomPower = FissionPower + DecayPower;
      mdot_fuel = mdot_fuelNom * fuelFlowFraction.FF;
    
      hA = hAnom * (0.8215 * fuelFlowFraction.FF ^ 6 - 4.108 * fuelFlowFraction.FF ^ 5 + 7.848 * fuelFlowFraction.FF ^ 4 - 7.165 * fuelFlowFraction.FF ^ 3 + 3.004 * fuelFlowFraction.FF ^ 2 + 0.5903 * fuelFlowFraction.FF + 0.008537);
    //  hA = hAnom;
      varTauCoreToDHRS = tauCoreToDHRS / fuelFlowFraction.FF;
//maxTauCoreToDHRS = tauCoreToDHRS/fuelFlowFraction.FF_min;
      m_FN1 * cP_fuel * der(fuelNode1.T) = mdot_fuel * cP_fuel * (temp_In.T - fuelNode1.T) + kFN1 * FissionPower * P - hA * kHT_FN1 * (fuelNode1.T - grapNode.T) + P_decay.Q * m_FN1;
      m_FN2 * cP_fuel * der(fuelNode2.T) = mdot_fuel * cP_fuel * (fuelNode1.T - fuelNode2.T) + kFN2 * FissionPower * P - hA * kHT_FN2 * (fuelNode1.T - grapNode.T) + P_decay.Q * m_FN2;
      m_GN * cP_graphite * der(grapNode.T) = hA * (fuelNode1.T - grapNode.T) + kG * FissionPower * P;
    //  fuelNode1.T = 649.3;
    //  fuelNode2.T = 681.9;
    //  grapNode.T = 652.2;
      temp_Out.T = delay(fuelNode2.T, varTauCoreToDHRS, 5000);
    //  temp_Out.T = 681.9;
    //  P_CorePower = (temp_Out.T - temp_In.T)*mdot_fuel * cP_fuel;
    
      annotation(
        Diagram(graphics = {Rectangle(origin = {-15.4297, -10.014}, extent = {{-75.8099, 90.0986}, {75.8099, -90.0986}}), Rectangle(origin = {-40, 20}, lineColor = {255, 63, 63}, fillColor = {255, 63, 63}, fillPattern = FillPattern.Solid, lineThickness = 0, extent = {{-20, 20}, {20, -20}}), Rectangle(origin = {-40, -40}, lineColor = {255, 63, 63}, fillColor = {255, 63, 63}, fillPattern = FillPattern.Solid, lineThickness = 0, extent = {{-20, 20}, {20, -20}}), Rectangle(origin = {15, -10}, lineColor = {94, 95, 92}, fillColor = {94, 95, 92}, fillPattern = FillPattern.Solid, lineThickness = 0, extent = {{-15, 50}, {15, -50}}), Text(origin = {-16, 70}, extent = {{-47, 12}, {47, -12}}, textString = "Core Heat Transfer"), Text(origin = {-76, 35}, extent = {{-13, 13}, {13, -13}}, textString = "n(t)/n_0"), Text(origin = {-76, -20}, extent = {{-13, 13}, {13, -13}}, textString = "Decay Heat"), Text(origin = {-75, -85}, extent = {{-13, 13}, {13, -13}}, textString = "Temp_In"), Text(origin = {46, 45}, extent = {{-13, 13}, {13, -13}}, textString = "Temp_Out"), Text(origin = {47, 2}, extent = {{-13, 13}, {13, -13}}, textString = "Temp_G1"), Text(origin = {45, -54}, extent = {{-13, 13}, {13, -13}}, textString = "Temp_FN2"), Text(origin = {45, -92}, extent = {{-13, 13}, {13, -13}}, textString = "Temp_FN1")}),
        Icon(graphics = {Rectangle(origin = {-15.4297, -10.014}, extent = {{-75.8099, 90.0986}, {75.8099, -90.0986}}), Rectangle(origin = {-40, 20}, lineColor = {255, 63, 63}, fillColor = {255, 63, 63}, fillPattern = FillPattern.Solid, lineThickness = 0, extent = {{-20, 20}, {20, -20}}), Rectangle(origin = {-40, -40}, lineColor = {255, 63, 63}, fillColor = {255, 63, 63}, fillPattern = FillPattern.Solid, lineThickness = 0, extent = {{-20, 20}, {20, -20}}), Rectangle(origin = {15, -10}, lineColor = {94, 95, 92}, fillColor = {94, 95, 92}, fillPattern = FillPattern.Solid, lineThickness = 0, extent = {{-15, 50}, {15, -50}}), Text(origin = {-16, 70}, extent = {{-47, 12}, {47, -12}}, textString = "Core Heat Transfer"), Text(origin = {-76, 35}, extent = {{-13, 13}, {13, -13}}, textString = "n(t)/n_0"), Text(origin = {-76, -20}, extent = {{-13, 13}, {13, -13}}, textString = "Decay Heat"), Text(origin = {-75, -85}, extent = {{-13, 13}, {13, -13}}, textString = "Temp_In"), Text(origin = {46, 45}, extent = {{-13, 13}, {13, -13}}, textString = "Temp_Out"), Text(origin = {47, 2}, extent = {{-13, 13}, {13, -13}}, textString = "Temp_G1"), Text(origin = {45, -54}, extent = {{-13, 13}, {13, -13}}, textString = "Temp_FN2"), Text(origin = {45, -92}, extent = {{-13, 13}, {13, -13}}, textString = "Temp_FN1")}));
      
    end Core;

    model Poisons
      // Tracking of I-135, Xe-135, Pm-149, and Sm-149
      //Parameter declarations
      parameter NERTHUS_Modelica.Units.IsotopicFissYield gamma_I = 0.06390; 
      parameter NERTHUS_Modelica.Units.IsotopicFissYield gamma_Xe = 0.0025761; 
      parameter NERTHUS_Modelica.Units.IsotopicFissYield gamma_Pm = 0.010816; 
      parameter NERTHUS_Modelica.Units.IsotopicFissYield gamma_Sm = 0.0; 
      parameter NERTHUS_Modelica.Units.IsotopicDecayConstant I135_lam = 2.926153244511758e-05;
      parameter NERTHUS_Modelica.Units.IsotopicDecayConstant Xe135_lam = 2.106574217602556e-05; 
      parameter NERTHUS_Modelica.Units.IsotopicDecayConstant Pm149_lam = 3.627371580423393e-06; 
      parameter NERTHUS_Modelica.Units.MicroAbsorptionCrossSection sig_Xe = 2.66449e-18; 
      parameter NERTHUS_Modelica.Units.MicroAbsorptionCrossSection sig_Sm = 4.032e-20; 
      parameter NERTHUS_Modelica.Units.MacroAbsorptionCrossSection Sig_f = 8.586438950470045e-04; 
      parameter NERTHUS_Modelica.Units.MacroAbsorptionCrossSection Sig_a = 0.002064330826435;
      parameter NERTHUS_Modelica.Units.NominalNeutronFlux phi_0 = 3.1849E+14; 
      parameter NERTHUS_Modelica.Units.OffgasRemovalRate lam_bubble; 
//parameter NERTHUS_Modelica.Units.IsotopicConc Xe135_0 = 3.097134432117779e+12;
      //parameter NERTHUS_Modelica.Units.IsotopicConc Sm149_0 = 2.303346321634028e+14;
    //  parameter NERTHUS_Modelica.Units.Reactivity Xe_react;
    //  parameter NERTHUS_Modelica.Units.Reactivity Sm_react;
//Variable declarations
      NERTHUS_Modelica.Units.IsotopicConc I135_conc; 
      NERTHUS_Modelica.Units.IsotopicConc Xe135_conc; 
      NERTHUS_Modelica.Units.IsotopicConc Pm149_conc; 
      NERTHUS_Modelica.Units.IsotopicConc Sm149_conc; 
      NERTHUS_Modelica.Units.IsotopicConc Xe135_0; 
      NERTHUS_Modelica.Units.IsotopicConc Sm149_0; 
      NERTHUS_Modelica.Units.Reactivity Xe_react;
      NERTHUS_Modelica.Units.Reactivity Sm_react;
      
      input NERTHUS_Modelica.Connectors.NominalNeutronPopulation n_population annotation(
        Placement(visible = true, transformation(origin = {-40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      output NERTHUS_Modelica.Connectors.Reactivity Poison_react annotation(
        Placement(visible = true, transformation(origin = {20, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {20, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      
      initial equation
      I135_conc = gamma_I*Sig_f*phi_0/I135_lam; // Steady state iodine concentration [#/cm^3]
      Xe135_conc = ((gamma_Xe+gamma_I)*Sig_f*phi_0)/(Xe135_lam + sig_Xe*phi_0 + lam_bubble);
      der(Xe135_conc) = 0;
      //Xe135_conc = Xe135_0;
      Pm149_conc = gamma_Pm*Sig_f*phi_0/Pm149_lam; 
      Sm149_conc = ((gamma_Pm+gamma_Sm)*Sig_f)/(sig_Sm);
      //Sm149_conc = Sm149_0;
      
      equation
      Xe135_0 = ((gamma_Xe+gamma_I)*Sig_f*phi_0)/(Xe135_lam + sig_Xe*phi_0 + lam_bubble);
      Sm149_0 = ((gamma_Pm+gamma_Sm)*Sig_f)/(sig_Sm);
      der(I135_conc) = (n_population.n * gamma_I * Sig_f * phi_0) - (I135_lam * I135_conc);
      der(Xe135_conc) = (n_population.n * gamma_Xe * Sig_f * phi_0) + (I135_lam * I135_conc) - (sig_Xe * phi_0 * n_population.n  * Xe135_conc) - (Xe135_lam * Xe135_conc) - (lam_bubble * Xe135_conc);
      der(Pm149_conc) = (n_population.n * gamma_Pm * Sig_f * phi_0) - (Pm149_lam * Pm149_conc);
      der(Sm149_conc) = (n_population.n * gamma_Sm * Sig_f * phi_0) + (Pm149_lam * Pm149_conc) - (sig_Sm * phi_0 * n_population.n * Sm149_conc);
      Xe_react = ((Xe135_0 * sig_Xe)/Sig_a) * (1 - (Xe135_conc / Xe135_0));
      Sm_react = ((Sm149_0 * sig_Sm)/Sig_a) * (1 - (Sm149_conc / Sm149_0));
      Poison_react.rho = Xe_react + Sm_react;
      
    annotation(
        Diagram(graphics = {Text(origin = {-35, -51}, extent = {{-17, 7}, {17, -7}}, textString = "Neutron Population"), Text(origin = {20, -51}, extent = {{-16, 5}, {16, -5}}, textString = "Poison Reactivity"), Text(origin = {-7, -7}, extent = {{-39, 17}, {39, -17}}, textString = "Poison Tracking"), Rectangle(origin = {-7, -28}, extent = {{-53, -32}, {53, 32}})}),
        Icon(graphics = {Text(origin = {-35, -51}, extent = {{-17, 7}, {17, -7}}, textString = "Neutron Population"), Text(origin = {20, -51}, extent = {{-16, 5}, {16, -5}}, textString = "Poison Reactivity"), Text(origin = {-7, -7}, extent = {{-39, 17}, {39, -17}}, textString = "Poison Tracking"), Rectangle(origin = {-7, -28}, extent = {{-53, -32}, {53, 32}})}));
end Poisons;
  end Nuclear;

  package Units
    // Defines all units in the model
    type Frequency = Real(unit = "rad/s");
    // Used in: Nuclear > mPKE
    type NeutronDensity = Real(unit = "1/m^3", min = 0);
    // Neutron Density [#n/m^3]
    // Used in:
    type NominalNeutronPopulation = Real(unit = "1", min = 0);
    // Nominal Neutron Population [#n]
    // Used in:
    type NeutronGenerationTime = Real(unit = "s", min = 0);
    // Neutron Generation Time (Lambda) [s]
    // Used in:
    type Reactivity = Real(unit = "1");
    // Absolute Reactivity [unitless]
    // Used in:
    type PrecursorDecayConstant = Real(unit = "1/s", min = 0);
    // Delayed Precursor Decay Constant [s^-1]
    // Used in:
    type PrecursorConc = Real(unit = "1", min = 0);
    // Delayed Neutron Precursor
    // Used in:
    type PrecursorReturn = Real(unit = "1/s", min = 0);
    // Used in:
    type DelayedNeutronFrac = Real(unit = "1", min = 0);
    // Delayed Neutron Fraction [unitless]
    // Used in:
    type VolumeImportance = Real(unit = "1", min = 0);
    // Fraction of Fission Power Deposited in Core Nodes [m^3]
    // Used in: Nuclear > Temperature feedback
    type TemperatureReactivityCoef = Real(unit = "1/C");
    // Absolute Temperature Reactivity Coef [C^-1]
    // Used in: Nuclear > Poisons
    type IsotopicConc = Real(unit = "1/m^3", min = 0);
    // Isotopic Concentration [#atoms/m^3]
    // Used in:
    type IsotopicDecayConstant = Real(unit = "1/s", min = 0);
    // Isotopic Decay Constant [s^-1]
    // Used in:
    type IsotopicFissYield = Real(unit = "1", min = 0);
    // Isotopic Yield per fission
    // Used in: Nuclear > Poisons
    type NominalNeutronFlux = Real(unit = "1/(cm^2.s)");
    // OLD: "n/(cm^2.s)"
    // Used in:
    type MassFlowRate = Real(unit = "kg/s", min = 0);
    // Mass Flow Rate [kg/m^3]
    // Used in:
    type ResidentTime = Real(unit = "s", min = 0);
    // Fuel Salt Resident Time (tau) [s]
    // Used in:
    type FlowFraction = Real(unit = "1", min = 0);
    // Flow Fraction [unitless]
    // Used in:
    type SpecificHeat = Real(unit = "MJ/(kg.s)");
    // Used in:
    type HeatFlowRate = Real(unit = "MJ/s");
    // Heat Flow Rate [MJ/kg.s]
    // Used in: Heat Transport
    type NominalPower = Real(unit = "1", min = 0);
    // Nominal reactor power as a fraction
    // Used in:
    type ReactorPower = Real(unit = "MW", min = 0);
    // Nominal Reactor Thermal Power
    // Used in:
    type Convection = Real(unit = "MJ/(s.C)", min = 0);
    // Rate of heat transfer by convection [J/(s.C) == W/C]
    // Used in:
    type HeatTransferFraction = Real(unit = "1", min = 0);
    // Fraction of Heat Trasfer from Node to an adjacent Node [unitless]
    // Used in: Nuclear > DecayHeat
    type DecayHeatPrecursorDecayConstant = Real(unit = "1/s", min = 0);
    // Decay heat precursor decay constant [s^-1]
    // Used in:
    type DecayHeatYield = Real(unit = "1/s", min = 0);
    // Used in:
    type DecayHeatFraction = Real(tinits = "1", min = 0);
    // Used in:
    type Mass = Real(unit = "kg", min = 0);
    // Used in:
    type Density = Real(unit = "kg/(m^3)", min = 0);
    type SpecificHeatCapacity = Real(unit = "MJ/(kg.C)", min = 0);
    // Used in:
    type Temperature = Real(unit = "C", min = 0);
    // Component Related
    // Used in:
    type DHRStimeConstant = Real(unit = "1/s", min = 0);
    // DHRS time constant [per seconds]
    // Used in:
    type InitiationTime = Real(unit = "s", min = 0);
    // Start component [seconds]
    // Used in:
    type Demand = Real(unit = "1", min = 0);
    // Component demand
    // Used in:
    type PumpConstant = Real(unit = "1/s", min = 0);
    // Used in:
    type Pressure = Real(unit = "MPa", min = 0);
    type Length = Real(unit = "m", min = 0);
    type Number = Real(unit = "1", min = 0);
    type Area = Real(unit = "m^2", min = 0);
    type MicroAbsorptionCrossSection = Real(unit = "cm^2", min = 0);
    type MacroAbsorptionCrossSection = Real(unit = "1/cm", min = 0);
    type TsatConstant = Real(unit = "C/MPa", min = 0);
    type CompressibilityFactor = Real(unit = "1", min = 0);
    type UniversalGasConstant = Real(unit = "MJ/(mol.C)", min = 0);
    type MolarMass = Real(unit = "kg/mol", min = 0);
    type K_4 = Real(unit = "(m^6.s)/(kg^2)");
    type X_4 = Real(unit = "(m^5)/(kg.s)", min = 0);
    type OffgasRemovalRate = Real(unit = "1/s", min = 0);
    type FissFactor = Real(unit = "1", min = 0);
    type EnthalpyChange = Real(unit = "1");
    type K_sc = Real(unit = "1");
  end Units;

  package Connectors
    // Creates all inlets and outlets

    connector Temp_In
      NERTHUS_Modelica.Units.Temperature T;
      annotation(
        Diagram(graphics = {Ellipse(origin = {1, -1}, fillPattern = FillPattern.Solid, extent = {{-51, 47}, {51, -47}}), Ellipse(origin = {-8, 36}, extent = {{0, -2}, {0, 2}})}),
        Icon(graphics = {Ellipse(origin = {1, -1}, fillPattern = FillPattern.Solid, extent = {{-51, 47}, {51, -47}})}));
    end Temp_In;

    connector Temp_Out
      NERTHUS_Modelica.Units.Temperature T;
      annotation(
        Icon(graphics = {Ellipse(origin = {1, -1}, lineThickness = 0.5, extent = {{-51, 47}, {51, -47}}, endAngle = 360)}),
        Diagram(graphics = {Ellipse(origin = {1, -1}, lineThickness = 0.5, extent = {{-51, 47}, {51, -47}}, endAngle = 360)}));
    end Temp_Out;

    connector DecayHeat_In
      NERTHUS_Modelica.Units.SpecificHeat Q;
      annotation(
        Diagram(graphics = {Ellipse(origin = {1, -1}, lineColor = {0, 225, 255}, fillColor = {0, 225, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-51, 47}, {51, -47}}, endAngle = 360)}),
        Icon(graphics = {Ellipse(origin = {1, -1}, lineColor = {0, 225, 255}, fillColor = {0, 225, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-51, 47}, {51, -47}}, endAngle = 360)}));
    end DecayHeat_In;

    connector DecayHeat_Out
      NERTHUS_Modelica.Units.SpecificHeat Q;
      annotation(
        Icon(graphics = {Ellipse(origin = {1, -1}, lineColor = {0, 225, 255}, fillColor = {0, 225, 255}, lineThickness = 0.5, extent = {{-51, 47}, {51, -47}}, endAngle = 360)}),
        Diagram(graphics = {Ellipse(origin = {1, -1}, lineColor = {0, 225, 255}, fillColor = {0, 225, 255}, lineThickness = 0.5, extent = {{-51, 47}, {51, -47}}, endAngle = 360)}));
    end DecayHeat_Out;

    connector NominalNeutronPopulation
      NERTHUS_Modelica.Units.NominalNeutronPopulation n;
      annotation(
        Diagram(graphics = {Ellipse(origin = {1, -1}, fillColor = {20, 36, 248}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-51, 47}, {51, -47}})}),
        Icon(graphics = {Ellipse(origin = {1, -1}, lineColor = {20, 36, 248}, fillColor = {20, 36, 248}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-51, 47}, {51, -47}})}));
    end NominalNeutronPopulation;

    connector Reactivity
      NERTHUS_Modelica.Units.Reactivity rho;
      annotation(
        Diagram(graphics = {Ellipse(origin = {1, -1}, lineColor = {78, 154, 6}, fillColor = {78, 154, 6}, lineThickness = 0.5, extent = {{-51, 47}, {51, -47}})}),
        Icon(graphics = {Ellipse(origin = {1, -1}, lineColor = {78, 154, 6}, fillColor = {78, 154, 6}, lineThickness = 0.5, extent = {{-51, 47}, {51, -47}})}));
    end Reactivity;

    connector ExternalReactivity
      NERTHUS_Modelica.Units.Reactivity rho_Ex;
      annotation(
        Diagram(graphics = {Ellipse(origin = {1, -1}, lineColor = {78, 154, 6}, fillColor = {78, 154, 6}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-51, 47}, {51, -47}}, endAngle = 360)}),
        Icon(graphics = {Ellipse(origin = {1, -1}, lineColor = {78, 154, 6}, fillColor = {78, 154, 6}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-51, 47}, {51, -47}}, endAngle = 360)}));
    end ExternalReactivity;

    connector FlowFraction_In
      NERTHUS_Modelica.Units.FlowFraction FF;
      annotation(
        Diagram(graphics = {Ellipse(origin = {1, -1}, fillColor = {245, 121, 0}, fillPattern = FillPattern.Solid, extent = {{-51, 47}, {51, -47}})}),
        Icon(graphics = {Ellipse(origin = {1, -1}, fillColor = {245, 121, 0}, fillPattern = FillPattern.Solid, extent = {{-51, 47}, {51, -47}})}));
      annotation(
        Diagram(graphics = {Ellipse(origin = {1, -1}, fillColor = {245, 121, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-51, 47}, {51, -47}})}),
        Icon(graphics = {Ellipse(origin = {1, -1}, fillColor = {245, 121, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-51, 47}, {51, -47}})}));
    end FlowFraction_In;

    connector FlowFraction_Out
      NERTHUS_Modelica.Units.FlowFraction FF;
      annotation(
        Diagram(graphics = {Ellipse(origin = {1, -1}, lineColor = {245, 121, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-51, 47}, {51, -47}})}),
        Icon(graphics = {Ellipse(origin = {1, -1}, lineColor = {245, 121, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-51, 47}, {51, -47}})}));
    end FlowFraction_Out;
  end Connectors;

  package QAtoolBox
    // For test cases, performance issues, debugging, and etc
  end QAtoolBox;
end NERTHUS_Modelica;
