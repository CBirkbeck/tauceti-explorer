# REV-PKG-WeightZeroCrystallineAutomorphyLifting

Refs #9241. Independent review by Codex, session `codex-C6AWJd`, 2026-10-14.
The package was written by Claude, session `claude-Kdsiuy` (PR #9624); this reviewer did none of
that work.

## Verdict

**needs_changes.** The local fixes described below are applied. The package retains all 30 targets,
but four supplier contracts remain unfilled: arbitrary-rank weight-zero generic reducedness;
crystalline comparison for the twisted, diamond-linear cohomology systems; torsion Galois
comparison away from p; and geometric component stabilization for the local lifting rings.
The README now identifies the exact missing statements and makes their dependent conclusions
conditional. Naming a mathematical input does not establish its ownership or close the build.

This is a completed fixing review, not a checkpoint. The remaining work crosses the package's
ownership boundaries and cannot be done by editing the files authorized by this review.

## Scope, form and fidelity

Read WORKERS.md, PROTOCOL.md, PACKAGE_REVIEW.md, UPSTREAM_GUIDE.md and the expansion protocol;
the entire package and its author's handoff; and the entire accepted plan. The two current upstream
models were LocalGaloisGroups and ProfiniteArithmetic, including their representative Lean files.

The README retains six layers WZ.0–WZ.5 and 30 targets. All 21 accepted-plan target names, all 31 API
names and all **30** test names occur in it; the author's handoff's count of 29 tests was a counting
error. No accepted target was deleted. The inherited plan still records 28 gaps and 20 requests;
passing its schema validator is not a claim that those mathematical requests are closed.

The package's additions to the plan are 2.1 (the general local DVR bridge), 2.2 (completed tensor
components), 2.3 (the base-field crystalline interpretation of connects), and 3.1–3.6 (the adequate
selected-block method). They assemble the stated source arguments where the cited supplier plans
contain only weaker inputs. The generic-reducedness theorem was deliberately left to its designated
sibling, as the accepted plan requires; it has not been silently moved here.

The README has the opening summary, boundaries, conventions, exact contracts, targets with sources
and prerequisites, definition APIs and Checks, and examples and dependencies for each layer.
Eight definition/construction subsections have 4, 4, 4, 4, 5, 6, 4 and 4 Check bullets respectively.
The two light predicates inside those subsections have both satisfying and failing instances.
The metadata remains the fitting single line `topic = "math.NT"`.

The Lean file now uses `import Mathlib`, one opening module description, the roadmap namespace,
layer titles in README order and a closing list of all README-only definitions. It contains four
real-bodied light definitions, three milestone theorems and eleven examples. There is no developed
auxiliary theory, no sorry-bodied data and no invented carrier for the end theorems. Mathematical
source paraphrases and locators remain in the README; process bookkeeping remains in this report
and handoff. No source passage or section-by-section source summary was added.

## Repairs applied

1. **Supplier precision.** Removed the assertion that AG2.5 owns ACC's torsion theorem. Its actual
   statement is a characteristic-zero comparison. Distinguished the V_λ theorem of CL §7.5 from
   the coefficient and Taylor–Wiles extensions needed here. The unfilled-input subsection gives
   the required uniformity and coefficient compatibility, including the finite-type hypothesis
   needed to apply BLGHT Lemma 3.3(8)–(9).
2. **Framing.** Corrected the assertion that fixing the determinant changes the full GL_n framing
   count. The relative count remains n²|S|−1 (GlobalGaloisDeformations §2.6); the underlying rings
   and dimension formulas change. The new local scalar-twist test detects an illicit fixed
   determinant even when the framing count agrees.
3. **Prepared examples.** Replaced the impossible prepared example over a field with one p-place
   by five degree-one p-places of F⁺, ten p-places of F, one R-place and two auxiliary places.
   Its values are f=5, s=13, j=51. Marked f=1 calculations as cohomological or numerical examples
   independent of preparation. Computed the ramified degree-two and unequal-degree tests.
4. **Local geometry.** Added equal-characteristic and nonregular-element controls to 2.1. Fixed
   the scope and part numbers of BLGHT Lemma 3.3; a nonsquare residue, rather than merely a
   nonsquare unit, is used in the quadratic tensor counterexample. Distinguished the current
   Tau Ceti special-fibre theorem from the stronger conclusion required here.
