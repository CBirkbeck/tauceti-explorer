# BP-FunctionFieldArithmetic handoff

Agent: Codex. Session: codex-Mp7Yro. Issue: #732. Branch: codex-Mp7Yro-function-field-arithmetic. Claim confirmed by the swarm bot on 2026-10-10. This submission completes the target-level planning pass for FA.0–FA.7; it is not a checkpoint, implementation or independent review.

## Deliverables and counts

The packet, mathematical reader and suggested file agree on 48 targets: 8 comparisons, 5 definitions, 16 constructions and 19 theorems. The 21 definition/construction targets have 64 API items and 63 named unit tests, each with an actual example in the suggested file. There are 31 planets, no more than six per layer; 28 pinned native declaration receipts; 16 public primary sources; 5 version-scoped source findings; 29 open supplier receipts; and 4 explicit gaps. Every implementation status is unchecked.

FA.0, FA.1, FA.2, FA.3, FA.4, FA.5, FA.6 and FA.7 are all **planned**. No layer is closed. Complete means that every target and prerequisite boundary in scope has been accounted for; it does not claim that supplier interfaces or source proof gaps are discharged. The reader gives full mathematical hypotheses, constructions/proofs, named APIs, tests, acceptance criteria and exact source locators. The suggested file is subordinate to that specification.

## Verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/FunctionFieldArithmetic.json`: **0 errors, 0 warnings**.
- The source-issue validator and version checker used by `check_errata.py` accept all five findings: **0 errors**. The standalone errata CLI expects a separate errata-v1 document, so it is not the appropriate CLI for this blueprint-v1 packet.
- `lean-check research/blueprint/suggested/FunctionFieldArithmetic.lean`: **exit 0**, with only admitted-proof warnings. The shared build is pinned to Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Memory was checked before each run, and only one own elaboration ran at a time.
- A temporary native declaration inventory appended to the actual suggested file checked all **175 distinct packet names** (48 targets, 64 API items, 63 tests). They all resolved. The temporary checks were removed; the compiled core is the submitted file. It contains 63 actual examples. No language server, library build, dependency update or cache download was run.
- Independent finite enumeration checked the elliptic curve y²=x³+x+1 over F5 and F25: N1=9, N2=27, P over F5 is 1+3T+5T², and over F25 is 1+T+25T². It also checked y³−y=x² over F3 and F9: N1=4, N2=16, P=1+3T². The degree-two fields were represented as pairs a+bu with u²=2; 2 is a nonsquare in both F5 and F3. Enumerate every affine pair, test the equations, and add the single smooth projective point at infinity. Newton's recurrence and the squared-root constant-extension formula independently reproduce the displayed polynomials. In the original wild model x=1/t, there is one point above t=0 and three above t=∞.

## Existing work imported

Actual declaration statements were read at the planning pins. The current read-only TauCetiRoadmap inventory was also checked at 81207c7f16d5abf770f13a7d2bdcdb465c030787 and current Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The packet records those receipts. Current Place.Completion and repartitionToFiniteAdeles, Completed/RestrictedProducts topology, AlgebraicVectorBundles carriers, ordinary SF.3 Picard and vector-bundle degree/duality, AC ramification and different, LFR filtrations, and CFT Tate machinery are imported. SR.4 owns local integral Hecke/Satake; IHG.0 polynomial laws are not substituted for it. IntegralLattices over Z is not a Hermitian local-density supplier. No current roadmap target is reconstructed here.

## Four confirmed ownership findings

1. **RT-AREA-finitefields/12:** FA.7 imports FF.3 factorization and point-count certificates. It owns normalized place enumeration, Newton assembly from counts for r≤g, the functional equation, ray/conductor/completion adapters and the explicit cost model. FF.3's reviewed point-count node is only an odd-characteristic elliptic case, so general normalized curve/hyperelliptic counts are explicitly requested there. Factorization itself is adequate and is not planned again.
2. **RT-AREA-langlands-1/12:** GS.0 owns Bun_G and GS.1 owns affine/BD Grassmannians. The packet's upstream notes record those geometric imports to ET.2b and FA.2/FA.6 arithmetic imports to ET.3. This submission does not edit ET or GS files. Maintainer follow-up must insert the ownership links and narrow ET's geometry accordingly.
3. **RT-AREA-algebraicgeometry/7:** FA.5/schmidt-degree-one explicitly proves gcd of closed-point degrees equals one using WC.5's independent bound over every finite extension. Bézout supplies an integer divisor of degree one, without asserting a rational point. This feeds FA.4 degree splitting. There is no FA.4→Schmidt dependency. Maintainer follow-up must retarget PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/degree-one-divisor and annotate AUDIT-01's AC.5 entry; AC.5 remains within its zeta-free scope.
4. **RT-AREA-geomlanglands/12:** FA.2/FA.6 own the arithmetic specialization of adeles, central characters and degree lattices. AA.0 owns generic restricted topology and Haar products. ES7 must import those inputs and retain division-algebra maximal orders, compactness modulo the center, discrete decomposition, kernel trace identity and simple trace/globalization targets. The necessary ownership links are recorded for maintainer application, without editing ES7.

