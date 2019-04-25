xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../WSDL/FTOLERANCE_NII_IVR_CONSULTS_PKG_NII_DEBT_CONSULT_PRC.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/FTOLERANCE/NII_IVR_CONSULTS_PKG/NII_DEBT_CONSULT_PRC/";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/IN_XQ_getInfoDeuda_nii_consults_pkg/";

declare function xf:IN_XQ_getInfoDeuda_nii_consults_pkg($nroCelular as xs:string)
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_DN_NUMBER>{ $nroCelular }</ns0:P_DN_NUMBER>
        </ns0:InputParameters>
};

declare variable $nroCelular as xs:string external;

xf:IN_XQ_getInfoDeuda_nii_consults_pkg($nroCelular)