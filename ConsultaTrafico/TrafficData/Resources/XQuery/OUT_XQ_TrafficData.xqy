xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getTrafficDataDbaOutputCollection1" element="ns1:getTrafficDataDbaOutputCollection" location="../WSDL/getTrafficDataDba.xsd" ::)
(:: pragma bea:global-element-return element="ns0:traficoDatosResponse" location="../WSDL/TrafficDataService.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/getTrafficDataDba";
declare namespace ns0 = "http://traficoDatos.wave.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/ConsultaTrafico/TrafficData/Resources/XQuery/OUT_XQ_TrafficData/";

declare function xf:OUT_XQ_TrafficData($getTrafficDataDbaOutputCollection1 as element(ns1:getTrafficDataDbaOutputCollection))
    as element(ns0:traficoDatosResponse) {
        <ns0:traficoDatosResponse>
            {
                for $getTrafficDataDbaOutput in $getTrafficDataDbaOutputCollection1/ns1:getTrafficDataDbaOutput
                return
                    <outTraficoDato>
                        <numeroOrigen>{ data($getTrafficDataDbaOutput/ns1:NUMERO_ORIGEN) }</numeroOrigen>
                        <numeroDestino>{ data($getTrafficDataDbaOutput/ns1:NUMERO_DESTINO) }</numeroDestino>
                        <destino>{ data($getTrafficDataDbaOutput/ns1:DESTINO) }</destino>
                        <sentido>{ data($getTrafficDataDbaOutput/ns1:SENTIDO) }</sentido>
                        <fecha>{ data($getTrafficDataDbaOutput/ns1:FECHA) }</fecha>
                        <horaInicio>{ data($getTrafficDataDbaOutput/ns1:HORA_INICIO) }</horaInicio>
                        <horaTermino>{ data($getTrafficDataDbaOutput/ns1:HORA_TERMINO) }</horaTermino>
                        <unidad>{ data($getTrafficDataDbaOutput/ns1:UNIDAD) }</unidad>
                        <duracion>{ data($getTrafficDataDbaOutput/ns1:DURACION) }</duracion>
                        <duracionSegundos>{ data($getTrafficDataDbaOutput/ns1:DURACION_SEGUNDOS) }</duracionSegundos>
                        <valorSegundo>{ data($getTrafficDataDbaOutput/ns1:VALOR_SEGUNDO) }</valorSegundo>
                        <servicio>{ data($getTrafficDataDbaOutput/ns1:SERVICIO) }</servicio>
                        <tramoHorario>{ data($getTrafficDataDbaOutput/ns1:TRAMO_HORARIO) }</tramoHorario>
                        <caracteristicaServicio>{ data($getTrafficDataDbaOutput/ns1:CARACTERISTICA_SERVICIO) }</caracteristicaServicio>
                        <valorLlamada>{ data($getTrafficDataDbaOutput/ns1:VALOR_LLAMADA) }</valorLlamada>
                    </outTraficoDato>
            }
        </ns0:traficoDatosResponse>
};

declare variable $getTrafficDataDbaOutputCollection1 as element(ns1:getTrafficDataDbaOutputCollection) external;

xf:OUT_XQ_TrafficData($getTrafficDataDbaOutputCollection1)