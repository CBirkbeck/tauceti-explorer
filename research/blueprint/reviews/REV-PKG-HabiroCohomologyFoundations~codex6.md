# Independent review of q-Hodge filtrations and Habiro cohomology

Review job: `REV-PKG-HabiroCohomologyFoundations~codex6`, issue #11452. Reviewer: Codex, session `codex-QXXPkr`, 2026-10-20. Verdict: **needs_changes** after the corrections in this submission. The remaining defects concern the family ownership and the required supplier order; resolving them requires changes to neighboring packages or their prerequisite contracts, which this review cannot edit. This is a finished review, not a checkpoint.

The reviewed baseline is atlas commit `18faffeca6a15be8927e5d95fc45ab4436724d3c`, including FIX-PKG-HabiroCohomologyFoundations~adv5. Its self-assessment is replaced by this independent verdict. I did not author that fix, the package, or the earlier reviews. The issue's old `~codex.md` review path is absent on this baseline; I read the available `~codex4.md` review, the adv4/adv5 dispositions, the accepted Part II review and its handoff, and checked their claims against the current files. The issue template's Lawrence–Venkatesh title is stale: the object reviewed is the q-Hodge package named by its paths.

## Findings that remain

Arrows in this report run **supplier → consumer**. Acyclicity and having the particular requested topological order are different tests.

### R1. The requested five-package order is not a topological order of the current inputs

The issue requires Part I → HabiroRings → HabiroCyclotomicCompletions → RefinedTraceMethods → Part II. There is no direct Part I supplier reference to HR's derived theory, HC, RT or Part II after adv5. That direct-edge check passes. However, deleting those references has not made the requested order valid:

- `packages/HabiroRings/README.md` §2.2 imports HC.1's factorial polynomials and cofinality; §2.3 imports HC.1's cyclotomic completion and cofinality. §2.4 expressly imports HC §2.3's polynomial/Laurent comparison and HC §5.1's ordinary module completion. Other numbered subsections with explicit HC supplier clauses are HR §§2.9–2.10, 2.12–2.14, 3.1, 5.2, 5.5, 5.7, 5.9, 6.3, 7.2 and 7.4. These are **HC → HR**, contrary to the requested **HR → HC** order.
- `roadmaps/QWittVectors.json`, QW.2, explicitly imports cyclotomic comaximality from `HabiroCyclotomicCompletions:HC.4`, both in its description and in `requires`. QW.3 requires QW.2, and QW.4 requires QW.3. Part I imports QW.2 in §0.2 and QW.3/QW.4 in §0.3 and throughout the later build. Thus **HC.4 → QW.2 → QW.3/QW.4 → Part I** remains. Renaming the direct supplier to QW does not eliminate this transitive prerequisite.
- HC's own scope says that its ordinary completion uses no derived Habiro input and that HR §2.4 consumes its ordinary results. I found no reciprocal HC construction input from HR that could justify reversing that edge.

The direct construction edges among these five packages are HC→HR, HR→RT, I→RT, HR→II, I→II and RT→II. The HR ordinary-model comparison can additionally consume I's new étale export, but HR's current construction does not yet cite it. This displayed direct graph is acyclic; it is **not** evidence of a cycle. Adding the QW path still permits HC before I and HR. It prevents certifying the particular order requested by the issue. A complete family audit would also need to account for all the other suppliers, rather than just these five names.

I removed Part I's false assertion that the requested family order had already been implemented, and made its scope acknowledge QW's cyclotomic prerequisites. Repairing the actual order needs an authorized ownership change in HC/QW/HR, with all consumers updated, or a maintainer revision of the order. Merely changing Part I's prose cannot do it. No general target has been removed to simulate the requested order.

### R2. The new Part I owners still duplicate targets owned by HabiroRings

Adv5 introduced substantive constructions in Part I §§0.1–0.3 but left the corresponding HR targets in place:

| New Part I owner | Existing HR target still constructing the same interface | Required integration |
| --- | --- | --- |
| §0.1, complete subcategory, reflector, factorial/principal limits, completed tensor and detection | HR §§2.1–2.3, 2.5–2.8 | Retarget the common cohomological construction to one owner; preserve HR's genuinely additional solid/spectral results and ordinary comparison. |
| §0.2, finite closed cyclotomic descent, prime-chain reduction, mapping spaces and coherent reconstruction | HR §§3.6–3.11 | Import the shared enhanced descent instead of constructing a second version; retain any additional ordinary arithmetic calculations. |
| §0.3, marked complete étale lifts of qW, ghost gluing, Frobenius transitions and static limit | HR §§4.1–4.11 and its use in §5.1 | Reconcile the general deformation supplier and specialized relative coefficient construction with Part I's owner, including polynomial/Laurent scalar restriction. |

For example, HR §2.3 still proves the reflector from its own localization resolution, §3.10 still proves the same enhanced prime-chain descent, and §§4.6–4.11 still construct the marked lifts and transitions. These are not just citations or ordinary presentations. Part I's use of A[q] rather than HR's integral Laurent coefficient convention does not make two independent theories necessary: HR §2.1 itself claims the polynomial/Laurent and scalar-restriction comparisons, and Part I's statement includes the integral case.

The former assertion that HR already consumes Part I §§0.1–0.3 was therefore also corrected. It can consume the new contracts, but the donor has not been retargeted. WORKERS/PROTOCOL require shared mathematics to have one owner. Removing these constructions from Part I would restore its prohibited upward derived-HR dependency; rewriting HR is outside this issue's deliverables. This is the second concrete reason that the package is not ready for its upstream draft PR.

## Corrections made here

### Étale pairs before and after filtration completion

The old §4.21 identified the animated complex qdR with R[[h]] for every étale R/A and consequently made its uncompleted filtration h-adic and static. This fails even for A=ℚ and R=ℚ(i). Rational polynomial animation gives dR=ℚ and qdR=ℚ[[h]], whereas the smooth complex is qΩ=R[[h]]. The source distinguishes these objects in QH Remark 3.6, pp.22–23, and Paragraph A.14, p.76; Proposition 3.47(a), p.48, identifies the relevant filtration completion.

