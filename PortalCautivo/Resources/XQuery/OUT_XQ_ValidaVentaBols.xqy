xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../WSDLs/PROVI_BOLS_NII_BSCS_PORTAL_CAUTIVO_PKG_VALIDA_VENTAS_BUNDLE_PRC.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getValidaVentaBolsasResponse" location="../WSDLs/ValidaVentaBolsas.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_BSCS_PORTAL_CAUTIVO_PKG/VALIDA_VENTAS_BUNDLE_PRC/";
declare namespace ns0 = "http://captive.portal.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/OUT_XQ_ValidaVentaBols/";

declare function xf:OUT_XQ_ValidaVentaBols($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:getValidaVentaBolsasResponse) {
        let $OutputParameters := $outputParameters1
        return
            <ns0:getValidaVentaBolsasResponse>
                {
                    let $SV_BUNDLE_STATUS_QT_LIST := $OutputParameters/ns1:SV_BUNDLE_STATUS_QT_LIST
                    return
                        <listaResults>
                            {
                                for $SV_BUNDLE_STATUS_QT_LIST_ITEM in $SV_BUNDLE_STATUS_QT_LIST/ns1:SV_BUNDLE_STATUS_QT_LIST_ITEM
                                return
                                    <item_result>
                                        <parameter>{ data($SV_BUNDLE_STATUS_QT_LIST_ITEM/ns1:PARAMETER) }</parameter>
                                        <applied>{ data($SV_BUNDLE_STATUS_QT_LIST_ITEM/ns1:APPLIED) }</applied>
                                        <value>{ data($SV_BUNDLE_STATUS_QT_LIST_ITEM/ns1:VALUE) }</value>
                                    </item_result>
                            }
                        </listaResults>
                }
                <error_code>{ data($OutputParameters/ns1:SN_COD_RETORNO) }</error_code>
                <err_description>{ data($OutputParameters/ns1:SV_MENS_RETORNO) }</err_description>
            </ns0:getValidaVentaBolsasResponse>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:OUT_XQ_ValidaVentaBols($outputParameters1)