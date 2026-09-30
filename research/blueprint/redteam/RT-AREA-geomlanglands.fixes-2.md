# Geometrisation fixes, second round

Job `FIX-RT-AREA-geomlanglands~2`, issue #5160. Codex — `codex-rtOQ9t`,
30 September 2026. Input commit `bad86c8`.

## Scope and result

The four allowlisted deliverables are this report and the MotivesAndAlgebraicCycles
packet, reader and suggested Lean file. Finding /17 is applied there as a common
abstract supplier and a stage-split proposal. The other 30 enumerated findings
receive precise owning-job handoffs below, as PROTOCOL §17 requires when their
blueprint files are excluded. No campaign, data, integrated decomposition, other
packet, upstream roadmap or live graph was edited. A handoff does not mean that
the excluded consumer is already fixed.

The full original result and verifier were read, including the seven findings
not enumerated in this issue. /3 and /35 were rejected; no rejected remedy is
applied. Findings /33–39 are outside this issue's enumeration. The earlier
[round-one report](RT-AREA-geomlanglands.fixes.md) remains historical; this report
uses the verifier's corrected choices and the current accepted source owners.

## RT-AREA-geomlanglands/17 — applied to the common supplier

Accepted PAPER-ZHU-17 routes 8 and 11 already assign the general reconstruction
to an early MC.6 supplier. The route is present in the current accepted-route
selection. Nine nodes now separate the following obligations:

1. `MC.6/relative-finite-piece-reconstruction`: the representing object,
   left adjoint, tensor monad, and finite-piece module/comodule comparison.
2. `MC.6/relative-coalgebra-assembly`: the filtered coalgebra and compatible
   fibre coactions in Ind(A).
3. `MC.6/relative-bialgebra-reconstruction`: commutative multiplication from
   tensor products, and the symmetric monoidal comparison.
4. `MC.6/relative-rigid-antipode`: the extra rigidity hypothesis for inversion.
5. `MC.6/neutral-finite-subcategory-representability`: DM 2.12–2.13's P_X and
   stabilizer algebra, which cannot be omitted when specializing to Vect.
6. `MC.6/neutral-reconstruction-coalgebra`: DM 2.14–2.16 and tensor-endomorphism
   representability over every commutative scalar algebra.
7. `MC.6/neutral-tannaka-reconstruction`: DM 2.11 with the specified neutral
   fibre functor and the duality argument DM 1.13.
8. `MC.6/tannaka-finiteness-recognition`: DM 2.20, separating finite groups
   from finite-type groups and sum/subquotient generation from tensor generation.
9. `MC.6/tannaka-connectedness-recognition`: DM 2.22 in characteristic zero.

Their node prerequisites have no MC.5 ancestor. The old diagram/Nori
`tensor-automorphism-group` and `pro-algebraic-approximation` nodes now import the
common theorems, retaining their later motivic hypotheses. All 173 old nodes,
47 old source issues, old baseline credits, pending iwasawa review and independent
review history remain. The obsolete “DM.TC must be added” coverage bullet is
removed: that source was already present, and its relevant pages were freshly read.
All other coverage obligations remain; MC.6 is still partial.

The packet proposes `MC.6:abstract`, containing these nine nodes and the existing
`rigid-bialgebra-is-hopf`, and `MC.6:periods` for the other existing MC.6 nodes.
The current parent stays MC.6 under PROTOCOL §9. The proposed four abstract planets
are recorded with the split; the installed six MC.6 planets are unchanged.
GS4:integral-dual-group must import the relative construction and check its Satake
representers. GS4:rational-reductivity must import neutral representability,
reconstruction, finite type and connectedness, verifying tensor generation and
weight growth in its own application. Do not install a whole late MC.6→GS4 edge.

DM 2.23 is a direct import from upstream ReductiveGroups layer 6, after finite type,
connectedness and the characteristic-zero smoothness interface; it is not a new
MC proof or a new ReductiveGroups roadmap. Its unrestricted connected-affine form
says **pro-reductive**, not finite-type reductive. The characteristic-p extension
of semisimplicity/reductivity is not asserted. Upstream layer 1 supplies the
closed-immersion representation and group/comodule dictionary.

### Source and baseline evidence

