xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../WSDL/FTOLERANCE_NII_IVR_CONSULTS_PKG_NII_DEBT_CONSULT_PRC.xsd" ::)
(:: pragma bea:global-element-return element="ns1:ussdOperacionResponse" location="../WSDL/USSDOperaciones.xsd" ::)

declare namespace ns1 = "http://ussd.operaciones.wom.ws.ncl.com";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/FTOLERANCE/NII_IVR_CONSULTS_PKG/NII_DEBT_CONSULT_PRC/";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/OUT_XQ_getInfoDeuda_nii_consults_pkg/";

declare function xf:OUT_XQ_getInfoDeuda_nii_consults_pkg($outputParameters1 as element(ns0:OutputParameters))
    as element(ns1:ussdOperacionResponse) {
        <ns1:ussdOperacionResponse>
            {
                for $OUT_COD_ERROR in $outputParameters1/ns0:OUT_COD_ERROR
                return
                    <errorCode>{ if(empty($OUT_COD_ERROR/text())) then ('0') else ($OUT_COD_ERROR/text())  }</errorCode>
            }
            {
                for $OUT_MONTO_VENCIDO in $outputParameters1/ns0:OUT_MONTO_VENCIDO,
                    $OUT_FECHA_VENCIDO in $outputParameters1/ns0:OUT_FECHA_VENCIDO
                    
                    let $montoDeuda := if(empty($OUT_MONTO_VENCIDO/text())) then ('0') else ($OUT_MONTO_VENCIDO/text())
                return
                if(xs:decimal($montoDeuda) <= 0) then (
                	<errorDescription>{ 'Usted no tiene deudas vencidas pendientes.'}</errorDescription>
                ) else
                (
                	<errorDescription>{ fn:concat('Usted tiene una deuda de $',$montoDeuda, ' que venció el ',$OUT_FECHA_VENCIDO/text() ,'.') }</errorDescription>
                )
                    
            }
        </ns1:ussdOperacionResponse>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;

xf:OUT_XQ_getInfoDeuda_nii_consults_pkg($outputParameters1)