5. **Connects example.** CN Lemma 5.3.4 concerns a nonzero rank-two ring with determinant ε_p⁻¹
   and residue field of K different from F_p. Restored those hypotheses and explained the
   unrestricted determinant parameter. The worked example no longer applies that lemma to Q_p.
6. **Selected-block action.** The block operators act by specified elementary symmetric functions
   on an ordered-partition piece of semisimplified parahoric invariants, not by that scalar on
   the whole space. Added the rank-two two-eigenvalue counterexample and distinguished normalized
   Satake parameters a_j from Frobenius-normalized β_j=q_v^((n−1)/2)a_j.
7. **Characteristic-zero local theory.** Paired the untwisted Hecke map with rec and the twisted
   map with rec^T. Replaced the erroneous repeated-ramified-character restriction by the actual
   Mackey-intersection restriction on characters from one Steinberg segment. Added a scalar tame
   twist with repeated inertia character and a computed scaled-projector identity. Resultants
   are not cancelled when zero.
8. **Excluded places and nilpotence.** Taylor–Wiles primes avoid S∪S^c. The general prepared set
   S is not assumed conjugation-stable; 3.5 first excludes T=S∪S^c and removes ramification at
   T∖S through the required torsion comparison, retaining framings at S. The argument uses one
   simultaneous bounded error ideal, rather than summing one error ideal per place and asserting
   an unchanged bound.
9. **Adequate counts.** Made q≥n²f explicit when writing g=q−n²f power-series variables. Computed
   a genuine prepared example: n=2, f=5, s=13, q=20 gives dim S∞=72, dim R∞=63, ℓ₀=9, a=5 and
   dual degrees [6,15]. Kept the integer identity and its incorrect-qn negative control.
10. **Global common unramified places.** Removed PA §2.19 from 4.4's prerequisites: it requires
    a pure compatible system absent here. Added `avoidGoodPlace` to preparation. Repeat
    preparation avoiding a chosen good v; the base change is unramified there, killing
    monodromy and leaving finite inertia. Varma's characteristic-zero semisimplified comparison
    then kills that inertia. Frobenius comparison and strong multiplicity one make descent
    independent of the preparation. The Steinberg check shows why semisimplified inertia alone
    would not be sufficient. The ordinary theorem uses this same argument.
11. **Signs and source versions.** Added explicit reciprocal, Hodge–Tate and Hecke-polynomial
    witnesses. The local deformation and Hodge suppliers use the opposite Hodge–Tate sign;
    their weight multisets are explicitly negated and reordered without dualizing representations.
    Added LGDR §3.7 for coefficient extension. Specified the dual Tate module in the ordinary
    elliptic-curve example. Corrected
    Thorne Proposition 4.4 to pp. 17–18 and Lemma 5.10 to pp. 25–26 of arXiv v1.

12. **Iwahori prime conventions.** The block-equivalence and nonunipotent-vanishing arguments
    use the normal Iwahori subgroup of pro-order prime to the coefficient prime p, not the
    pro-v Iwahori radical. Identified it by diagonal reduction to the maximal p-power torus
    quotient and added a tame quadratic-character witness at q_v=11,p=5.

## Inputs that remain unfilled

