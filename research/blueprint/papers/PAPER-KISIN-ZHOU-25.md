# Kisin–Zhou (2025): independence of ℓ for Frobenius conjugacy classes of abelian varieties, extraction and routing

Issue [#1069](https://github.com/CBirkbeck/tauceti-explorer/issues/1069). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged Codex checkpoint, whose report follows below as history.
- **The paper.** M. Kisin and R. Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*, Ann. of Math. 202 (2025), 1077–1156.
  - arXiv v2 (the latest arXiv version) was re-fetched; its SHA-256 (62d26eb9…) matches the checkpoint.
  - The Annals text is not openly available, and Crossref lists no correction.
- **Items.** The result has **210 items: 23 library, 25 planned and 162 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** The fourteen findings the checkpoint recorded are kept under `sourceIssues`.

## This continuation (cc-442dc5)

**Reclassified to affect nothing (verified in the text).**
- **E3.** The very-good isomorphism c: its target should also be reduced modulo a.
- **E4.** (3.3.2.1) tensors over Z_p, and the transported tensors are s_{α,ét}.
- **E5.** Proposition 4.2.3(5) is printed as "torsion", but Lemma 4.2.4 and the proof of Lemma 4.3.8 use "torsion-free".
- **E6.** "non-negative" is missing from the dominance order.
- **E7.** ṫ_λ lies in G(F_q((t))).
- **E8.** The H¹ against H¹(1) convention does not change the Mumford–Tate group.
- **E9.** The conjugation slips in the proof of Lemma 6.2.6(2) are confirmed on the page image.

Each is a misprint whose intended form is the one used.

**Unchanged.** The substantive findings keep their classification:
- **E10 and E14.** Lemma 6.3.3 needs a semisimple real lift.
- **E11.** Corollary 5.2.7 relies on a Poonen corollary whose hypotheses are projective.
- **E12.** The orbit choice in the proof of Proposition 5.2.3.

The checkpoint supplies repairs for all four.

**Locators.** Seventeen locators named the wrong statement kind or number for v2 and are corrected; each item keeps a `previousLocator`. Examples:
- Proposition 2.4.4 becomes Lemma 2.4.4.
- Proposition 3.4.5 becomes Theorem 3.4.5.
- Proposition 4.1.15 becomes Theorem 4.1.15.
- Lemma 4.4.10 becomes Proposition 4.4.10.
- Definition 2.4.2 becomes Definition 2.4.3.

Theorem 1.2 is mapped to Theorem 5.1.4, and Theorem 1.3 to Theorems 4.4.4 and 4.4.6, as introduction forms.

**Gaps.**
- **G-version is unavailable.** The final Annals text is not open.
- **G-roots, G-curves and G-global are recorded** through E10–E12 and E14.
- **The other ten are deferred.** They are cited suppliers.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once.
- Every gap has a status and a resolution.

## Mistakes found (`sourceIssues`)

- **E1** (misprint; affects nothing), arXiv2103.09945v2, p9,§2.2.2; final Annals text not compared. *Printed:* {u^(-1) w sigma(w) | u in W} *Correction:* Replace the final sigma(w) with sigma(u).
- **E2** (misprint; affects nothing), arXiv2103.09945v2, p23,§3.2.5, reference to Definition3.1.6; final Annals text not compared. *Printed:* property (3) of Definition 3.1.6 *Correction:* Use property(2), the closed immersion of local models.
- **E3** (misprint; affects nothing), arXiv2103.09945v2, p23,§3.2.5, canonical comparison c; final Annals text not compared. *Printed:* c: U_tilde_1 tensor W_hat(A_G/a_G) -> M_tilde_1 tensor W_hat(A_G) *Correction:* Reduce the right side to W_hat(A_G/a_G) as well, with the same coefficient maps.
- **E4** (misprint; affects nothing), arXiv2103.09945v2, p25,equation(3.3.2.1) and its following tensor label; final Annals text not compared. *Printed:* T_p(G)^vee tensor_(breve Z_p) W_hat(O_K); s_(alpha,0) *Correction:* Tensor the etale Tate lattice over Z_p. The tensors transported from that lattice are s_(alpha,et); s_(alpha,0) denotes the crystalline tensors on the target.
- **E5** (misprint; affects nothing), arXiv2103.09945v2, p34,Proposition4.2.3(5); final Annals text not compared. *Printed:* X_*(G^ab)_I is torsion. *Correction:* Use torsion-free.
- **E6** (misprint; affects nothing), arXiv2103.09945v2, p48,§5.2.1, integral dominance; final Annals text not compared. *Printed:* an integral linear combination of positive coroots *Correction:* Require a nonnegative integral linear combination of positive coroots.
- **E7** (misprint; affects nothing), arXiv2103.09945v2, p52,Lemma5.2.5, hypothesis on t_lambda; final Annals text not compared. *Printed:* t_lambda in G(F_q[[t]]) *Correction:* Use t_lambda in G(F_q((t))) for the loop element; the conjugator g remains in the positive-loop parahoric.
- **E8** (misprint; affects nothing), arXiv2103.09945v2, p55,§6.1.1, Hodge types of Betti cohomology; final Annals text not compared. *Printed:* H^1_B(A(C),Q); ((0,-1),(-1,0)) *Correction:* For the stated H^1 and the dual Tate comparison in§6.1.3, use cohomological types ((1,0),(0,1)). If choosing H_1 instead, change the realization and dual conventions consistently throughout.
- **E9** (misprint; affects nothing), arXiv2103.09945v2, p58,proof of Lemma6.2.6(2), diagonal conjugacy; final Annals text not compared. *Printed:* h^(-1) g h = g; h_1 g h_1^(-1)=gprime *Correction:* The premise is h^-1 g h=gprime and its first-coordinate consequence is h_1^-1 g h_1=gprime.
- **E10** (error; affects the proof), arXiv2103.09945v2, p60,proof of Lemma6.3.3, compactness step; final Annals text not compared. *Printed:* any lift *Correction:* Choose a SEMISIMPLE lift of the quotient class before deducing compactness from unit-modulus eigenvalues; carry the central rescaling through the subsequent lift.
- **E11** (gap; affects the proof), arXiv2103.09945v2, p53,proof of Corollary5.2.7; repeated onp54; final Annals text not compared. *Printed:* [Poo04, Corollary 3.4] *Correction:* Supply the local smooth-chart curve argument C20–C24, or a proved reduction to the projective hypotheses of that corollary.
- **E12** (gap; affects the proof), arXiv2103.09945v2, pp49–50,proof of Proposition5.2.3, choice of orbit sum; final Annals text not compared. *Printed:* lambda+sigma_q^i(alpha^vee) <= mu; lambda+sum_i sigma_q^i(alpha^vee) <= mu *Correction:* Choose the coroot orbit by applying the ordinary dominance step to the folded coroot root system, with integral/chamber transport and the adjacent-even-A case checked. C14–C19 supply that finite combinatorial proof; the BT relative-root normalization remains G-roots.
- **E13** (misprint; affects nothing), arXiv2103.09945v2, p59,proof of Theorem6.2.7, auxiliary level and special fiber; final Annals text not compared. *Printed:* K_1^p subset H(A_f^p); S_K(H_1,X_1) *Correction:* Use K_1^p subset H_1(A_f^p) containing the image of K^p, and S_(K_1)(H_1,X_1) for the reduction.
- **E14** (gap; affects the proof), arXiv2103.09945v2, p60,proof of Lemma6.3.3, last sentence; final Annals text not compared. *Printed:* Any lift *Correction:* Prove a real lift with the required semisimple quotient class, then multiply back by the central element z used to define gamma_1. An arbitrary real lift of the image in G/w(G_m) does not suffice.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **G-version** (unavailable). The November 2024 Annals revision is not openly available (Unpaywall lists no copy); arXiv v2, the latest arXiv version, was reread and E3–E9 were checked there.
- **G-local** (deferred). He, He–Nie, He–Rapoport, He–Zhou and Haines–Rapoport are cited suppliers.
- **G-neron** (deferred). Edixhoven, BLR and the Bruhat–Tits root charts are cited suppliers.
- **G-models** (deferred). KPZ, AGLR, FHLR, Levin and Scholze–Weinstein are cited suppliers.
- **G-display** (deferred). Zink, Anschütz and Kisin 2010 are cited suppliers.
- **G-tensors** (deferred). Deligne, Blasius–Wintenberger and KMPS are cited suppliers.
- **G-components** (deferred). KP18 and KPZ component descent are cited suppliers.
- **G-functoriality** (deferred). Pappas–Rapoport's canonical integral models are a cited supplier.
- **G-roots** (recorded). E12 records the orbit-choice step in the proof of Proposition 5.2.3, with the folded dominance repair written out in the items; the valued-root normalization of BT84 is a cited supplier.
- **G-curves** (recorded). E11 records the reliance on [Poo04, Corollary 3.4] in Corollary 5.2.7, with the same-field étale-graph argument written out in the items.
- **G-stacks** (deferred). Laumon–Moret-Bailly is a cited supplier.
- **G-companions** (deferred). Chin 2004 and L. Lafforgue are cited suppliers.
- **G-global** (recorded). E10 and E14 record the missing semisimple choice of the real lift in Lemma 6.3.3; Steinberg, Chebotarev, Krasner and Langlands–Rapoport/Kottwitz are cited suppliers.
- **G-weights** (deferred). E8 records the Tate-twist convention; the Weil and Rosati inputs are cited suppliers.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of the findings reclassified here, this continuation supersedes it.

## Kisin–Zhou: Frobenius conjugacy classes and independence of ℓ

**Partial research checkpoint — Codex, session codex-c83e7a, 23 September 2026.** The extraction now contains **210 items: 23 library, 25 planned and 162 missing**, with one owner route for each missing item. Its 92 definitions/constructions carry 276 API statements and 276 specified tests. All 192 previous item IDs and statuses are preserved. The 18 additions develop the finite orbit-dominance proof and an elementary same-field curve construction. Four additions reuse declarations read at the pinned Mathlib commit.

All 63 pages of [arXiv:2103.09945v2](https://arxiv.org/pdf/2103.09945v2) were freshly read, including references. Its SHA-256 remains `62d26eb931f271404c333c4b9a929e85239222788834cf16dcec1dff230c34c8`. The [publisher](https://annals.math.princeton.edu/2025/202-3/p03) records Annals 202 (2025), 1077–1156, DOI 10.4007/annals.2025.202.3.3, and a final revision dated 19 November 2024. The acquired preprint is dated 7 October 2024. The final journal text has **not** been obtained or compared. All fourteen source findings below are scoped to the inspected preprint, and have no independent-review verdict.

The main theorem gives a common rational point of **Conj_G(Q)** for the Frobenius classes of a good-reduction abelian variety at an odd residue characteristic, for every ℓ≠p, after the common finite extension making the realizations factor through the Mumford–Tate group. It does not prove the Mumford–Tate conjecture or automatically produce an element of G(Q). The rational-representative refinement retains its simply connected derived-group and quasi-split-at-p hypotheses and its possible one-prime exception. No ℓ=p or bad-reduction theorem is asserted here.

The job remains partial: the new finite combinatorics is distinct from its valued-root realization; the local curve proof is distinct from the rational-object stack atlas. Integral models, displays, component descent, companion suppliers and the global arithmetic arguments retain the explicit gates at the end.

### The finite Frobenius-orbit step

The old C03 and C04 contracts are now connected to a proof tree. C25 owns the generic **nonnegative integral** root-cone relation; C02 imports it for Schubert strata. This direction avoids making a generic root theorem depend on local-model geometry. Rational Newton dominance is a separate relation.

For C03, write μ−λ=∑nᵢaᵢ with nᵢ≥0. Choose a maximal positive root β=∑mᵢaᵢ with mᵢ≤nᵢ. The finite set is nonempty because some nᵢ>0. For each simple aᵢ, maximality implies either β+aᵢ is not a root or mᵢ=nᵢ. In the first case the obtuse-sum criterion gives a nonnegative simple-coroot pairing for β; in the second case

λ+β=μ−∑ⱼ≠ᵢ(nⱼ−mⱼ)aⱼ

has nonnegative pairing because off-diagonal simple pairings are nonpositive. Thus λ+β is dominant and bounded by μ. This is the full Waldspurger argument in Rapoport's Lemma 2.3, reread on printed pp.157–158. The two sign/root-sum leaves are already `RootPairing.root_add_root_mem_of_pairingIn_neg` and `RootPairing.Base.pairingIn_le_zero_of_ne` in the pin (L20–L21).

One must choose a suitable **orbit**, not add separate upper bounds for arbitrary choices. A useful rejection example is A₄ with diagram reversal: let the simple pairings of λ be (1,0,0,1), let μ−λ have simple-root coordinates (1,1,1,1), and choose α=(1,1,1,0). Both λ+α and λ+σα are dominant and bounded by μ, but α+σα=(1,2,2,1) exceeds μ−λ. This example only tests the generic inference; it is not claimed to meet the paper's minuscule local-model hypotheses or contradict Proposition 5.2.3.

C14–C19 instead apply C03 to a folded root system. Work with the **coroot** system R=Σ∨ in the application. For each orbit O of simple roots set β_O=∑ₐ∈O a, counting each distinct member once. Invariant integral cone coefficients are constant on O. They become integer coefficients of β_O, without division by the orbit size.

When R is simply laced and each simple orbit is orthogonal, [Stembridge's four-page folding note](https://websites.umich.edu/~jrs/papers/folding.pdf), condition (1) and Claims 1, 3, 4, proves that the β_O form a crystallographic base and that folded roots are exactly root-orbit sums. Products of commuting reflections give the fixed Weyl subgroup; length descent proves surjectivity. For finite R, positive definiteness gives the root-orbit height induction. The condition on simple orbits is essential to this invocation.

C16 handles the excluded adjacent case directly. In A₂ₙ, put fᵢ=eᵢ−e₂ₙ₊₂₋ᵢ. Diagram reversal sends eₐ−e_b to e₂ₙ₊₂₋b−e₂ₙ₊₂₋ₐ. Listing index positions shows that the orbit sums are exactly

±fᵢ, ±fᵢ±fⱼ,

with simple roots fᵢ−fᵢ₊₁ and fₙ: the Bₙ system. The fᵢ are orthogonal with squared norm 2. A fixed root eᵢ−e₂ₙ₊₂₋ᵢ and the two-root orbit through the middle coordinate both yield fᵢ. Use the latter lift when the short restricted-root convention is required. For an invariant λ the folded simple pairings are the original dᵢ off the middle and **2dₙ** at the middle. They are integral and have exactly the same signs. This factor is not the orthogonal-orbit norm formula.

C17 reduces a cycle of irreducible components to the return automorphism on one component. The diagonal transport scales every squared norm by the cycle length, which cancels in coroot pairings. The upstream oriented Dynkin classification supplies the reduction: non-simply-laced irreducible diagrams have no nonidentity length-preserving automorphism; nontrivial A, D, E₆ actions are orthogonal except the even-A reversal. D₄ triality is included. The classification and lattice apparatus are imported, not replanned.

C18 now transports both the integral cone and the dominant integral-weight condition. Apply C03 in the folded datum and lift its positive root to an orbit: this proves C19, the existence of β=∑orb(α) with λ<λ+β≤μ and λ+β dominant. Common central directions do not enter the coroot difference. **G-roots now concerns only the remaining local-group adapter:** the exact identification of this coweight with the short relative-root rank-one subgroup and affine-flag translation in BT84 §4.1.4. The finite calculation does not prove that valued-root statement.

### A curve over the original residue field

The scheme input C11 now has a direct proof over any field. Suppose Y is smooth near y∈Y(k), and U meets its component densely. By the standard-smooth Jacobian presentation, choose an affine integral neighbourhood V of y and an étale map π:V→Aᵐ_k; translate its coordinates so π(y)=0. The chart theorem and its proof were read at [Stacks tag 054L](https://stacks.math.columbia.edu/tag/054L).

Assume first m≥1. Put Z=V∖U. Every component of Z has dimension at most m−1. Its image closure in Aᵐ has dimension at most m−1, by the function-field dimension inequality. Thus a nonzero polynomial h vanishes on π(Z). If Z is empty, take h=1.

Choose B≥2 larger than every individual exponent in the support of h, and take the polynomial graph

a(T) = (T, T^B, T^(B^2), ..., T^(B^(m−1))).

Here the exponent on coordinate i is Bⁱ. Base-B expansion is injective on the bounded support, so distinct monomials of h stay distinct after substitution: h(a(T))≠0. The first coordinate is T, hence a is a closed immersion. This argument concerns polynomials, not their values on the finite set k-points. For example over F₂, X²Y−XY² vanishes on every rational line through the origin, but B=3 produces T⁵+T⁷. The strict exponent bound matters: B=2 kills Y−X².

Form D=V×_(Aᵐ)A¹. Its projection to A¹ is étale by the pinned base-change instance (L22), so D is a smooth curve. The point (y,0) is k-rational. Take its unique connected component C; smoothness makes components disjoint and open, so C is an integral curve. A smooth rational point makes that integral variety geometrically integral, by [Stacks tag 0CDW](https://stacks.math.columbia.edu/tag/0CDW). This is not a valid inference for an arbitrary connected singular curve.

The map C→A¹ is nonempty and étale, hence open and dominant. Consequently h(a(T)) cannot vanish on all of C. Where it is nonzero, the V-coordinate lies outside Z, proving that C meets U in a dense open. The marked point maps to y over exactly k. If the smooth component has dimension zero, its rational neighbourhood is Spec(k), U contains y, and the constant map A¹→y supplies the required curve morphism.

C20–C24 and C25 have separate statements, dependency edges and, for the new constructions, APIs and tests. C11 no longer depends on C10: the scheme lemma is independent of the atlas. C12 still needs C10 to obtain a chart carrying the **same rational stack object**, together with Lang lifting and the local-model curve. Those gates remain. The construction proves a one-point curve meeting one dense open; it makes no projective or multipoint Bertini assertion. Poonen's projective Corollary 3.4 remains a comparison source, not a prerequisite of this local repair.

### The rest of the extraction

#### Local group theory

Items N01–N26 and R01–R14 separate the extended Iwahori–Weyl group, its affine Coxeter subgroup and length-zero component from B(G). The integral Kottwitz map takes values in inertia coinvariants; the class invariant passes to further Frobenius coinvariants. The affine Frobenius action, its linear part and the chamber-preserving L-action are recorded as distinct maps. This is needed before averaging a Hodge cocharacter.

A σ-straight translation has length equal to the pairing of its dominant Newton point with 2ρ. Equality in the averaged length estimate places the relevant iterates in one chamber. Zero root pairings then make the translation cocharacter central in its Newton Levi. The absolute lift of that cocharacter is also central after the inertia-averaging argument. These are proof inputs to the deformation construction, not ornamental combinatorial facts.

B(G,μ) imposes **both** the Kottwitz equality and the rational Newton inequality. A μ-ordinary class has Newton point exactly μ-diamond. A unique maximal element of B(G,μ) need not be μ-ordinary for a non-quasi-split group. The extraction records existence separately. Once an ordinary admissible element is given, Proposition 2.3.3 obtains an integral σ-conjugator, a stronger result than equality of B(G)-classes. That integral result is used to normalize the actual Dieudonné lattice.

The full fixer model, connected parahoric, torus Néron lft model, finite-type open submodel and identity component are five different objects. For a torus, the finite-type submodel retains torsion components of the inertia-coinvariant cocharacter group, whereas the identity model retains only zero. R-smoothness is smoothness of a particular schematic closure; it enables the closed-immersion and quotient arguments. In a restriction of scalars of a tamely split torus, the restricting field extension itself may be wild. In the central quotient theorem, the integral kernel closure may have components and the conclusion is fppf exactness, not only exactness of generic points.

#### Local models and tensor deformations

M01–M10 distinguish a local model triple, a local Hodge embedding, a good integral embedding and the proper flat integral local-model scheme. The scheme has a generic flag variety and a reduced admissible special fiber. Its relation to the Scholze–Weinstein v-sheaf is a theorem, not a definition that automatically gives a scheme. A Witt perfection is also not automatically a finite-type scheme.

The group cocharacter convention changes between the local model and the contravariant deformation problem. The local-model lattice is represented by πgΛ modulo π; the deformation filtration uses the corresponding inverse Hodge cocharacter. These signs must be checked against each realization map. Goodness is a closed Grassmannian embedding. It does not by itself supply very goodness.

D01–D20 describe the Zink coefficient ring, Hodge lattice, defining tensors, tensor-orbit completion, adapted deformation and Frobenius-image torsor. Very goodness says that a canonical comparison over the quotient by m²+π_E preserves the tensors. The comparison must be reduced modulo that ideal on **both** sides. KPZ's read equation supplies this formulation. Tensor independence follows because the comparison descends to the intrinsic tensor-isomorphism torsor.

The versal criterion 3.2.7 uses assumptions A, B and C: acceptability, goodness and very goodness. Its torsor argument uses Anschütz in place of the defective earlier input. The ordinary construction in §3.4 is a separate route: it assumes A and B plus equality of full fixer and parahoric, constructs a central-Levi filtration and a height-one Breuil–Kisin module directly, and uses classification to obtain the lift. It does not import C as an unexplained universal hypothesis. The lifted J_b(Q_p) action is rational because the theorem works in the isogeny category.

#### Integral Shimura stacks and ordinary lifting

S01–S44 retain stacks at non-neat level. The proof of the abelian theorem selects a p-level containing a chosen Frobenius lift; imposing a neatness condition arbitrarily can lose that element. Schemes at auxiliary small level are used with their quotient-stack descent, preserving inertia and rational objects.

Strong acceptability requires a Hodge-type datum, a derived group locally expressed as restrictions of **split** groups, induced central-torus factors, and a very-special parahoric. A special vertex is not automatically very special after unramified base change. The auxiliary Hodge cover has separate outputs: derived fundamental group, reflex-field splitting, a globally very good embedding, R-smooth center and torsion-free abelianized coinvariants. These properties feed different steps and are not collapsed into a generic “good model” assertion.

The component-group `*` product was checked in KP18 §4.5.6. If Δ acts on H and φ:Γ→Δ satisfies the source equivariance and inner-action conditions, it is the quotient of H⋊Δ by the normal subgroup of pairs (γ,φ(γ)⁻¹). It is **not** a free amalgamated product. S21 gives this construction; S41–S44 give the four adelic/integral and neutral level-action groups. Their closures, positive real-adjoint subgroups and finite coset translates matter when moving a lift off the neutral component.

The integral local-model diagram uses an adjoint parahoric with **connected** special fiber. That connectedness enables Lang's theorem over F_q. The functoriality theorem on completed local rings assumes an isomorphism on derived groups, not merely a central isogeny. The comparison datum G₃ is the identity component of the fiber product over both the common adjoint group and G_m: its two multipliers must agree. This makes the direct-sum symplectic representation valid and identifies the pulled-back abelian object with A₁×A₂.

Ordinary density retains the existence and normality hypotheses. The special-point lift is first constructed on the auxiliary Hodge model, transported using completion comparisons and isogeny-group exact sequences, then moved through the component and Hecke actions. The I_x rank theorem and lift-independent crystalline tensors are imported from the candidate KMPS continuation, whose previous partial extraction is not treated as a completed proof.

#### Curves, companions and rationality

C01–C13 isolate the special-fiber geometry. Schubert dominance uses a **nonnegative integral** coroot combination. Newton dominance instead uses a rational cone. For example, in PGL₂ coordinates with coroot 2, a difference of 1 is rational-positive but not integral-coroot-positive. Omitting nonnegativity would turn the alleged order into a symmetric lattice relation.

The essential curve theorem provides a smooth geometrically connected curve over the original F_q and an F_q-rational marked preimage of the lower-stratum point. The three rank-one constructions are split SL₂, standard SU₃ and the nonstandard ramified SU₃ parahoric. The last uses x↦u_−(x,−x²/2), which explains the odd-prime restriction in that calculation. The matrix identity and its conjugated integrality were verified symbolically with Laurent polynomials. This checks an algebraic step; it does not prove the closed-immersion or geometric stratum assertions.

The finite combinatorial and local scheme-curve steps are expanded above; their geometric and stack adapters retain the named gates.

Chin's Theorem 4.6 applies to an irreducible or semisimple lisse sheaf on a smooth finite-field curve that is **plain of characteristic p**. This means algebraic Frobenius eigenvalues which are units at every finite place away from p, not only at the coefficient prime currently in use. The original sheaf need not have finite-order determinant: a plain constant rank-one twist reduces to that case, companions are constructed, and the twist is undone. The system is actual sheaves at coefficient places with matching polynomials, not merely a list of polynomials.

The downward KR induction compares arbitrary algebraic representations. On the curve's higher-stratum open the companions agree; curve Chebotarev and semisimple recognition extend that agreement to the rational marked point. The density supplier is DeligneWeightsAndPurity DWP.3, which explicitly constructs the finite-field closed-point theorem with constant-field degree constraints. The finer R01.5 decomposition concerning G_Q is not an exact replacement for it.

All algebraic representations separate geometric semisimple classes. One faithful representation is insufficient: the torus t↦diag(t,t⁻¹) identifies the GL₂ characteristic polynomials of 2 and 1/2 without identifying them in the torus. A finite map from Conj_G to the faithful GL quotient proves only that the class is algebraic. Rationality is a second step. Its residue field has a degree-one prime above every rational prime away from p; in a Galois closure this forces the stabilizer subgroup to meet every conjugacy class. Burnside's count on its cosets then forces that subgroup to be the whole group. “A degree-one prime exists” is not “the prime splits completely.”

Finally, the abelian application uses a totally real restriction-of-scalars datum with diagonal multiplier, followed by a **central product** with a torus. This second construction is a quotient by an inverse diagonal center, not a fiber product with unspecified maps to that center. Its conjugacy quotient contains Conj_G injectively and Galois-equivariantly. The finite extension realizing the integral Shimura point has residue degree one at v; it need not be unramified. Applying the geometric theorem then descends the common class back to G. The real compact-form argument must choose a semisimple lift: absolute values of eigenvalues alone do not put an arbitrary nonsemisimple matrix into a compact group.

### Pinned baseline and ownership

The pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The 30 earlier declaration records are retained; four new records include exact source slices and file hashes. L20–L21 are the root-sum and off-diagonal pairing facts. L22 is `AlgebraicGeometry.Etale.etale_isStableUnderBaseChange`; L23 is `AlgebraicGeometry.Etale.iff_smoothOfRelativeDimension_zero`. None of these supplies a folded root system or the local curve theorem automatically.

The reviewed R09.4 and LPV.3 audits were read. The root roadmap's classification and lattice ownership boundaries were checked against the pinned documents. Searches of the root-system and multivariate-polynomial sources did not find the finite folding or bounded Kronecker adapter. Nearby complete He18, He21, Zhu17 and Abe25 extractions and the now-complete KPZ26 extraction were screened for these exact item statements. Existing candidate IDs are reused; a complete extraction is not automatically an accepted design or a proved supplier. The new SF.0 route only adds general coordinate, dimension and component lemmas. The final refresh also screened Calegari–Geraghty20, Witaszek22 and Zhang21 changes. KPZ26 F10/F34 and S35/S37 are recorded as precise display and connected-diagram supplier leads, with version/adapter gates retained. No upstream roadmap or library file is changed.

The current inspected repository manifest has 560 blob/SHA-256 verified files at `6202b8a96ae94d876d072ffe7ea6cf049da2318e`. This is a bounded ownership and conflict screen, not a claim to have read every file fully. The publication guard checks all those inputs and the original three deliverable blobs again.

#### Route 1: BunGAndNewtonStrata

BG0 owns B(G), J_b and G-isocrystals; BG1 owns Newton/Kottwitz classification and its order. Add the straight-translation and mu-ordinary results here, importing extended affine Weyl and parahoric structure from RG2. No second local sigma-conjugacy theory is proposed.

Existing stages: BunGAndNewtonStrata:BG0, BunGAndNewtonStrata:BG1.

Items: N07, N08, N09, N11, N12, N13, N15, N17, N18, N19, N20, N21, N25, N26.

#### Route 2: ReductiveGroupsPartII

The existing local-group continuation owns valued roots, buildings, full fixers, parahorics and their double cosets. R-smooth torus models and integral closed-embedding/quotient lemmas are inputs to its root-chart and integral-model proofs. Keep torus Neron lft models here; R11.1 is specifically the abelian-variety Neron existence route. Lang and its congruence-level application supply connected special-fiber lifting.

Existing stages: ReductiveGroupsPartII:RG2.1, ReductiveGroupsPartII:RG2.2, ReductiveGroupsPartII:RG2.3, ReductiveGroupsPartII:RG2.4.

Items: N02, N04, N06, N10, N23, R01, R02, R03, R04, R05, R06, R07, R08, R09, R10, R11, R12, R13, S20, A06, R14.

#### Route 3: GlobalShtukasAndFunctionFieldLanglands

GS.6 explicitly proves the full GL_n correspondence with finite-order determinant and separates extension by twists. Chin plainness, constant twists and compatible companion systems supply that exact coefficient/twist interface. Do not create a second function-field Langlands or companions roadmap; E10 imports the curve-density theorem separately.

Existing stages: GlobalShtukasAndFunctionFieldLanglands:GS.6.

Items: E04, E05, E06, E07.

#### Route 4: ArithmeticGaloisRepresentations

R01.5 owns semisimple recognition from Frobenius polynomials. Its current finer G_Q/finite-field-descent node does not itself prove the curve case. Add the curve application using the already-owned DWP.3 closed-point Chebotarev theorem and the same Brauer–Nesbitt supplier.

Existing stages: ArithmeticGaloisRepresentations:R01.5.

Items: E10.

#### Route 5: AlgebraicModuliForArithmeticGeometry

R09.4 owns algebraic stacks and smooth atlases. The rational-object smooth-atlas lemma belongs to that construction, with LMB6.3 hypotheses proved explicitly. The Shimura route imports it and retains inertia rather than passing to coarse moduli.

Existing stages: AlgebraicModuliForArithmeticGeometry:R09.4.

Items: C10.

#### Route 6: GeometricSatakeLocalModelsPartII

GS0 owns loop/Schubert, Witt and v-sheaf geometry. The flat proper O_E local-model scheme, good integral Hodge embeddings and same-residue-field curves add a distinct integral-model layer. GlobalShtukas GS.1 supplies classical equal-characteristic flag geometry; it does not assert the mixed-characteristic integral extension.

Begin with Geometric Satake over the Fargues–Fontaine curve (GeometricSatakeAndFusion GS0), importing its loop, bounded Schubert and Witt comparison geometry; import classical equal-characteristic flags from GlobalShtukasAndFunctionFieldLanglands GS.1 and valued roots/parahorics from ReductiveGroupsPartII RG2.1–4. Define acceptable local model triples and good integral Hodge embeddings. Construct the proper flat O_E local model with generic flag fiber and reduced admissible special fiber, using the exact KPZ/AGLR/Levin hypotheses. Prove good embedding existence for p>2 with the prime-to-p derived fundamental-group and R-smooth centralizer conditions, including the symplectic trace and lattice criteria. Identify the special fiber with the equal-characteristic Schubert union and prove Kisin–Zhou5.2.3: every rational lower-stratum point admits a smooth geometrically connected curve with a rational marked preimage over the SAME finite field and dense open in a higher stratum. Import the positive-coroot step from RootSystemsDominancePartII, and close its Frobenius-orbit strengthening before using it. Prove all three rank-one curves, the closed rank-one flag embedding and the connected-stabilizer Lang lift. Do not infer this curve property for arbitrary normal schemes. The final-text and original-source gates remain binding. C14–C19 now supply the finite orbit-sum choice. The remaining G-roots obligation is the valued-root/coroot normalization of its short relative-root subgroup, especially the even-A adjacent case.

Items: M01, M02, M03, M04, M05, M06, M07, M08, M09, M10, C01, C02, C04, C05, C06, C07, C08, C09, C13.

#### Route 7: FiniteFlatGroupsWithTensorsPartII

R07.2 and R07.4 already own Dieudonne and Breuil–Kisin classification, while R07.6 states deformation tangent/obstruction exports. Tensor-adapted versal rings, corrected very-good display data and whole J_b-action lifts require further layers; they import those classifications.

Build on Finite flat group schemes and integral p-adic Hodge theory (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2,R07.4,R07.6), retaining the existing integral classification rather than duplicating it. Import Witt and divided-power carriers from the pins, crystalline comparison through PadicHodgeTheory R06.5/CohomologyComparisons, local model schemes from GeometricSatakeLocalModelsPartII and ordinary Newton/Levi theory from BunGAndNewtonStrata. Define the Zink Witt ring, displays, tensor orbit deformation ring, adapted lift and tensor isomorphism torsor with full coefficient maps. Define very goodness using the canonical comparison reduced modulo m^2+pi_E on both sides. Prove the corrected versal adapted-deformation criterion under A,B,C and the integral etale/crystalline tensor comparison using Anschütz, not the defective earlier KP18 input. Separately prove Kisin–Zhou3.4.5 under its A,B,full-fixer-equality and ordinary hypotheses: construct a height-one Breuil–Kisin lift with central Levi filtration, prove adaptedness and lift the entire J_b(Q_p) action in the isogeny category. Do not assert uniqueness or an action by integral automorphisms. Close G-display and the tensor normalization gate before exporting these statements.

Items: D01, D02, D03, D04, D05, D06, D07, D08, D09, D10, D11, D12, D13, D14, D15, D16, D18, D19, D20.

#### Route 8: ShimuraVarietiesHondaTatePartII

Reuse the same candidate continuation proposed by PAPER-KISIN-MADAPUSIPERA-SHIN-22; that merged checkpoint is not an accepted supplier. This source adds strongly acceptable integral stacks, ordinary special lifts, common rational Frobenius classes and the abelian application. Merge the briefs at design intake, without creating a competing integral Shimura roadmap.

Extend Complex Shimura varieties and canonical models (ShimuraVarieties V4–V8) using the existing candidate ShimuraVarietiesHondaTatePartII from the KMPS22 extraction. Import ShimuraData D3–D5, PELModuli integral Siegel moduli, AutomorphicBundles B1 tensors, AbelianSchemesAndArithmeticModuli A4 Serre–Tate, and the two local-model/tensor-deformation continuations in this extraction. Define strongly acceptable triples with the induced central tori and very-special parahoric condition, and retain non-neat quotient stacks. Construct integral models, their corrected auxiliary Hodge cover, component-group semidirect quotients, adjoint local-model diagram and precise functoriality. Prove Kisin–Zhou4.4.6: at p>2 every mu-ordinary point has a special-point lift carrying I_x(Q) in the isogeny category. Prove density with the stated ordinary-existence and normality hypotheses. Import same-field local-model curves, the rational-point stack atlas and finite-field Bertini, and prove the Shimura curve corollary. Import Chin companions from GlobalShtukasAndFunctionFieldLanglands GS.6 and curve recognition through ArithmeticGaloisRepresentations R01.5 with DeligneWeightsAndPurity DWP.3. Deduce Theorem 5.1.4, a common point of Conj_G(Q) for all ell different from p. Then construct the totally-real diagonal-multiplier and central-product enlargement and the finite extension with residue degree1 to prove Theorem 6.2.7 for good-reduction abelian varieties after the common finite Mumford–Tate factorization extension. No Mumford–Tate conjecture, type-D exclusion, ell=p assertion or bad-reduction theorem is part of this target. Import quotient descent and the optional rational-representative refinement from ReductiveGroupsArithmeticPartII. Close every source gate listed in the report before claiming completion.

Items: P15, S01, S02, S03, S04, S05, S06, S07, S08, S09, S10, S11, S12, S13, S14, S15, S16, S17, S18, S19, S21, S22, S23, S24, S25, S26, S27, S28, S29, S30, S31, S32, S33, S34, S35, S36, S37, S38, S39, S40, C12, E01, E03, E08, E11, E15, A05, A07, A08, A09, A11, A12, S41, S42, S43, S44.

#### Route 9: ReductiveGroupsArithmeticPartII

Reuse the KMPS22 candidate for global arithmetic conjugacy. ET.0 already owns rational/stable conjugacy and cohomological parameterization; import it. This route adds the invariant quotient scheme, representation separation, rational descent, Mumford–Tate comparison and the exact elliptic representative refinement, without duplicating ET.0 or RG2 local theory.

Build on Reductive algebraic groups (tauceti:TauCetiRoadmap/ReductiveGroups), retaining the candidate ReductiveGroupsArithmeticPartII already proposed by PAPER-KISIN-MADAPUSIPERA-SHIN-22. Import stable/rational conjugacy, inner twists and group-specific cohomological parameterization from EndoscopicTransferAndUnitaryTraceComparison ET.0; local parahorics remain ReductiveGroupsPartII. Construct Conj_G=Spec O(G)^G, T/W and the finite map to a faithful representation quotient. Prove separation by all algebraic representations, including the reductive extension of Steinberg6.6, and prove the Chebotarev residue-field descent with the explicit finite-coset derangement lemma supplied by Mathlib Burnside. Construct the Mumford–Tate and absolute-Hodge comparison interfaces and Galois-equivariant quotient injections for diagonal restriction and central products. For the common abelian Frobenius class prove a real elliptic lift using a SEMISIMPLE representative. Under G_der simply connected and G_Qp quasi-split, prove Kisin–Zhou6.3.4 through the precise Kottwitz90 patching argument: a rational elliptic representative agrees over Q_ell for all but at most one ell different from p. The exceptional prime can be selected from a positive-density set but the representative may change. Do not identify quotient rationality with rational conjugacy or infer the conjectural strengthening without these restrictions.

Items: E02, E09, E12, E13, E14, A01, A02, A03, A04, A10, A13, A14, A15.

#### Route 10: RootSystemsDominancePartII

Extend the existing proposed owner for integral dominance by the reusable finite diagram-folding and invariant-step proof. Upstream RootSystems supplies classification; LieHighestWeight supplies lattice interfaces; Mathlib supplies the obtuse-sum and simple-pairing leaves.

Build on Root systems (tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems), importing its finite reduced crystallographic root data, bases, positive roots and chamber API, including pinned dominant representatives and Bruhat carriers where they match. Define or reuse the nonnegative INTEGRAL coroot dominance order, distinguish it from rational dominance, and prove the exact Stembridge step in Rapoport00 Lemma 2.3: between distinct comparable dominant integral cocharacters one can add a positive coroot while staying dominant and below the upper endpoint. Decompose the maximal eligible coroot proof into the root-sum and simple-pairing lemmas it uses. Test PGL2 parity and rank-two examples. Export this one generic lemma to the local-model curve proof; that consumer must separately establish its Frobenius-orbit sum strengthening. Do not duplicate the upstream chamber or root-lowering construction. This continuation also proves invariant dominance by folding the COROOT root system: use Stembridge2008 only when simple orbits are orthogonal; treat adjacent A_(2n) explicitly by the B_n coordinate roots f_i and f_i±f_j. Reduce component permutations and non-simply-laced return maps using the upstream finite Dynkin classification, not a second classification. Prove integer pairing and cone transport before applying the ordinary Stembridge lemma to the folded datum. Export the existential orbit-sum choice; it does not justify summing arbitrary individually allowable steps.

Items: C03, C14, C15, C16, C17, C18, C19, C25.

#### Route 11: LefschetzFiniteFieldBertiniPartII

LPV.3 permits a field extension; the consumer needs its exact rational residue field. The explicit local etale graph proof gives that additional conclusion and removes the previous unsupported application of projective Poonen3.4.

Extend Lefschetz pencils, nearby cycles and vanishing cycles (LefschetzPencilsAndVanishingCycles LPV.3) by the same-field local curve supplier needed in Kisin–Zhou. Its first layer is elementary and does not require projective Bertini: at a smooth rational point choose an etale chart, contain the image of the proper boundary in V(h), and pull back the graph T -> (T,T^B,...), choosing B larger than every individual exponent of h. Prove support-exponent injectivity, retain the rational marked component, and use etale openness and the smooth rational-point criterion for geometric integrality. Import standard-smooth coordinates and dimension/component lemmas from SchemeAndStackFoundations SF.0 and pinned etale base change. Handle dimension zero by a constant map from A1. Export C11 over the original field. Do not infer a projective curve, a multipoint curve, or a Lefschetz pencil from this local statement. Poonen3.4 remains a projective comparison source; its stronger global theorem is not a dependency of this local repair.

Items: C11, C20, C24.

#### Route 12: SchemeAndStackFoundations

SF.0 owns smooth and etale scheme morphisms and their local coordinate geometry. Add the precise standard-smooth coordinate and boundary/component lemmas needed by the local curve proof; the reusable curve selection remains in the existing finite-field curve continuation.

Existing stages: SchemeAndStackFoundations:SF.0.

Items: C21, C22, C23.

### Source findings in the inspected preprint

All findings have the full section-18 fields in `sourceIssues`: exact locator, printed expression, correction, reason, reach and searched sources. The publisher landing page, arXiv history/current bytes, author access attempts and a bounded erratum search produced no located correction. The author PDF failed TLS verification; the author homepage timed out; no verification was disabled. The earlier guessed publisher PDF URL returned 404. “New” records that bounded search, not a claim of priority. None has an independent-review verdict.

- **E1 — misprint; affects nothing.** arXiv2103.09945v2, p9,§2.2.2; final Annals text not compared. Replace the final sigma(w) with sigma(u). Twisted conjugation acts by u^-1 w sigma(u). For sigma=id,w=1 in the cyclic groupC3, the printed set is allC3, whereas the conjugacy class is {1}; the preceding B(G) definition uses the correct variable.
- **E2 — misprint; affects nothing.** arXiv2103.09945v2, p23,§3.2.5, reference to Definition3.1.6; final Annals text not compared. Use property(2), the closed immersion of local models. Definition3.1.6 onp19 has only clauses(1),(2); clause(2) is exactly the asserted good-embedding condition.
- **E3 — misprint; affects the proof.** arXiv2103.09945v2, p23,§3.2.5, canonical comparison c; final Annals text not compared. Reduce the right side to W_hat(A_G/a_G) as well, with the same coefficient maps. The left module is over the quotient Witt coefficient ring, and the next tensor-preservation condition compares the reduced tensors. The previously read KPZv1 equation5.2.1 gives both sides over the quotient.
- **E4 — misprint; affects the proof.** arXiv2103.09945v2, p25,equation(3.3.2.1) and its following tensor label; final Annals text not compared. Tensor the etale Tate lattice over Z_p. The tensors transported from that lattice are s_(alpha,et); s_(alpha,0) denotes the crystalline tensors on the target. T_p(G)^vee is a Z_p lattice, with no given breve-Z_p module structure. In§3.3.3 the induced breve-Z_p isomorphism explicitly transports s_(alpha,et) to s_(alpha,0). Keep the crystalline lift tilde-s on the right.
- **E5 — misprint; affects a stated result.** arXiv2103.09945v2, p34,Proposition4.2.3(5); final Annals text not compared. Use torsion-free. The immediately following Lemma4.2.4 requires torsion-free coinvariants, as does the later application. KPZv1 Proposition7.2.18(5), already read in the preceding checkpoint, supplies the torsion-free output. The extracted S19 already uses this corrected contract.
- **E6 — misprint; affects a stated result.** arXiv2103.09945v2, p48,§5.2.1, integral dominance; final Annals text not compared. Require a nonnegative integral linear combination of positive coroots. Without nonnegativity both a nonzero coroot and its negative belong to the integer span, giving both comparison directions for distinct dominant endpoints (e.g.0 and2 in PGL2). The Bruhat-compatible order requires the positive integral cone.
- **E7 — misprint; affects a stated result.** arXiv2103.09945v2, p52,Lemma5.2.5, hypothesis on t_lambda; final Annals text not compared. Use t_lambda in G(F_q((t))) for the loop element; the conjugator g remains in the positive-loop parahoric. The earlier proof onp49 chooses a loop-field lift, andp52 conjugates integral subgroups inside the loop field. Requiring a nontrivial torus translation to be integral would exclude the needed stratum representatives.
- **E8 — misprint; affects the proof.** arXiv2103.09945v2, p55,§6.1.1, Hodge types of Betti cohomology; final Annals text not compared. For the stated H^1 and the dual Tate comparison in§6.1.3, use cohomological types ((1,0),(0,1)). If choosing H_1 instead, change the realization and dual conventions consistently throughout. The negative types belong to homology. The displayed§6.1.3 comparison is with T_l(A)^vee, hence cohomology. This local type correction does not settle the entire geometric-Frobenius/multiplier convention gate.
- **E9 — misprint; affects the proof.** arXiv2103.09945v2, p58,proof of Lemma6.2.6(2), diagonal conjugacy; final Annals text not compared. The premise is h^-1 g h=gprime and its first-coordinate consequence is h_1^-1 g h_1=gprime. Both errors disappear by projecting the diagonal tuple conjugacy equation to the first factor. The existence of a conjugator and the quotient injection remain valid.
- **E10 — error; affects the proof.** arXiv2103.09945v2, p60,proof of Lemma6.3.3, compactness step; final Annals text not compared. Choose a SEMISIMPLE lift of the quotient class before deducing compactness from unit-modulus eigenvalues; carry the central rescaling through the subsequent lift. The unipotent matrix [[1,1],[0,1]] has eigenvalues1 and maps to the identity semisimple quotient class, but its nth power has upper-right entryn and is unbounded. Thus arbitrary lifts do not satisfy the stated compactness inference. This is a proof qualification, not a counterexample to the real elliptic representative theorem.
- **E11 — gap; affects the proof.** arXiv2103.09945v2, p53,proof of Corollary5.2.7; repeated onp54; final Annals text not compared. Supply the local smooth-chart curve argument C20–C24, or a proved reduction to the projective hypotheses of that corollary. The cited Poonen statement assumes a smooth projective geometrically integral ambient variety; the obtained Y is only a smooth scheme chart. The etale polynomial graph proof given here establishes exactly the needed one-point/dense-open conclusion over the original field. It does not prove a projective or multipoint Bertini theorem.
- **E12 — gap; affects the proof.** arXiv2103.09945v2, pp49–50,proof of Proposition5.2.3, choice of orbit sum; final Annals text not compared. Choose the coroot orbit by applying the ordinary dominance step to the folded coroot root system, with integral/chamber transport and the adjacent-even-A case checked. C14–C19 supply that finite combinatorial proof; the BT relative-root normalization remains G-roots. Separate upper bounds cannot in general be added while retaining the same upper bound. In A4 with reversal, lambda simple pairings(1,0,0,1), mu-lambda=(1,1,1,1), alpha=(1,1,1,0), both individual steps are dominant and bounded, but their sum(1,2,2,1) exceeds the difference. This tests only the generic inference; no claim is made that these endpoints satisfy the paper's minuscule local-model hypotheses. An existential suitable orbit does exist and is proved here.
- **E13 — misprint; affects nothing.** arXiv2103.09945v2, p59,proof of Theorem6.2.7, auxiliary level and special fiber; final Annals text not compared. Use K_1^p subset H_1(A_f^p) containing the image of K^p, and S_(K_1)(H_1,X_1) for the reduction. The ambient Shimura datum and p-level have already changed to H_1 and K_(1,p). The point is in Sh_(K_1)(H_1,X_1), and the immediately following sentence names its integral model with K_1.
- **E14 — gap; affects the proof.** arXiv2103.09945v2, p60,proof of Lemma6.3.3, last sentence; final Annals text not compared. Prove a real lift with the required semisimple quotient class, then multiply back by the central element z used to define gamma_1. An arbitrary real lift of the image in G/w(G_m) does not suffice. Multiplying a lift by a nontrivial element of w(G_m)(R) preserves its image in the quotient but can change its class in Conj_G. For example scalar matrices in GL2 all map to the identity of PGL2 while their eigenvalues differ. The necessary compatible real lift and central rescaling remain in G-global; no counterexample to the stated elliptic-representative theorem is asserted.

### Remaining source gates

- **G-version**: Fresh arxivv2 bytes are unchanged, all63 pages reread. SourceIssues now records image-confirmed slips and proof qualifications, with proposed corrections; the final Annals November2024 revision has not been acquired and KPZ locator reconciliation remains. Do not certify these preprint findings as present in the final publication.
- **G-local**: Read and decompose He14,He16,He–Nie18,He–Rapoport17,He–Zhou20 and Haines–Rapoport08 at the cited results. Prove the straight-representative/length, ordinary existence, integral conjugacy and full-fixer component adapters. Keep maximal acceptable class distinct from mu-ordinary in inner forms.
- **G-neron**: Expand the torus Neron lft/finite-type/identity models, schematic closure and R-smoothness using Edixhoven/BLR and the exact KP18/BT root charts. Verify component kernels and fppf exactness, and the rank-one SU3 closed embedding beyond the explicit primitive SL2 lattice check.
- **G-models**: Read the precise KPZ,AGLR,FHLR,Levin and Scholze–Weinstein theorems proving local-model scheme representability, reducedness, normal/Cohen–Macaulay components, good embeddings and globally very good covers. KPZ v1 pp52–53,82–84 were read selectively, not its full proof. Resolve numbering changes and the ordinary-smooth implies very-good citation.
- **G-display**: Extract all display axioms and Zink classification, Anschütz Proposition 10.3, and Kisin10 height-one equivalence. Verify tensor torsor triviality and the canonical mod-a section, then the distinct direct central-filtration Breuil–Kisin construction. D04 remains a consumer contract until its source axioms are expanded.
- **G-tensors**: Complete Deligne absolute-Hodge, Blasius–Wintenberger, KMPS singular-base tensor extension and rank/centralizer suppliers. Reconcile integral etale/crystalline tensor normalizations and prove the rational group/action comparisons. A merged KMPS checkpoint is evidence of a candidate owner, not a proved import.
- **G-components**: Continue KP18 §4.5.6 and§4.6 and KPZ component descent beyond the star-product definition actually read. Prove topology, closure, group action, finite coset J, reflex-field unramified descent and all component transport maps. Split the multi-step action/gluing proofs to declaration size.
- **G-functoriality**: Acquire Pappas–Rapoport canonical integral-model/shtuka results and the exact completed-local identification theorem. Prove the extension maps, derived-isomorphism completion comparison, neutral component isomorphism and matched-multiplier fiber-product compatibility; avoid substituting a derived isogeny.
- **G-roots**: The ordinary and finite sigma-invariant dominance lemmas now have proof graphs C03,C14–C19, including even-A adjacent folding. Remaining: identify the Sigma-coroot orbit coweight with the short relative-root rank-one subgroup and its affine flag translation, using the exact BT84 §4.1.4 normalization. Do not treat the finite Dynkin calculation as this valued-root theorem.
- **G-curves**: C11 now has an explicit same-field etale graph proof C20–C24, removing the Poonen projectivity mismatch. Remaining: rank-one flag closed embedding, generic stratum membership, Lang lifting through connected finite-type stabilizer/congruence quotients, and compatibility with the adjoint local-model diagram. C10 retains the independent rational-object stack atlas gate.
- **G-stacks**: Read LMB Theorem 6.3 with its exact hypotheses and construct the smooth scheme atlas carrying the specified F_q-rational object. Prove quotient-stack level descent and the residue-degree-one realization; coarse points do not suffice.
- **G-companions**: Chin04 §2.1 and§§4.2–4.6 were read; complete its prerequisite§4.1 and the exact Laurent Lafforgue theorem, determinant twisting and coefficient-field descent. Import DWP.3 finite-field closed-point density and R01.5 semisimple recognition. Verify that E08 gives plainness at every non-p valuation, not merely at one coefficient place.
- **G-global**: Complete invariant-quotient construction/finiteness, the reductive extension of Steinberg6.6, number-field Chebotarev, totally-real approximation/Krasner, rational torus transfer, and Langlands–Rapoport5.6/Kottwitz90 p188. Choose a semisimple lift for the compact-form argument and retain the one-prime exception.
- **G-weights**: Pin the dual Tate versus H^1, geometric versus arithmetic Frobenius and multiplier conventions. Import the actual DWP.1 abelian Weil/Rosati theorem and prove preservation of non-p units under all algebraic representation operations.

### Acquisition, validation and handoff

- [cambridge](https://www.dpmms.cam.ac.uk/~rz240/l-indep_v2.pdf): TLS certificate verification failed; no PDF acquired.
- [arxiv](https://arxiv.org/pdf/2103.09945v2): All63 pages freshly read including references. Images19,9,23,25,34,48,49,50,52,53,55,58,59,60 inspected; bytes match prior hash. SHA-256 `62d26eb931f271404c333c4b9a929e85239222788834cf16dcec1dff230c34c8`.
- [published](https://annals.math.princeton.edu/wp-content/uploads/annals-v202-n3-p03-p.pdf): Guessed publisher PDF URL returned404. Publisher landing-page metadata and arXiv identity agree; final text has NOT been compared.
- [chin](https://arxiv.org/pdf/math/0206147): PDF pages 5,11,12,13 read: definition of plainness,§§4.2–4.6 and beginning of§5. The rest was not read. SHA-256 `c0e3b107c6c5e8067bc01208e7bdea8c4196387c91bf74afa21c6c6baa0b3e40`.
- [poonen](https://math.mit.edu/~poonen/papers/bertini.pdf): Previously acquired PDF pp1–3,10–11 read this continuation; original Theorem1.2 proof not read. Its projective Corollary3.4 is a comparison source, not a prerequisite of the new local etale proof. SHA-256 `52bbee7fc56a181b5c745d729a9125e4bfd702a5a860058043874bfba0d17e9d`.
- [steinberg](https://www.numdam.org/item/PMIHES_1965__25__49_0.pdf): PDF pages16–17 read: printed pp65/64 in scan order,Corollary 6.6 and surrounding invariant-quotient discussion. The reductive central-torus extension was not independently sourced. SHA-256 `bda20c4a4b3cf4a7e9e5b17a4eacd0147d0c9370063ab3a3778114a53c8349b9`.
- [kpz](https://arxiv.org/pdf/2409.03689v1): arXiv2409.03689v1. PDF pages44,52,53,82,83,84 read. The earlier attempted4.3.9 locator is different in this version; it does not verify KZ ordinary-smooth citation. The full 88-page paper was not read. SHA-256 `b508c1ea29f8c8aeeb656ee0af95851af08d8e2ef381fef4462133db772dc8fe`.
- [rapoport](https://www.math.uni-bonn.de/people/rapoport/myalggeom/preprints/satake.pdf): Previously acquired PDF pp5–6 (printed157–158) freshly reread, including the complete Waldspurger proof of Lemma2.3. No claim of full14-page read. SHA-256 `8dfb39087041244845bb0fdd57cdd52c1bda3d70b8eebc02711df7cb90d2f71d`.
- [kp18](https://www.numdam.org/item/10.1007/s10240-018-0100-0.pdf): Published Numdam PDF page75 (printed195),§4.5.6 star-product definition and surrounding action discussion read. Other 97 pages not read. SHA-256 `e2b4a0763f216be82da950f4c0dd2800adea8a0d911b12bfacf2b7e493b4618b`.
- [stembridge-folding-2008](https://websites.umich.edu/~jrs/papers/folding.pdf): All4 pages read through web PDF extraction on2026-09-23, especially condition(1),Claims1,3,4 and their proofs. The direct download returned403, so no local PDF hash is asserted.
- [stacks-054L](https://stacks.math.columbia.edu/tag/054L): statement and proof SHA-256 `7db38acd7659e6f9009849fedabc267a7bce5c128c9d800ec46ea93409b15013`.
- [stacks-0CDW](https://stacks.math.columbia.edu/tag/0CDW): statement and proof SHA-256 `12e232b5ac61fcdae41b78a44c142231467860f75e4a58d52446882e8e959794`.

The semantic checker verifies ID preservation, the acyclic item graph, one route per missing item, API/test coverage, source-issue shape, exact pinned statement slices, input hashes and real atlas stages. The paper and intake path checks pass. The embedded exact Python script runs independently; its 85,551 assertions cover eleven folded root systems, 7,908 admissible endpoint pairs, dominance transport, positive root lifts, the rejected arbitrary-sum inference, bounded exponent encoding, finite-field line traps and selected source corrections. These finite checks support the separately written general proofs; they do not replace them. The nine inherited exact checks were also rerun.

The 276 API tests are specifications. No Lean file was authorized, written or compiled. The complete supplier closure still needs the listed gates. Resume with final-text comparison and the BT/local-model/stack adapters; preserve the finite folding and local étale curve work rather than extracting the same contracts again.

### Item index

| ID | Item | Status |
|---|---|---|
| L01 | Witt-vector coefficient carrier | library |
| L02 | Frobenius on the Witt fraction field | library |
| L03 | Point-valued isocrystal | library |
| L04 | Morphism of point-valued isocrystals | library |
| L05 | Rank-one isocrystal classification | library |
| L06 | Connected reductive group predicate | library |
| L07 | Algebraic torus predicate | library |
| L08 | Geometric character lattice | library |
| L09 | Cocharacter lattice and pairing | library |
| L10 | Perfect character-cocharacter pairing | library |
| L11 | Closed dominant chamber of a root pairing | library |
| L12 | Unique dominant representative in a Weyl orbit | library |
| L13 | Abelian variety over a field | library |
| L14 | Geometric isogeny | library |
| L15 | Divided-power structure | library |
| L16 | Finite free cocharacter lattice | library |
| L17 | Galois invariance of the pairing | library |
| L18 | Coxeter Bruhat order | library |
| L19 | Burnside fixed-point count | library |
| P01 | Hodge-type Shimura datum | planned |
| P02 | Reflex field and generic canonical tower | planned |
| P03 | Contravariant Dieudonne module | planned |
| P04 | Height-one Breuil–Kisin module | planned |
| P05 | Barsotti–Tate classification | planned |
| P06 | Serre–Tate deformation | planned |
| P07 | Integral crystalline and etale comparison | planned |
| P08 | Absolute Hodge tensors | planned |
| P09 | General algebraic quotient stacks | planned |
| P10 | Affine Weil restriction | planned |
| P11 | Finite-field abelian Frobenius weights | planned |
| P12 | Rational and stable conjugacy | planned |
| P13 | Semisimple Frobenius recognition | planned |
| P14 | Finite-dimensional isocrystal slopes | planned |
| P15 | Rank of the tensor isogeny group | missing |
| N01 | Iwahori–Weyl group | planned |
| N02 | Iwahori–Weyl exact sequences | missing |
| N03 | Algebraic fundamental group and Kottwitz invariant | planned |
| N04 | Affine and linear Frobenius actions | missing |
| N05 | Affine-root Coxeter and translation length | planned |
| N06 | Translation length formula | missing |
| N07 | Newton point of an extended Weyl element | missing |
| N08 | Sigma-straight element | missing |
| N09 | Newton criterion for straightness | missing |
| N10 | Newton centralizer Levi | missing |
| N11 | Straight translation has central Levi cocharacter | missing |
| N12 | Centrality of an absolute cocharacter lift | missing |
| N13 | Mu-admissible set | missing |
| N14 | Sigma-conjugacy classes B(G) | planned |
| N15 | Straight Weyl classes classify B(G) | missing |
| N16 | Acceptable Newton set B(G,mu) | planned |
| N17 | Mu-ordinary class | missing |
| N18 | Unique maximum versus ordinary existence | missing |
| N19 | Straight translation representative of the ordinary class | missing |
| N20 | Ordinary existence under a derived isogeny | missing |
| N21 | Ordinary membership under a derived isogeny | missing |
| N22 | Full fixer and connected parahoric | planned |
| N23 | Associated parahorics under adjoint identification | missing |
| N24 | Parahoric Iwahori decomposition | planned |
| N25 | Ordinary admissible element lies in a translation cell | missing |
| N26 | Integral conjugacy of an ordinary admissible element | missing |
| R01 | Neron lft model of a torus | missing |
| R02 | Finite-type and identity torus submodels | missing |
| R03 | Torus closure in a split restriction model | missing |
| R04 | R-smooth torus | missing |
| R05 | Closed immersion of Neron lft models | missing |
| R06 | Closed immersion of finite-type torus models | missing |
| R07 | Weil restrictions of tame tori are R-smooth | missing |
| R08 | R-smoothness under torus extensions | missing |
| R09 | Closed fixer embedding with equal derived groups | missing |
| R10 | Fixer embedding after field extension | missing |
| R11 | Primitive root-lattice embedding in rank one | missing |
| R12 | Integral kernel of a central torus quotient | missing |
| R13 | Smooth fppf exact parahoric quotient | missing |
| M01 | Local model triple | missing |
| M02 | Acceptable reductive group | missing |
| M03 | Local Hodge embedding | missing |
| M04 | Integral local model | missing |
| M05 | Local-model strata and components | missing |
| M06 | Good integral Hodge embedding | missing |
| M07 | Existence of a good integral embedding | missing |
| M08 | Closed local-model map under Weil restriction | missing |
| M09 | Trace symplectic embedding | missing |
| M10 | Admissible lattice criterion | missing |
| D01 | Dieudonne tensors and Hodge lattice | missing |
| D02 | Tensor orbit deformation ring | missing |
| D03 | Zink Witt ring and augmentation ideal | missing |
| D04 | Display of a p-divisible group | missing |
| D05 | Adapted deformation | missing |
| D06 | Frobenius-image tensor torsor | missing |
| D07 | Very good integral embedding | missing |
| D08 | Independence of defining tensors in very goodness | missing |
| D09 | Tensor-preserving display section | missing |
| D10 | Versal adapted deformation criterion | missing |
| D11 | Integral crystalline tensors and trivialization | missing |
| D12 | Generic filtration comes from a group cocharacter | missing |
| D13 | Cocharacter filtration lifts the special filtration | missing |
| D14 | Adaptedness recognition from comparison tensors | missing |
| D15 | Ordinary Levi has connected fixer | missing |
| D16 | Central cocharacter filtration reduces correctly | missing |
| D17 | Sigma-centralizer and its isogeny action | planned |
| D18 | Ordinary central-filtration Breuil–Kisin lift | missing |
| D19 | Ordinary adapted lift exists | missing |
| D20 | Entire sigma-centralizer action lifts rationally | missing |
| S01 | Shimura stack at non-neat level | missing |
| S02 | Normal Hodge integral model | missing |
| S03 | Global good Hodge embedding | missing |
| S04 | Lift-independent crystalline tensors | missing |
| S05 | Completed normalization branch and adapted ring | missing |
| S06 | Adapted deformation detects the chosen branch | missing |
| S07 | Tensors distinguish normalization points | missing |
| S08 | Tensor-preserving rational isogeny group | missing |
| S09 | Special lift at a very good ordinary point | missing |
| S10 | Ordinary points are very good | missing |
| S11 | Integral extension property | missing |
| S12 | Hodge local-model diagram | missing |
| S13 | Compact central torus Zc | missing |
| S14 | Strongly acceptable Shimura triple | missing |
| S15 | Auxiliary Hodge cover | missing |
| S16 | Auxiliary derived fundamental group | missing |
| S17 | Globally very good auxiliary embedding | missing |
| S18 | Auxiliary center is R-smooth and quasi-tame | missing |
| S19 | Auxiliary abelianized coinvariants are torsion-free | missing |
| S20 | Very-special fixer is connected | missing |
| S21 | Semidirect quotient star product | missing |
| S22 | Integral model from neutral components | missing |
| S23 | Strongly acceptable local singularity comparison | missing |
| S24 | Strongly acceptable DVR extension property | missing |
| S25 | Adjoint local-model diagram | missing |
| S26 | Extension of maps of Hodge integral models | missing |
| S27 | Derived-isomorphic map preserves completions | missing |
| S28 | Neutral-component integral isomorphism | missing |
| S29 | Integral Siegel map for an arbitrary Hodge embedding | missing |
| S30 | Matched-multiplier fiber product datum | missing |
| S31 | Connected fixer of the fiber product | missing |
| S32 | Good embedding of the fiber product | missing |
| S33 | Ordinary locus of the integral Shimura model | missing |
| S34 | Ordinary locus is open and dense under normality | missing |
| S35 | Product comparison of universal abelian objects | missing |
| S36 | Exact isogeny-group sequences for the fiber product | missing |
| S37 | Ordinary special-point lift for a strongly acceptable triple | missing |
| S38 | Rational isogeny action on the ordinary special lift | missing |
| S39 | Ordinary rational Frobenius representative | missing |
| S40 | Auxiliary reflex-field splitting | missing |
| C01 | Equal-characteristic local-model Schubert realization | missing |
| C02 | Integral Schubert dominance | missing |
| C03 | Stembridge positive-coroot step | missing |
| C04 | Frobenius-stable rank-one step | missing |
| C05 | Split SL2 Schubert curve | missing |
| C06 | Standard SU3 Schubert curve | missing |
| C07 | Nonstandard ramified SU3 Schubert curve | missing |
| C08 | Rational lift of a positive-loop orbit | missing |
| C09 | Same-residue-field curve in the local model | missing |
| C10 | Rational-point smooth atlas for the relevant stack | missing |
| C11 | Same-field local curve through a smooth rational point | missing |
| C12 | Same-residue-field curve on the Shimura stack | missing |
| E01 | Group-valued etale local system from the Shimura tower | missing |
| E02 | Scheme of semisimple conjugacy classes | missing |
| E03 | Frobenius quotient point | missing |
| E04 | Compatible lisse systems on a finite-field scheme | missing |
| E05 | Plain eigenvalues in characteristic p | missing |
| E06 | Constant rank-one twist | missing |
| E07 | Chin companions for plain sheaves on curves | missing |
| E08 | All algebraic representations have unit Frobenius eigenvalues | missing |
| E09 | Algebraicity of the quotient Frobenius point | missing |
| E10 | Curve recognition from an open subset | missing |
| E11 | Representation-wise Frobenius independence | missing |
| E12 | Algebraic characters separate semisimple classes | missing |
| E13 | A proper subgroup misses a conjugacy class | missing |
| E14 | Rational descent from degree-one primes | missing |
| E15 | Rational common Frobenius class on a Shimura stack | missing |
| A01 | Mumford–Tate group of an abelian variety | missing |
| A02 | Mumford–Tate group is connected reductive | missing |
| A03 | Changing complex embedding changes only the inner form | missing |
| A04 | Common finite field of Galois factorization | missing |
| A05 | Diagonal-multiplier restriction datum | missing |
| A06 | A compact element becomes hyperspecial-integral | missing |
| A07 | Totally real field with the needed local extension | missing |
| A08 | Central-product strongly acceptable enlargement | missing |
| A09 | The enlargement is strongly acceptable | missing |
| A10 | Injective Galois-equivariant conjugacy quotient map | missing |
| A11 | Frobenius-preserving extension and Shimura realization | missing |
| A12 | Independence of ell for abelian Frobenius classes | missing |
| A13 | Real elliptic representative of the common class | missing |
| A14 | Rational representative with one possible exceptional prime | missing |
| A15 | Choice of exceptional prime | missing |
| S41 | Adelic level-action group A(G) | missing |
| S42 | Prime-to-p integral level-action group | missing |
| S43 | Neutral adelic level-action subgroup | missing |
| S44 | Neutral integral level-action subgroup | missing |
| P16 | Closed-point Chebotarev for curves | planned |
| C13 | Closed rank-one flag embedding | missing |
| R14 | Lang surjectivity and rational torsors | missing |
| L20 | Obtuse roots have a root sum | library |
| L21 | Distinct simple roots have nonpositive pairing | library |
| L22 | Etale morphisms survive base change | library |
| L23 | Etale means smooth relative dimension zero | library |
| P17 | Finite Dynkin classification and coordinate models | planned |
| P18 | Integral lattice and dominant weight interface | planned |
| C14 | Root sums over distinct diagram orbits | missing |
| C15 | Folding with orthogonal simple-root orbits | missing |
| C16 | Adjacent folding of even A type | missing |
| C17 | Reduction of general diagram folding to components | missing |
| C18 | Invariant integral dominance equals folded dominance | missing |
| C19 | Dominant orbit-sum step | missing |
| C20 | Polynomial graph avoiding a closed subset | missing |
| C21 | Etale coordinates at a rational smooth point | missing |
| C22 | Proper boundary has a proper image closure in a coordinate chart | missing |
| C23 | The component through a smooth rational point is geometrically integral | missing |
| C24 | Pullback of an avoiding polynomial graph gives the required curve | missing |
| C25 | Integral root-cone dominance | missing |
