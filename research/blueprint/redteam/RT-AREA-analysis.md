# RT-AREA-analysis — complex and functional analysis

Codex — `codex-c83e7a`; issue #1539; 2026-09-24. Complete area review with five findings, subject to independent verification. Four are high severity because the stated hypotheses allow counterexamples; the analytic-arc reduction error is medium because the correct local-chart implementation already supplies the target.

Input snapshot: `a83d9981d5340b3e612b4f821093d8f5f5ecbabd`. Library baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Only this report and its result JSON are deliverables. No Lean implementation or compilation is claimed.

## Reading, scope and independence

All six assigned documents and their 63 full stage descriptions were read. Exact normalized-substring checks connect the descriptions to the documents. Their reviewed coverage contains 398 target records; parents and extracted sub-layers sometimes repeat targets.

| Roadmap | Stages | Coverage records | Main boundaries checked |
| --- | ---: | ---: | --- |
| Completed/ContourIntegration | 5 | 37 | Ordinary versus principal-value integrals; finite meromorphic pinned scope; flatness and sector cancellation; ModularForms as consumer |
| Completed/OrthogonalL2Bases | 11 | 44 | Probabilists' Hermite normalization, Gaussian dilation, Fourier scaling, weighted-measure versus reference-measure basis, sigma-finite products |
| ConformalMapping | 7 | 28 | Existing RMT and reflection, charted arcs, Jordan boundary correspondence, Schwarz–Christoffel limitations |
| FuchsianOrbifolds | 7 | 54 | Effective projective action, elliptic charts, normalized cusp data, compactification, independent degree theory and lower j-input module |
| OneParameterSemigroups | 9 | 77 | Growth versus contraction, endpoint smoothness, generic monoids versus group involutions, abstract versus concrete flow ownership |
| OptimalTransport | 24 | 158 | Coupling/duality/moment regimes through regularity, dynamics, barycenters, entropy, synthetic curvature and measured-kernel layers |

The coverage notes were read for every row; this does **not** claim an independent source-code proof audit of all 398 records. Declaration-index searches preceded searches of both pinned Lean trees. The findings below use actual statements, with nine cited/read files checked against the pinned recursive tree's blob hashes. Search vocabulary included alternate mathematical names rather than only proposed declaration names.

No focal packet or integrated decomposition, and no restructuring result mentioning one of the six roadmap identities or names, was found in the acquired inputs. All directly touching entries selected from the link maps were read: six links and seven overlaps. Accepted semigroup/PDE ownership, nonlinear OT flow comparisons, distribution/Fourier boundaries, graph-gluing involutions and the weighted-basis/Peter–Weyl distinction remain relevant. The StandardDistributions overlap proposal has no accepted review and is treated as a lead. Its elementary Gaussian affine-law owner is already recognized by OT's reviewed coverage; this report does not create a second duplication finding from that lead.

The three paper routes directly parented by this area were read with their extraction context: Bakker–Tsimerman's hyperbolic-volume/gonality extension, Duke–Imamoglu–Toth's Nielsen-core extension, and Calegari–Dimitrov–Tang's punctured-plane/value-distribution extension. They explicitly continue beyond the parent quotient/degree or simply-connected conformal theory. The latter already routes disc Nevanlinna theory, complex ODE continuation and Shimizu's lemma; these are not unowned omissions. This is a boundary check, not a new full extraction of those papers. Work previously authored or reviewed by this session was used only as consumer context, never as an independent red-team target.

The apparent Fuchsian/Belyi overlap was checked against Belyi's current opening ownership table, which defers its analytic continuation programme to a successor and imports a shared compact-surface API; historical layer wording alone does not establish a new independent implementation. Fuchsian's finite-CW/Euler-characteristic dependency was compared with AlgebraicTopology's Euler-characteristic stage. The generic degree module is explicitly independent of ModularForms, while j-inputs live below the quotient application: a whole-roadmap cycle is not inferred from these two opposite module-level uses. No new missing-owner finding was established. The advanced OT proof literature was not reread in full, and this report is not a certificate that every future proof is closed.

## 1. Bernstein's endpoint hypothesis — high

