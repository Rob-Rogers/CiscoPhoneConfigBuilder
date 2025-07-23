#!/bin/bash

echo "Enter MAC address (e.g., 001122334455): "
read MAC
MAC_UPPER=$(echo $MAC | tr '[:lower:]' '[:upper:]')
FILENAME="SEP${MAC_UPPER}.cnf.xml"

echo "Enter SIP username: "
read SIPUSER

echo "Enter SIP password: "
read SIPPASS

echo "Enter SIP server IP (e.g., 192.168.1.100): "
read SIPSERVER

cat > $FILENAME <<EOF
<device>
  <fullConfig>true</fullConfig>
  <deviceProtocol>SIP</deviceProtocol>
  <sshAccess>0</sshAccess>
  <devicePool>
    <dateTimeSetting>
      <dateTemplate>M/D/Y</dateTemplate>
      <timeZone>Eastern Standard/Daylight Time</timeZone>
      <ntps>
        <ntp>
          <name>pool.ntp.org</name>
          <ntpMode>Unicast</ntpMode>
        </ntp>
      </ntps>
    </dateTimeSetting>
    <callManagerGroup>
      <members>
        <member priority="0">
          <callManager>
            <ports>
              <sipPort>5060</sipPort>
            </ports>
            <processNodeName>$SIPSERVER</processNodeName>
          </callManager>
        </member>
      </members>
    </callManagerGroup>
  </devicePool>

  <commonProfile>
    <phonePassword></phonePassword>
  </commonProfile>

  <loadInformation>SIP894x.9-4-2SR3-1</loadInformation>

  <vendorConfig>
    <backgroundImageAccess>true</backgroundImageAccess>
    <phoneLabel>My 8945</phoneLabel>
    <webAccess>0</webAccess>
    <videoCapability>1</videoCapability>
    <sshAccess>0</sshAccess>
  </vendorConfig>

  <networkLocale>US</networkLocale>
  <networkLocaleInfo>
    <name>US</name>
  </networkLocaleInfo>

  <phoneServices>
    <provisioning>0</provisioning>
  </phoneServices>

  <sipProfile>
    <sipProxies>
      <backupProxy></backupProxy>
      <backupProxyPort>5060</backupProxyPort>
      <emergencyProxy></emergencyProxy>
      <emergencyProxyPort>5060</emergencyProxyPort>
      <outboundProxy></outboundProxy>
      <outboundProxyPort>5060</outboundProxyPort>
      <registerWithProxy>true</registerWithProxy>
    </sipProxies>

    <sipCallFeatures>
      <callWaiting>3</callWaiting>
      <callerIdBlocking>0</callerIdBlocking>
      <autoAnswerTimer>1</autoAnswerTimer>
      <autoAnswerAlt>0</autoAnswerAlt>
      <autoAnswer>2</autoAnswer>
      <dtmfAvtPayload>101</dtmfAvtPayload>
      <dtmfDbLevel>3</dtmfDbLevel>
      <dtmfOutofBand>avt</dtmfOutofBand>
      <callHoldRingback>2</callHoldRingback>
    </sipCallFeatures>

    <sipLines>
      <line button="1">
        <featureID>9</featureID>
        <featureLabel>My Extension</featureLabel>
        <proxy>$SIPSERVER</proxy>
        <port>5060</port>
        <name>$SIPUSER</name>
        <displayName>$SIPUSER</displayName>
        <authName>$SIPUSER</authName>
        <authPassword>$SIPPASS</authPassword>
        <messageWaitingLampPolicy>1</messageWaitingLampPolicy>
        <messagesNumber>*97</messagesNumber>
        <ringSettingIdle>4</ringSettingIdle>
        <ringSettingActive>5</ringSettingActive>
        <contact>$SIPUSER</contact>
      </line>
    </sipLines>

    <natEnabled>false</natEnabled>
    <phoneLabel>$SIPUSER</phoneLabel>
    <preferredCodec>g722</preferredCodec>
    <softkeyFile>softkeys.xml</softkeyFile>
    <dialTemplate>dialplan.xml</dialTemplate>
    <voipControlPort>5060</voipControlPort>
    <startMediaPort>16384</startMediaPort>
    <stopMediaPort>32766</stopMediaPort>
    <natReceivedProcessing>false</natReceivedProcessing>
    <stutterMsgWaiting>1</stutterMsgWaiting>
    <callStats>false</callStats>
    <offhookToFirstDigitTimer>15000</offhookToFirstDigitTimer>
    <silentPeriodBetweenCallWaitingBursts>10</silentPeriodBetweenCallWaitingBursts>
    <semiAttendedTransfer>true</semiAttendedTransfer>
    <allowTransferOnProceeding>true</allowTransferOnProceeding>
  </sipProfile>

  <userLocale>
    <name>English_United_States</name>
    <langCode>en_US</langCode>
    <version>1.0.0.0-1</version>
    <winCharSet>iso-8859-1</winCharSet>
  </userLocale>

  <servicesURL>http://$SIPSERVER/services</servicesURL>
  <directoryURL>http://$SIPSERVER/directory</directoryURL>
  <idleURL></idleURL>
  <informationURL></informationURL>
  <messagesURL></messagesURL>
  <proxyServerURL></proxyServerURL>
</device>
EOF

echo "Configuration file created: $FILENAME"
