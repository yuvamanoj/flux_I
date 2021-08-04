---
apiVersion: helm.fluxcd.io/v1
kind: HelmRelease
metadata:
  name: TEMPLATE_APP_NAME
  namespace: example
  annotations:
    fluxcd.io/automated: "true"
    filter.fluxcd.io/chart-image: glob:*-master.*
spec:
  releaseName: TEMPLATE_APP_NAME
  forceUpgrade: true
  chart:
    repository: https://na.artifactory.swg-devops.com/artifactory/mss-helm-virtual
    name: TEMPLATE_APP_NAME
    version: TEMPLATE_VALID_CHART_TAG
  values:
    image:
      repository: mss-docker.artifactory.swg-devops.com/TEMPLATE_APP_NAME
      tag: TEMPLATE_VALID_IMAGE_TAG
    imagePullSecrets:
    - name: example-docker-registry-pull
    graphite:
      enabled: true
      host: dal09-prd-statsnode-01a.sec.ibm.com
      prefix: dev.ocp.example
    # TEMPLATE: Insert other required configuration values here
