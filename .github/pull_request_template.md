:rotating_light: **IMPORTANT:** Please fill out all points in this pull request template. 
It helps us streamline the process and not forget about important things.
Your Production Pull Request might get rejected if this template is not filled appropriately.

:computer: **Developers:** Edit this template and fill out the following sections - Summary / Impact Assessment & Planning / Rollback Plan & Readiness Checklist

:question: Have questions? Visit our [GitOps Flux Release FAQ](http://ibm.biz/FAQGitOpsFluxReleases)


**:mag_right: QA:** Complete the Readiness Checklist and add test details on the comments section.


## 📝 Summary
#### What's the purpose of this release?
<!-- Brief description of the scope of the release, modules affected, features released, etc. -->

#### Who is responsible for this pull request?
<!-- 
Name, Slack ID and email address of the developer responsible for this pull request.
Note that this person might be contacted by Infra / QA / RM  in case a critical post release issue is raised.

Example:
* John Smith, @john.smith, john.smith@us.ibm.com
-->

#### What are the applications being deployed?
<!-- List of applications being deployed as part of this PR.
If you are working on pak models, like atds, list the name of the pak being deployed and the microservices that are changing-->

#### What are the environments that will receive this change?
<!-- ATL / EU / KSA -->

#### What are the stories being released?
<!-- List of JIRA stories that are part of this PR. -->


## 📅 Impact Assessment & Planning

#### Is there any internal impact expected?
<!-- List of the expected impacts of this release AND THEIR EXPECTED DURATION, if impact is expected, please answer with N/A. 
The impact can be internal (only noticeable by Engineering and Analysts), or external (the end user will notice)
Example of Internal Impact:
 - New AI alert creation will be delayed for 20-30 minutes (note, this is an acceptable impact) 
 - Loss of data or data being backloged -->
 
#### Is there any external impact expected?
<!-- List of the expected impacts of this release AND THEIR EXPECTED DURATION, if impact is expected, please answer with N/A. 
The impact can be internal (only noticeable by Engineering and Analysts), or external (the end user will notice)Example of External Impact:
 - VSOC Portal will be unavailable for 10 minutes.
 - User will not be able to access a feature on Portal for 20 minutes
 - Loss of data or data being backloged .

Please be honest on the impact description, this will help us to assess if it is safe to have a release on a weekday, or if  we'll need a special window on an weeked.

-->
## Pre/post-req-update

#### Are there any _pre-release_ requirements?
<!-- List of pre-release requirements for this pull request with people assigned for completing the tasks, if none, please answer with N/A

IMPORTANT: If this pull request requires infrastructure team support prior to the release, the developer submitting this pull request is responsible for creating a RFC Remedy Ticket with detailed instructions and finding someone to fulfill the requirements. - refer to the FAQ for more detailed info about the pre/post req - https://ibm.biz/BdfzTC

Examples of pre-requirement that require infrastructure support: 
- database schema changes (e.g. MySQL) --- ANY MySQL change MUST be reviewed and approved by a DBA at least 1 day prior to the expected release date.
- vault credentials setup --- follow the request creation template - [XPS-47867](https://jira.sec.ibm.com/browse/XPS-47867) (More info on https://ibm.biz/BdfzWR)
- k8s secrets creation --- the vault credential setup is required for the k8s secret creation - follow the request creation template - [XPS-80775](https://jira.sec.ibm.com/browse/XPS-80775) -  (More info on https://ibm.biz/BdfzWR)
- cache reload
- Kafka topic creation
- ElasticSearch index rebuild
- NOTE - any MySQL change MUST be previously assessed and approved by the DBA.
-->

#### Are there any _post-release_ requirements?
<!-- List of pre-release requirements for this pull request with people assigned for completing the tasks, if none, please answer with N/A

IMPORTANT: If this pull request requires infrastructure team support after to the release, the developer submitting this pull request is responsible for creating a RFC Remedy Ticket with detailed instructions and finding someone to fulfill the requirements.

Examples of post-requirement that require infrastructure support: 
- database schema changes (e.g. MySQL) --- ANY MySQL change MUST be reviewed and approved by a DBA at least 1 day prior to the expected release date.
- load balancer changes
- application / service restart
-->


## 🔥 Rollback Plan
#### What actions should be taken to perform a rollback?
<!-- What are the exact steps to roll back this release in case things go wrong? 
If the we had a Pre/Post release requiement, take it in consideration and point out if we also need them to be reverted, and in which point.

Examples:
1. Accept pull request PR-231
2. Revert MySQL change and accept pull request PR-231
3. Accept pull request PR-231 and only then revert MySQL change

-->
- [x] Revert this pull request (default)
- [ ] Other (please specify necessary actions below)


## 👨‍💻 Readiness Checklist
#### Developers
<!-- Please check all items that are true for this pull request. -->

- [ ] Tribe / Squad / Application labels were added on this PR
- [ ] SM has created a fix version to consolidate the stories from this PR i.e YYYY.MM.DD GitOps SquadName (2021.01.01 GitOps ReleaseMagement) <!-- Please fill out the Release Date field on the fix version. -->
- [ ] Jenkins pipeline is green 
- [ ] No new vulnerabilities are reported by Sonar
- [ ] Application secrets are stored on Vault
- [ ] All open source libraries have been reviewed & approved through the COO/OSS process
- [ ] Architecture has been reviewed & approved through the Architecture Review process, including Threat modeling
- [ ] Continuous monitoring is in place <!-- Include a link in the comments - i.e New Relic -->
- [ ] Alerting is in place <!-- Include a link in the comments - i.e - Nagios checks-->
- [ ] Grafana dashboard has been created <!-- Include a link in the comments -->

#### QA
<!-- Please check all items that are true for this pull request. -->
QA - Add in the comments the STG & PRD Test Execution created for this PR, if one or more items are not applicable, or not yet completed, justify in the comments.
- [ ] Manual tests have been created / updated and executed / approved on STG<!-- Include a link in the comments -->
- [ ] Automated tests have been created / updated and executed / approved on STG<!-- Include a link in the comments -->
- [ ] Performance degradation has been verified <!-- Include a link in the comments -->
- [ ] Integration with other modules/microservices for this release have been identified & tested <!-- Include a link in the comments -->
- [ ] Before deploying to Production, ensure that the developer responsible for the PR is online and ready to support if necessary.

## ✅ Release Manager Checklist
The following should be completed before merging and deploying:

- [ ] All items from above checklists have been completed
- [ ] JIRA status of the stories has been reviewed
- [ ] Pull request has correct Tribe / Squad / Application labels
