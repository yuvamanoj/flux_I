apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: ISTIO_TEMPLATE_UNIQUE_NAME
spec:
  selector:
    istio: ingressgateway
  servers:
  - hosts:
    - "ISTIO_TEMPLATE_UNIQUE_NAME.apps-priv.dal09-dev-ocp-01.cl.sec.ibm.com"
    port:
      name: http
      number: 80
      protocol: HTTP

---

apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata:
  name: TEMPLATE_APP_NAME_A
spec:
  host: TEMPLATE_APP_NAME_A
  subsets:
  - name: TEMPLATE_APP_NAME_A
    labels:
      app.kubernetes.io/instance: TEMPLATE_APP_NAME_A
      
      
---

apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata:
  name: TEMPLATE_APP_NAME_B
spec:
  host: TEMPLATE_APP_NAME_B
  subsets:
  - name: TEMPLATE_APP_NAME_B
    labels:
      app.kubernetes.io/instance: TEMPLATE_APP_NAME_B
 

---


apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: ISTIO_TEMPLATE_UNIQUE_NAME
spec:
  hosts:
  - 'ISTIO_TEMPLATE_UNIQUE_NAME.apps-priv.dal09-dev-ocp-01.cl.sec.ibm.com'
  gateways:
  - ISTIO_TEMPLATE_UNIQUE_NAME  
  http:
  - name: "ISTIO_TEMPLATE_UNIQUE_NAME"
    route:
    - destination:
        host: TEMPLATE_APP_NAME_A
        subset: TEMPLATE_APP_NAME_A
      weight: 50
    - destination:
        host: TEMPLATE_APP_NAME_B
        subset: TEMPLATE_APP_NAME_B
      weight: 50
