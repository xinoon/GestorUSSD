xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$setWriteBSCSBundle1" element="ns0:setWriteBSCSBundle" location="../WSDLs/BSCSBundleService_schema1.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../WSDLs/PROVI_BOLS_NII_BSCS_BUNDLES_PKG_SET_CAMBIO_BOLSAS_GESTOR_PRC.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_BSCS_BUNDLES_PKG/SET_CAMBIO_BOLSAS_GESTOR_PRC/";
declare namespace ns0 = "http://bolsas.bscs.bundle.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/BSCSBundles/Resources/XQuery/IN_XQ_CambioBolsaGestor/";

declare function xf:IN_XQ_CambioBolsaGestor($setWriteBSCSBundle1 as element(ns0:setWriteBSCSBundle),
    $status as xs:string,
    $sncode_old as xs:decimal)
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:IN_CUSTOMER_ID>{ data($setWriteBSCSBundle1/enterpriseID) }</ns1:IN_CUSTOMER_ID>
            <ns1:IN_CLIENT_NAME>{ data($setWriteBSCSBundle1/client_Name) }</ns1:IN_CLIENT_NAME>
            <ns1:IN_STATUS>{ $status }</ns1:IN_STATUS>
            {
                let $packages := $setWriteBSCSBundle1/packages
                return
                    <ns1:SQ_LIST_PACKAGE>
                        {
                            for $item_pkg in $packages/item_pkg
                            return
                                <ns1:SQ_LIST_PACKAGE_ITEM>
                                    <ns1:SN_SPCODE>{ data($item_pkg/spcode) }</ns1:SN_SPCODE>
                                    {
                                        let $services := $item_pkg/services
                                        return
                                            <ns1:SERVICES_LIST>
                                                {
                                                    for $item_srv in $services/item_srv
                                                    return
                                                        <ns1:SERVICES_LIST_ITEM>
                                                            <ns1:SNCODE>{ data($item_srv/sncode) }</ns1:SNCODE>
                                                            <ns1:TEMPLATE_ID>{ data($item_srv/templ_Id) }</ns1:TEMPLATE_ID>
                                                        </ns1:SERVICES_LIST_ITEM>
                                                }
                                            </ns1:SERVICES_LIST>
                                    }
                                </ns1:SQ_LIST_PACKAGE_ITEM>
                        }
                    </ns1:SQ_LIST_PACKAGE>
            }
        </ns1:InputParameters>
};

declare variable $setWriteBSCSBundle1 as element(ns0:setWriteBSCSBundle) external;
declare variable $status as xs:string external;
declare variable $sncode_old as xs:decimal external;

xf:IN_XQ_CambioBolsaGestor($setWriteBSCSBundle1,
    $status,
    $sncode_old)