xquery version "2004-draft";
(:: pragma bea:local-element-parameter parameter="$contractServicesAdd1" type="ns1:JcontractServicesAdd/ns0:input/ns1:services/ns1:item/ns1:contractServicesAdd" location="../../../3GBSCS/Resources/WSDLs/JcontractServicesAdd.wsdl" ::)
(:: pragma bea:local-element-parameter parameter="$contractServicesWrite1" type="ns1:JcontractServicesAdd/ns0:input/ns1:services/ns1:item/ns1:contractServicesWrite" location="../../../3GBSCS/Resources/WSDLs/JcontractServicesAdd.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:JcontractServicesAdd" location="../../../3GBSCS/Resources/WSDLs/JcontractServicesAdd.wsdl" ::)

declare namespace ns1 = "http://www.lhsgroup.com/ws_v2_NII_1";
declare namespace ns0 = "http://xml.apache.org/axis/wsdd/providers/java";
declare namespace xf = "http://tempuri.org/BSCSBundles/Resources/XQuery/IN_XQ_PWriteBscsBundleService-Package_TO_BSJContractServiceAdd/";

declare function xf:IN_XQ_PWriteBscsBundleService-Package_TO_BSJContractServiceAdd($contractServicesAdd1 as element(),
    $contractServicesWrite1 as element())
    as element(ns1:JcontractServicesAdd) {
        <ns1:JcontractServicesAdd>
            <ns0:input>
                <ns1:services>
                    <ns1:item>
                        <ns1:contractServicesAdd>
                            {
                                for $coId in $contractServicesAdd1/ns1:coId
                                return
                                    <ns1:coId>{ data($coId) }</ns1:coId>
                            }
                            {
                                for $services in $contractServicesAdd1/ns1:services
                                return
                                    <ns1:services>
                                        {
                                            for $item in $services/ns1:item
                                            return
                                                <ns1:item>
                                                    {
                                                        for $cosTemplId in $item/ns1:cosTemplId
                                                        return
                                                            <ns1:cosTemplId>{ data($cosTemplId) }</ns1:cosTemplId>
                                                    }
                                                    {
                                                        for $profileId in $item/ns1:profileId
                                                        return
                                                            <ns1:profileId>{ data($profileId) }</ns1:profileId>
                                                    }
                                                    {
                                                        for $sncode in $item/ns1:sncode
                                                        return
                                                            <ns1:sncode>{ data($sncode) }</ns1:sncode>
                                                    }
                                                    {
                                                        for $spcode in $item/ns1:spcode
                                                        return
                                                            <ns1:spcode>{ data($spcode) }</ns1:spcode>
                                                    }
                                                </ns1:item>
                                        }
                                    </ns1:services>
                            }
                        </ns1:contractServicesAdd>
                        <ns1:contractServicesWrite>
                            {
                                for $coId in $contractServicesWrite1/ns1:coId
                                return
                                    <ns1:coId>{ data($coId) }</ns1:coId>
                            }
                            {
                                for $services in $contractServicesWrite1/ns1:services
                                return
                                    <ns1:services>
                                        {
                                            for $item in $services/ns1:item
                                            return
                                                <ns1:item>
                                                    {
                                                        for $cosPendingStatus in $item/ns1:cosPendingStatus
                                                        return
                                                            <ns1:cosPendingStatus>{ data($cosPendingStatus) }</ns1:cosPendingStatus>
                                                    }
                                                    {
                                                        for $profileId in $item/ns1:profileId
                                                        return
                                                            <ns1:profileId>{ data($profileId) }</ns1:profileId>
                                                    }
                                                    {
                                                        for $sncode in $item/ns1:sncode
                                                        return
                                                            <ns1:sncode>{ data($sncode) }</ns1:sncode>
                                                    }
                                                </ns1:item>
                                        }
                                    </ns1:services>
                            }
                        </ns1:contractServicesWrite>
                    </ns1:item>
                </ns1:services>
            </ns0:input>
            <ns0:sessionChange>
                <ns1:values>
                    <ns1:item>
                        <ns1:key>BU_ID</ns1:key>
                        <ns1:value>2</ns1:value>
                    </ns1:item>
                </ns1:values>
            </ns0:sessionChange>
        </ns1:JcontractServicesAdd>
};

declare variable $contractServicesAdd1 as element() external;
declare variable $contractServicesWrite1 as element() external;

xf:IN_XQ_PWriteBscsBundleService-Package_TO_BSJContractServiceAdd($contractServicesAdd1,
    $contractServicesWrite1)