xquery version "2004-draft";
(:: pragma bea:local-element-parameter parameter="$packages1" type="ns0:setWriteBSCSBundle/packages" location="../WSDLs/BSCSBundleService_schema1.xsd" ::)
(:: pragma bea:local-element-return type="ns2:JcontractCreate/ns1:input/ns2:contractServicesAdd" location="../../../3GBSCS/Resources/WSDLs/JcontractCreate.wsdl" ::)

declare namespace ns2 = "http://www.lhsgroup.com/ws_v2_NII_1";
declare namespace ns1 = "http://xml.apache.org/axis/wsdd/providers/java";
declare namespace ns0 = "http://bolsas.bscs.bundle.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/BSCSBundles/Resources/XQuery/IN_XQ_PWriteBscsBundleService-Package_TO_BSJContractCreate-Service/";

declare function xf:IN_XQ_PWriteBscsBundleService-Package_TO_BSJContractCreate-Service($packages1 as element())
    as element() {

        <ns2:contractServicesAdd>
            <ns2:services>
                {
                    for $item_pkg in $packages1/item_pkg,
                        $item_srv in $item_pkg/services/item_srv
                    return     
                        <ns2:item>
                            <ns2:cosTemplId>{ data($item_srv/templ_Id) }</ns2:cosTemplId>
                            <ns2:profileId>0</ns2:profileId>
                            <ns2:sncode>{ data($item_srv/sncode) }</ns2:sncode>
                            <ns2:spcode>{ data($item_pkg/spcode) }</ns2:spcode>
                        </ns2:item>
                }
            </ns2:services>
        </ns2:contractServicesAdd>
};

declare variable $packages1 as element() external;

xf:IN_XQ_PWriteBscsBundleService-Package_TO_BSJContractCreate-Service($packages1)