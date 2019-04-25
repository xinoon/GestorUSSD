xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$infoCuotaDatos1" element="ns0:infoCuotaDatos" location="../WSDLs/LTInfoSchema.xsd" ::)
(:: pragma bea:global-element-return element="ns1:getInfoPlanCicloDBAInput" location="../WSDLs/getInfoPlanCicloDba.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/getInfoPlanCicloDBA";
declare namespace ns0 = "http://nii.com/EnterpriseProxyService/ServiceManagement/LTInfoXSD/v1";
declare namespace xf = "http://tempuri.org/LTInfoService/Resources/XQuery/IN_XQ_LTInfoCuotaDatos/";

declare function xf:IN_XQ_LTInfoCuotaDatos($infoCuotaDatos1 as element(ns0:infoCuotaDatos))
    as element(ns1:getInfoPlanCicloDBAInput) {
        <ns1:getInfoPlanCicloDBAInput>
            <ns1:PHONE_NUMBER>{ data($infoCuotaDatos1/ns0:nroCelular) }</ns1:PHONE_NUMBER>
        </ns1:getInfoPlanCicloDBAInput>
};

declare variable $infoCuotaDatos1 as element(ns0:infoCuotaDatos) external;

xf:IN_XQ_LTInfoCuotaDatos($infoCuotaDatos1)