| Gap | Exact required input and consumers | Evidence and resolution |
|---|---|---|
| G1: weight-zero rings | For every finite K/Q_p and residual rank n, p>n, E containing the Galois closure of K: generic reducedness of R^{crys,0}/ϖ, compatible with coefficient extension. Used by 2.5, 2.8 and support propagation. | BCGNT Theorem 2.5.5, p. 29, supplies the mathematical theorem. WeightZeroCrystallineLiftingRings has no allocated layer or accepted plan in this checkout. The named sibling must own the Emerton–Gee inputs and this theorem. CN's rank-two result is insufficient; the accepted plan prohibits moving this theorem here. |
| G2: twisted crystalline comparison | CL §7.5 for V_λ⊗O(χ⁻¹) with χ away from p, at every selected-block K₁(Q_N), into the O[Δ_Q]-linear derived Hecke image; one error exponent independent of χ, coefficient depth and N; compatible reduction and augmentation. Used by 1.1, 3.5, 3.7 and 3.9. | CL §7.5 and CN Theorem 4.2.15, pp. 71–72, state the V_λ case. BCGNT Proposition 3.2.3, p. 33, and Theorem 3.2.5's proof, pp. 34–35, use the extension. A named theorem must provide coefficient descent and the uniform diamond-linear version. Being trivial at p does not by itself prove that theorem. |
| G3: torsion comparison away from p | ACC Theorems 2.3.5/2.3.7 and the simultaneous inertial comparison of Theorem 3.1.1, with twisted coefficients and auxiliary levels, including unramifiedness at S^c∖S and a cardinality-independent nilpotence bound. Used by 1.1 and 3.4–3.7. | ACC pp. 57–58 and Proposition 6.5.3, pp. 167–168, show the needed contract. AG2.5 supplies Varma's characteristic-zero statement and monodromy bound, not torsion Hecke-valued representations. The determinant roadmap provides algebraic interpolation, not this geometric torsion theorem. A torsion owner with the required coefficient theorem is needed. |
| G4: geometric component stabilization | For the local lifting rings and their special fibres, a finite coefficient extension after which all component quotients are geometrically integral, with labels stable under further extension. Used in convention 2 and 2.4–2.8. | BLGHT Lemma 3.3(8)–(9), pp. 48–49, proves this for completions of finite-type models. LGDR §§3.4, 3.9, 3.10 supply lifting rings, dimensions and generic smoothness, without the cited models or this stabilization theorem. Supply finite-type models for the needed rings, or a directly applicable stabilization theorem. Counting their initial minimal primes is insufficient. |

No other roadmap's files or packets were edited to assign these obligations. The fixes expose the
defects without claiming to discharge them.

### Dependency tiers and delivery prerequisites

CaraianiNewton.md places DDPA at tier 10, PadicHodgeTheory at tier 13, global/local deformation
rings at tier 15, AG2 at tier 17, PotentialAutomorphyInfrastructure at tier 23 and CL at tier 27.
WeightZeroCrystallineAutomorphyLifting and its generic-reducedness sibling are outside that 94-roadmap
tier list. Its intended use after CL is explicit, but a numeric tier for either sibling cannot be
certified from that file. There are no `UPSTREAM:` or FoundationsAndLibraryIntegration dependencies
in the revised package. Internal prerequisites run to earlier targets; 4.1's use of earlier 1.2 is
not a cycle, since 1.2 works on already-prepared data.

DDPA R03.1/P8/P9, PA Part II PL.1 and PadicHodgeTheory R06.2 have relevant accepted nodes but no
packages in this checkout. They are named delivery dependencies, not additional unsourced theorems
merely because their packages have not yet been written. PL.1's definition of connects is consumed;
2.3 explicitly owns the stronger equivalence needed here. The reviewed library audit gives partial
algebra and support APIs, not the complete R03.1/P8/P9 machinery. Upstream assembly must retain those
exact supplier obligations and assign an order to the two unlisted siblings.

## Public source verification

The deterministic sample was `random.Random("codex-C6AWJd").sample(targets, 15)`, sorted in layer
order below. Each source entry was opened and its actual statement read, rather than checked only
against a table of contents. Page numbers are printed pages in the linked version.