## Exact closure work and supplier requests

The first 13 requests are scope enhancements or normalization comparisons: SF.3 generalized Picard/Rosenlicht, Tsen and Lang inputs; WC.5 independent all-extension Weil estimates; FF.3 general curve count certificates; EDC.8 torsion-coefficient trace with j_* versus j_!; DWP.1 determinant/Brauer–Nesbitt comparison; EDC.2 integral Z2 curve cup-product alternation; RG2.4 nonsplit reduction and unitary/parabolic data; SR.4 integral Satake and unramified induction; GN.3 split Hermitian densities; MP.6 exact FYZ rank-n+2j local Siegel–Weil; AS.1 function-field convergence; AS.2 meromorphic continuation; and AL.3 rerouting its existing GLn Fourier/Whittaker arithmetic inputs. The other 16 requests are explicit import receipts for existing AC/LFR/CFT layer contracts, not allegations of absent mathematics or permission to duplicate them. All requested statements and consumers are in the packet and reader.

The four gaps are:

- **LEAN-INTERFACES:** replace omitted supplier conditions and executable encodings with their actual interfaces. The reader's precision section and comments beside signatures list each omission. No absent condition is replaced by a dummy logical field. RR basis/certificate proof fields are genuine. Formula-only signatures must not be used as unconditional theorems.
- **GEO-RAY:** verify Rosenlicht generalized-Jacobian construction, connectedness of the pulled-back Lang ray torsor, and conductor/Artin comparison. Conrad Theorems 3.1–3.2 state the contract without supplying its entire proof. Milne ADT Appendix A explicitly excludes existence and does not fill this gap.
- **RG-RED:** supply the exact nonsplit reductive reduction theorem with all central-degree directions bounded. Harder's read Theorem 1.2.1 and Corollary 1.2.3 cover split Chevalley groups. The reader does not infer unrestricted reductive cusp finiteness from them.
- **GENERAL-POINT-COUNT:** supply independently verified projective counts for general curves/hyperelliptic models over all needed finite extensions. An L-polynomial of the right shape cannot certify its input counts.

The planning pass includes full Hess finite/infinite fractional-module reduction, termination via decreasing degree with determinant lower bound, and the complete basis theorem. No unverified efficient normalization claim is made. Costs specify the field-operation/bit-operation model and divisor height separately from factorization and normalization. The four examples are specified, including the wild cover's different and conductor.

## Sources and corrections

The 16 public sources, versions, URLs, hashes and exact read portions survive in the packet and reader: Yu; Ciubotaru–Harris; D'Addezio; Abdurrahman–Venkatesh; Feng–Yun–Zhang; Kosters–Wan; Parshin; Roquette; Harder; Böckle–Harris–Khare–Thorne; Li–Zhang; Kosters; Yoshida; Milne ADT; Conrad; Hess. Public proof portions were checked for the specified targets, without claiming full-paper readings. All repository statements are in our own words. Rosen, Stichtenoth and Weil were not cleared by the reference-library index and were not used; no restricted book copy or passage was copied.

Parshin E1–E3 concern the sum/product pairing misprint, impossible injectivity of a complex additive character of a nonprime finite field, and the missing translates in the Bruhat–Schwartz spanning assertion. Printed preprint page images were inspected. Searches found no correction, and the AMS published PDF refused access; these findings are expressly scoped to arXiv v1, require independent verification, and assert nothing about an unread publisher text. Yu E4–E5 repeat the already confirmed PAPER-YU-23/E10–E11 findings: a nonzero spherical vector is required; the shifted diagonal has **positive** Yu determinant degree n(n−1)(g−1), canceled by scalar exponent **negative** (n−1)(g−1). The source search boundaries and existing independent review are recorded.

## Resume point

The next action is independent blueprint review of these four deliverables. Check the source findings, exact supplier sufficiency, constant-field and Frobenius signs, the coarse explicit Chebotarev bound, and FYZ measure/degree/rank normalizations. Apply the ownership routing through the maintainer, then discharge the named supplier/source boundaries. A roadmap package must retain every API and test and the full mathematical conditions. No work depends on this run's disposable scratch files.
