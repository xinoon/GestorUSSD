xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../WSDL/FTOLERANCE_NII_IVR_CONSULTS_PKG_NII_DEBT_CONSULT_PRC.xsd" ::)
(:: pragma bea:global-element-return element="ns1:ussdOperacionResponse" location="../WSDL/USSDOperaciones.xsd" ::)

declare namespace ns1 = "http://ussd.operaciones.wom.ws.ncl.com";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/FTOLERANCE/NII_IVR_CONSULTS_PKG/NII_DEBT_CONSULT_PRC/";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/OUT_XQ_getInfoDeuda_nii_consults_pkg_error_sql/";

declare function xf:OUT_XQ_getInfoDeuda_nii_consults_pkg_error_sql($outputParameters1 as element(ns0:OutputParameters))
    as element(ns1:ussdOperacionResponse) {
        <ns1:ussdOperacionResponse>
             <errorCode>ERR-0016</errorCode>
            
            {
                for $OUT_MEN_ERROR in $outputParameters1/ns0:OUT_MEN_ERROR,
                	$OUT_COD_ERROR in $outputParameters1/ns0:OUT_COD_ERROR
                return
                    <errorDescription>{ concat('stage: getDeudaVencida, Error: ', if(empty($OUT_MEN_ERROR/text())) then ('No se encuentra resultado para el numero ingresado.') else($OUT_MEN_ERROR/text()), ', código error: ', if(empty($OUT_COD_ERROR/text())) then ('ERR-0017') else($OUT_COD_ERROR/text())) }</errorDescription>
            }
        </ns1:ussdOperacionResponse>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;

xf:OUT_XQ_getInfoDeuda_nii_consults_pkg_error_sql($outputParameters1)