Freshly read [FS v4](https://arxiv.org/pdf/2102.13459v4), pp.232–234 and 236–237
(SHA-256 `1f8040751d3424f59ae56651d990d7b2d5030e6b7cae58bc2fc683358dfc2027`),
and the [corrected Deligne–Milne author text](https://www.jmilne.org/math/xnotes/tc.pdf),
p.12 and pp.20–27 (SHA-256
`48f8af5249081217fc4a806414a764d9d69d66eff9092ddd8e2cf0ea078579e8`).
This was a selected-section read, not a new full-paper or published-FS-edition read.
The proof's premature Hopf label and A/H letter slips already have confirmed
records `PAPER-FARGUES-SCHOLZE-21/E108` and `/E46`; those are reused, not duplicated.

At Mathlib `082e2d3`, ordinary Beck monadicity, Ind and BimonObj exist. The
finite-group Tannaka theorem starts with a finite group; the module theorem starts
with a ring. At Tau Ceti `f790474`, `pointsFunctorIsoTensorAutFunctor` starts with a
commutative Hopf algebra. These statements were read at the pins. None is credited
as constructing a Hopf algebra from an arbitrary neutral fibre functor. The reviewed
library-coverage file has no Motives entry; no audit verdict has been fabricated.

A new implementation gap records the relative A-action/representability and
monoidal-Ind/internal-comodule adapters. FS prints reflection of F-split
coequalizers, whereas the pinned Beck interface also requires preservation. The
adapter must justify that instance from the intended convention; until then the
sufficient-hypothesis prototype explicitly adds preservation. This is not a claim
that FS has been disproved and not a hidden proof of that implication.

The Lean file adds an actual finite-sum/subquotient hull and two basic membership
examples, and names every new API/test obligation. Full reconstruction signatures
whose carriers are absent are explicitly recorded as **not stated**; there are no
invented Prop placeholders. This is a partial, unchecked prototype. No build at the
pinned pair is available, so it was not compiled and no build/cache/LSP was started.

## Excluded-owner handoffs

Each entry below is unapplied in this PR. The named owning blueprint/design jobs
must implement it in their packet, reader and suggested file, then receive their
own independent check. Where a live stage-edge change is needed, the maintainer
installs the accepted proposal; this report is not a live edge edit.

### RT-AREA-geomlanglands/1

**Owner:** GeometricSatakeAndFusion, GS2:Satake-closure and GS3:fusion.

Prove FS VI.8.1–VI.8.2 at GS2 before fusion. Replace GS3:fusion→GS2:Satake-closure with GS2:Satake-closure→GS3:fusion. Keep two-leg convolution geometry with closure; fusion consumes the resulting monoidal category and duals. Test convolution and sw* Verdier duality on flat perverse ULA objects; retain the flatness/Tor qualifications.

### RT-AREA-geomlanglands/2

**Owner:** EndoscopicTransferAndUnitaryTraceComparison ET.6a; HeckeStacksAndLocalShtukas HS2; ExcursionOperatorsAndSpectralAction ES7:GLn-comparison.

Choose verifier option (a): ET.6a owns the classical tower-diamond/Hecke-fibre comparison after HS2. HS2 imports no reverse ET.6a edge; ES7 imports ET.6a. Supply SW 24.2.5 at all levels K with transitions, GL_n(E), division-algebra and Weil actions, plus the O_E extension and Drinfeld 24.3.5 or independent duality. A single hyperspecial unacted diamond is insufficient. Preserve /22’s general-field boundary.

### RT-AREA-geomlanglands/4

**Owner:** ReductiveGroupsPartII early pinned automorphisms; LanglandsParameterStacks LP1.

Place PY02 reductivity of the identity component of fixed points, and the finite unipotent-class input, before LP1; do not route it from LP3 or late RG2.3 if that makes LP1 depend on itself. The LP1 dimension argument precedes flatness. State the cohomological dimension two and Euler characteristic zero inputs. Separate this early PY02 owner from the integral Prasad–Yu criterion in /16.

### RT-AREA-geomlanglands/5

**Owner:** LanglandsParameterStacks LP2:excursion-presentation; ExcursionOperatorsAndSpectralAction ES0.

LP2 owns FS VIII.4.1–VIII.4.2 and the VIII.3.7 relations for the enhanced stable-category target π₀End(id). ES0 specializes it to D_lis(Bun_G), supplies the Hecke data and continuity, and retains the actual operator formulas. Do not replace the enhanced centre by the ordinary centre of the homotopy category.

### RT-AREA-geomlanglands/6

**Owner:** LanglandsParameterStacks LP4; ExcursionOperatorsAndSpectralAction ES2 and ES3.

Apply only the verifier’s primary choice: ES2 owns X.1.1–X.1.3, including X.1.2, and ES3 owns X.3.1–X.3.4 and X.0.1–X.0.2. LP4 keeps VIII.5.1 representation-bundle generation; import the finite-free-group invariant colimit from LP2:integral-invariants rather than restating it. Delete LP4’s generic exact-monoidal-functor universal-property claim and correct the ES owner sentence. The contrary second alternative in the finding is not authorized.

### RT-AREA-geomlanglands/7

**Owner:** ExcursionOperatorsAndSpectralAction ES1:spectral-center, ES2, ES4, ES6 and ES7.

Add the spectral-centre supplier to ES7:parabolic, ES6:functoriality, ES6:duality, ES4 and, as the verifier adds, ES2. Supply VS5 and HS3 to ES4 for duality and local-shtuka cohomology. Keep the |π₀Z| hypothesis on the relevant centre comparison, not on all excursion/spectral constructions. Test that each consumer uses the spectral-centre map already constructed.

### RT-AREA-geomlanglands/8

**Owner:** SmoothRepresentationsOfLocalGroups SR.3b; ExcursionOperatorsAndSpectralAction ES0.

Put Vignéras’s mod-ℓ admissibility and the required Schur statement in an early SR.3b branch after SR.2, independent of SR.6 and ES. ES keeps its condensed refinement. Correct the field distinction: Qbar_ℓ is uncountable, while Fbar_ℓ is countable, so an uncountability/Dixmier argument cannot fill the mod-ℓ Schur gap. Preserve the appropriate primary-source obligation.

### RT-AREA-geomlanglands/9

**Owner:** SmoothRepresentationsOfLocalGroups SR.1; ExcursionOperatorsAndSpectralAction ES0.

SR.1 owns the ordinary abelian Λ-linear Bernstein centre via the compatible pro-p Hecke-corner system, including ℓ-adic separatedness where used. ES0 owns the enhanced π₀End(id) and the comparison to the abelian centre. Existing SR ancestry is reused; do not force the ordinary construction through a derived extension or claim that a centre map alone reconstructs the enhanced centre.

### RT-AREA-geomlanglands/10

**Owner:** ReductiveGroupsPartII early z-extensions; BunGAndNewtonStrata BG1/BG2:uniformization; EndoscopicTransferAndUnitaryTraceComparison ET.0; ES6:functoriality.

The algebraic z-extension/induced-torus exactness and π₁-surjectivity input must precede BG/ET consumers. It cannot come from a late arithmetic continuation that already imports those consumers. ES6 already owns the later functorial construction; name Kaletha, Rigid inner forms vs. isocrystals, arXiv:1502.00650, for its additional comparison. Test early group-theoretic versus late geometric uses separately.

### RT-AREA-geomlanglands/11

**Owner:** BunGAndNewtonStrata basic classes; ExcursionOperatorsAndSpectralAction ES7:parabolic.

Supply the basic b₀ with quasi-split inner form for connected centre using Kottwitz 10.4. ES7 then supplies the z-embedding, Bun fibre product, B(G)-injectivity and rational-point factorization needed to reduce to that case. A bare basic-class classification does not establish the functorial rational-point reduction.

### RT-AREA-geomlanglands/12

**Owner:** FunctionFieldArithmetic FA.2/FA.6; AdelicAlgebraicGroups AA.0; ES7:function-field-automorphic.

Import the generic adele/rational-points and compactness theory; add the missing AA.0 input. FA.2 is already reached transitively. Keep D-specific orders, compactness modulo centre and trace/globalization arguments in ES7, with centre and measure normalizations. Do not construct a second general adelic theory inside the automorphic application.

### RT-AREA-geomlanglands/13

**Owner:** VStackSheavesAndLisseCategories VS5; HeckeStacksAndLocalShtukas HS1.

Add VS5→HS1 and use the lisse, rather than merely torsion D_et, BZ/ULA results. HS1 preserves ULA/perfect pro-p invariants and the IX.2.2 duality comparison for all ℓ≠p; the later spectral good-prime conditions do not belong in this Hecke theorem. Coordinate with /29.

### RT-AREA-geomlanglands/14

**Owner:** GeometricSatakeAndFusion GS0:loop-geometry, GS0:Witt-geometry, GS0:Schubert-smoothness.

Move integral Div_𝒴 bounded properness and its dependent closedness into Witt geometry, retaining generic Div_X/Div_Y geometry in the loop branch. Add Witt geometry to the integral Schubert-smoothness input. Test generic and Witt special fibres plus nonsplit descent; do not assume every ramified reductive G/E has a reductive O_E model.

### RT-AREA-geomlanglands/15

**Owner:** SchemeAndStackFoundations SF.5; GeometricSatakeAndFusion GS0:Witt-geometry.

SF.5 owns the general Keel positivity and Stein-factorization inputs; Witt geometry owns the Bhatt–Scholze application. Consolidate the duplicate BS17 G817/G815 source items, and route the G819 Stein input to its general owner. SF.0 is already transitive. Preserve the positivity hypotheses and fibre conditions in the application.

### RT-AREA-geomlanglands/16

**Owner:** ReductiveGroupsPartII RG2.3; GeometricSatakeAndFusion GS4:integral-dual-group.

Reuse the accepted KPZ26 route to RG2.3 for Prasad–Yu Corollary 1.3. State the alternative residue hypotheses precisely: characteristic different from 2, or absence of an odd special-orthogonal normal subgroup in the relevant source group; the target is an affine group scheme of finite type, not necessarily reductive. GS4 applies it after the adjoint reduction gives a simply connected dual at ℓ=2. Do not create a second general criterion in GS or move /4’s PY02 theorem behind LP1.

### RT-AREA-geomlanglands/18

**Owner:** AdicCoefficientsAndComparisons L1/L3; GeometricSatakeAndFusion GS1, GS2:correspondences, GS3:fusion.

Supply L1 and L3 to GS1’s perfection comparison. Replace EDC.4 by EDC.5 where perversity/recollement is intended. Remove VS3→GS2:correspondences and VS3→GS3:fusion unless an actual D_lis use is provided: FS Chapter VI is torsion D_et. HS1 retains its independent VS3 input. See /28 for the loop-geometry comparison.

### RT-AREA-geomlanglands/19

**Owner:** HeckeStacksAndLocalShtukas HS1; LanglandsParameterStacks LP3; ReductiveGroupsIntegralRepresentationsPartII.

HS1 owns the extension from finite-projective Satake representations to the perfect-complex Hecke family in IX.2; GS4 exports finite-projective Satake and points to that later extension. Import the split-dual-group integral highest-weight/generation statements for every ℓ≠p, without VIII.5 good-prime restrictions. Use the already accepted common Part II in /24; LP3 supplies its relevant interface, not a second proof. LP4→HS1 is optional if its Perf-generation theorem is used.

### RT-AREA-geomlanglands/20

**Owner:** HeckeStacksAndLocalShtukas HS2/HS3; DiamondsAndVStacks D6; GS0:Schubert-smoothness.

HS2 constructs the minuscule partially proper smooth rigid-analytic tower from SW 23.3.3, 19.4.2 and 10.4.2, with finite-étale levels and the étale period map. SW 24.1.2 is the nonemptiness proposition, not the whole rigidification proof; nonemptiness is not needed to construct that structure. HS3 must separately request or own the higher-dimensional Huber/diamond RΓ_c comparison; a curves-only H3 theorem is insufficient.

### RT-AREA-geomlanglands/21

**Owner:** HeckeStacksAndLocalShtukas HS0/HS1; VStackSheavesAndLisseCategories VS2.

Re-parent the Demazure ULA-generator/preservation node from HS0 to HS1, or leave its pure geometric half in HS0 and move the sheaf-theoretic half. HS1 already reaches GS1, VS2 and VS3. Request FS VII.4.3 from VS2 at stage level: no named VII.4.3 node exists in the reviewed input, so do not fabricate one.

### RT-AREA-geomlanglands/22

**Owner:** HeckeStacksAndLocalShtukas HS2; ES7:equal-characteristic; GlobalShtukasAndFunctionFieldLanglands GS.7.

Keep SW 23.1.1 as the Q_p integral-model definition. Define general-E local shtukas via HS2’s Hecke fibre over HS0; an O_E analogue must be marked as an extension beyond SW’s written definition. Equal characteristic uses the appropriate F_q[[t]] geometry, never W(k)[1/p]. Retain a general-E coverage obligation until that construction and its comparison are supplied.

### RT-AREA-geomlanglands/23

**Owner:** LanglandsParameterStacks LP2:excursion-presentation, LP2:semisimple-characters and LP2:integral-invariants; SmoothRepresentationsOfLocalGroups SR.6.

Move the unconditional affine invariant quotient, its invariant-map universal property, transition maps and closed-orbit/semisimple-point theorem into excursion-presentation. Semisimple-characters and SR.6 import it there. Keep good-prime invariant isomorphism, higher cohomology vanishing and base change in integral-invariants. Import the already accepted BHKT-19/LAFFORGUE-18 field-level GIT routes; rejected /3 creates no new owner. Never add the reverse integral-invariants→excursion-presentation cycle.

### RT-AREA-geomlanglands/24

**Owner:** DESIGN-ReductiveGroupsIntegralRepresentationsPartII; LP3; PotentialAutomorphyInfrastructure PA.1.

Use the existing accepted KISIN-PAPPAS-18 and KISIN-PAPPAS-ZHOU-26 Part II as sole owner of integral induced/Weyl/dual-Weyl modules, Kempf vanishing, Donkin’s criterion, Donkin–Mathieu tensor stability and Koppinen/Donkin filtration of O(G). Import into LP3 and PA.1. LP3 retains cocycle-scheme applications; PA.1 retains its GL_n weight/linkage bounds. Do not invent RG2.6 or another Part II.

### RT-AREA-geomlanglands/25

**Owner:** LanglandsParameterStacks LP2:semisimple-characters; GlobalShtukasAndFunctionFieldLanglands GS.5.

Implement the accepted LAFFORGUE-18 route 3 once at LP2: reconstruction from compatible excursion characters for profinite/condensed Γ and the stated possibly disconnected reductive target, with continuity separately proved and the correct characteristic-zero/positive-characteristic invariant theory. Add LP2:semisimple-characters→GS.5. GS.5 retains the shtuka-specific operator relations and global consequences under RS-22; excursion-presentation→GS.5 is optional.

### RT-AREA-geomlanglands/26

**Owner:** LanglandsParameterStacks LP1; SmoothRepresentationsOfLocalGroups SR.6.

LP1 constructs the finite-wild cocycle scheme over Z[1/p], identifying the DHKM and FS discretizations, and exports its Z_ℓ base changes. SR.6 imports it through the existing LP1 edge and retains DHKM finiteness/Hecke applications. Do not construct the same scheme twice. Resolve current RS-21 wording against this verified common-owner boundary rather than relying on the old report’s date-sensitive assertion that RS-21 is unreviewed.

### RT-AREA-geomlanglands/27

**Owner:** SchemeAndStackFoundations SF.1; LanglandsParameterStacks LP1.

Add SF.1→LP1 for effective fpqc/fppf descent and the quotient-stack interface. LP1 specializes them to the parameter stack. The verifier rejects the proposed broader transfer of derived QCoh/Perf to S.1 or E5: scheme-perfectness does not own all stacky Perf, and that move is outside this fix.

### RT-AREA-geomlanglands/28

**Owner:** AdicCoefficientsAndComparisons L0/L1/L3–L6; VStackSheavesAndLisseCategories VS3; GeometricSatakeAndFusion GS0/GS1.

Remove the unjustified L1/L3/L4/L5/L6→VS3 gates while retaining L0 adic coefficients. Route the actual ECD §27 uses to L1→GS0:loop-geometry and L3→GS1, with L1→GS1 as in /18. L4–L6 retain their genuine scheme-side EDC consumers. Do not force generic D_lis and its downstream users to wait on alterations absent from FS VII.6.

### RT-AREA-geomlanglands/29

**Owner:** VStackSheavesAndLisseCategories VS4/VS5; HeckeStacksAndLocalShtukas HS1.

VS5 adds VII.7.6 BZ duality, VII.7.7 Verdier exchange, Definition VII.7.8 lisse ULA and VII.7.9–VII.7.10 for discrete Z_ℓ-algebras, including Q_ℓ. Keep torsion D_et nodes distinct. VII.7.2’s left adjoint belongs to VS4, feeding VS5. Add VS5→HS1. FS explicitly omits the lisse analogue of V.6.2; do not invent a sourced lisse reflexivity node.

### RT-AREA-geomlanglands/30

**Owner:** VStackSheavesAndLisseCategories VS2/VS4.

Take the verifier’s alternative: VS2 keeps generic solid VII.2.1–VII.2.6 and VII.3; VS4 owns divisor-specific partial support Definition VII.2.9/Theorem VII.2.10 and VII.2.7–VII.2.8 (the latter may instead sit in HS1). VS4 already reaches VS0/VS1. Do not add VS1→VS2 and thereby put Fargues–Fontaine/Div¹ geometry in front of generic solid modules used by Habiro.

### RT-AREA-geomlanglands/31

**Owner:** VectorBundlesAndIsocrystals VB2:classification; VStackSheavesAndLisseCategories VS1; FarguesFontaineDiamonds F2/F3.

VB2 supplies FF18 8.6.1: finite étale O_X-algebras on the arithmetic curve correspond to finite étale E-algebras; its arithmetic fundamental group is G_E, while the geometric curve is simply connected. VS1 assembles SW 16.3.2’s cover comparison from this and F2/F3, in the general-E/equal-characteristic scope required by FS. VB2 already reaches VS1. Exclude neighbouring product-π₁ statements SW 16.3.3/16.3.6 and the ClassFieldTheory layer 9 link explicitly declined by the verifier.

### RT-AREA-geomlanglands/32

**Owner:** BunGAndNewtonStrata BG0/BG1; IgusaVarietiesAndTorsionConcentration IG.0; EndoscopicTransferAndUnitaryTraceComparison ET.5.

Split both BG0 and BG1 into early algebraic B(G)/G-isocrystal/J_b/Newton/Kottwitz data and later analytic torsor/bundle comparison. The early B(G,{μ}) has κ(b)=μ^♮ and ν_b≤μ^◇, as already routed by Kisin, van Hoften and GLX26. Add the early algebraic interfaces to IG.0 and ET.5; IG.0 retains its PEL-specific map/admissibility and μ⁻¹ convention. Do not import the late analytic BG1 chain or identify a nonbasic Bun stratum with [*/J_b].

## Remaining finding boundaries

/3 is rejected: accepted BHKT-19, LAFFORGUE-18 and Fintzen routes already supply
the invariant-theory owner. /35 is rejected: ES0 already owns the enhanced centre,
and its map to the centre of the homotopy category need not be bijective.

The unenumerated /33–39 are not silently added to this fix. Their verified routes
are: /33 update ES7's “unproved” wording while retaining the LRS route; /34 correct
the IX.5.1/IX.5.2 citation and use ES7:parabolic for IX.7.1; /36 use DM.7's
order-parametric elliptic-sheaf chain formalism without mandating an unused split
Morita comparison; /37 the dedicated HeckeStacks errata job records both IX.6.2
misprints after version checking; /38 BG3 owns IV.1.23–IV.1.24 with smooth-Artin
input; /39 call Viehmann's closure theorem a known, unused theorem rather than a
conjecture. /35 remains rejected. No new target is added for /39.

## Validation

- Blueprint checker: 182 nodes, 446 API items, 252 planned unit tests, zero errors
  and zero packet warnings. The global declaration-index-unavailable notice means
  baseline references were checked manually at the pins as described above.
- Preservation check: all 173 original nodes and the prior review/history,
  source issues, baseline credits, 21 gaps and 14 requests retained; only the two
  named application nodes were augmented. The reader contains every MC.6 node's
  statement, hypotheses, proof, prerequisites, API, uses and tests. Every new
  API/test name appears in the prototype inventory.
- The new nine-node prerequisite closure is acyclic and contains no MC.5 input.
  Fresh atlas assembly has 2,891 vertices and 8,258 edges and is acyclic. Adding
  the proposed abstract supplier after upstream layer 1, its three consumers
  (late MC.6 and the two GS4 branches), and the direct upstream layer 6 rational
  import is also acyclic. This is a prospective check, not installation.
- Intake: all four allowlisted files pass ownership/format checks. Source-version
  accounting passes. Lean was not compiled.

Independent `REV-FIX-RT-AREA-geomlanglands~2` must check the new source statements,
neutral representability step, characteristic/coefficient boundaries, split and
excluded-owner handoffs. The existing separate pending iwasawa fix review remains
untouched. No independent acceptance or mathematical formalisation is claimed.