| Sampled target | Locator checked | Finding |
|---|---|---|
| 0.2 | BCGNT §3.2, p. 32; ACC Lemma 6.5.2, p. 167 | The three local branches and two distinct residue characteristics agree. |
| 0.4 | BCGNT §3.1.1, p. 30, and §3.2, pp. 32–33 | Crystalline, tame-type and unrestricted local problems and residual identifications agree; full-GL framing correction is recorded above. |
| 2.2 | BLGHT Lemma 3.3(2)–(9), pp. 48–49 | Generic and special components use different parts; finite-type assumptions are essential for parts (8)–(9). |
| 2.3 | BLGGT §1.4, pp. 25–26; BCGNT Remark 3.2.2, p. 32 | The potential-crystalline definition and base-crystalline interpretation agree. CN Lemma 5.3.4, p. 77, restricts the example. |
| 2.7 | BCGNT Lemma 3.2.4(4), pp. 33–34 | The assertion is about characteristic-zero points and crystalline component labels. |
| 2.8 | BCGNT Lemma 3.2.4(5) and Theorem 3.2.5's proof, pp. 33–35 | Residual transport and the common power-series variables agree. |
| 3.2 | MT Theorem 2.14, p. 9; Thorne Lemma 5.10, pp. 25–26; CHT Appendix B.1, p. 174 | Characteristic-p comparison uses q_v≡1 mod p and p>n; corrected the Thorne locator. |
| 3.4 | MT Theorem 7.6, pp. 26–27 | Selected localization and derived comparison agree; its torsion comparison input remains G3. |
| 3.6 | MT Definition 6.6 and Proposition 6.7, pp. 21–22; Thorne Proposition 4.4, pp. 17–18 | Adequate primes require ζ_p∉F; corrected the Thorne locator and stated nonnegative presentation count. |
| 3.7 | BCGNT Theorem 3.2.5's proof, pp. 34–35; MT §8, pp. 28–30 | Two systems and adequate counts agree; uniform crystalline coefficient generality remains G2. |
| 3.9 | CN §5.4, pp. 77–79; MT §8, pp. 28–30 | Dual augmentation, residual comparison and dimension hypotheses agree. |
| 3.10 | CN Proposition 5.4.2 and Corollary 5.4.3, pp. 77–79; BCGNT Theorem 3.2.5, pp. 34–35 | Component propagation agrees; the explicit cyclotomic exclusion is retained. |
| 4.4 | BCGNT Theorem 3.2.1, pp. 31–32, proof p. 35; ACC §6.5.12, pp. 175–179 | Global hypotheses agree. ACC p. 179 gives the varying-preparation and finite-inertia argument used to repair unramifiedness. |
| 5.1 | ACC §6.6.1–6.6.2, pp. 179–180, and ordinary patching pp. 185–186; MT §8, pp. 28–30 | Local degrees, inertia characters, weight branch and adequate counts agree. |
| 5.2 | MT Theorem 1.3, pp. 2–3 | Potential semistability, open-inertia formula, seed of possibly different weight, adequacy and scalar witness agree. |

All author-flagged inputs were checked: BCGNT Theorem 2.5.5 (G1); CL §7.5 against CN Theorem
4.2.15 (G2); AG2.5 against ACC Theorem 3.1.1 and Proposition 6.5.3 (G3); and the accepted DDPA,
PL.1 and R06.2 supplier nodes. In addition the seven existing source corrections were checked:

| Existing correction | Source witness and result |
|---|---|
| Complementary degree | BCGNT p. 32; ACC p. 178; MT p. 28: the global degree is over Q. |
| Odd constant sign | BCGNT p. 31: the general summand yields (−1)^n; n=1 and n=3 detect the displayed last-term error. |
| Recollected presentation count | ACC pp. 174–175 and 185–186: the later count conflicts with the earlier n²f subtraction. The adequate balance uses q−n²f. |
| All-place local base change | ACC Proposition 6.5.13, pp. 175–176: its all-finite-place conclusion requires the full local base change identity, retained through PA §2.3. |
| Test-place splitting | ACC p. 178: the listed bad-prime congruences do not enforce splitting of the separately chosen test places; preparation includes them. |
| Cyclotomic exclusion | BCGNT Theorem 3.2.5, pp. 34–35, compared with MT Proposition 6.7, p. 22: the adequate-prime theorem requires ζ_p∉F. |
| Last selected block | MT local theory pp. 4–11, boundary display p. 18, global display p. 26 and proof pp. 24–25: the unequal block orders need consistent transport. |

