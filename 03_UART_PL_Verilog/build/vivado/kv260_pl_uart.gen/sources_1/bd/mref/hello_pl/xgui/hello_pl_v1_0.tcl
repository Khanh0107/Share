# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "BAUD" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CLK_HZ" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PERIOD_MS" -parent ${Page_0}


}

proc update_PARAM_VALUE.BAUD { PARAM_VALUE.BAUD } {
	# Procedure called to update BAUD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BAUD { PARAM_VALUE.BAUD } {
	# Procedure called to validate BAUD
	return true
}

proc update_PARAM_VALUE.CLK_HZ { PARAM_VALUE.CLK_HZ } {
	# Procedure called to update CLK_HZ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CLK_HZ { PARAM_VALUE.CLK_HZ } {
	# Procedure called to validate CLK_HZ
	return true
}

proc update_PARAM_VALUE.PERIOD_MS { PARAM_VALUE.PERIOD_MS } {
	# Procedure called to update PERIOD_MS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PERIOD_MS { PARAM_VALUE.PERIOD_MS } {
	# Procedure called to validate PERIOD_MS
	return true
}


proc update_MODELPARAM_VALUE.CLK_HZ { MODELPARAM_VALUE.CLK_HZ PARAM_VALUE.CLK_HZ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CLK_HZ}] ${MODELPARAM_VALUE.CLK_HZ}
}

proc update_MODELPARAM_VALUE.BAUD { MODELPARAM_VALUE.BAUD PARAM_VALUE.BAUD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BAUD}] ${MODELPARAM_VALUE.BAUD}
}

proc update_MODELPARAM_VALUE.PERIOD_MS { MODELPARAM_VALUE.PERIOD_MS PARAM_VALUE.PERIOD_MS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PERIOD_MS}] ${MODELPARAM_VALUE.PERIOD_MS}
}