Where: [Part B, definition and milestone](https://github.com/CBirkbeck/tauceti-explorer/blob/a83d9981d5340b3e612b4f821093d8f5f5ecbabd/content/tau-ceti/OneParameterSemigroups/README.md#L163). The roadmap combines smoothness on the closed half-line with an iff for **every finite** representing measure. The endpoint is the problem.

Take the probability measure

`mu = sum_(n>=1) 2^(-n) delta_(2^n)`.

Its Laplace transform `f(t)=sum 2^(-n) exp(-2^n t)` is continuous for `t>=0` and completely monotone for `t>0`. For every N,

`(1-f(t))/t >= sum_(n=1)^N 2^(-n)(1-exp(-2^n t))/t -> N` as `t downarrow 0`.

Thus no finite right derivative exists at zero. A finite measure cannot imply the roadmap's closed C-infinity predicate. Separately, `exp(-n t)` converges pointwise on the closed half-line to the indicator of zero, so unrestricted pointwise limits do not even preserve endpoint continuity.

The pin already distinguishes [the strong predicate and its within derivatives](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/CompletelyMonotone/Basic.lean#L195) from [the continuous-at-zero predicate](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/CompletelyMonotone/Basic.lean#L483). The [unique-representation iff](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/CompletelyMonotone/Bernstein/HausdorffBernsteinWidder.lean#L70) uses the latter. The [strong converse](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/CompletelyMonotone/Laplace/Representation.lean#L504) adds integrability of every moment; [RepresentsLaplace](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/CompletelyMonotone/Laplace/Representation.lean#L517) includes finiteness and equality on the half-line.

Fix: align the definition, prose milestone and displayed Lean stub with that existing finite-measure iff. Keep the strong endpoint-smooth API separately, using within derivatives. Qualify pointwise-limit closure as in the JSON. Add both counterexamples as acceptance checks. The reviewed coverage already warns about this mismatch; the remaining defect is the roadmap text, not its qualified library citation.

## 2. General-growth Yosida approximants need not be contractions — high

Where: [Part A, common construction paragraph](https://github.com/CBirkbeck/tauceti-explorer/blob/a83d9981d5340b3e612b4f821093d8f5f5ecbabd/content/tau-ceti/OneParameterSemigroups/README.md#L121). The general theorem allows `(M,omega)` growth, but the common proof paragraph assigns contractive exponentials to its unshifted approximants.

On the real Banach space R, let `A=I`, `M=1`, `omega=1`. For `lambda>1`, every resolvent-power bound holds with equality. Nevertheless

`A_lambda = lambda^2/(lambda-1) I - lambda I = lambda/(lambda-1) I`,

so `norm(exp(t A_lambda))=exp(t lambda/(lambda-1))>1` for `t>0`.

The pin's [approximation estimate](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Semigroups/Generation/HilleYosida/Approximation.lean#L105) bounds the exponent-zero case by M; its [shift theorem](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Semigroups/Generation/HilleYosida/Shift.lean#L49) handles `A-omega I`. [Engel–Nagel](https://www.math.uni-tuebingen.de/de/forschung/agfa/members/engel-nagel_one-parameter-semigroups.pdf), II.3.5 and II.3.8, printed pp.73–78, treats contraction and general growth separately, with the latter's shift/equivalent-norm argument. Those statements and proof passages were read.

Fix: keep the contraction construction under its contraction hypotheses; use the pinned general-M estimate and shift reduction for general growth. Replace the stale build-here instruction with an import of the existing construction. Test `A=I`. The accepted semigroup link review already warns against the overstrong contraction sentence; that warning has not corrected the source paragraph.

## 3. Group-negation bounds do not extend to involutive monoids — high

Where: [Part C, generic definition and basic API](https://github.com/CBirkbeck/tauceti-explorer/blob/a83d9981d5340b3e612b4f821093d8f5f5ecbabd/content/tau-ceti/OneParameterSemigroups/README.md#L200). On `M=R>=0` with identity involution, let `F(t)=exp(t)` as a complex-valued function. Then

`sum_(i,j) c_i conj(c_j) F(t_i+t_j) = |sum_i c_i exp(t_i)|^2 >= 0`.

This is exactly the generic positivity condition, and F is continuous at zero. Yet `F(t)>F(0)=1` for `t>0`. It is not uniformly continuous: `s_n=n` and `t_n=n+exp(-n)` have distance tending to zero, whereas `F(t_n)-F(s_n)` tends to 1. The example is also the zero-dimensional spatial slice of the intended BCR carrier.

The existing [general Cauchy–Schwarz statement](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/PositiveDefinite/Basic.lean#L206) keeps the two diagonal values. The [bound by F(0)](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/PositiveDefinite/Basic.lean#L213) adds `a+star(a)=0`. The [uniform-continuity theorem](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/PositiveDefinite/Continuity.lean#L250) uses a seminormed additive group with negation involution.

Fix: split the generic and group APIs with these exact hypotheses and retain independent boundedness in BCR. Use the exponential example as a negative test for monoid and graph-gluing consumers. Again, existing coverage and the accepted link review already identify the restriction; the false unqualified roadmap sentence persists.

## 4. The barycenter small-set threshold follows an obsolete draft — high

Where: [OT Layer 12, item 7](https://github.com/CBirkbeck/tauceti-explorer/blob/a83d9981d5340b3e612b4f821093d8f5f5ecbabd/content/tau-ceti/OptimalTransport/README.md#L1379). It requires nullity only for Borel sets with Hausdorff dimension **strictly less** than `n-1`.

Let U be uniform on `[-1,1]`, and let `mu=law(U,0)`, `nu=law(0,U)` in R². Each is a probability with finite second moment, and each vanishes on every Borel set of dimension less than 1: its restriction to its supporting line has zero length. Every coupling has cost

`E[|X-Y|^2]=E[U^2]+E[U^2]=2/3`,

because the axes are orthogonal. In particular, couple equal parameters or opposite parameters. The resulting midpoint laws

`rho_+=law(U/2,U/2)` and `rho_-=law(U/2,-U/2)`

are distinct. Each coupling to either endpoint has cost `1/6`. For any rho, the triangle inequality and `a²+b² >= (a+b)²/2` give

`(W2(mu,rho)^2+W2(nu,rho)^2)/2 >= W2(mu,nu)^2/4 = 1/6`.

Thus both midpoint laws minimize the equal-weight barycenter functional. The claimed uniqueness fails under the roadmap's predicate.

This is a version issue with a documented repair. The [August 17, 2010 author draft](https://www.ceremade.dauphine.fr/~carlier/AC_bary_Aug11_10.pdf), Definition 3.2 p.10, has the strict inequality. The [December 10, 2010 manuscript](https://www.ceremade.dauphine.fr/~carlier/Wasserstein-barycenters), Definition 3.2 p.10, instead says “less than or equal to d − 1”; Proposition 3.5 p.11 uses that definition for uniqueness. Both definition/proposition passages and proofs were inspected. This report does not assert a new error in the revised article.

Fix: use `dim_H(A)<=n-1` throughout this item and its dependent uniqueness/multi-map interface, with the revised citation. Keep the absolutely-continuous and bounded-density tiers separate. The counterexample should reject the old threshold. The target remains in OptimalTransport Layer 12; no new roadmap is needed.

## 5. Analytic arcs require local holomorphic charts — medium

Where: [ConformalMapping L4](https://github.com/CBirkbeck/tauceti-explorer/blob/a83d9981d5340b3e612b4f821093d8f5f5ecbabd/content/tau-ceti/ConformalMapping/README.md#L118). Möbius straightening works for lines and circles. It cannot flatten the regular real-analytic arc `gamma(t)=t+i t²` near zero: a Möbius preimage of the real axis is a generalized circle, and the parabola lies in neither a line nor a circle on any interval. Substitution into a circle equation gives a polynomial with nonzero t⁴ coefficient, precluding an interval of zeros.

The pinned [charted Schwarz-reflection theorem](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Complex/Conformal/Reflection/Arc.lean#L160) already takes holomorphic open partial homeomorphisms for source and target, symmetric coordinate domains, the one-sided continuity/holomorphy conditions and the boundary-image condition. These are local charts, not necessarily Möbius maps.

Fix: separate the line/circle Möbius case from regular analytic arcs, and import the existing chart theorem. For the parabola, `h(z)=z+i z²` has `h'(0)=1`, so its local holomorphic inverse straightens the arc. This supplies an acceptance example for the corrected route. No change to the reviewed built verdict is requested.

## Reproducibility and limits

All primary-source access for the findings was on 2026-09-24. PDF SHA-256:

| Source | SHA-256 |
| --- | --- |
| Agueh–Carlier, August draft, 28 pages | `907a406a29d6c2293ce4ef363376899aaa2235c74a39417b87d119fde2900a52` |
| Agueh–Carlier, December revision, 27 pages | `48d0c809725c7c8abdaa2bc0e698c691f8f3ed4b7221ef50f060f06479bca287` |
| Engel–Nagel, 603-page PDF | `a48ba290280c718cbf6a65a6b09b4c3c59f622102619fe5b227d446c921a56ff` |

Unsuccessful alternative downloads supply no evidence. The counterexamples above are mathematical arguments checked here, not Lean proofs. The report does not change library status, source papers, ownership maps or upstream documents; the verifier/fixer should apply only confirmed findings.

Validation: `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AREA-analysis.result.json` passes; `python3 research/blueprint/intake.py check-files` on the two deliverables reports no problems. Finding stage IDs resolve. The guarded input refresh at `c72bce3a772fed50643914ea4b4673f3d977f42c` found no changed input contents. No Lean file is requested or compiled.