Source versions: [BCGNT author copy](https://www.math.uchicago.edu/~fcale/papers/SatoTate.pdf),
[MT published PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A36C754C24E9258E1E062C62378BF1E/S2050509423000038a.pdf/automorphy-lifting-with-adequate-image.pdf),
[CN v3](https://arxiv.org/pdf/2301.10509v3), [ACC v2](https://arxiv.org/pdf/1812.09999v2),
[BLGGT v4](https://arxiv.org/pdf/1010.2561v4),
[BLGHT published PDF](https://ems.press/content/serial-article-files/41128?nt=1),
[Thorne v1](https://arxiv.org/pdf/1107.5989v1),
[CHT published PDF](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf),
and [Stacks 00PD](https://stacks.math.columbia.edu/tag/00PD).
No restricted book was required or copied.

## Adversarial mathematics pass

Every target was instantiated or its exclusion hypotheses checked. Arithmetic targets inherit
n≥1, prepared targets n≥2 and p>n; n=0 is excluded rather than interpreted as GL₀ patching.
For n≥2 the arithmetic prime is odd. A p=2 scalar witness outside F(ζ₂) cannot exist, including
when n=1; rank-one target 4.3 itself does not require that witness. Coefficients are a nonzero
mixed-characteristic DVR, not a field or the zero ring. The light scalar and matrix predicates
have the explicitly broader signatures checked below.

| Target | Instances and interfaces tried | Result or repair |
|---|---|---|
| 0.1 prepared data | Four/five equal degrees; (6,1,1,1,1); five ramified degree-two places; empty raw set; p=2. | Strict degree bound is weighted by local degree. Arithmetic nonemptiness/positivity is separate from the raw predicate. Computed witnesses added. |
| 0.2 levels | S={1,2,3}, S_p={1}, R={2}; outside S; overlapping input sets; K_P≠K_I; trivial local group. | Priority K₀, K_I, K_P agrees with Lean. The four places give K₀,K₀,K_I,K_P. Product neatness uses two residue characteristics. |
| 0.3 inverse coefficient | Unit 2 over Q; empty index; trivial characters/group; zero ring; ζ₅ over Z₅[ζ₅]. | 2 acts by 1/2; empty/trivial tuples give the library trivial action. Unit inversion is defined even for the zero ring; arithmetic coefficients exclude it. ζ₅⁻¹ reduces to 1 modulo ζ₅−1. |
| 0.4 deformation problem | R empty; rank-two nonidentity unipotent inertia; unramified scalar local twist; S nonempty. | (X−1)² permits nontrivial unipotent inertia. Crystalline local factors allow determinant-changing scalar twists. Corrected the false fixed-determinant framing distinction. |
| 1.1 Hecke quotient | Empty R; n=1/3 polynomial signs; many R-places; J=0 and nonzero nilpotent J. | Nilpotent spectral transport does not construct a strict chain action. Uniformity uses simultaneous torsion comparison (G2/G3), not an arbitrary sum of ideals. |
| 1.2 recognition | Cuspidal seed; zero localized rational cohomology without seed; Eisenstein localization; f=1 degree range. | Non-Eisenstein hypotheses and seed nonvanishing are necessary. The f=1 example is no longer claimed to be prepared. |
| 2.1 local DVR | A=Z, ϖ=5; O[[x]] at (ϖ); O[x]/(x²−ϖ²), p odd; k[[ϖ]]; A=k[x], ϖ=0; unit ϖ. | Reduced special localization and regular ϖ give a DVR. Nonreduced crossing has two generic branches. Equal characteristic has no characteristic-zero corollary. Zero ϖ gives a field; unit ϖ admits no prime over it. Controls added. |
| 2.2 tensor components | O[[x]], O[[y]]; two branches times a smooth factor; nonsquare-residue quadratic cone; field/zero factors. | Dimension 3=2+2−1. Geometric integrality is essential for pair indexing. Required category has residue k over a DVR; field factors do not qualify. Finite-type restriction restored; G4 remains at application. |
| 2.3 connects | Equal lifts; ordinary/nonordinary rank-two slice; unramified twists; zero crystalline ring; K residue F_p. | Slice needs determinant ε_p⁻¹, p odd, nonzero ring and larger residue field. Zero ring gives no points. Removed unjustified F_p classification. |
| 2.4 local dimensions | n=2; f=1 numerical expression; R empty; hypothetical zero crystalline factor; ramified coefficients. | Counts include one dim O, not one per tensor factor. Seed/tame/smooth existence rules out zero factors. Component indexing is explicitly conditional on G4. |
| 2.5 unique generalization | Smooth factor; nonreduced crossing; p≤n; special fibre reduced only generically. | Only special generic points are used. The crossing detects absence of reducedness; p>n is retained. G1 and G4 remain exact inputs. |
| 2.6 distinct types | R empty; two p-components; identical tame characters. | Empty R gives a smooth extension of R_p; distinct tame types remove away-p labels but keep both p-labels. No bijection is asserted without distinct types. |
| 2.7 characteristic-zero point | Two components meeting only in the special fibre; integral singularities; unramified framing/coefficient changes. | Generic regularity gives a unique component through each characteristic-zero point; no integral smoothness or universal connectedness is asserted. |
| 2.8 residual transport | Same/different p-labels; fixed residual identification; adjoining zero or several variables. | Same labels transport to one twisted component, different labels stay distinct; special generic points have codimension one. The current scheme theorem supplies only part of this conclusion. |
| 3.1 block level | n=2,d=1; n=3,d=1; d=n; raw d=0,d>n,n=0; zero/unit ideals; Q empty; q_v=11/101,p=5; two eigenvalues. | Lower-left condition and last-block determinant are correct. Raw predicate can be vacuous without describing a GL subgroup. Δ has orders 5/25. Corrected scalar action on the whole invariant space. |
| 3.2 mod-p comparison | d=n; rank-two Iwahori plane versus spherical line; zero V; q_v≢1 mod p; p≤n; q_v=11,p=5 tame quadratic character. | The projector is essential except for the full block. Congruence and p>n cannot be dropped. Zero V gives zero on both sides. Prime-to-p Iwahori kernel contains the pro-v radical; the quadratic character distinguishes them. |
| 3.3 inertia relation | One block; Steinberg; repeated tame scalar twist; equal parameters; two-block scaled projectors. | Empty resultants are 1. Steinberg forces the annihilator alternative. Repeated tame characters are allowed. No division at a zero resultant. Corrected Hecke/rec normalization pairing. |
| 3.4 level comparison | Q empty; all full blocks; localization without e_α; derived versus ordinary augmentation. | Empty datum is identity; full blocks retain only descent. Other blocks survive without selected localization. Uniform rank follows from minimal perfect representatives and the fixed residual fibre. G3 remains. |
| 3.5 TW Galois lift | Q empty; d=n; S not S^c; diamond map with wrong orientation; noncoprime residual factors. | General S retained, T=S∪S^c excluded first. Coprime decomposition and scalar last-block inertia are required. Specific O[Δ_Q] map is retained; G2/G3 remain. |
| 3.6 adequate primes | q=n²f; q<n²f; repeated eigenvalue; ζ_p∈F; p=2 or p divides n. | g=0 is allowed; negative variable count excluded explicitly. Adequacy uses a selected eigenvalue of arbitrary multiplicity. ζ_p∉F and p∤2n retained. |
| 3.7 tower | N=0; constant depth-one diamond quotients; repeated selected eigenvalue; same residual systems; q=20,n=2,f=5. | Base level is identity. Constant quotients fail shrinking kernels. Rank is 20, g=0. Common residual presentations and dual augmentations are explicit; G2/G3 remain. |
| 3.8 balance | n=2,f=s=1,q=4; genuine f=5,s=13,q=20; n=0 in integer-only theorem; q<n²f arithmetic. | Integer identities hold beyond arithmetic range. Prepared values are 72,63,9 with dual [6,15]. Formal variables require nonnegative g; corrected example scope. |
| 3.9 patched objects | R empty; kill only one error image; replace q by qn; reverse dual compositions; zero complex without seed. | Both error images must be killed; qn breaks codimension. Duality is an anti-isomorphism. Nonzero rational seed excludes the zero datum. |
| 3.10 support | Same/different p-labels; framing changes; coefficient extensions; ζ_p∈F. | Only same p-labels propagate support. Cyclotomic exclusion is explicit; all two-system hypotheses are retained rather than assumed from elaboration. |
| 4.1 preparation | Four/five replicated degrees; ramified p; totally real input; residual-field extension; avoiding a chosen good v. | t>4 is necessary. Complete splitting preserves ramified completions. Image-preserving test places/disjointness are necessary. Added avoidance of auxiliary places. |
| 4.2 realization | p and outside-S hyperspecial factors; auxiliary pro-Iwahori factors; residual reducibility. | Pro-Iwahori vectors do not imply unramified π. Rational recognition uses absolute residual irreducibility. Auxiliary ramification is handled by repeated preparation. |
| 4.3 rank one | Cyclotomic character; finite-order character unramified at p; crystalline weight zero; p=2. | Cyclotomic weight is −1 and not weight zero. Rank one uses the named local algebraicity/class-field suppliers and no prepared-image witness. |
| 4.4 global theorem | n=1; totally real F; ramified p; common good place chosen as auxiliary; unramified Steinberg WD parameter. | Rank one separated; CM preparation preserves p-completions. Repeated preparation and all-place local base change kill N before finite inertia. Removed unsupported pure-system supplier. |
| 5.1 ordinary patching | λ≠μ; inertia equality only on an open subgroup; insufficient local degree; nonminimal Λ branch. | Prepared theorem requires the full inertia formula, root-of-unity compatibility and stated local-degree bound. Open-inertia generality is obtained after ordinary preparation. Single diamond per prime retained. |
| 5.2 ordinary theorem | n=1; λ≠seed weight; merely de Rham without potential semistability; ordinary ramification at p; dual Tate module. | MT's potential semistability and open-inertia character formula are retained. Conclusion away from p only. Corrected elliptic-curve module orientation. |

### Convention and denominator witnesses

| Convention/interface | Explicit witness or exclusion |
|---|---|
| Field and rank | Prepared n=2 forces p odd; n=0 is excluded. Global n=1 is handled by 4.3; the p=2 scalar-witness hypothesis is impossible. |
| Coefficients | For ramified O with p=uϖ^e, ϖ, not p, defines the reduced special fibre; O/p has nilpotents when e>1. The 2.1 theorem remains valid over equal-characteristic k[[ϖ]], but its characteristic-zero consequence does not. |
| Reciprocity and HT | A rank-one Hecke character with uniformizer value 2 has geometric Frobenius value 2 and arithmetic value 1/2. Weights of 1⊕ε⁻¹ are {0,1}; those of 1⊕ε are {0,−1}. The first becomes {−1,0} in LGDR's opposite-sign convention, with determinant still ε⁻¹. README witnesses added. |
| Hecke normalization and sign | n=2,q_v=9,a=(1,2) gives β=(3,6) and P=X²−9X+18, T₁=9,T₂=2. n=1 gives X−T₁; n=3 constant is −q_v³T₃. The general polynomial is supplied by IntegralHeckeAndGaloisDeterminants, not redefined here. |
| Determinant and framing | n=2,s=13 gives 51 full-GL framing variables in both determinant conventions; a local scalar twist changes determinant by ψ² and detects the illicit quotient. |
| Nilpotent spectral support | The quotient k[ε]/ε²→k induces Spec(k)→Spec(k[ε]/ε²), a homeomorphism of one-point spaces. Support of the zero module is empty; support of a nonzero finite k-module is that point. This is spectral transport, not an action on a chosen chain model. |
| Components and selected block | In a two-branch crossing, the special prime need not have a unique generalization. For n=3,d=1 the last block is rank one; reversing it without transport changes the determinant diamond. Lower-left matrix witness is also in Lean. |
| Resultants/projectors | For P₁=T−1,P₂=T−2,q_v=11: Res=−1, Res_q=−21, E₁=T−2,E₂=1−T and E₁+δE₂=−diag(1,δ) at diag(1,2). At equal parameters no inverse resultant is defined; the scaled polynomial identity survives. |
| Inverse coefficient | The scalar unit 2 acts by 1/2; ζ₅⁻¹ reduces to 1 modulo ζ₅−1. All divisions in this definition are inversion of supplied units. |
| Duality and shifts | Original degrees [1,2] with d=4 become [2,3]. D(u∘v)=D(v)∘D(u), fixing the comparison's anti-isomorphism. Prepared degrees [5,14] become [6,15] when d=20. |

Every division is by a unit or explicitly restricted to a nonzero resultant: q_v is inverted only
in characteristic zero or at v∤p; scalar characters take values in O×; n(n−1)/2 is integral; and
strictly positive central Hecke elements are inverted under the source's invertibility theorem.
No canonical map has an unspecified source: the residual ring identifications, diamond maps,
derived augmentation, Hecke quotient, component projection and connects relation are named.
Geometric comparisons that require an unavailable supplier are exactly G1–G4 above.

## Comparison of Lean signatures with the README

The following ten checks include all four definitions and all three named theorems.
The three additional checks concern mathematical examples, not name-only `#check` commands.

| Signature | Comparison |
|---|---|
| `complementaryDegreeCondition` | Finite set and natural local degrees, strict total < twice complement, distinct removed place. README explicitly distinguishes its empty/nonpositive scope from arithmetic degrees. |
| `LevelFactors` | Arbitrary local groups/subgroups, with outside-S or S_p priority before R. Prose and examples agree without requiring disjoint raw inputs. |
| `AuxiliaryCoefficient` | Finite dependent family of group homomorphisms to O×, product inverted and mapped to linear endomorphisms. Arbitrary CommRing, no implicit continuity. Arithmetic finiteness/smoothness is supplied separately. |
| `IsSelectedBlockParahoric` | Raw matrices over a CommRing and ideal; lower-left block defined by n−d. Invertibility and arithmetic 1≤d≤n are separate in the README. |
| `existsUnique_minimalPrime_le_of_isReduced` | Noetherian CommRing, regular ϖ, prime minimal over (ϖ), reduced localized quotient, exactly one minimal prime below q. It does not assume A a domain or O=Z_p. |
| `isDiscreteValuationRing_localization_of_isReduced` | Same hypotheses, with a supplied IsDomain instance before IsDiscreteValuationRing. The instance is a conclusion, not a circular hypothesis. |
| `adequateDimensionBalance_counts` | Integer inputs and subtraction, exact two identities. README scopes these identities separately from the nonnegative arithmetic variable counts. |
| Four/five-place examples | Equal degrees 1: 4<2·2 fails, 5<2·3 holds. Strictness, not weak inequality, is tested. |
| Inverse and matrix examples | Unit 2 sends 1 to 1/2; [[1,3],[5,1]] passes and [[1,0],[1,1]] fails modulo (5). They detect inverse-sign and transposed-block definitions. |
| Balance and qn negative control | n=2,f=s=1,q=4 gives 8 and 7. Substitution of qn yields 12 versus 8 after adding ℓ₀ and fails the identity. This is a numerical example, not prepared arithmetic data. |

The pinned Mathlib declarations were read: Representation and its trivial action;
DistribMulAction.toModuleEnd; PrimeSpectrum.comap and range_comap_of_surjective; Module.support;
minimal-prime/localization vocabulary and the DVR criteria. The file uses no Tau Ceti import and
therefore makes no claim to depend on a current-only Tau Ceti API at the older pin.

## Duplication against current Tau Ceti

Searched by mathematical objects and hypotheses (crystalline lifting, deformation rings,
adequate image, Taylor–Wiles, block parahorics, component quotients, special fibres, nilpotent Hecke
images, inverse coefficients and completed tensor products) throughout current roadmap README/Lean
files, Completed material and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
This includes all nine newer roadmaps and Completed ContourIntegration, EffectiveBounds,
OrthogonalL2Bases and RestrictedProducts; OperatorTheory's nested subroadmaps were included.
Relevant matches in the determinant, smooth-representation and number-field roadmaps are already
supplier objects, not new targets in this package.

The relevant new library match is
`TauCeti/AlgebraicGeometry/SpecialFiber/Components.lean`:
`AlgebraicGeometry.Scheme.Hom.maximal_base_eq_closedPoint_iff` characterizes special-fibre
component generic points on an integral locally Noetherian scheme by the base closed point and
coheight one. Read its integral-scheme and one-dimensional-local-base hypotheses. The adjacent
ZeroLocusComponents declarations supply principal-zero-locus geometry; the regular-node and
intersection declarations specialize other algebraic situations. None states 2.1's conclusion for
a possibly reducible ring with reduced localization of its special fibre, or 2.8's transport
between two different deformation rings. The README now places this existing scheme result only
in its boundaries and states the extra conclusions of the retained variants there.

**Full target removals: none.** The search found no current declaration or roadmap target equal to
any of the 30 retained targets. No existing general Hecke-polynomial, representation, local-system,
reciprocity or abstract-patching theory is re-planned here.

## Validation

- `lean-check` on the final Suggested.lean: exit 0, fourteen warnings, all `declaration uses sorry`,
  no other warnings or errors. Memory available before the final invocation was 111 GB. No Lake
  build, update, cache download or language server was used.
- `scripts/check_sorry_data.py`: no offenders.
- `research/blueprint/intake.py check-files` on the changed deliverables and unchanged metadata:
  0 problems.
- `scripts/check_blueprint.py` on the inherited plan: 0 errors, 0 warnings, 21 nodes, 31 API items,
  30 unit tests; the reported 28 gaps and 20 requests were not edited or declared closed.
- Accepted-plan name coverage: no missing target, API or test names. Eight definition/construction
  Check blocks all have at least three discriminating bullets.
- `git diff --check`: clean. No forbidden process identifiers or private paths in the package;
  no copied source passages. Only this job's package, report and required handoff are changed.

Resume at G1–G4 with the named suppliers. Once their exact contracts exist, replace the unfilled
input statements with layer/declaration citations and rerun this review's interface and source
checks. Writing more placeholder Lean declarations would not discharge those obligations.
