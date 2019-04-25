xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:infoCicloResetResponse" location="../WSDLs/LTInfoSchema.xsd" ::)

declare namespace ns0 = "http://nii.com/EnterpriseProxyService/ServiceManagement/LTInfoXSD/v1";
declare namespace xf = "http://tempuri.org/LTInfoService/Resources/XQuery/OUT_XQ_LTInfoCicloReset/";

declare function xf:OUT_XQ_LTInfoCicloReset()
as element(ns0:infoCicloResetResponse) {
    <ns0:infoCicloResetResponse>
        <ns0:infoCicloReset>
            <ns0:codigoPlan>string</ns0:codigoPlan>
            <ns0:nombrePlan>string</ns0:nombrePlan>
            <ns0:tipoTecnologia>string</ns0:tipoTecnologia>
            <ns0:ptt>string</ns0:ptt>
            <ns0:voz>string</ns0:voz>
            <ns0:sms>string</ns0:sms>
            <ns0:datos>string</ns0:datos>
            <ns0:cicloFacturacion>string</ns0:cicloFacturacion>
            <ns0:inicioCicloVigente>string</ns0:inicioCicloVigente>
            <ns0:finCicloVigente>string</ns0:finCicloVigente>
            <ns0:customerId>string</ns0:customerId>
            <ns0:coId>string</ns0:coId>
            <ns0:otro>string</ns0:otro>
            <ns0:otro1>string</ns0:otro1>
        </ns0:infoCicloReset>
        <ns0:error_code>0</ns0:error_code>
        <ns0:err_description>string</ns0:err_description>
    </ns0:infoCicloResetResponse>
};


xf:OUT_XQ_LTInfoCicloReset()