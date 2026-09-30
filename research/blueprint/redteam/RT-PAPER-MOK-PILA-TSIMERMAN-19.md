# RT-PAPER-MOK-PILA-TSIMERMAN-19

Codex — session `codex-rtOQ9t`; issue #4095; 30 September 2026.

Complete audit of the accepted extraction at `faffc6a92c8c4ef17d3db83f3284bb9b10c23230`. **Thirteen findings: eight high and five medium.** All 44 items and their routes were checked. The extraction and its review were written by Claude Code sessions `cc-7b31c4` and `cc-442dc5`; this session did neither.

## Sources and scope

The [published article](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p07-s.pdf) is publicly readable. All 34 pages (945–978), including proofs and references, were read, as were all 29 pages of [arXiv v3](https://arxiv.org/pdf/1711.02189v3). Published page images 947, 958, 959, 966, 972 and 974 were inspected. SHA-256 values:

- Published: `1eab0797914752bdc91b4f46692f0a5716be2cc9e0d2dd96b478f1cdb762a0ab`.
- V3: `b3de4f10ea6243fafcfc4a12adc939b1c8c6fab620afa00d2860d5313e1c0167` (matches the extraction).

The extraction disclosed its preprint-only scope. This audit supplies the published collation; it does not reinterpret a preprint locator as a quotation from print. The [separate errata](../errata/PAPER-MOK-PILA-TSIMERMAN-19.md) and [accepted errata review](../reviews/REV-ERRATA-PAPER-MOK-PILA-TSIMERMAN-19.md) were also read. Their E-numbers collide with the extraction's embedded E-numbers, so references below name the **separate errata file** explicitly. Findings 3–5 and 12 concern confirmed corrections that remain unapplied to the accepted items, not newly discovered mistakes in the source.

## Findings

### 1. high — The accepted item assigns weight 2 to the adjoint Hodge structure, retaining a preprint error corrected in print.

**Where:** research/blueprint/papers/PAPER-MOK-PILA-TSIMERMAN-19.result.json: items 20; Part II brief's adjoint-Hodge import

**Evidence and check:** Published §7.1, p.958, explicitly says “weight 0”; arXiv v3 §7.1, p.11, instead has weight 2. Both passages were read and the published page image inspected. Adjoint types (-1,1), (0,0), (1,-1) all have sum zero. At Tau Ceti f790474, TauCeti/Geometry/Hodge/Structure.lean:62 defines HodgeStructureOn W ω n with opposedness F(p) complementary to conjugate F(n+1-p); its piece at line 156 has bidegree (p,n-p). Thus changing the weight changes the mathematical type, not just its label.

**Fix:** Use weight 0 in item 20 and its consumer contracts. Add a version-scoped sourceIssue for the preprint mistake, marking the published §7.1 as the known correction. Retain the existing general Hodge API and import the specialized adjoint construction from ShimuraData D2/D3.

### 2. high — The all-orbits quotient retains the zero orbit and is not a weighted projective compactification. Unrestricted functoriality also fails after the necessary removal.

**Where:** research/blueprint/papers/PAPER-MOK-PILA-TSIMERMAN-19.result.json: items 41; Part II jet compactification

**Evidence and check:** Published §9.2, p.966, and v3 §9.1, p.19, print (Hom(D^r_k,Y) × A¹)/G_m and call it a “functorial compactification”. In the fiber over a point of a smooth curve with k=r=1, this is A²_(a,s)/G_m with weights (1,1). The origin is an extra orbit, in the closure of every nonzero orbit. The full orbit space is not the projective line; the affine invariant quotient is a point, and the stack quotient has a G_m stabilizer at the origin. Removing the origin gives P¹. A constant morphism Y→Z maps every boundary point (nonconstant jet,s=0) to the excluded origin, so it does not induce a morphism between the repaired quotients.

**Fix:** Remove precisely the locus (constant jet, s=0) before the weighted quotient, or define the compactification by the corresponding relative weighted Proj. Retain the s≠0 chart identifying the original jet space. State which morphisms preserve this open locus (in particular the automorphisms needed here), and use a rational/partially defined map for arbitrary morphisms unless extension is separately proved. Record the source omission, with both versions; do not silently transcribe the quotient.

### 3. high — Item 32 still exports the reversed functional-dependence test, despite the independently confirmed correction in the separate errata file.

**Where:** research/blueprint/papers/PAPER-MOK-PILA-TSIMERMAN-19.result.json: items 32, functional dependence

**Evidence and check:** Published §12.2, p.972 / v3 p.24 prints rank(p₁,p₂)=rank(p₂). In K=C(t,s) with the two partial derivations, p₁=(t,s), p₂=t is a projection, but the two sides are 2 and 1. Conversely p₁=t, p₂=(t,s) passes the printed test even though s does not depend on t. This is already research/blueprint/errata/PAPER-MOK-PILA-TSIMERMAN-19.json E7, confirmed by REV-ERRATA-PAPER-MOK-PILA-TSIMERMAN-19; it has not reached the accepted item.

**Fix:** Replace the right-hand side by rank(p₁). Describe local analytic dependence at regular points, not necessarily rational dependence. Link the existing errata E7 instead of creating a duplicate sourceIssue. Retain the equal-rank hypotheses in the applications, where the two tests coincide.

### 4. high — Item 43 still equates rank(z) with dim U. Nondegeneracy of each formal jet does not imply that the moving base has that rank.

**Where:** research/blueprint/papers/PAPER-MOK-PILA-TSIMERMAN-19.result.json: items 43, differential-to-jet deduction

**Evidence and check:** Published §12.4, p.974 / v3 p.26 contains rank(z)=dim U. Let q be the unramified uniformization of a modular curve. With two independent local parameters (a,b), b≠0, choose input second jet (z,r,s)=(a,b,0). Its graph under J₂q has coordinates (a,b,0;q(a),q′(a)b,q″(a)b²). The locus U has dimension 2 and open base projection, while rank(z)=1. Errata file E6 and its accepted review already give this counterexample and a repair, but item 43 repeats the false equality.

**Fix:** Apply differential Ax–Schanuel with rank(z)=dim(z). Recover derivatives by R=(Dq)r, hence Dq=Rr⁻¹, and recursively subtract lower-order terms and invert the induced symmetric-tensor action of r. Use the generic-fiber dimension inequality to supply dim U−dim(z). Reference existing errata E6; do not infer a local inverse of z from an invertible formal matrix.

### 5. high — The accepted characterization package does not carry the confirmed Lemma 11.1 proof gap, and item 31 still states Theorem 11.3 with only zeroth-order compatibility.

**Where:** research/blueprint/papers/PAPER-MOK-PILA-TSIMERMAN-19.result.json: items 30–31 and 33; Part II differential-system characterization

**Evidence and check:** Published Lemma 11.1, p.969, uses a dimension drop for every strict jet-stabilizer inclusion. Separate errata E4 gives an actual PSp₄ compact-dual counterexample: the third/fourth jet stabilizers of X(t)=tI+t³diag(1,0)+t⁴[[0,1],[1,0]] have orders 2 and 1, both dimension zero. Independently, in Theorem 11.3, p.971 / v3 pp.23–24, take w(t)=2t, u(t)=q(t), v(t)=J_rq(id_r(t)), r≥3, on a small unramified modular-curve disk. The pair lies in the jet orbit, v follows the identity foliation leaf, and its value is u. A constant g with q(g(2t))=q(t) would locally give q∘g(z)=q(z/2), whose derivative at 2t is q′(t)/2 rather than the q′(t) recorded by v. This is confirmed errata E5, not a new source discovery.

**Fix:** Import the existing errata E4/E5 into the item notes and Part II design obligations. Leave the finite-order determination proof as an explicit unresolved prerequisite until a valid replacement is supplied; the counterexample does not refute its existential conclusion. Add du=v₁∘dw (or full chain-rule compatibility) to the uniformized-locus characterization, retaining domain/lifting hypotheses. Do not advertise the known local compatibility repair as a complete global proof.

### 6. high — The volume-growth statement is placed on the arithmetic quotient, where it is false, and omits positive dimension.

**Where:** research/blueprint/papers/PAPER-MOK-PILA-TSIMERMAN-19.result.json: items 16 and 14's volume-growth note

**Evidence and check:** Published Lemma 4.3 proof, p.955 / v3 p.9, invokes Hwang–To growth “exponentially with R” to count translates of a fundamental domain. Item 16 changes this into volume growth of a subvariety of the quotient. Take the subvariety to be a finite-area torsion-free modular curve X itself. Every metric ball in X has area at most area(X), so there can be no lower bound c exp(αR) for c,α>0. A point also has bounded zero-dimensional volume. The intended counting argument measures a positive-dimensional analytic lift upstairs, where the hyperbolic ball grows across translates.

**Fix:** State the supplier for positive-dimensional closed complex analytic subvarieties in the Hermitian symmetric domain with the required invariant metric, center, multiplicity and constants; locate the exact Hwang–To theorem before blueprint decomposition. Apply it to the projected lift of U in Ω, not to an algebraic subvariety of Γ\Ω or the ill-typed expression γW∩X. Preserve the separate uniform bound on each fundamental-domain piece. The primary Hwang–To proof was not acquired in this audit; do not claim that it was.

### 7. high — The freeness assertion needs an effective group; the extraction's general semisimple G allows a nontrivial kernel.

**Where:** research/blueprint/papers/PAPER-MOK-PILA-TSIMERMAN-19.result.json: items 22, 28 and Part II freeness/orbit arguments

**Evidence and check:** Published Proposition 7.2, p.959 / v3 p.12, says G(C) “acts freely”. For G=SL₂ and Ω=H, the central matrix −I acts as z↦(-z)/(-1)=z on P¹, and hence fixes every jet of every order. It is not the identity in SL₂. The published introduction even gives G=Sp₂g on p.948. Passing to a torsion-free arithmetic subgroup Γ does not remove the kernel of the full complex algebraic group action. The accepted ShimuraVarieties V0/V1 contracts explicitly distinguish effective actions and deck groups.

**Fix:** State the jet rigidity and freeness for the effective image of G in Aut(Ω̂), typically the appropriate adjoint group with inactive factors removed. Alternatively state the stabilizer as the action kernel and carry its dimension through orbit calculations. Explain why replacing the group preserves the particular Shimura uniformization and expected-dimension terms. Add this hypothesis to item 22 and consumers rather than relying on the separate neat-level condition on Γ.

### 8. high — The extraction presents contradiction-argument lemmas as assertions in the unrestricted Hilbert-family setting, dropping essential assumptions.

**Where:** research/blueprint/papers/PAPER-MOK-PILA-TSIMERMAN-19.result.json: items 13–14 and 29, stabilizer lemmas

**Evidence and check:** Published §3.1, p.952 / v3 p.6, imposes no dimension assumption; published Lemma 4.2 proof, p.954, instead ends by “contradicting the hypothesis”. In item 13's stated §3.1 setting, choose W=Ω×X and U=D. Its projective closure is the whole Ω̂×X̂, whose full-dimensional Hilbert point has no deformation as a closed subscheme of that same ambient space; Γ₀=Γ and Θ=G°, not the identity for a positive-dimensional example. Conversely a point W={(z,q(z))} at torsion-free level satisfies §3.1 but has trivial stabilizer, contradicting item 14 if read in that same setting.

**Fix:** Package these as steps under the counterexample hypotheses: atypicality, projection not in a proper weakly special subvariety, the indicated induction hypotheses, and the very-general replacement used in Lemma 4.2. Carry the analogous context into the jet version. Avoid exporting both finite and infinite stabilizer conclusions as unconditional theorems about arbitrary Hilbert families.

### 9. medium — The inventory omits the published two-sorted theorem and the weakly-special closure interface it uses.

**Where:** research/blueprint/papers/PAPER-MOK-PILA-TSIMERMAN-19.result.json: items source metadata, items and Part II route

**Evidence and check:** Published Theorem 1.2, p.947, is the “2-sorted version”: dim(Y^zar)+dim(q(Y)^zar)≥dim Y+dim Y^WS, for irreducible analytic Y and its smallest weakly special envelope Y^WS. It is not the modular-derivative theorem numbered 1.2 in v3. None of the 44 items states this inequality or the smallest-envelope operation. The published footnote identifies this form as the input to Zilber–Pink.

**Fix:** Add the two-sorted inequality and its smallest weakly-special-envelope interface to the existing LogicAndDefinabilityPartII route, reusing item 2. Update sourceVersions and give both theorem-number systems: v3 1.2/1.3/1.4 correspond to published 1.3/1.4/1.5; v3 12.3/12.5 correspond to published 12.1/12.2. Collate the full-restriction hypotheses added to published Theorems 1.1 and 9.1 rather than silently changing old locators. The accepted preprint scope was disclosed; this is a concrete published-version completion, not an accusation that those preprint locators were fabricated.

### 10. medium — The prerequisite list sends workers to the wrong Mok publication and gives three incorrect DOI strings.

**Where:** research/blueprint/papers/PAPER-MOK-PILA-TSIMERMAN-19.result.json: items prerequisites: Mok, Scanlon, Bertrand–Zudilin, Daw–Ren; reader document

**Evidence and check:** V3 §7.3 pp.13–14 cites [24], whose bibliography on p.28 identifies Mok's 1999 Contemp. Math. article, not the 1989 book supplied by the extraction. Published §7.3 p.960 cites the same article as [23], with §(2.3); the bibliography on p.977 gives DOI 10.1090/conm/222/03174. Published references [34], [5], [7] give respectively 10.1016/j.aim.2018.03.008, 10.1515/crll.2003.008, and 10.1112/s0010437x1800725x. The extraction instead has endings .029, .005 and 1800765X. The alternative compactification paragraph cites separate Mok and Mok–Zhong works, not that book.

**Fix:** Replace the Mok prerequisite with the actual 1999 article and its §2.3 locator; distinguish the optional compactification sources. Correct the three DOI links to the published bibliography values. Revise the reader's repeated book attribution, without claiming to have audited those prerequisite proofs.

### 11. medium — The jet maps erase the distinction between source arity, jet order and target dimension.

**Where:** research/blueprint/papers/PAPER-MOK-PILA-TSIMERMAN-19.result.json: items 18–19 and 31, jet arity/order

**Evidence and check:** Published §5.2 pp.956–957 explicitly uses J_a^{dim X}J_bX, retaining the original source arity. Item 18 defines J_kX=J_k^{dim X}X but then uses J_aJ_bX, and item 19 uses J_a id_b and J_aW without the fixed arity. For X=A¹ and a=b=1, J₁¹(J₁¹X) has dimension 4, whereas J₁(J₁X)=J₁²(A²) under the stated abbreviation has dimension 6. Item 31 calls the condition a k-jet condition although V_m^k lies in jets of order m with k independent variables (§11, published pp.969–970).

**Fix:** Write π_{a,b}:J_{a+b}^gX→J_a^g(J_b^gX) with g fixed, and use J_a^g throughout the differentiation identity. In item 31 replace k-jet by order-m, arity-k jet and explicitly apply J_m^k(w,u) to the identity section. Keep the truncated rings at powers a+b+1, a+1 and b+1 as in print.

### 12. medium — The extracted finite C-basis of modular functions is impossible for a positive-dimensional function field, leaving the promised input vacuous.

**Where:** research/blueprint/papers/PAPER-MOK-PILA-TSIMERMAN-19.result.json: items 4–5; finite basis terminology in reader and route

**Evidence and check:** Published Theorem 1.3 p.948 and Corollary 9.3 p.965 / v3 Theorem 1.2 p.3 use finite basis terminology. A nonconstant modular function f is transcendental over C, so 1,f,f²,… are linearly independent over C; the modular function field has no finite vector-space basis. The separate errata E3 already confirms that field generators are intended, but items 4–5 and the route still say C-basis.

**Fix:** Use a finite tuple generating the modular function field over C, with its necessary domain-of-definition conditions, throughout items 4–5, reader and route. Link existing errata E3, preserving the valid derivative-field transcendence-degree claims and its version-specific correction.

### 13. medium — Theorem A and Theorem B are named as suppliers, but neither has a separately inventoried statement with its hypotheses.

**Where:** research/blueprint/papers/PAPER-MOK-PILA-TSIMERMAN-19.result.json: item 23 and prerequisites

**Evidence and check:** Published §7.3, p.960 / v3 pp.13–14, states Theorem A and Theorem B before using them to derive the lower-order Schwarzian rigidity. The former assumes n≥2, a convex open U⊂Cⁿ and a biholomorphism to an open subset of Pⁿ carrying nonempty affine-line intersections into affine lines, and concludes extension to PGL(n+1,C). The latter assumes an irreducible compact Hermitian symmetric manifold S of rank at least 2, connected open U,V and a biholomorphism whose projectivized differential carries the distinguished highest-weight tangent orbit W_x to W_f(x), and concludes extension to Aut(S). Item 23 states the resulting Theorems 7.4/7.5 but its note and prerequisite names omit these supplier contracts.

**Fix:** Add two separate external-theorem items with the displayed hypotheses and conclusions, including the highest-weight tangent-orbit/VMRT interface needed to state Theorem B. Route them through the existing Part II, cite the actual Mok article and Ochiai source, and make item 23 consume them. Do not require acquisition or decomposition of their full proofs to complete this extraction; PROTOCOL §16 leaves proof closure to the blueprint.

## Coverage and clean checks

The three accepted routes cover every missing item exactly once: 33 to LogicAndDefinabilityPartII, two to LD.6 and one to ComplexComparisonPartII. The eight planned items are 1, 7, 15, 20, 36, 37, 38 and 39. Their 13 named layers were read in a fresh atlas assembly, together with the reviewed library audit where an entry exists; LD.0 and LD.6 have no entry. No duplicate route or orphaned missing item was found.

Tsimerman-18's current weakly-special records already assign the shared definition to the pending Part II and let LD.6 consume it. BKT20's definable Chow/o-minimal records are compatible with the source route here. The old D4-owner objection and the LD.6 application/counting cycle are already documented in the extraction review and are not new findings. None of these checks edits or replans a Tau Ceti-owned roadmap.

The main dimension conversion codim(U)<codim(W)+codim(D) to dim(W)<dim(U)+dim(X), and the weakly-special product example, check out. The published change to full restrictions of an irreducible algebraic subvariety in Theorems 1.1 and 9.1 is retained as a collation obligation in finding 9, not asserted to be a counterexample to the preprint theorem. The added theorem is the smallest-weakly-special-envelope inequality, not another copy of the derivative theorem.

All 11 embedded sourceIssues were checked against both versions. In particular embedded E5 (rank(k)) and E8 (action on X) are corrected in print at pp.973 and 964; the existing entries remain explicitly preprint-scoped. The Schwarzian fourth-coordinate factor, unipotent sign, domain labels and cross-references were checked without treating their already recorded corrections as new findings. Separate errata E9 is already reflected correctly by item 42's X^ℓ exception.

Items 30–31 need care beyond source transcription: the unresolved finite-order proof issue is distinct from the explicitly false weak compatibility condition. The main basic and jet Ax–Schanuel conclusions are not declared false by these checks. A full global repair of the differential characterization is outside this redteam deliverable and must remain visible to its designer.

## Pinned-library boundary

All cited declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

- Mathlib `RingTheory/Derivation/DifferentialRing.lean`: `Differential` (line 21) bundles one derivation; `DifferentialAlgebra` (46) states compatibility; `Differential.ContainConstants` (62) expresses a constants condition. `FieldTheory/Differential/Basic.lean` supplies extension of a derivation over finite characteristic-zero field extensions. These are reusable foundations for item 32; they do not provide its finite commuting-family, variety-point rank and uniformized-locus package.
- Mathlib `ModelTheory/Definability.lean:56`: `Set.Definable` uses a first-order formula with parameters. This supports LD.0; it is not o-minimality of R_an,exp or Pila–Wilkie.
- Tau Ceti `Geometry/Hodge/Structure.lean`: `TauCeti.Hodge.HodgeStructureOn` and `.piece` provide the weight-dependent general carrier used in finding 1. They do not supply the specialized homogeneous Shimura construction.
- Tau Ceti `Analysis/Holder/One.lean:62`: `C1HolderSpace.C1HolderJet` pairs a bounded value field with a Hölder derivative field. This search hit is not an algebraic finite-jet scheme.

No specialized Ax–Schanuel, Schwarzian, Hwang–To or algebraic jet-space implementation was found in the pinned searches. The eight specialized planned statuses are not replaced with claims that whole items are formalized. The reader's blanket phrase that nothing is in the libraries should be narrowed to the specialized packages when updated; the generic foundations above should be imported.

## Verification and limits

Exact rational diagnostics checked 108 first/second chain-rule recovery cases: R=dr and S=ds+er² recover d=R/r and e=(S−ds)/r² for nonzero r. Additional checks verified the central SL₂ fractional-linear identity and that every positive-degree monomial in the weight-(1,1) fiber changes under scalar multiplication. The general arguments are given above; finite checks alone do not establish the complex-analytic or algebraic-geometric claims.

Correction searches on 30 September 2026 covered the [journal page](https://annals.math.princeton.edu/2019/189-3/p07), [arXiv history](https://arxiv.org/abs/1711.02189), [Crossref record](https://api.crossref.org/works/10.4007/annals.2019.189.3.7), [Mok's page](https://hkumath.hku.hk/~nmok/), [Tsimerman's page](https://www.math.toronto.edu/jacobt/) and targeted title/erratum/rank queries. ArXiv's latest is v3; Crossref returned no update-to and an empty relation object. No additional corresponding correction was located. This is bounded search evidence, not a claim of exhaustive novelty. The separate accepted errata are credited even where the paper itself remains unchanged.

The primary Hwang–To theorem's full proof was not acquired, nor were the prerequisite papers re-audited recursively. Finding 6 is established by the direct finite-volume counterexample to the extracted quotient statement; the exact upstairs supplier must be acquired before blueprint decomposition. The wrong prerequisite links in finding 10 are established by the primary paper's own bibliography.

Validation: `scripts/check_redteam.py` and `research/blueprint/intake.py check-files` on the two deliverables; staged whitespace/path checks. No Lean file changed or compiled, no Lake build or language server started, and no formalization is claimed.
