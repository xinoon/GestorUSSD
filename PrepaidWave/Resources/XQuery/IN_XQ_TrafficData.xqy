xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$consumosICCAbonado1" element="ns1:consumosICCAbonado" location="../WSDL/PrepaidWaveService.xsd" ::)
(:: pragma bea:global-element-return element="ns0:traficoDatos" location="../../../ConsultaTrafico/TrafficData/Resources/WSDL/TrafficDataService.xsd" ::)

declare namespace ns1 = "http://prepaid.wave.ws.ncl.nii.com";
declare namespace ns0 = "http://traficoDatos.wave.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/PrepaidWave/Resources/XQuery/IN_XQ_TrafficData/";

declare function xf:IN_XQ_TrafficData($consumosICCAbonado1 as element(ns1:consumosICCAbonado))
    as element(ns0:traficoDatos) {
        <ns0:traficoDatos>
            <nroCelular>{ data($consumosICCAbonado1/nroCelular) }</nroCelular>
            <fechaInicio>{ data($consumosICCAbonado1/fechaInicio) }</fechaInicio>
            <fechaFin>{ data($consumosICCAbonado1/fechaFin) }</fechaFin>
        </ns0:traficoDatos>
};

declare variable $consumosICCAbonado1 as element(ns1:consumosICCAbonado) external;

xf:IN_XQ_TrafficData($consumosICCAbonado1)