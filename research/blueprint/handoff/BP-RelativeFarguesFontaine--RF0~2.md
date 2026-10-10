# Handoff: BP-RelativeFarguesFontaine--RF0~2

Agent: Codex. Session: `codex-3N8CHn`. Issue: [#7005](https://github.com/CBirkbeck/tauceti-explorer/issues/7005).
Branch: `codex-3N8CHn-rf0-revision`. Revision completed 10 October 2026.
The claim was confirmed by the bot in [comment 6094259034](https://github.com/CBirkbeck/tauceti-explorer/issues/7005#issuecomment-6094259034).

## Result

The revision resolves the nineteen signature/test objections in
[REV-RelativeFarguesFontaine--RF0](../reviews/REV-RelativeFarguesFontaine--RF0.md)
and synchronizes the packet, definitive reader and suggested file. The packet
is `complete`: the target-level revision pass is complete, with mathematical
supplier gaps still recorded. It is ready for a new independent review, not
accepted or implemented. All 73 node IDs, the exact eight-stage scope, the
historical packet review and the historical source-finding review objects
are retained. Every implementation status remains `unchecked`.

The actual packet contains **73 nodes: 3 definitions, 28 constructions,
36 theorems and 6 comparisons; 137 API items; 97 proposed unit tests;
25 planets; 31 baseline declarations; 9 gaps; 19 requests; 17 sources;
69 source-item routes; and 14 source findings**. These counts are taken from
the JSON, rather than copied from the previous review report's count table.
No node, API item, test or planet was removed in this revision. Five baseline
citations were added. The signature/test gap introduced by the review was
removed after repair; the nine mathematical/ownership gaps were retained.

The accepted RS-20 result and review
`independent-review-REV-FIX-RT-RS-20~3` still govern the roadmap, which extends
AdicSpaces as **Foundations of adic spaces, Part II: relative Fargues–Fontaine
curves and period geometry**. RF4 and the VectorBundlesAndIsocrystals stages
remain separate owners.

| Stage in RelativeFarguesFontaine | Status | Remaining work |
|---|---|---|
| RF0 | planned | Lubin–Tate formal-module and logarithm input |
| RF0:annuli | planned | All-E period-norm extension |
| RF0:integral-Y | planned | Integral coefficient tensor, integral perfectoid criterion, LT input |
| RF1 | planned | LT tower and outward global Proj/Div1 interfaces |
| RF2 | planned | Aggregate targets are represented; child-stage gaps remain |
| RF2:integral-divisors | planned | Early degree inverse and ordinary bundle correction on thickenings |
| RF2:untilts | planned | Strict completion base change, marked geometric comparisons and outward moduli interfaces |
| RF3 | planned | LT input and outward global section/Proj comparison |

No scoped stage is closed. The deliverables are
[the packet](../packets/RelativeFarguesFontaine--RF0.json),
[the reader](../readmes/RelativeFarguesFontaine--RF0.md),
[the suggested file](../suggested/RelativeFarguesFontaine--RF0.lean), and this note.

## Nineteen repaired contracts

The stable node names below identify each repaired entry. Every listed node
also has a `suggestedForm` note distinguishing its expressible Lean fragment
from its full mathematical target. PROTOCOL section 13 omissions name the
missing geometry; they do not assert a theorem about an unrelated arbitrary
object or introduce a property field equal to the conclusion.

1. **ramified-witt-universal-property:** separate the all-E strict lift from
   the arbitrary-algebra mixed-characteristic coordinate functor. Its input
   is a residue algebra of a complete DVR; the API supplies a uniformizer,
   finite residue cardinality and bijective q-power. The universal target is
   complete and π-regular, with a coefficient-compatible residue marking.
   Equal characteristic uses the power-series carrier. The Qp comparison is
   from the strict lift over Mathlib's `PadicInt p` to `WittVector p R`, with
   perfect characteristic-p residue input and Teichmüller compatibility.
2. **q-twisted-witt-functor:** carry the actual polynomial quotient congruence
   Q mod π = X^q through the ring carrier, algebra instance and functor.
3. **q-teichmuller-lift:** use that same Q and congruence in the functional
   equation; the limiting construction has the canonical π-adic topology and
   inverse q-power roots of the specified perfect residue algebra.
4. **lubin-tate-teichmuller-lift:** evaluate the same existing commutative
   `FormalGroup` coefficient series in source and target, with convergence
   hypotheses. Scalar compatibility refers to the formal module's scalar
   series. The LT condition, formal OE-action and maximal-ideal domain still
   require the named LocalFields Part II vocabulary. The F2 multiplicative
   law test evaluates its actual polynomial; it no longer uses unrelated laws.
5. **integral-rational-chart-rings:** compare the original proper two-generator
   adic ring with its constructed chart. The original ring has no topologically
   nilpotent unit; the chart's localized image of [ϖ] is such a unit. Tests use
   the actual denominator and special-fibre quotient.
6. **root-extension-chart-model:** use one integral algebra over W, with
   identified zeroth coefficients and compatible root streams. The reduction
   is the variable-only perfection after killing π and [ϖ], not the perfection
   of all coefficients. The π=0 tests localize the actual denominator first.
7. **classical-points-of-integral-period-disc:** compute supports from the
   specified theta or disc evaluation. The zero and small nonzero point kernels
   are distinct, and the Gauss valuation's support differs from these kernels.
8. **gauss-disc-fibre:** replace an unrestricted function inequality by an
   actual convergent power series and its Gauss coefficient supremum. Require
   a nonzero series, 0<ρ<1, coefficient decay, points of norm at most ρ and
   distance less than ρ. The completed-residue embedding is the omitted
   geometric input; the strict analytic difference estimate is explicit.
9. **div-d-moduli-v-sheaf:** construct the symmetric orbit presheaf, its
   sheafification and the section map. The repeated-leg test compares the
   nontrivial swap stabilizer with the subsingleton endomorphisms of the actual
   discrete sheaf section, so it distinguishes the forbidden action stack.
10. **relative-degree-criterion:** use the actual product ideal. The prototype
    is the forward geometric-fibre DVR calculation: a quotient by a product of
    d parameters has length d, including d=0 and repeated parameters. It no
    longer asserts an inverse for arbitrary leg-to-ideal assignments. The full
    early family factorization remains the explicit nonroutine gap.
11. **div1-moduli-and-properness:** construct the integer Frobenius orbit
    setoid, quotient presheaf and sheafification. Tests identify different
    Frobenius markings in the same quotient. Base change uses the actual
    inverse-image functor and compatible coefficient/Frobenius identification;
    a two-point swap model checks an actual orbit quotient.
12. **lubin-tate-divisor-section:** construct the convergent bilateral sum
    with powers of π and the shifted compatible roots. Continuous Frobenius
    fixes π and shifts the roots, giving the stated eigenvalue. The simple-zero
    fragment uses the actual translated logarithm with nonzero linear term;
    its square has quotient length two. Identifying the logarithm with the LT
    section is part of the existing supplier gap, not an arbitrary eigenvector
    hypothesis.
13. **witt-seminorm-lambda-mu:** use the bounded coefficient and Witt spectra
    with pointwise evaluation topologies and perfect characteristic-p input.
    The Witt bound on p excludes the trivial norm. The normalized primitive
    quotient test uses the constructed λ/μ and detects their nonidentity.
14. **relative-extended-robba-rings:** specify the coefficient growth subring
    and the interval/infinity/plus constructors with their actual prime, norm
    and plus data. Tests evaluate their Teichmüller maps and singleton norm and
    compare actual plus membership with the infinity ring.
15. **relative-period-presheaves:** retain the coefficient functor, plus
    subrings, norms, prime, both radii and twelve-variant index. Affinoid
    evaluation and restriction are those of this construction. The plus test
    excludes a constructed element from its actual affinoid map's range.
16. **berkovich-period-deformation:** the spectrum is on the actual integral
    period ring, dominated by its coefficient Gauss norm. The homotopy's
    endpoints and preserved coefficient norm use the constructed λ/μ. The
    fixed-point test uses a Gauss point; the disconnected product test evaluates
    (1,0) to separate components throughout the homotopy. The annular union and
    radius-circle geometry remain explicitly omitted from the carrier fragment.
17. **global-period-sheaves-and-etale-functoriality:** global affine values use
    the same period/radius data. The split test compares F(S⊔S) with F(S)⊔F(S)
    for the actual curve functor. Perfectoid-domain and geometric étale
    vocabulary are expressly omitted from the prototype, with the full target
    retained in the document.
18. **stein-exhaustion-and-higher-acyclicity:** construct compatible sequences
    and their ring projections. State bijectivity of the restriction map for a
    sheaf on a nested exhaustion covering Y. Separately state surjectivity of
    1−shift for complete normed section rings with continuous dense restrictions,
    supplying the lim¹ input. The Fréchet comparison and higher cohomology
    vocabulary remain explicit mathematical conclusions outside this fragment.
19. **local-generation-on-period-annuli:** the module is finite projective
    over the actual interval ring. Fibre and rational-neighbourhood modules
    are tensor base changes along their specified algebra maps; both use the
    same generators. The rational neighbourhood contains the selected bounded
    spectral point and satisfies the denominator/generator conditions.

## Review corrections preserved and synchronized

The seven coordinate APIs and functor laws for arbitrary Witt algebras remain;
they do not use ghost injectivity on torsion. The constructed root ratio remains.
LocalFields Layer 4 supplies inertia, separately from Layer 2 unramified
Frobenius. Corrected KLII Theorem 3.3.13 is a direct P3 input for interval
perfectoidness and spectral surjectivity. D6 pre-adic Spd and D3 ordinary module
descent are extension requests, not claims about their current suppliers.

The finite-level ordinary-disc maximum-modulus argument precedes passage to
boundary suprema and approximation; no general perfected spectral supremum is
asserted attained. Boundary Cech input precedes the LT section, without the old
back-edge. Completion completeness retains finite generation, and the geometric
DVR fragment retains a regular principal ideal with field residue. The Proj
chart uses the existing positive-degree homogeneous localization theorem, while
the analytic chart has a separate ring map. Both Div1 coefficient bases and the
whole-single-classical-fibre assertion remain. Repeated legs, characteristic-p
integral legs, Cartier filtration lines and nonadditive Teichmüller maps remain.

## Sources and evidence

This revision downloaded twelve public PDF copies whose SHA-256 values match
the packet's existing records: both Fargues–Fontaine author copies, both
Geometrization copies, KL foundations and KLII, Kedlaya's Witt and Ainf papers,
Berkeley, BMS, Fargues' divisor paper and Scholze's rigid-analytic period paper.
The repaired contracts and source-finding passages were checked in these
versions. Fresh reads are dated 10 October in the corresponding source records;
older retained supporting reads retain their original dates. No source hash
was changed. All source excerpts were removed. Statements, proof descriptions
and source findings are in our own words, with result/section and printed-page
locators; no source passage or source file is committed.

Important locator corrections include KL Definition 3.3.2/Lemma 3.3.3 p.76;
the splitting and eigenrestriction arguments pp.117–121; Theorem 5.3.9/Lemma
5.3.14 pp.123–125; deformation §5.4 pp.126–127; finite-étale proofs pp.128–132;
Definition 8.3.4 p.166 and Lemma 8.7.15/Remark 8.7.16 p.180. Kedlaya's Witt
deformation is Definition 7.5/Theorem 7.8, pp.33–34. Berkeley's whole-analytic
inputs are Proposition 13.1.1/Remark 13.1.2/Theorem 13.1.3 pp.108–109, and its
ordinary descent input is Proposition 19.5.3 pp.180–181. BMS Lemma 3.21 is p.27;
Scholze's Definition 6.1/Lemma 6.3/Corollary 6.4 are pp.35–36.

Two historical review statements needed correction in the current findings:

- **E5** concerns KL Lemmas 5.2.8 and 5.2.10, pp.118–119, rather than Lemma
  5.2.6/Remark 5.2.7. The current correction distinguishes the positive and
  negative pieces and their signs. No corresponding correction was found in
  KLII Appendix A; its historical review reason's Appendix-A attribution is
  retained as history, not adopted as evidence.
- **E6** concerns Corollary 5.2.12, p.120, rather than Lemma 5.2.10. Its
  eigenweight n and iteration index m are distinguished, with the accumulating
  mn exponent; KLII Appendix A p.190 supplies the correction.

E7 now points to §3.6, Lemma 3.6.3/Definition 3.6.4 p.88 and Lemma 5.5.5
pp.130–131. All fourteen finding IDs and historical verdicts remain: thirteen
confirmed, with E3 rejected. E3's Gauss-disc condition already excludes the
boundary. E11–E14 retain the residual initialization, product exponent,
base-ring-subscript and scalar-ring corrections. Findings remain scoped to the
named author/preprint copies, not unavailable published versions.

The prior HK direct-download HTTP406 limitation remains: this run did not
revalidate that PDF's binary hash. Its supporting indexed §7 read is retained.
The full relevant Astérisque 466/406 proofs and Astérisque 371 text were not
available; publisher samples are not evidence for those proofs. No cleared
private book was required or used. These access limitations do not conceal an
unchecked passage behind a newly asserted source receipt.

## Libraries and existing ownership

Required pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit and the
supplier statements were consulted. The five added baseline declarations are
`FormalGroup`, `MvPowerSeries.eval₂`, `Module.length`,
`CategoryTheory.presheafToSheaf`, and `PadicInt`. Their statements and enclosing
hypotheses were read at the Mathlib pin. In particular, `eval₂` extends the
dense polynomial evaluation; its ring-homomorphism form has continuity,
completeness and compatible linear-topology hypotheses. The LT analytic helper
uses an explicitly summable coefficient series. Sheafification requires
`HasWeakSheafify`; the stronger left-exact interface is separate.

Current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and TauCetiRoadmap
`0a56d1b5303c26887a4042db834f46d9079ac593` were also checked read-only. Tau Ceti
already has `Huber/WittVector` and `FarguesFontaine/Y`, `Window`, and `Quotient`:
p-typical Huber/Tate topology, spaY and Frobenius, all-rank rational radius
windows, their compact wandering cover, and the open topological quotient
spaX with compactness and T0. The packet and reader require reuse of those
results. Their remaining new payload is all-E coefficient/integral geometry,
relative norm completions and quotient structure-sheaf enhancements. Those
four modules are absent at the Tau pin, so the pinned suggested file cannot
import them.

The nine post-snapshot upstream roadmaps and the relevant completed documents
were screened for overlap. AdicSpaces Layers 3–6 own rational localization,
sheaf foundations, absolute p-typical intervals and quotient; LocalFields Layers
2/4 own unramified Frobenius/inertia. Existing targets are comparison imports.
The packet's upstream notes record these checks; stale audit rows do not
authorize duplicating newer library work.

## Remaining interfaces

The nine gaps have their exact consumers and details in the packet:

1. Integral completed coefficients when OE→W is continuous but not an adic map.
2. The integral perfectoid criterion and all root-chart hypotheses at P1.
3. Transport of KL's analytic estimates through the genuine all-E coefficient
   construction, including equal characteristic.
4. Early all-E family factorization/degree inverse independent of subsequent
   Picard and Banach–Colmez theory.
5. Norm-controlled ordinary bundle correction on every divisor thickening.
6. The LT formal OE-module, scalar action, tower, tilt and logarithm comparison.
7. Strict finite-quotient comparison and the completion inverse-limit argument.
8. Marked tilt/PreTilt/theta/Cartier and selected-E-factor geometric comparisons.
9. Global Proj and Div1 properties assigned to their outward VB owners.

There are **19 recorded requests**, not newly filed external issues. Incoming
interfaces go to R0/R3, P1/P2/P3, D3/D6, AdicSpaces Layers 5/6 and LocalFields
Layers 2/4. Outward interfaces go to VB1, VB2 ampleness/classification, VB3,
RF4, LocalFields' Cohen extension and DerivedDeRham DD.0. The existing
LocalFields Part II LT extension proposal remains; no fictional callable
supplier node is introduced. Outward global-generation, properness and bundle
classification results must not be made early prerequisites.

## Validation and next action

- `python3 scripts/check_blueprint.py` on the packet: **0 errors, 0 warnings**.
- Embedded findings checked by `source_issues.check_issues` and
  `check_errata.versions_checked`: **pass**.
- `research/blueprint/intake.py check-files` on the four deliverables:
  **four files, zero problems**. `git diff --check`: **clean**.
- All node declarations, 137 APIs and 97 named test examples are present in the
  suggested file; the API/test statements and all node IDs are synchronized
  with the reader. Scope, IDs and historical review objects are unchanged.
- `lean-check` on the final suggested file: **exit 0**, **353 warnings for
  declarations using `sorry`**, **no other warnings or errors**. Memory was
  checked; only one compilation ran at a time; no build, update, cache fetch
  or language server was started, and no compilation remains running.
- The shared build's Mathlib checkout is exactly the required pin. Its Tau
  root is not a Git checkout: all **14 transitively imported Tau source files**
  were compared byte for byte with the required Tau pin, with no mismatches.
  This is an import-source compatibility receipt, not compilation from an
  exact pinned Tau checkout.

The next worker should perform the independent review of these repaired
contracts, especially the explicitly limited degree, LT, deformation and Stein
fragments. Mathematical follow-ups then refine the nine named gaps with their
supplier owners while preserving the dependency direction. There is no partial
editing checkpoint to resume and no second job claimed by this session.