Section 4.21 now states the completed filtration F̂^j=h^max(j,0)R[[h]] and the actual uncompleted pair

```text
F^j = qdR_{R/A} ×^h_{R[[h]]} h^max(j,0)R[[h]].
```

For the example above and j>0, the kernel and cokernel of ℚ[[h]]⊕h^jR[[h]]→R[[h]] give

```text
H^0(F^j) = h^j ℚ[[h]],
H^1(F^j) = (R/ℚ)[[h]] / h^j.
```

In particular H¹(F¹)≠0. This is a negative control against replacing the animated pair by its completion. The Habiro–Hodge object, its partial coefficient lifts and its q-Hodge modification still have the stated static étale values. I added `HabiroHodge.etalePair` and `etalePair_completion`, propagated the distinction to §4.28 and its export API, and corrected the dimension-zero discussion in §5.7. No carrier for this enhanced pullback is available at the pins, so it remains a README target rather than an artificial Lean encoding.

The natural marked E∞ comparison H(R,F)≃E(R/A), all partial completions, reduction to qW_m(R/A), Frobenius transitions, and the canonical h-map remain. No spherical lift, factor-6 inversion, Frobenius lift on R itself, finite-projectivity restriction or trace theorem was added to the general étale domain.

### Ownership prose and locators

The scope and downstream paragraphs now describe the cohomological interfaces without certifying an unimplemented family order or donor retarget. The coefficient-scaling construction in §3.31 continues to use complete descent and QW inputs, without rootwise Taylor calculus.

Two locator repairs were made: §0.1 now calls QH B.3 a **Lemma**, followed by Corollary B.4 (p.78); §8.18 now gives the BS Lemma 18.3 proof on **pp.122–123**, ending before the bibliography on p.124. The same latter locator in §8.19 was already correct. The older HQ.8 packet still records p.124 in its E806 discussion; packets are outside this review's edit scope.

## Trace relocation and the exported boundary

I checked the current Part I, Part II and RT files, rather than treating the earlier disposition as proof.

| Former Part I material | Current owner and check |
| --- | --- |
| Old §§6.1–6.3, spherical inputs, functorial trace pairs and their descent | Part II §§1.1–1.3; RT §§6.1, 6.9–6.13 and 8.8 supply the actual trace constructions/comparisons. |
| Old §6.4, higher-power spherical lifts and trace/canonical quotient pairs | Part II §§2.1–2.3; the spectral ranges and lift data stay there, separately from Part I's algebraic theorem. |
| Old §6.5, number-field genuine fixed points, cyclotomic/Taylor maps | Part II §§4.1–4.2, using RT §6.14 and HR's ordinary number-field identification. |
| Old §8.1 framed trace clause | Part II §3.3 consumes RT §6.10's full framed theorem, q-PD diagonal and Čech proof, prime-two comparison and pair coherences. |
| Old §9.15 trace/Nygaard comparison clause | Imported downstream through Part II's prismatic/trace supplier contract: PrismaticCohomologyPartIII §7.0 and AInfCohomology §AI.7.2, with the relative BS Proposition 15.7 input. Its trace theorem is supplied, not newly proved in II. Part I §8.15 retains only the independently constructed algebraic/prismatic Nygaard interface. |

Part I's present Layer 6 is the explicitly open analytic comparison problem, not the old trace layer. Present §8.1 specifies comparison-square data; §8.15 imports PR.3/AI.1 and its own HQ.4, with no trace supplier. Its canonical θ and Witt equality targets §§8.18–8.19 remain independent problems; no trace comparison proves them.

RT and Part II occur in Part I as downstream consumers, including §4.28, §5.26 and the final consumer discussion. Neither occurs in any of the 151 subsection supplier sentences. Neither HR-derived material nor HC occurs there. The complete subsection inventory below makes this check reproducible. The opening contracts also contain no such construction input; the only analytic supplier, HS.3, serves the explicitly open problem, not the algebraic build.

The generality distinction survives: Part I §5.19/§5.26 allows algebraic regular powers α≥2 at every prime, including p=2; Part II/RT separately require the source's stronger E₁/E₂ spherical-lift ranges. The canonical smooth domain retains all dimensions with the specified small primes inverted, rather than replacing it by a single framed application. Étale exports impose no unnecessary prime exclusions.

## Sources checked

