xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$traficoDatosResponse1" element="ns0:traficoDatosResponse" location="../../../ConsultaTrafico/TrafficData/Resources/WSDL/TrafficDataService.xsd" ::)
(:: pragma bea:global-element-return element="TOTAL_TRAF_DET_ITEM" location="../WSDL/XMLTrafico.xsd" ::)

declare namespace ns0 = "http://traficoDatos.wave.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/PrepaidWave/Resources/XQuery/OUT_XQ_GetTrafficData/";

declare function xf:OUT_XQ_GetTrafficData($traficoDatosResponse1 as element(ns0:traficoDatosResponse))
    as element(TOTAL_TRAF_DET_ITEM) {
        <TOTAL_TRAF_DET_ITEM>
            <CALLDURATION>{
            	let $sumData := for $indice1  in $traficoDatosResponse1/outTraficoDato
		            let $data := xs:double(data($indice1/duracion))
				return $data
		        return xs:string(sum($sumData))}</CALLDURATION>
        </TOTAL_TRAF_DET_ITEM>
};

declare variable $traficoDatosResponse1 as element(ns0:traficoDatosResponse) external;

xf:OUT_XQ_GetTrafficData($traficoDatosResponse1)