Public versions read: [QH v2](https://arxiv.org/pdf/2510.04782v2), [QW v5](https://arxiv.org/pdf/2410.23078v5), [TC v4](https://arxiv.org/pdf/2410.23115v4), [Scholze v1](https://arxiv.org/pdf/1606.01796v1), and [BS v4](https://arxiv.org/pdf/1905.08229v4). Page numbers below are the documents' printed pages. No restricted book was needed, and no source passages are copied into this submission.

The seeded sample of 15 citation-bearing numbered subsections used seed 11452. Multiple locators in a selected subsection were read where they define its interface; the list records the principal ones. These are statement/location checks, not claims to have formalized their proofs.

| Subsection sampled | Passage checked | Result |
| --- | --- | --- |
| 1.12 | QH Construction A.12, p.75 | Global arithmetic pullback; uniform denominators precede the product rationalization. |
| 1.11 | QH A.10, p.74 | The coordinate-free and framed rational maps agree. |
| 1.23 | Scholze Definition 7.3, p.15, and §8, p.16 | Framed connection convention agrees; integer lattice action is the roadmap's additional construction, not a theorem attributed to this source. |
| 1.7 | QH A.7, p.72; Lemma 3.29, p.38; Proposition 4.27, p.65 | Reverse envelope expansion and completed rational/base-change interfaces have the stated scope. |
| 4.21 | QH Corollary 3.13, p.27; 2.7/2.9/2.10, pp.15–17 | Marked coefficient comparison is supported; the uncompleted-pair claim needed the correction above, using 3.6/3.47/A.14. |
| 4.2 | QH Lemma 3.3, p.22 | Exponent-one free δ quotient obstructs a section on all algebras. |
| 4.10 | QH Proposition 3.36, p.42 | Invert p with the prescribed completion and filtration. |
| 2.7 | QH Definition 3.2(c), p.21; Proposition 3.47(a), p.48 | Combined Hodge/h-adic filtration is on the specified rational/complete object. |
| 2.9 | QH Remark 1.8, p.5; Lemma A.4, p.70; Definition 3.2, pp.20–21 | Local rational corner is separate from rationalizing the global object; the proof input is A.4. |
| 5.26 | TC 3.3/3.5/3.7–3.8, pp.30–32; 3.15–3.17, pp.38–40; QH 4.21–4.24, pp.62–64; A.14, p.76 | Algebraic and spectral power ranges differ; finite-coefficient rational corner and real overlap must be retained. |
| 4.11 | QH Proposition 3.37, p.42 | Lower cyclotomic completion and twisting are retained. |
| 3.4 | QW Proposition 3.12(a)/Definition 3.13, p.40; Remark 3.14, p.41; Lemma 3.16, p.42 | Initial q-V-system, differential envelope, and base-change hypotheses match. |
| 3.18 | QH Theorem 3.11, p.25; Propositions 3.30–3.31, p.40; Remark 3.52, p.50 | Animation retains shifts and any chosen multiplicative enhancement. |
| 5.6 | QH Theorem 4.9 and its proof, pp.56–57 | Fully faithful truncation inclusions and pushout, not an equivalence of unrestricted categories. |
| 7.2 | QH Remark 1.13, p.7; Definition 3.2, pp.20–21 | q-Hodge differential and chosen-pair interface agree. |

I additionally read QH Appendix B pp.77–79 for the new completion layer, §2.2 pp.15–19 for the étale coefficient construction, §3.1 pp.20–23 and §3.7 pp.48–50 for completion and multiplicativity, the relevant rational-envelope arguments in Appendix A pp.70–76, and BS §18 pp.122–123 for the changed locator. Existing packet source-issue warnings were checked against the package: signs in the p=2 Γ₁ calculation, completed versus uncompleted rational corners, shifts of animated forms, exponent-one failure, conditional operadic structure, and fixed maps in the canonical specialization targets are still stated explicitly. The public text's proof of QH Proposition 2.12 uses an overstrong cyclotomic irreducibility claim: Φ₃ splits modulo 7. The package's coefficient construction uses the full finite étale coefficient algebra and marked lift, not a single cyclotomic field assumption. There was no unresolved locator labelled unverified in the current package; named missing mathematical constructions are recorded as targets, not silently supplied by citations.

## Adversarial mathematics and generality audit

The following covers all 151 numbered subsections, including definitions, identities and conventions. An interval includes every intervening subsection. I checked the actual statement and supplier domain in each interval, using the witnesses below and the definition Checks; this is not a proof of every prospective theorem. Unless the last column records a change, the relevant hypothesis/negative control was already present and is retained.

| Statements | Instances and computations tried | Result or change |
| --- | --- | --- |
| 0.1 | M=0; B/(q−1); ℚ(q); unit-ideal completion | Derived quotient of B/(h) has two degrees; ℚ(q) has zero cyclotomic reductions but is not complete. Detection stays inside the complete category. |
| 0.2 | m=1, m=2 over ℚ/ℤ/𝔽₂; m=12 at p=2 | At 2 the first two cyclotomic supports coincide; (1,0) fails the integral overlap. No duplicate copies along a prime chain. |
| 0.3 | R=A, A×A, ℤ[∛2,1/6] at p=5; ℚ[y]/y² | The m=1 lift is R[[h]], not qW₁=R. Non-étale dual-number deformations disprove uniqueness without étaleness; no global Frobenius on arbitrary R. |
| 1.1–1.4 | S=A; q=1; p=2; smooth versus animated input | q-PD ideal h and prism ideal [p]_q have different quotients. Rational h-completion and local p-completion remain specified. |
| 1.5–1.8 | n=0,1,2,3; p=2 | Empty denominator is 1; values 1,1,64,2¹⁴3²⁶ agree with Lean. Inverse powers appear only in the rational envelope; bounds are uniform before the prime product. |
| 1.9–1.11 | Zero endomorphism; one-variable operator; commuting versus arbitrary twists | Koszul twist comparison requires the displayed commutations; no equivalence is inferred for unrelated automorphisms. Framed/coordinate-free maps are fixed. |
| 1.12–1.16 | A itself, affine line, dimension zero; q=1; two frame changes | Global gluing retains the rational corner, h-completion and comparison cocycle. It does not identify animated and smooth objects. |
| 1.17–1.21 | Identity affine cover, disjoint cover, triple overlaps | PD realization and enhanced Čech descent retain coherent comparisons and the specified ordinary crystalline input; an equalizer of cohomology rings is insufficient. |
| 1.22 | x and x², q=1 and q=2 | D_q(x²)=(1+q)x; twisted Leibniz gives (1+q)x rather than 2x. Flat q-connection and ordinary connection specialize as stated. |
| 1.23 | a=0, rank=0, q=1, exponent −1; a=(2,−1), m=(−1,3) | Multipliers are 1,1,1,q⁻¹ and q⁻⁵ respectively. Unit q is necessary for negative exponents. |
| 1.24–1.28 | Zero/unit module, trivial lattice action, Laurent rank one | Semilinear cocycles and coherent homotopy-fixed points are required; ordinary fixed vectors do not define derived quotient QCoh. Ordinary vector bundles are imported. |
| 2.1–2.3 | Constant filtration; β=0; t=1; m=0; q=2, βt=3 at m=2 | βt=q^m−1 has degree zero; quotient maps F^{i−1}→F^i. βt=2 fails at m=2. m=0 identity is algebraically allowed in Lean but excluded as a cyclotomic reduction. |
| 2.4–2.6 | Polynomial algebra, ℚ[x±¹], ℚ(i) | Animation can differ from the smooth Hodge-complete complex. Base-change statement includes its completion; no étale-invariance shortcut for uncompleted dR. |
| 2.7–2.11 | Form degree 0/1; Hodge step 0/1; ℚ versus ℤ_p then 1/p | Combined filtration uses h^max(i−j,0). Completing ℚ at p gives zero, unlike ℤ_p[1/p]. Generic Lη is imported, not rebuilt. |
| 3.1–3.3 | m=1 and p; F₁,V₁; p=2 | Actual FV relations and the stated torsion-free variant; ordinary Witt restriction cannot be added to the q-system. |
| 3.4–3.7 | Initial system in degree zero; m=1; torsion coefficient | Initiality is in the full q-V/FV category. Ghost injectivity has the divisibility-prime torsion assumptions. No arbitrary FV family substitutes for the universal object. |
| 3.8–3.10 | Identity étale map, product algebra, p-primary/mixed m | Degree-zero étale lifting, differential, coefficient twists and prime-to-p factors are retained. |
| 3.11–3.14 | Smooth line, q=1, m=p, p=2 | Smooth framed cohomology and p-completion use their fixed comparisons. No functorial unrestricted q-Hodge section is inferred. |
| 3.15–3.17 | m=1; two divisor chains; p-complete and rational corners | Twisted objects glue along the natural fracture maps; derived reduction, not reduction of cohomology, recovers the q-Witt object. |
| 3.18–3.19 | Degree 0 and 1 forms, smooth line | The animated form has its required cohomological shift; shifted associated graded is not shifted twice. |
| 3.20–3.23 | Nygaard steps 0/1, relative Frobenius, p=2 | Frobenius-divisibility pullback and divided Frobenius retain their twist and filtration direction. No trace filtration defines Nygaard. |
| 3.24–3.29 | n=0, m=1, fixed-prime exponent 0/1, p inverted | Kernel/cofiber/conjugate sequences remain derived. Combined filtration after inversion is not an integral formula. |
| 3.30–3.31 | Module versus Eₙ input; rank-zero torus; scaling q⁻¹ | Multiplicativity is transported only when supplied. Semilinear scaling is on the whole enhanced cyclotomic diagram. Full uncompleted framed Habiro comparison remains an explicit target, not a proved consequence of one completion. |
| 4.1–4.3 | Constant pair for the base; exponent-one free δ quotient; p=2 | Four conditions include separate rational corners and their coherences. Failed exponent-one witness prevents a section on all algebras. |
| 4.4–4.7 | Zero filtration; coordinate line; filtration step/form degree 0/1 | Colimit precedes h-completion; conjugate and q-Witt graded shifts have the stated orientation. No ordinary cohomology quotient replaces a cofiber. |
| 4.8–4.11 | Line and empty frame; p=2; α=0/1; smaller cyclotomic point | hD_q is the q-Hodge differential. Recursive twists and lower-point completion remain explicit. |
| 4.12–4.16 | m=1; 1|2|6 and 1|3|6; [p]_q versus q^p−1 | Full divisor coherence is retained. Adjoining divided Nygaard by the two different denominators has different outcomes, including zero for the latter. |
| 4.17–4.20 | Coefficient unit, zero object, one q-Witt reduction | Habiro limit, tensor and filtration identifications are coherent; an ordinary scalar ring is not the entire complete module category. |
| 4.21–4.24 | Étale ℚ(i)/ℚ; non-étale ℤ[x]; reduction of cohomology versus derived reduction | Fixed the false uncompleted étale h-adic statement. E∞/derived commutative upgrades retain chosen enhancement assumptions; Bockstein is attached to the derived reduction. |
| 4.25–4.28 | Identity and finite-projective scalar extension; arbitrary flat extension; étale non-Frobenius example | Finite projectivity, and conditional relative-Frobenius/Nygaard/filtered-décalage inputs, are retained. Updated the exported completed/uncompleted distinction. No arbitrary flat exchange with infinite limits. |
| 5.1–5.7 | Bounds 0 and 1; empty frame; ℚ(i)/ℚ; dimension-one line | Truncation, left adjoint and fixed counit are used. Completeness alone does not make the zero map an equivalence. Fixed the dimension-zero completed-filtration wording. |
| 5.8–5.12 | d=0,1,2; ℤ[x]⊗ℤ[x]=ℤ[x,y] | No prime inversion for d≤1; 2 needed at d=2. Domain is a partial operad, not closed under every tensor product. |
| 5.13–5.14 | Affine scheme, disjoint affine cover, smooth proper case | Scheme descent uses enhanced affine coefficients. Smooth proper perfectness retains its missing criterion/proof as a named target, not an imported theorem. |
| 5.15–5.18 | Identity quotient, quasi-lci amplitude endpoints, naive filtration | Staticity and saturation are proved before the ordinary preimage is used. Injective reduction does not imply surjective reduction. |
| 5.19–5.21 | x, x²; p=2; Γ₁=x²−hδ(x) | α=1 fails; α≥2 algebraic theorem includes p=2 without spherical evenness bounds. Division by [2]_q and the displayed p/h congruences use the stated integral estimates. |
| 5.22–5.25 | Identity algebra, tensor products, arithmetic étale ring | Canonical sections retain their distinct smooth/quasi-regular domains and specified uniqueness arguments. No unconditional K₃ arithmetic-module identification. |
| 5.26 | m=1,4,12,36; p=2,α=2; PD class y^[2]−8 | Powerful m=4 remains algebraically allowed. m=12 fails the exponent condition. PD torsion prevents replacing a local factor by ℤ_p, and the overlap is not just ℚ_p. The rational ℚ[[h]] corner is retained. |
| 6.1–6.3 | Spec O_F[1/Δ], affine plane, unbounded product family | Open comparison remains open; analytic localization is not conservative. The sequence 1/(n+1)! is not in the rationalization of ∏ℤ. Solid tensor claim retains its bound/continuity obligation. |
| 7.1–7.2 | Constants; q=0,1,2; characteristic 2 | D_q constants vanish, D₁ is derivative, hD_q specializes to zero; H⁰(M/^Lh) and H⁰(M)/h differ on the line. |
| 8.1–8.3 | Zero/identity square, p=2, absent perfectoid choice | Square record does not construct its corners. Distinct completion ideals, input intersections, twists and coefficient maps are retained. |
| 8.4–8.8 | Base algebra; framed line; p=2; ξ versus φ(ξ) | Local q-PD/prismatic and A_inf maps use the correct Frobenius linearization and derived base change. Lη_h and Lη_[p]_q are different interfaces. |
| 8.9–8.12 | Incompatible filtration, m=1/p, derived h-reduction of line | No gluing from unrelated filtrations; ordinary de Rham–Witt comparison stays a map on its domain. The torsion correction at q=1 is retained. |
| 8.13–8.17 | Composites of fixed comparison maps; zero square; prime decomposition p=2,3,5 | Commutation is a target for specified maps, not any equivalent corners. Φ₂=2+(X−1), Φ₃=3X+(X−1)²; at p=5 take u=X³−X²+X with u(1)=1. |
| 8.18–8.19 | Fontaine θ and Witt maps on Teichmüller generators; Frobenius-twisted coefficients | Actual canonical maps, normalization, and enhanced base change remain obligations; no arbitrary equivalence or trace comparison supplies equality. Corrected §8.18's proof locator. |

There are 53 definition Check blocks, each with at least three bullets (range 3–8 after this edit). I checked that the tests distinguish wrong choices such as an ordinary quotient, arbitrary flat limit exchange, a global Frobenius on R, ordinary Leibniz, the wrong torus exponent, independent characteristic-two branches, a constant finite-coefficient rational corner omitted from gluing, or static uncompleted étale filtration. The five light Lean definitions have two proved examples each; two further examples witness the cyclotomic comparison convention. No admitted examples were added.

## Native signatures, library and duplicate checks

I read the pinned statements used by the native signatures, including `AddMonoidAlgebra.lift`, geometric-sum and cyclotomic identities, `Algebra.Etale`/formal étaleness, and the existing ordinary adic, divided-power and derived-category interfaces. The generality comparison below records twelve declarations, exceeding the ten-signature minimum.

| Lean declaration | README contract and boundary checked |
| --- | --- |
| `qDiff` | §§1.2/7.2: arbitrary commutative A; coefficientwise geometric sum, exponent zero vanishes; no division. |
| `jackson_calculus` | Same domain; exact divided-difference identity, twisted product order, q=1 derivative. |
| `uniformDenominator` | §1.8: product over primes ≤n; empty product and exponent formula agree. |
| `uniformDenominator_pos` | Nonzero natural scalar only; no claim that this theorem constructs an envelope map. |
| `torusScaleHom` | §1.23: arbitrary commutative B, q a unit, Fin d integer lattice; actual monoid-algebra map. |
| `torusScaleHom_action` | Zero weight and addition/composition order agree with the monomial formula. |
| `torusScale_exists_unique` | Coefficient-linear algebra automorphism on the existing Laurent carrier, fixed on every lattice monomial; no fake quotient-stack carrier. |
| `coefficientRelation` | §2.2: variable order q,β,t; βt−(q^m−1), weights 0,1,−1. |
| `coefficientRelation_eval` | All natural m algebraically; README's cyclotomic interpretation requires m≥1. No hidden nonzero denominator. |
| `qHodgeDiff` | §§4.8/7.2: h times D_q, not D_q itself. |
| `qHodge_polynomial` | Arbitrary A, n=0 included; q=1 gives zero, not the ordinary derivative. |
| `cyclotomic_prime_decomposition` | §8.2: integral polynomial identity with `Fact p.Prime`; u(1)=1, valid also p=2. |

Heavy definitions are absent from Lean and identified as README targets in its module comment; no sorry-bodied carrier, artificial theorem hypothesis, `True` placeholder, admitted data, auxiliary development chain or weakened headline substitute was found. README and Lean preserve the general native coefficient rings; the enhanced non-native generality is stated separately, rather than encoded with unavailable carriers.

I read the reviewed HQ.1–HQ.8 library coverage audit. For form/density I read the snapshot UniversalCovers and HodgeStructures READMEs and current upstream ClassFieldTheory/LocalGaloisGroups suggested-file models. I also screened the current TauCetiRoadmap tree and Completed tree, not only the atlas snapshot, at commit `0d144d044dacebca17b654695b6f1ad58f159b27`, and current TauCeti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches used the mathematical objects/operators and their variants: derived completion and enhanced filtrations, q-derivatives, q-Witt/FV systems, Nygaard, q-Hodge, q-PD, Habiro, semilinear torus actions and equivariant vector bundles.

The close existing interfaces were read: ordinary Rees grading, DGAInfinity and StablePeriodicCurved derived categorical constructions, AlgebraicVectorBundles L0B/L2B, and TauCeti's `LinearAlgebra/Basis/DiagonalTorus/Basic.lean` character/action formulas. Ordinary Rees grading and derived categories do not provide the enhanced filtered Habiro construction; the vector-bundle and torus-character inputs are already deferred in Scope. The retained torus target adds the algebra automorphisms and coherent semilinear descent. No additional duplicate with the current upstream/library was identified and no target was removed on that ground. R2 is instead a duplicate **within the atlas family**, and remains unresolved.

## Validation and target conservation

`lean-check` of the unchanged Suggested.lean exited 0 at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and TauCeti `f790474821cf4256814db967cb154e7af3d0c369`: exactly seven warnings, all declaration-uses-sorry warnings; no errors or other warnings. The file has 226 lines, five real-bodied definitions, seven theorem targets and twelve proved examples. No new build, cache download or language server was started.

All 151 numbered subsections remain, in the same order. All baseline API targets and all 53 Check blocks remain. Bullets beginning with a code-quoted API name followed by a colon number 309 before this edit and 311 afterward. Two API bullets and one discriminating Check bullet were added. No theorem signature, original target, hypothesis range or native example was deleted or weakened. Metadata remains the fitting one-line `topic = "math.AG"`. The README is 255,281 bytes: it exceeds the old issue-template 200 KB note, but PACKAGE_REVIEW's binding shape rule explicitly overrides older size notes and requires retaining the full targets, hypotheses and Checks. I applied that later rule rather than cutting mathematical content. The accepted packet is historical input: its trace ownership and some supplier labels predate the authorized relocation, so literal restoration would recreate the defect. Trace conservation is recorded explicitly above rather than treating stale packet ownership as current instructions.

Final mechanical check results are recorded in the handoff. They include the five unchanged Part I packet validators, the no-sorry-data check, changed-file intake, JSON/metadata parsing, target/API conservation and whitespace checks. These checks cannot discharge R1/R2 or prove prospective mathematics.

## Complete Part I supplier inventory

The opening exact contracts import QW.1–QW.4; PR.0–PR.3/PR.6; DD.0–DD.4; AI.1 and AI.3–AI.5; CR.2/CR.4; CP.1/CP.6; PerfectoidQuotients Q3; E0/E1/E2/E5; and HS.3 only for the open analytic problem. Scope additionally defers ordinary native Mathlib/TauCeti APIs and the AlgebraicVectorBundles dictionary. QW.5 and QW.6:framings designate interfaces owned by this package rather than upward construction inputs. HQ.4 is constructed before the HQ.3 targets that use it. No HR-derived, HC, RT or II contract is hidden in these introductory imports.

Below is every numbered subsection's actual supplier sentence, including internal edges. HQ.k denotes this roadmap's named layer interface, not another package. This inventories **direct** suppliers; the QW→HC transitive path in R1 remains relevant even though HC is absent from these sentences.

| Consumer subsection | Suppliers stated in the final package |
| --- | --- |
| 0.1 | DerivedDeRhamCohomology DD.1, EnhancedDerivedSheaves E0 and E5:presentability. |
| 0.2 | §0.1, DerivedDeRhamCohomology DD.1, EnhancedDerivedSheaves E0 and E5:presentability, QWittVectors QW.2. |
| 0.3 | §§0.1–0.2, QWittVectors QW.1/QW.3/QW.4, PrismaticCohomology PR.0, DerivedDeRhamCohomology DD.1 and EnhancedDerivedSheaves E0. |
| 1.1 | PrismaticCohomology PR.6, QWittVectors QW.1, Mathlib geom_sum_mul, Mathlib Polynomial.eval_geom_sum, Mathlib Polynomial.cyclotomic_prime, Mathlib Polynomial.cyclotomic_prime_pow_eq_geom_sum, Mathlib Polynomial.eval_one_cyclotomic_prime, Mathlib Polynomial.prod_cyclotomic_eq_geom_sum. |
| 1.2 | HQ.1, AInfCohomology AI.1, Mathlib Algebra.Etale, Mathlib KaehlerDifferential. |
| 1.3 | HQ.1, PrismaticCohomology PR.6, EnhancedDerivedSheaves E5:animation, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.3, DerivedDeRhamCohomology DD.4, CrystallineCohomology CR.2. |
| 1.4 | HQ.1, PrismaticCohomology PR.6, PrismaticCohomology PR.0, CrystallineCohomology CR.0, DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.4, DerivedDeRhamCohomology DD.1. |
| 1.5 | HQ.1, PrismaticCohomology PR.6, PrismaticCohomology PR.0. |
| 1.6 | HQ.1, PrismaticCohomology PR.6, CrystallineCohomology CR.0. |
| 1.7 | HQ.1, CrystallineCohomology CR.0, PrismaticCohomology PR.6. |
| 1.8 | HQ.1, CrystallineCohomology CR.0, DerivedDeRhamCohomology DD.1. |
| 1.9 | AInfCohomology AI.1. |
| 1.10 | HQ.1, PrismaticCohomology PR.6, PrismaticCohomology PR.0, CrystallineCohomology CR.0. |
| 1.11 | HQ.1, PrismaticCohomology PR.6, CrystallineCohomology CR.2. |
| 1.12 | HQ.1, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.4, EnhancedDerivedSheaves E5. |
| 1.13 | HQ.1, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.1. |
| 1.14 | HQ.1, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.1. |
| 1.15 | HQ.1, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.1. |
| 1.16 | HQ.1. |
| 1.17 | CrystallineCohomology CR.0, CrystallineCohomology CR.2, EnhancedDerivedSheaves E5. |
| 1.18 | HQ.1, EnhancedDerivedSheaves E5, PrismaticCohomology PR.6, CrystallineCohomology CR.2. |
| 1.19 | HQ.1, QWittVectors QW.1, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2. |
| 1.20 | HQ.1, EnhancedDerivedSheaves E0. |
| 1.21 | HQ.1, EnhancedDerivedSheaves E2, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2. |
| 1.22 | HQ.1, Mathlib Module.Projective. |
| 1.23 | Mathlib AddMonoidAlgebra, Mathlib AlgEquiv, HQ.1. |
| 1.24 | HQ.1, Mathlib LinearEquiv. |
| 1.25 | HQ.1. |
| 1.26 | the lattice action of §1.23, EnhancedDerivedSheaves E5:presentability and EnhancedDerivedSheaves E0/E1 coherent module-category limits. |
| 1.27 | the coherent action limit of §1.26, EnhancedDerivedSheaves E0/E1 affine modules and prestack right Kan extension, and EnhancedDerivedSheaves E5:presentability. |
| 1.28 | the quotient comparison of §1.27, EnhancedDerivedSheaves E0/E1, and AlgebraicVectorBundles L0B's affine finite-projective dictionary, with the specified lattice equivariance added here. |
| 2.1 | EnhancedDerivedSheaves E1, DerivedDeRhamCohomology DD.1. |
| 2.2 | HQ.2. |
| 2.3 | HQ.2. |
| 2.4 | HQ.1, EnhancedDerivedSheaves E5:animation, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2, QWittVectors QW.1. |
| 2.5 | HQ.2, HQ.1, DerivedDeRhamCohomology DD.2. |
| 2.6 | HQ.2, HQ.1, EnhancedDerivedSheaves E5:animation, DerivedDeRhamCohomology DD.2. |
| 2.7 | DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.1, HQ.2. |
| 2.8 | HQ.2, HQ.1, DerivedDeRhamCohomology DD.1. |
| 2.9 | HQ.2, HQ.1, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2. |
| 2.10 | HQ.2, HQ.1. |
| 2.11 | AInfCohomology AI.1, PrismaticCohomology PR.3, PrismaticCohomology PR.6, HQ.2, HQ.1. |
| 3.1 | QWittVectors QW.3/QW.4, QWittVectors QW.1. |
| 3.2 | HQ.4. |
| 3.3 | QWittVectors QW.3/QW.4, HQ.4, CrystallineCohomology CR.4. |
| 3.4 | HQ.4, QWittVectors QW.3/QW.4, DerivedDeRhamCohomology DD.2. |
| 3.5 | HQ.4, QWittVectors QW.3/QW.4. |
| 3.6 | HQ.4, CrystallineCohomology CR.4. |
| 3.7 | HQ.4, QWittVectors QW.3/QW.4. |
| 3.8 | Mathlib Algebra.Etale, DerivedDeRhamCohomology DD.2. |
| 3.9 | HQ.4, QWittVectors QW.3/QW.4. |
| 3.10 | HQ.4, QWittVectors QW.3/QW.4. |
| 3.11 | HQ.4, HQ.1, PrismaticCohomology PR.0, DerivedDeRhamCohomology DD.4. |
| 3.12 | HQ.4, DerivedDeRhamCohomology DD.4. |
| 3.13 | HQ.4, PrismaticCohomology PR.0, DerivedDeRhamCohomology DD.4. |
| 3.14 | HQ.4, QWittVectors QW.3/QW.4, EnhancedDerivedSheaves E5:animation, PrismaticCohomology PR.0. |
| 3.15 | HQ.1, HQ.2, §0.2, EnhancedDerivedSheaves E5:animation, PrismaticCohomology PR.6, PrismaticCohomology PR.3, AInfCohomology AI.1. |
| 3.16 | HQ.4, §0.2, §0.1. |
| 3.17 | HQ.4. |
| 3.18 | HQ.4, EnhancedDerivedSheaves E5:animation, EnhancedDerivedSheaves E5, DerivedDeRhamCohomology DD.2. |
| 3.19 | HQ.4, DerivedDeRhamCohomology DD.2. |
| 3.20 | HQ.4, EnhancedDerivedSheaves E5:animation. |
| 3.21 | HQ.4. |
| 3.22 | HQ.4, PrismaticCohomology PR.6, PrismaticCohomology PR.3, AInfCohomology AI.1. |
| 3.23 | HQ.4. |
| 3.24 | HQ.4. |
| 3.25 | HQ.4, DerivedDeRhamCohomology DD.2. |
| 3.26 | HQ.4, DerivedDeRhamCohomology DD.2, PrismaticCohomology PR.2. |
| 3.27 | HQ.4, HQ.2, PrismaticCohomology PR.3, PrismaticCohomology PR.2. |
| 3.28 | HQ.4, PrismaticCohomology PR.3, PerfectoidQuotients Q3. |
| 3.29 | HQ.4, HQ.2, HQ.1, PrismaticCohomology PR.3. |
| 3.30 | HQ.4, EnhancedDerivedSheaves E5. |
| 3.31 | §§0.2–0.3, QWittVectors QW.1, HQ.1 and AInfCohomology AI.1. |
| 4.1 | HQ.2, DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.1, HQ.1. |
| 4.2 | HQ.3, EnhancedDerivedSheaves E5:animation. |
| 4.3 | HQ.3, HQ.2, PrismaticCohomology PR.0, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.2. |
| 4.4 | HQ.3, HQ.2, DerivedDeRhamCohomology DD.2. |
| 4.5 | HQ.3, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2. |
| 4.6 | HQ.3, HQ.2. |
| 4.7 | HQ.2. |
| 4.8 | HQ.3, HQ.4, HQ.1 and QWittVectors QW.1. The completed framed construction uses no rootwise Taylor comparison; its separate uncompleted comparison is the target of §3.31. |
| 4.9 | HQ.3, HQ.4, HQ.2. |
| 4.10 | HQ.3, HQ.4. |
| 4.11 | HQ.3, HQ.4. |
| 4.12 | HQ.3, HQ.4. |
| 4.13 | HQ.3, HQ.4, HQ.2. |
| 4.14 | HQ.3. |
| 4.15 | HQ.4, HQ.3, PrismaticCohomology PR.3. |
| 4.16 | HQ.3. |
| 4.17 | HQ.3, §0.1. |
| 4.18 | HQ.3, HQ.4, DerivedDeRhamCohomology DD.2, §0.1. |
| 4.19 | HQ.3, §0.1. |
| 4.20 | HQ.3, HQ.4, HQ.2. |
| 4.21 | §§0.1–0.3, HQ.2, HQ.3, HQ.4, QWittVectors QW.3/QW.4 and EnhancedDerivedSheaves E5. |
| 4.22 | HQ.2, HQ.3, AInfCohomology AI.1, DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.1. |
| 4.23 | HQ.3, HQ.4, HQ.1, EnhancedDerivedSheaves E5. |
| 4.24 | HQ.3, HQ.4. |
| 4.25 | Mathlib Module.Finite, Mathlib Module.Projective, HQ.3, HQ.2, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2, Mathlib CategoryTheory.preservesColimitIso. |
| 4.26 | HQ.3, HQ.4, DerivedDeRhamCohomology DD.1, PrismaticCohomology PR.3, AInfCohomology AI.1. |
| 4.27 | HQ.3, HQ.4, §0.1, DerivedDeRhamCohomology DD.1, Mathlib CategoryTheory.Limits.limit.post, Mathlib CategoryTheory.Limits.limMap, Mathlib CategoryTheory.Limits.limMap_π, Mathlib CategoryTheory.Limits.limit.post_π, Mathlib CategoryTheory.Limits.isIso_limMap, Mathlib CategoryTheory.preservesLimitIso. |
| 4.28 | Layer 0, HQ.2, HQ.3, HQ.4, DerivedDeRhamCohomology DD.1, DerivedDeRhamCohomology DD.2. |
| 5.1 | HQ.2, EnhancedDerivedSheaves E1, EnhancedDerivedSheaves E5:abstract. |
| 5.2 | HQ.5, HQ.1, HQ.2, DerivedDeRhamCohomology DD.2, Mathlib Algebra.Smooth. |
| 5.3 | HQ.5, HQ.3, HQ.1, HQ.2, DerivedDeRhamCohomology DD.2. |
| 5.4 | HQ.5, HQ.3, HQ.2. |
| 5.5 | HQ.5, HQ.1, PrismaticCohomology PR.6, EnhancedDerivedSheaves E5:presentability, HQ.2. |
| 5.6 | EnhancedDerivedSheaves E0, Mathlib Algebra.Smooth. |
| 5.7 | HQ.5, HQ.3. |
| 5.8 | HQ.5, HQ.3, Mathlib Algebra.Smooth. |
| 5.9 | HQ.5, EnhancedDerivedSheaves E5:abstract, Mathlib Algebra.Smooth. |
| 5.10 | HQ.5, DerivedDeRhamCohomology DD.2, EnhancedDerivedSheaves E5:abstract. |
| 5.11 | HQ.5, DerivedDeRhamCohomology DD.2, EnhancedDerivedSheaves E5:abstract. |
| 5.12 | HQ.5, EnhancedDerivedSheaves E5:abstract. |
| 5.13 | HQ.5, HQ.3, HQ.4, §0.1. |
| 5.14 | HQ.5, §0.1, HQ.4. |
| 5.15 | HQ.2, QWittVectors QW.1, PrismaticCohomology PR.0, DerivedDeRhamCohomology DD.0, Mathlib RingTheory.Sequence.IsRegular, Mathlib Algebra.Etale. |
| 5.16 | HQ.5, HQ.2, HQ.1, DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.3, PrismaticCohomology PR.3, PrismaticCohomology PR.6. |
| 5.17 | HQ.5, HQ.3, HQ.1, HQ.2, DerivedDeRhamCohomology DD.2. |
| 5.18 | HQ.5, HQ.2. |
| 5.19 | HQ.5, HQ.2, PrismaticCohomology PR.0. |
| 5.20 | HQ.5, PrismaticCohomology PR.0. |
| 5.21 | HQ.5, HQ.1, HQ.2, DerivedDeRhamCohomology DD.2. |
| 5.22 | HQ.5, HQ.3, HQ.1, HQ.2, DerivedDeRhamCohomology DD.2. |
| 5.23 | HQ.5, DerivedDeRhamCohomology DD.0, DerivedDeRhamCohomology DD.2, EnhancedDerivedSheaves E5:abstract. |
| 5.24 | HQ.5, HQ.3. |
| 5.25 | HQ.5, HQ.3 and §§0.3, 4.21 and 4.28. |
| 5.26 | HQ.5, HQ.3, HQ.2, HQ.1, PrismaticCohomology PR.0, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.2, DerivedDeRhamCohomology DD.4. |
| 6.1 | HQ.5, AnalyticHabiroStack HS.3. |
| 6.2 | HQ.6, HQ.3, HQ.5, HQ.4. |
| 6.3 | HQ.6, §0.1 and AnalyticHabiroStack HS.3, only to formulate the open analytic comparison. |
| 7.1 | HQ.1, HQ.3, HQ.5, HQ.2. |
| 7.2 | HQ.1, HQ.3, HQ.4, Mathlib geom_sum_mul, Mathlib Polynomial.comp, Mathlib Polynomial.derivative_X_pow, Mathlib Polynomial.cyclotomic_prime. |
| 8.1 | HQ.1, HQ.2, HQ.3. |
| 8.2 | HQ.1, PrismaticCohomology PR.0, PrismaticCohomology PR.6, DerivedDeRhamCohomology DD.1, Mathlib Polynomial.cyclotomic_prime, Mathlib Polynomial.eval_one_cyclotomic_prime, Mathlib Polynomial.cyclotomic_prime_mul_X_sub_one, Mathlib geom_sum_mul, Mathlib Polynomial.cyclotomic_three, Mathlib IsCyclotomicExtension.Rat.associated_zeta_sub_one_pow_prime, Mathlib PreTilt, Mathlib WittVector.teichmuller, Mathlib WittVector.fontaineTheta, Mathlib WittVector.fontaineTheta_teichmuller. |
| 8.3 | HQ.8, HQ.3, HQ.6. |
| 8.4 | HQ.8, HQ.1, PrismaticCohomology PR.6. |
| 8.5 | HQ.8, HQ.1, PrismaticCohomology PR.6. |
| 8.6 | HQ.8, HQ.1, PrismaticCohomology PR.0, PrismaticCohomology PR.1, PrismaticCohomology PR.6, AInfCohomology AI.3. |
| 8.7 | HQ.8, HQ.2, HQ.3, AInfCohomology AI.1. |
| 8.8 | HQ.8, HQ.2, HQ.4, PrismaticCohomology PR.3, AInfCohomology AI.1. |
| 8.9 | HQ.8, HQ.2, HQ.4, AInfCohomology AI.1. |
| 8.10 | HQ.8, HQ.4, HQ.2, PrismaticCohomology PR.3. |
| 8.11 | HQ.8, HQ.3, HQ.4, CrystallineCohomology CR.4, Mathlib Polynomial.prod_cyclotomic_eq_X_pow_sub_one. |
| 8.12 | HQ.8, HQ.1, HQ.2, HQ.3, DerivedDeRhamCohomology DD.2. |
| 8.13 | HQ.8. |
| 8.14 | HQ.8, HQ.5, HQ.6, CohomologyComparisons CP.1, CohomologyComparisons CP.6. |
| 8.15 | HQ.4, PrismaticCohomology PR.3, AInfCohomology AI.1. |
| 8.16 | HQ.8. |
| 8.17 | HQ.8, Mathlib Polynomial.cyclotomic_prime, Mathlib Polynomial.eval_one_cyclotomic_prime, Mathlib Polynomial.cyclotomic_prime_mul_X_sub_one, Mathlib Polynomial.cyclotomic_three, Mathlib IsCyclotomicExtension.Rat.associated_zeta_sub_one_pow_prime, Mathlib WittVector.fontaineTheta_teichmuller. |
| 8.18 | HQ.8, HQ.1, DerivedDeRhamCohomology DD.1, AInfCohomology AI.4, CohomologyComparisons CP.1, CohomologyComparisons CP.6, PrismaticCohomology PR.6. |
| 8.19 | HQ.8, DerivedDeRhamCohomology DD.1, AInfCohomology AI.4, CrystallineCohomology CR.2, CrystallineCohomology CR.4, CohomologyComparisons CP.1, CohomologyComparisons CP.6, PrismaticCohomology PR.6. |
