# Stable reduction, Part II — MC.5: Hodge determinant and integral Noether comparison

For a stable genus-g curve, the Hodge determinant and the self-pairing of the relative dualizing sheaf measure two aspects of the same geometry. Their difference is the boundary, including the thickness of each degeneration. The goal is an integral isomorphism of line bundles over the moduli stack over Z,

$$
\lambda_g^{\otimes12}\;\simeq\;
\langle\omega,\omega\rangle\otimes\mathcal O(\Delta),\qquad g\ge2.
$$

The proof has three distinct endpoints: a rational Chow computation over C, an integral equality in the universal Picard group, and a choice of actual line isomorphism whose universal ambiguity is ±1. Rational GRR alone reaches only the first endpoint.

This document retains the thirteen accepted MC.5 targets by their original IDs and adds nine support targets. The generic determinant and pairing theory is specified as an incoming foundation extension, with sources, API and tests. It is not assigned a second implementation in this moduli roadmap. All targets are mathematical specifications; none is an implementation claim.

## Conventions and imported carriers

Throughout, g,n are nonnegative integers and stable pointed stacks require 2g−2+n>0. A family is proper, flat and finitely presented, with geometrically connected nodal fibres and disjoint ordered markings in the relative smooth locus. Stability means that ω(sum of markings) is relatively ample. The Hodge bundle uses **ω without the markings**. The unpointed integral Noether comparison has g≥2.

A line on a stack X is a morphism X→BG_m, with line isomorphisms given by invertible modifications. Equivalently it is a cartesian family of actual invertible sheaves on test schemes, together with the pullback cocycle. This imports `SchemeAndStackFoundations:SF.1/line-bundle-section-stack` and its BG_m equivalence. Tensor, dual, integer powers, evaluation and cancellation act in the resulting Picard groupoid. A comparison A≅B is a map in that groupoid; [A]=[B] is a statement in its group of isomorphism classes. Automorphisms of any line are global units. This uses `SchemeAndStackFoundations:SF.3/picard-groupoid` and SF.1 descent, rather than a new line carrier.

Current upstream [AlgebraicVectorBundles, L0A–L0C](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AlgebraicVectorBundles/README.md#layers) supplies the symmetric monoidal sheaf structure and pullback, finite locally free sheaves and rank, and ordinary exterior powers and determinants. These are imports `AV-L0A`, `AV-L0B`, `AV-L0C`. They postdate the atlas stage snapshot, so the packet records their immutable upstream URLs separately; they are not invented library declarations. L0C does not supply a determinant of cohomology or a Deligne pairing.

[StableReduction, layer 2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/StableReduction/README.md#layer-2-coherent-curve-theory-duality-and-positivity) supplies the same nodal dualizing sheaf, coherent cohomology, trace and Serre duality on locally Noetherian bases. Its extension to arbitrary stable-family bases is the explicit input `NODAL-BC`; it is not obtained just by removing a hypothesis from the upstream statement. The parent normalization/dual-graph and stable-family theories are also imported through the accepted MC.0–MC.3 targets.

The fixed library baseline is Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. The actual pinned `InvertibleSheaf X`, tensor product and `LineBundleClass X` exist. The latter currently has a commutative monoid structure, not a constructed full Picard group with inverses. Its `mk_eq_mk_iff` identifies equality with existence of an underlying-sheaf isomorphism. Stack carriers and the missing dual/group structure are imported roadmap work. The reviewed parent layer-2 audit finds the coherent-curve lane not built; there is no separate reviewed MC.5 audit. Searches in both pinned and current libraries found no supplying Deligne-pairing, determinant-of-cohomology or Teichmüller-space declaration.

## Hodge bundle, determinant and clutching

These targets retain the IDs `hodge-bundle`, `hodge-determinant`, `hodge-forgetting`, `separating-hodge` and `nonseparating-hodge` under `StableReductionPartII:MC.5/`.

For f:C→M̄_g,n, set E_g,n=f_*ω. It is finite locally free of rank g, and the Hodge line is λ_g,n=∧^g E_g,n. In genus zero E is zero but λ is the tensor unit. Both have coherent arbitrary-base-change comparisons, using NODAL-BC. The ordinary determinant comes from AV-L0C; the base packet's legacy SF.5 determinant citation must be replaced by this import and stack descent.

For the forget-and-stabilize map π:M̄_g,n+1→M̄_g,n, where the target is stable, π*E_g,n≅E_g,n+1 and π*λ_g,n≅λ_g,n+1. Repeated forgetting gives the same comparison after its associativity identifications. Contracted rational components contribute no Hodge sections. [Knudsen, III](https://journals.msp.org/mscand/article/download/1623/1622/1654), §4 p. 201 and Theorem 4.1(a), p. 202, supplies the line descent and forgetting comparison; the vector-bundle statement also uses the imported normalization/duality API.

For ordered separating clutching ξ with g=g₁+g₂ and n=n₁+n₂,

$$
\xi^*E_{g,n}\simeq\operatorname{pr}_1^*E_{g_1,n_1+1}
\oplus\operatorname{pr}_2^*E_{g_2,n_2+1},\qquad
\xi^*\lambda_{g,n}\simeq\lambda_1\otimes\lambda_2.
$$

The determinant comparison concatenates wedge bases in the displayed order. Exchanging the two blocks contributes (−1)^(g₁g₂), including when the two underlying determinant lines admit the ordinary unsigned tensor symmetry. The comparison on a graph-exchange quotient must carry that action. For ordered nonseparating clutching α, the exact sequence is

$$
0\longrightarrow E_{g-1,n+2}\longrightarrow\alpha^*E_{g,n}
\xrightarrow{\operatorname{Res}_1}\mathcal O\longrightarrow0.
$$

The last map is the residue at the first branch, and gives α*λ_g,n≅λ_g−1,n+2. Exchanging branches sends Res₁ to −Res₁ and changes the equivariant quotient/determinant comparison accordingly. [Knudsen, III](https://journals.msp.org/mscand/article/download/1623/1622/1654), Theorem 4.2(a) and its normalization exact sequence, p. 203, supplies the underlying line isomorphisms. The ordered signs are fixed by the actual residue and wedge maps; they are not additional source formulas being silently quoted.

### hodge-bundle — inherited API and tests

**API.**

- **hodge_rank** (characterisation): E=f_*ω is locally free of constant rank g.
- **hodge_baseChange** (functoriality): For every base change h, h*E≅E′, with the identity/composition cocycle.
- **hodge_untwisted** (compatibility): Use ω, not ω(sum of markings); the usual Serre trace comparison is retained.

**Checks and worked examples.**

- **genus-zero-three-marks** (degenerate): On M̄_0,3 the Hodge bundle is zero; f_*ω(sum marks) has rank two and is the wrong definition.
- **genus-one** (computation): On M̄_1,1 the Hodge bundle has rank one, not the number of markings.
- **separating-two-elliptic** (computation): A genus-two fibre made from two elliptic components has Hodge space the direct sum of their one-dimensional spaces.

### hodge-determinant — inherited API and tests

**API.**

- **hodgeDet_rankZero** (simp): The determinant of the zero bundle is the trivial line.
- **hodgeDet_baseChange** (functoriality): Use AV-L0C coherent pullback and descend this comparison to the stack.
- **hodgeDet_orderedSum** (compatibility): Concatenated wedge bases determine the direct-sum determinant comparison; exchanging blocks changes it by (−1)^{g₁g₂}.

**Checks and worked examples.**

- **genus-zero-line** (degenerate): Although E has rank zero, λ has rank one and is canonically trivial.
- **one-plus-one-swap** (computation): Swapping two genus-one Hodge blocks acts by −1 before specializing to characteristic two.
- **ordered-residue** (compatibility): For nonseparating clutching, the two residue orderings differ by −1 on the quotient line, even when the underlying λ line is isomorphic in both descriptions.

**Additional clutching checks.** Forgetting one marking on M̄_0,4 preserves the zero Hodge bundle. Two elliptic components give a rank-two direct sum and exchange sign −1. A genus-zero separating block contributes sign +1. A one-loop graph adds one residue dimension in the nonseparating sequence; switching its branches negates that residue. In characteristic two the two signs have equal images, but their integral equivariant origins remain specified.

## Integral determinant and pairing: incoming foundation contracts

The generic core has no verified supplying node. The following are requirements on a proposed **SchemeAndStackFoundations, Part II**, not generic definition nodes owned by MC.5. `NoncommutativeAndEquivariantIwasawa:NE.2/determinant-functor` already owns the virtual determinant for associative rings. GDET asks for its commutative graded-line realization and sheaf descent, with a comparison to that existing virtual determinant; it does not reconstruct a virtual category or a general K-theory roadmap. GPAIR adds the unmetrized integral curve pairing. Metric and arithmetic refinements belong to the Arakelov direction.

### GDET — graded determinant of cohomology

For schemes, realize the commutative-ring virtual determinant in graded invertible sheaves, descend it from finite-projective complexes to perfect complexes and glue. For proper flat finitely presented f, perfect E has perfect Rf_*E and λ_f(E)=det Rf_*E commutes with arbitrary derived base change. Locally λ_f(E) has line ⊗_i(det P^i)^{(−1)^i} and grade Σ_i(−1)^i rank(P^i) for a finite-projective model of Rf_*E. Quasi-isomorphisms and acyclic models have the specified canonical comparisons; exact-sequence and shift comparisons retain Koszul signs. This is not the assertion that every distinguished triangle has a functorial arbitrary-triangle determinant isomorphism.

**Prerequisites for the supplier.** `AV-L0A`, `AV-L0B`, `AV-L0C`, `NoncommutativeAndEquivariantIwasawa:NE.2/determinant-functor`, `SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`.

**API.**

- **detPerfect_affine** (compatibility): On an affine and a degree-zero finite projective module, agree with AV-L0C exterior determinant, with grade equal to its rank.
- **detPerfect_acyclic** (characterisation): An acyclic perfect complex has the canonical determinant trivialization, compatible with quasi-isomorphisms.
- **detPerfect_shortExact** (functoriality): A short exact sequence of perfect complex models gives a natural additivity isomorphism with the Knudsen–Mumford coherence laws.
- **detPerfect_shift** (relation): Shifting by one inverts the graded line; the integer grade changes sign.
- **detCohomology_baseChange** (functoriality): For every S′→S, derived base change identifies pullback of λ_f(E) with λ_f′(Lh*E), with identity and composition cocycles.
- **detCohomology_duality** (compatibility): Use actual curve Serre duality to compare det Rf_*O and det Rf_*ω with the ordinary Hodge determinant; do not identify their integer grades.

**Checks and worked examples.**

- **degree-zero-rank-two** (computation): For R² in degree zero the line is ∧²R² and the grade is 2; exchanging the two standard basis vectors acts by −1.
- **identity-complex** (degenerate): For [R --id→ R] in degrees 0,1 the grade is 0 and the canonical acyclic determinant is R.
- **shifted-line** (computation): For R concentrated in degree 1 the determinant line is R∨ and its grade is −1, rather than +1.
- **nonflat-specialization** (compatibility): The required base-change map exists for Spec(F_p)→Spec(Z); requiring this map to be flat fails the contract.
- **projective-line** (computation): For P¹_R→Spec(R), λ(O(1)) is det(R²) of grade 2, while λ(O(−2)) has grade −1; these are not both H⁰ determinants.

**Sources.** [Finn Faye Knudsen; David Mumford](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1976b--DetDiv%2BKnudsenSequel-GT.pdf), §1, pp. 20–21; Lemma 2, p. 28; bounded-complex formula, pp. 30–32: Supplies graded lines, their sign symmetry and the passage from complexes to determinant data.; [Dennis Eriksson; Gerard Freixas i Montplet](https://jep.centre-mersenne.org/item/10.5802/jep.254.pdf), Propositions 4.14(2), 4.15(2), Definition 4.16, pp. 286–287: Gives the proper flat finite-presentation perfect pushforward and arbitrary-base-change range, including non-Noetherian bases.

### GPAIR — integral Deligne pairing

For f:X→S locally projective, faithfully flat, finitely presented and of pure relative dimension one, construct the integral Deligne pairing on actual line bundles, with arbitrary base change. Put d(A)=underlying line of λ_f(A). In the fixed order, ⟨L,M⟩=d(L⊗M)⊗d(O_X)⊗d(L)∨⊗d(M)∨. The determinant calculation is made in graded lines before passing to its grade-zero line. Coherent bilinearity, permutation, norm and divisor comparisons are data to prove, not consequences of an equality in K₀ or Pic⊗Q. No smoothness or Noetherian assumption is imposed.

**Prerequisites for the supplier.** `GDET`, `SchemeAndStackFoundations:SF.3/picard-groupoid`.

**API.**

- **delignePairing_detComparison** (characterisation): Use exactly the four-term determinant expression above; its Euler-characteristic grade is zero by curve Riemann–Roch.
- **delignePairing_bilinear** (structure): Tensor-product additivity in both arguments, coherent with unit, associativity, interchange and permutations.
- **delignePairing_baseChange** (functoriality): Pullback identifies the pairing with the pairing on the cartesian family for every base morphism; identity and composition comparisons satisfy descent.
- **delignePairing_relativeDivisor** (compatibility): For a relative effective Cartier divisor D finite flat over S, identify ⟨O(D),M⟩ with N_D/S(M|D). If D is empty on an open-and-closed component, the value there is the trivial line.
- **delignePairing_scalar** (relation): Multiplication by u on L acts on the pairing by u^{deg(M)} on each rank/degree component.
- **delignePairing_selfSymmetry** (relation): The canonical interchange on ⟨L,L⟩ is multiplication by (−1)^{deg(L)}. It is not always the identity.
- **delignePairing_firstChern** (compatibility): On the divisorial-scheme range of Corollary 6.9 identify the pairing class with the degree-two Chern pushforward in the graded K-group; the Chow and stack extensions are separate named needs.

**Checks and worked examples.**

- **trivial-argument** (degenerate): ⟨O_X,M⟩ has the bilinear unit trivialization; omitting the d(O_X) term breaks this normalization.
- **section-divisor** (compatibility): For a section s in the smooth locus, ⟨O(s),M⟩≅s*M by the degree-one norm; no inverse appears.
- **odd-self-symmetry** (computation): For P¹_k and L=O(1), the canonical self-interchange is −1 when char(k)≠2, even though the pairing line is one-dimensional.
- **dualizing-even-degree** (computation): For a connected stable genus-g fibre, deg(ω)=2g−2 is even, so self-interchange of ⟨ω,ω⟩ is +1.
- **base-line-degree** (compatibility): For L=f*A, identify ⟨f*A,M⟩ with A^{deg(M)}. For M=O(1) on P¹ this is A, not A∨.
- **nodal-nonflat-base-change** (compatibility): For a stable nodal family over Z and its F_p fibre, the integral pairing specializes; a smooth-family-only or flat-base-change-only definition fails.
- **finite-flat-norm** (computation): For a relative divisor of degree two, multiplication by u on M acts by u² on its norm pairing, not by u.

**Sources.** [Pierre Deligne](https://publications.ias.edu/sites/default/files/Number58.pdf), Construction 7.2, (7.2.1), pp. 147–149; §7.4, p. 150: Gives the rank-zero determinant expression and the coherent bilinear comparison for proper flat curves, beyond the smooth discussion in §6.; [Dennis Eriksson; Gerard Freixas i Montplet](https://jep.centre-mersenne.org/item/10.5802/jep.254.pdf), Definition 1.1, p. 258; (6.3), Proposition 6.1, Remark 6.2, pp. 310–312: Supplies the locally projective arbitrary-base version and the sign, scalar and relative-divisor laws.

For the Deligne pairing the four-determinant formula must be interpreted before forgetting the grading:

$$
\langle L,M\rangle_f =
 d_f(L\otimes M)\otimes d_f(\mathcal O_C)
 \otimes d_f(L)^{\vee}\otimes d_f(M)^{\vee}.
$$

The locally constant grade is zero. Nevertheless its canonical permutation map need not be the ordinary identity on an equal argument: the self-interchange on ⟨L,L⟩ is (−1)^deg(L). For the dualizing line the degree is 2g−2, so that map is +1. A construction which forgets all determinant signs before producing these comparison maps fails the odd-degree test.

Deligne's smooth discussion in §6 is not used to assert a theorem about all nodal families. Construction 7.2, pp. 147–149, and Eriksson–Freixas i Montplet's arbitrary-base construction supply the required range. The latter's locally projective condition is Zariski-local on the base and stable under every base change; it does not require a Noetherian base. A relative effective Cartier divisor in the norm law must be flat over the base. An arbitrary vertical divisor is not substituted into that law.

## Universal pairing and the Noether obstruction

### Dualizing Deligne pairing

Declaration: `StableReductionPartII:MC.5/universal-dualizing-pairing` (construction).

For g≥2 and f:C→M̄_g over Z, construct P_g=⟨ω_f,ω_f⟩ as a line object on M̄_g. Precisely, P_g is a cartesian assignment to each T-valued stable curve of the GPAIR line ⟨ω_C/T,ω_C/T⟩ in the core of InvertibleSheaf T, together with base-change isomorphisms and their cocycle. Equivalently it is a 1-morphism M̄_g→BG_m, using the existing line-stack equivalence. Its tensor operations and isomorphisms occur in this Picard groupoid, not in its set of isomorphism classes.

**Hypotheses.** g≥2; universal unpointed stable curve; untwisted relative dualizing sheaf. GDET/GPAIR and the arbitrary-base nodal-dualizing extension in gap NODAL-BC are supplied.

**Construction or proof.**

1. On a scheme chart use the parent stable-curve dualizing line, local projectivity of a stable curve and the integral GPAIR construction.
2. Its canonical base-change comparisons, and the dualizing base-change maps, give descent along the chart groupoid.
3. Apply SF.1 line-stack equivalence and effective descent to obtain a line on the stack; verify identity, composition and 2-isomorphism invariance.

**API.**

- **dualizingPairing_onChart** (characterisation): For x:T→M̄_g, x*P_g≅⟨ω_Cx/T,ω_Cx/T⟩, with its actual four-determinant expression.
- **dualizingPairing_pullback** (functoriality): The chart comparison is coherent for arbitrary T′→T, for identities/composites, and for isomorphisms of stable families.
- **dualizingPairing_selfSwap** (relation): The canonical self-interchange is +1 because the dualizing degree is 2g−2, including nodal fibres.
- **dualizingPairing_schemeCarrier** (compatibility): On a scheme chart the value belongs to the core of the pinned InvertibleSheaf category, via SF.1’s BG_m equivalence, not merely to LineBundleClass.

**Checks and worked examples.**

- **constant-genus-two** (compatibility): For a fixed stable genus-two curve C/k pulled to S, P is the pullback of the one-dimensional k-line ⟨ω_C,ω_C⟩; the degree for self-symmetry is 2.
- **boundary-point** (non-example): A stable nodal genus-two curve over k has a pairing line; restricting this construction to smooth curves fails.
- **closed-characteristic-p** (compatibility): Base change along Spec(F_p)→Spec(Z), which is not flat, preserves the stated chart comparison.
- **self-interchange** (computation): For every g≥2 the self-swap is +1; replacing ω by an arbitrary odd-degree line does not justify this conclusion.

**Sources.** [Xinyi Yuan](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), Theorem 3.3, §3.1.1, p. 42; §3.1.2, pp. 42–43: Uses the universal relative-dualizing pairing and its classifying pullback.; [Dennis Eriksson; Gerard Freixas i Montplet](https://jep.centre-mersenne.org/item/10.5802/jep.254.pdf), (6.3), Proposition 6.1, pp. 310–312: Supplies the actual line-valued chart construction and coherent arbitrary base change, permitting effective descent.

**Prerequisites.** `StableReductionPartII:MC.5/hodge-bundle`, `SchemeAndStackFoundations:SF.1/line-bundle-section-stack`, `SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`, `SchemeAndStackFoundations:SF.3/picard-groupoid`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `StableReductionPartII:key/moduli-curves`.

Current upstream imports: `AV-L0A`, `AV-L0B`.

Unresolved supplier inputs: `GDET`, `GPAIR`, `NODAL-BC`.

**Acceptance.**

- A chartwise line plus class equality is insufficient: its actual comparison morphisms satisfy the groupoid cocycle.
- Specialization to a nodal F_p-valued stable curve is admitted.
- The universal line is independent, up to the specified coherent isomorphism, of a choice of chart.

### Hodge determinant and derived direct image

Declaration: `StableReductionPartII:MC.5/hodge-determinant-cohomology` (comparison).

For a proper stable family f:C→S of connected arithmetic genus g, let E=f_*ω and λ=det E. There are natural underlying-line isomorphisms d_f(ω)≅λ and d_f(O_C)≅λ, coherent with arbitrary base change. In graded lines their integer degrees are respectively g−1 and 1−g; these grades are not silently identified with the ordinary rank-g determinant grading.

**Hypotheses.** S a scheme chart of the stable stack, including arbitrary base via NODAL-BC. Relative trace R¹f_*ω≅O_S and Serre duality R¹f_*O≅E∨, with f_*O≅O_S.

**Construction or proof.**

1. Use the parent connected-nodal cohomology and duality contracts to identify the two cohomology sheaves in degrees zero and one.
2. Compute the alternating determinant, retaining the trace trivialization and canonical double-dual comparison.
3. Transport the identifications along derived base change; check the equality of grades and descent separately from the underlying line.

**Sources.** [Finn Faye Knudsen](https://journals.msp.org/mscand/article/download/1623/1622/1654), §4, definitions (a)–(b), p. 201; Theorem 4.1 proof, p. 202: Defines the Hodge line by the derived determinant and compares the O and dualizing determinants using curve duality.; [David Mumford](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1977a--StabilityLecturesIHES-Swiss.pdf), Definition 5.9 and Theorem 5.10, pp. 100–102: Uses the determinant of the derived direct image for the Hodge and pluricanonical lines.; [Dennis Eriksson; Gerard Freixas i Montplet](https://jep.centre-mersenne.org/item/10.5802/jep.254.pdf), Definition 4.16, p. 287: Specifies the graded determinant-of-cohomology convention used in the comparison.

**Prerequisites.** `StableReductionPartII:MC.5/hodge-bundle`, `StableReductionPartII:MC.5/hodge-determinant`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `SchemeAndStackFoundations:SF.3/picard-groupoid`.

Current upstream imports: `AV-L0B`, `AV-L0C`.

Unresolved supplier inputs: `GDET`, `NODAL-BC`.

**Acceptance.**

- For g=0 on a stable pointed genus-zero family, both underlying lines are trivial but the two derived grades are −1 and +1.
- For a smooth genus-one family, both derived grades are zero while E has rank one.
- R¹f_*ω cannot be omitted from the determinant formula.

### Noether defect line

Declaration: `StableReductionPartII:MC.5/noether-defect-line` (definition).

For g≥2 define the line N_g=λ_g^{⊗12}⊗P_g∨⊗O(−Δ) as an object of the line Picard groupoid on M̄_g/Z, where P_g is the actual universal dualizing pairing and O(−Δ)=O(Δ)∨. Its class vanishes exactly when a Noether isomorphism λ_g^{⊗12}≅P_g⊗O(Δ) exists. This criterion concerns existence; the set of choices is a torsor under global units.

**Hypotheses.** g≥2; use the reduced local-node boundary convention of the imported boundary-divisor node. All tensor powers, duals, evaluation and cancellation maps live in the stack Picard groupoid supplied by SF.1/SF.3.

**Construction or proof.**

1. Apply tensor, dual and powers to the imported Hodge and boundary lines and the constructed P_g.
2. Tensor cancellation identifies trivializations of N_g with Noether comparison isomorphisms.
3. The Picard-groupoid unit automorphisms identify the ratio of two trivializations with a global unit.

**API.**

- **noetherDefect_pullback** (functoriality): Pull back N_g with its tensor and dual comparisons along any classifying map; for arbitrary families the boundary term means the pullback line.
- **noetherDefect_trivialization** (equivalence): Trivializations N_g≅O correspond to isomorphisms λ_g^12≅P_g⊗O(Δ), with inverse given by tensor cancellation.
- **noetherDefect_class** (compatibility): Its Picard class is 12[λ_g]−[P_g]−[O(Δ)]; on an actual scheme chart equality of line classes is the pinned nonempty-isomorphism criterion.
- **noetherDefect_ratio** (characterisation): Given two trivializations, a unique unit takes one to the other; class equality contains no preferred choice.

**Checks and worked examples.**

- **three-trivial-lines** (degenerate): If λ, P and O(Δ) are equipped with trivializations on a test scheme, the induced N is trivial; changing a trivialization changes the map, not its class.
- **boundary-sign** (computation): For a trait with one split node xy=π^m, the canonical rational section of the boundary factor O(−Δ) in N has order −m; the section of O(Δ) on the Noether right-hand side has order +m. This does not assign an order to an unspecified rational section of the whole defect line.
- **rational-torsion** (non-example): For a nontrivial torsion line, vanishing in Pic⊗Q does not give an integral trivialization; the proof must still use complex torsion-freeness.
- **nonuniversal-unit** (non-example): On a Q-scheme, multiplying a comparison by 2 produces another comparison. It need not be the pullback of a universal choice differing by ±1.

**Sources.** [Xinyi Yuan](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), Theorem 3.3 and §3.1.2, p. 42: The three lines and the universal-choice convention yield this obstruction line by tensor cancellation.; [David Mumford](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1977a--StabilityLecturesIHES-Swiss.pdf), Theorem 5.10 and its proof, pp. 100–103: Separates the rational computation, torsion-freeness step and integral descent; the defect packages precisely those steps.

**Prerequisites.** `StableReductionPartII:MC.5/hodge-determinant`, `StableReductionPartII:MC.5/boundary-divisor`, `StableReductionPartII:MC.5/universal-dualizing-pairing`, `SchemeAndStackFoundations:SF.1/line-bundle-section-stack`, `SchemeAndStackFoundations:SF.3/picard-groupoid`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct`, `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_eq_mk_iff`.

**Acceptance.**

- The boundary occurs with a negative sign in N_g and a positive sign on the right of the Noether isomorphism.
- A vanishing rational Chern class alone does not construct a trivialization.
- Two comparisons are compared as maps of line objects before passing to classes.

## Boundary line and thickness

Retain `StableReductionPartII:MC.5/boundary-divisor`. For g≥2 the universal reduced-node boundary Δ=M̄_g−M_g is an effective Cartier divisor. Its global components are the one-edge types Δ_i, 0≤i≤⌊g/2⌋, with Δ=Σ_i Δ_i. This sum is a divisor on the stack; no coarse-boundary ramification convention is substituted. At a family with several nodes the local boundary section is the product of its smoothing parameters, each to the first power. [Yuan](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), §3.1.1–3.1.2, pp. 41–43, supplies this convention and its family application.

For any classifying map c:S→M̄_g, the line with section c*(O(Δ),s_Δ) exists. If S is integral Noetherian and its generic fibre is smooth, the local smoothing parameters are nonzero in the local domains, so this section cuts out an effective Cartier divisor Δ_S. A family contained in the boundary can have zero pulled-back section; that does not define an effective Cartier divisor, although the pullback line remains invertible.

**API.**

- **boundary_line_section** (data): Use (O(Δ),s_Δ) on the stack; locally s_Δ is the product of the node smoothing parameters.
- **boundary_pullback** (functoriality): The line and section pull back along every map; Cartier-divisor pullback requires the pulled-back section to be regular.
- **boundary_trait** (compatibility): On a normal generically smooth trait the order is the residue-degree-weighted sum of smoothing thicknesses.

**Checks and worked examples.**

- **one-thick-node** (computation): For xy=π³, the order is 3.
- **two-nodes** (computation): For split nodes of thicknesses 2 and 5, the total order is 7.
- **nonsplit-node** (computation): A closed node of residue degree d and thickness m contributes d·m before splitting.
- **wholly-boundary** (non-example): A nodal stable curve over a field has pulled-back section zero; its line still exists but the zero subscheme is not an effective Cartier divisor.

Retain `StableReductionPartII:MC.5/boundary-thickness`. For a generically smooth stable family over a normal integral Noetherian base S and a codimension-one point v, the local ring is a DVR. After a finite unramified extension splitting the special-fibre nodes, write a completed local nodal equation xy=uπ^m with u a unit and m≥1. Then

$$
\operatorname{ord}_v\Delta_i=\sum_{\text{nodes of type }i}m_x,
\qquad
\operatorname{ord}_v\Delta=\sum_x m_x.
$$

Before splitting, sum over closed node points with residue-degree weights [κ(x):κ(v)]. Changing the uniformizer or the unit u does not change the order. For two split nodes xy=π² and zw=π⁵, the answer is 7. A degree-three closed node of thickness two contributes 6 before splitting. These are valuations of the pulled-back universal boundary section, so no choice of a regular total-space model is required. [Yuan](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), §3.1.2, p. 43, is the source of the thickness interpretation; MC.1 supplies the actual versal node parameters.

## From rational GRR to an integral line isomorphism

Retain `StableReductionPartII:MC.5/rational-noether`: over C,

$$
12c_1(\lambda_g)=f_*(c_1(\omega)^2)+[\Delta]
\quad\text{in }\mathrm{CH}^1(\overline{\mathcal M}_{g,\mathbf C};\mathbf Q).
$$

The nodal correction has coefficient +1 on each universal smoothing branch. [Mumford](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1977a--StabilityLecturesIHES-Swiss.pdf), Theorem 5.10 and its calculation, pp. 100–102, provides this rational computation. On a transverse universal chart the relative singular locus has codimension two; its contribution produces the displayed boundary term. This is not a claim that every family with equation xy=t^m has a smooth total space or that the smooth-scheme GRR node applies unchanged to such a family.

The precise route is: identify the pairing Chern class; deduce the Noether defect is torsion; kill it using the complex Picard torsion theorem; descend complex triviality to Q; then remove the vertical divisor over Z. The following support targets expose the inputs at each step.

### Chern class of the dualizing pairing

Declaration: `StableReductionPartII:MC.5/pairing-chern-on-moduli` (comparison).

On M̄_g/C, g≥2, the universal pairing satisfies c₁(P_g)=f_*(c₁(ω_f)²) in CH¹(M̄_g/C;Q). The scheme-level integral input is the degree-one graded-K comparison for Deligne pairings on divisorial bases. Its passage to rational Chow and then to the moduli stack must use named comparison/descent maps, and is not an integral identification of arbitrary stack Chow and Picard groups.

**Hypotheses.** Use SF.5 stack Chow with rational coefficients and its actual first-Chern/proper-pushforward operations. Supply gap CHOW-PIC: pairing Chern comparison and codimension-one Picard comparison for this smooth DM stack, including stabilizers.

**Construction or proof.**

1. On a suitable divisorial scheme chart apply Eriksson–Freixas Corollary 6.9 to the two line arguments.
2. Use the rational Chern-character comparison to convert its graded-K identity to Chow.
3. Use a smooth equivariant Hilbert presentation of the moduli stack and compatible mixed quotients (Edidin–Graham, Propositions 14–19), so that the chart computation is an equivariant identity and not merely an identity after forgetting equivariance. Theorem 3.1 of their Riemann–Roch paper supplies the compatible proper pushforward. Supply the comparison to the chosen SF.5 stack-Chow carrier in CHOW-PIC; pullback to a plain atlas alone is not an injection on Picard groups.

**Sources.** [Dennis Eriksson; Gerard Freixas i Montplet](https://jep.centre-mersenne.org/item/10.5802/jep.254.pdf), §6.1.4, Proposition 6.8 and Corollary 6.9, pp. 316–318: Identifies the Deligne-pairing Chern class with the direct image in graded K-theory under the divisorial-base hypothesis.; [David Mumford](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1977a--StabilityLecturesIHES-Swiss.pdf), Theorem 5.10, rational calculation, pp. 100–102: Supplies the moduli rational computation, including the local singularity correction; a formal stack Chow comparison is still required.; [Dan Edidin; William Graham](https://arxiv.org/pdf/alg-geom/9609018v3), Theorem 1, pp. 7–8; Corollary 1, p. 9; Propositions 14–19, pp. 28–29: Gives the equivariant Chern/Picard comparison, its quotient-stack interpretation and rational intersection-product compatibility.; [Dan Edidin; William Graham](https://arxiv.org/pdf/math/9905081v2), Theorem 3.1(b)–(e), pp. 13–14: Supplies proper equivariant pushforward and the smooth/qualified-lci Riemann–Roch compatibilities needed in a quotient presentation, with rational coefficients.

**Prerequisites.** `StableReductionPartII:MC.5/universal-dualizing-pairing`, `SchemeAndStackFoundations:SF.5/stack-chow`, `SchemeAndStackFoundations:SF.5/first-chern`, `SchemeAndStackFoundations:SF.5/chern-character`.

Unresolved supplier inputs: `GPAIR`, `CHOW-PIC`.

**Acceptance.**

- State the divisorial-scheme hypothesis before using Corollary 6.9.
- The smooth-scheme GRR signature is not advertised as arbitrary singular or stack GRR.
- The sign in the pairing term is positive.

The published Proposition 6.8 proof has the local display typo E18 described below: retain the gamma operation on both sides of its projection formula. This does not change the graded K-group statement or Corollary 6.9; the separate stack-Chow bridge remains CHOW-PIC.

### Rational Noether computation gives a torsion defect

Declaration: `StableReductionPartII:MC.5/rational-defect-torsion` (theorem).

For g≥2 the class [N_g/C] is torsion in Pic(M̄_g/C). Equivalently, some positive tensor power of N_g/C is trivial. This is the precise intermediate conclusion of rational Noether: 12c₁λ=f_*(c₁ω²)+[Δ] together with the pairing Chern comparison and the rational codimension-one Picard–Chow comparison.

**Hypotheses.** The imported rational-noether identity is over C and has coefficient one on every reduced universal node branch. CHOW-PIC supplies an injective Pic⊗Q→CH¹⊗Q comparison for the actual stack; N_g is a genuine line, not a rational formal symbol.

**Construction or proof.**

1. Compute c₁(N_g/C) from its three factors and cancel using rational Noether and pairing-chern-on-moduli.
2. Transport the vanishing to Pic⊗Q through the specified codimension-one comparison.
3. Use that the kernel of an abelian group’s map to its rationalization is its torsion subgroup; do not infer [N]=0 integrally yet.

**Sources.** [David Mumford](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1977a--StabilityLecturesIHES-Swiss.pdf), Theorem 5.10, pp. 100–105; Lemma 5.14, p. 102: First obtains the line relation rationally and then needs a separate torsion-freeness theorem to make it integral.; [Xinyi Yuan](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), Theorem 3.3, p. 42: States the integral endpoint, for which this node supplies only the rational/torsion intermediate step.; [Dan Edidin; William Graham](https://arxiv.org/pdf/alg-geom/9609018v3), Corollary 1, p. 9; Propositions 16–19, pp. 28–29: Identifies equivariant Picard and codimension-one Chow for a smooth quotient presentation; rationalization detects exactly the torsion ambiguity.

**Prerequisites.** `StableReductionPartII:MC.5/noether-defect-line`, `StableReductionPartII:MC.5/pairing-chern-on-moduli`, `StableReductionPartII:MC.5/rational-noether`, `SchemeAndStackFoundations:SF.3/picard-groupoid`.

Unresolved supplier inputs: `CHOW-PIC`.

**Acceptance.**

- The conclusion includes an existential positive exponent, not a canonical trivialization or an asserted exponent 12.
- A torsion character line on Bμ_r over C demonstrates why a rational class identity does not by itself imply an integral one.

### Boundary twists kill torsion-line monodromy

Declaration: `StableReductionPartII:MC.5/torsion-cover-boundary-monodromy` (theorem).

Let g≥2 and L be an r-torsion line on M̄_g/C with a chosen L^r≅O and r≥1. The associated μ_r-torsor on the stack has trivial monodromy on M_g/C: after analytification and pullback to Teichmüller space, its character Mod_g→μ_r is trivial. Indeed extension over each transverse one-node smoothing kills the associated Dehn twist, and Dehn twists generate Mod_g. The torsor is then trivial over the normal compactified stack, so L is trivial. Quotient stacks and their inertia are retained throughout; a coarse-space argument is insufficient, including in genus two.

**Hypotheses.** Use algebraic finite étale μ_r-torsors over C, where r is invertible; do not use the same étale argument in characteristic dividing r. TOPOLOGY supplies the analytic stack quotient [T_g/Mod_g], simple connectedness of T_g, mapping-class generation, nodal monodromy and cover comparison, including algebraic recovery on the proper DM stack.

**Construction or proof.**

1. Construct Spec(⊕_{i=0}^{r−1}L^i), with multiplication from L^r≅O, using the existing torsor/relative-Spec machinery.
2. Pull the analytic torsor to the contractible Teichmüller space. Descent along the action groupoid T_g×Mod_g gives a character of the full mapping-class group. The nerve has action face maps: it is not the product simplicial object with constant T_g; its realization is a homotopy quotient with contractible fibre over BMod_g (sourceIssues E16–E17).
3. A transverse smoothing disk has trivial étale/topological cover when filled in, so the loop around its puncture acts trivially; its mapping-class monodromy is the corresponding Dehn twist.
4. Use Luo’s generation theorem to kill the character. Extend the analytic cover splitting from the dense smooth locus across the normal compactified stack by normalization, retaining inertia; the disk argument is applied in stack charts. Hall Theorem 1 with proper DM source M̄_g/C and target Bμ_r algebraizes the trivialization and its inverse. Equivalently apply separated GAGA to the line isomorphism on the proper stack.

**Sources.** [David Mumford](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1977a--StabilityLecturesIHES-Swiss.pdf), Lemma 5.14, statement p. 102 and proof pp. 103–105: Uses the Teichmüller-space cover, mapping-class characters and boundary Dehn twists to eliminate torsion; the cited analytic inputs require separate supplier contracts.; [Paola Frediani; Frank Neumann](https://arxiv.org/pdf/math/0404387v1), Theorem 2.5 and Proposition 2.6, p. 11; §2.3, pp. 17–19, with corrections E16–E17 below: Supplies Teichmüller representability and contractibility. Use the action groupoid and homotopy quotient, retaining stabilizers; the displayed product-of-simplicial-spaces proof is corrected in sourceIssues.; [Feng Luo](https://arxiv.org/pdf/math/9801025v1), §1, main unnumbered theorem, p. 2: Presents the orientation-preserving mapping class group of a compact oriented surface by all Dehn twists, hence gives generation for the closed genus-g surface.; [Jack Hall](https://arxiv.org/pdf/1101.5123v2), Theorem 1, p. 1; Theorem A.1 and Corollary A.3, p. 17: For a proper DM source, analytification recovers morphisms to the DM target Bμ_r and their isomorphisms. Separated GAGA also recovers coherent line isomorphisms on the proper compactification.

**Prerequisites.** `SchemeAndStackFoundations:SF.1/torsor`, `SchemeAndStackFoundations:SF.1/line-bundle-section-stack`, `StableReductionPartII:MC.5/boundary-divisor`, `StableReductionPartII:MC.1/finite-unramified-diagonal`, `MordellLawrenceVenkatesh:LV.5/mapping-class-group`, `MordellLawrenceVenkatesh:LV.5/dehn-twist`.

Unresolved supplier inputs: `TOPOLOGY`.

**Acceptance.**

- Include separating as well as nonseparating nodal monodromy, and do not suppress inertia by replacing the stack with its coarse space.
- For r=1 the torsor is trivial. For arbitrary r over C it is étale; this reasoning does not assert the same in characteristic p dividing r.
- Triviality on the dense open is extended by normality, not by an unproved claim that restriction of arbitrary line bundles is injective.

### A complex trivialization descends to the rational fibre

Declaration: `StableReductionPartII:MC.5/complex-trivialization-rational-descent` (theorem).

Let X=M̄_g/Z, g≥2, and L a line on X. If L_C is trivial, then L_Q is trivial. More precisely H⁰(X_Q,L_Q)⊗_Q C≅H⁰(X_C,L_C) is one-dimensional, because Γ(X_C,O)=C. Choose a nonzero rational section in this space; after base change it is a nonzero constant multiple of a trivialization and hence nowhere vanishing. Faithful flatness then makes its evaluation O_XQ→L_Q an isomorphism.

**Hypotheses.** Proper stable-moduli stack over Z, and the geometrically connected/irreducible fibre statements imported from MC.1/MC.4. DESCENT supplies H⁰ flat field-extension base change on the proper DM stack and descent of the evaluation isomorphism. No claim is made that a line trivial after every arbitrary field extension descends without these H⁰ hypotheses.

**Construction or proof.**

1. Use flat cohomology base change for Q→C, without asserting the chosen complex section itself has rational coefficients.
2. The right-hand H⁰ has dimension one since the line is trivial and the proper connected complex stack has only constant functions.
3. A nonzero rational vector becomes a nonzero scalar multiple of a complex trivialization. Descend invertibility of its evaluation map by faithful flatness.

**Sources.** [David Mumford](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1977a--StabilityLecturesIHES-Swiss.pdf), Paragraph following Lemma 5.14, printed pp. 102–103: Uses invariant global sections and flat base change to pass from a complex trivial line to a rational section, before the vertical-divisor argument.

**Prerequisites.** `StableReductionPartII:MC.1/proper-moduli`, `StableReductionPartII:MC.4/irreducible-geometric-fibres`, `StableReductionPartII:MC.5/universal-units`, `SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`, `SchemeAndStackFoundations:SF.1/stack-quasi-coherent`.

Unresolved supplier inputs: `DESCENT`.

**Acceptance.**

- One-dimensionality is proved before selecting the rational section.
- The evaluation map, rather than only its space of sections, descends as an isomorphism.
- The argument respects stabilizer actions and thus applies to the stack line, not only its atlas restriction.

### Vertical divisors on the integral stable stack

Declaration: `StableReductionPartII:MC.5/vertical-divisors-on-stable-moduli` (lemma).

For X=M̄_g/Z, g≥2, every Cartier divisor whose support is vertical is a finite sum D=Σ_p n_p X_Fp of whole prime fibres, with integral n_p. Since X/Z is smooth with geometrically irreducible fibres, each X_Fp is reduced, irreducible and Cartier of multiplicity one. Consequently D=div_X(∏_p p^{n_p}). In particular, for any line L on X, a trivialization of L|X_Q extends after multiplication by a rational number to a nowhere-vanishing section on X.

**Hypotheses.** X is the smooth integral noetherian stable DM stack with geometrically irreducible fibres. DIVISORS supplies Cartier/Weil comparison, divisors of rational sections and the codimension-one criterion on a smooth DM stack, extending the scheme-only SF.3 excision result.

**Construction or proof.**

1. A codimension-one irreducible vertical support lies over a unique prime and equals that whole irreducible fibre; use smoothness and dimension to exclude a proper codimension-one subvariety of the fibre.
2. Smoothness makes each prime fibre reduced, and flatness makes p a nonzerodivisor, with divisor exactly that fibre.
3. A Cartier divisor has finitely many such components on the quasi-compact stack. Compare with the principal divisor of the rational number ∏p^{n_p}.
4. For a line rationally trivialized on X_Q, subtract this principal divisor from the divisor of its rational section; regularity/codimension-one comparison then makes it a global trivialization.

**Sources.** [David Mumford](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1977a--StabilityLecturesIHES-Swiss.pdf), Integral descent after Lemma 5.14, printed pp. 102–103: Removes vertical zeros or poles by whole-prime-fibre principal divisors, proving the needed integral restriction injectivity.

**Prerequisites.** `StableReductionPartII:MC.1/smooth-dimension`, `StableReductionPartII:MC.4/irreducible-geometric-fibres`, `SchemeAndStackFoundations:SF.3/picard-excision-sequence`.

Unresolved supplier inputs: `DIVISORS`.

**Acceptance.**

- Negative coefficients are allowed; the correcting scalar belongs to Q×, not necessarily Z.
- Multiplicity one uses smoothness; the same formula without multiplicities is false for a nonreduced prime fibre.
- The scheme excision node does not already prove this stack statement.

### Integral endpoint and its choices

Retain `StableReductionPartII:MC.5/complex-picard-torsion-free`, `integral-picard-injection` and `integral-noether` as the accepted target IDs. The boundary-monodromy theorem proves the first once TOPOLOGY is supplied. The rational-trivialization and vertical-divisor targets prove the second once DESCENT and DIVISORS are supplied. Thus N_g/C is torsion and hence trivial, and injectivity of Pic(M̄_g/Z)→Pic(M̄_g/C) makes N_g trivial over Z. Tensor cancellation gives

$$
\lambda_g^{\otimes12}\simeq P_g\otimes\mathcal O(\Delta).
$$

This is an existence theorem for an integral line isomorphism, with no rationalization left. [Yuan](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), Theorem 3.3, p. 42, states this endpoint. Mumford's Lemma 5.14 and the descent argument around it, pp. 102–105, supply the proof route. The pairing identification additionally uses the acquired integral Deligne-pairing comparison, rather than interpreting a Chern class as a line.

Retain `StableReductionPartII:MC.5/universal-units`: Γ(M̄_g/Z,O)=Z and its unit group is {±1}. Properness, geometric connectedness and smoothness enter through the stack global-function theorem in DESCENT. Two actual universal Noether comparisons therefore differ by a unique integer unit. Choosing a universal comparison is not a claim of a preferred sign.

Retain the definition `StableReductionPartII:MC.5/semi-canonical-noether`: for a generically smooth stable family over an integral Noetherian base, a semi-canonical comparison is induced by a chosen universal one. Its two potential universal signs can induce the same comparison in characteristic two. Arbitrary comparisons on the family form a torsor under all units on that base, which can be larger. [Yuan](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), §3.1.2, pp. 42–43, fixes this universal-choice interpretation.

**API.**

- **semiCanonical_fromUniversal** (constructor): Fix a universal line comparison; its pullback with the stated Hodge/pairing comparisons is a semi-canonical family comparison.
- **semiCanonical_ratio** (characterisation): Two universal choices differ by a unique element of Z×={±1}; their family pullbacks differ by its image in Γ(S,O_S)×.
- **semiCanonical_baseChange** (functoriality): The chosen comparisons commute with arbitrary classifying pullback, with the Cartier-boundary interpretation restricted to generically smooth integral Noetherian bases.

**Checks and worked examples.**

- **integer-units** (computation): On the universal integral stack the two comparison choices differ by +1 or −1, with no other unit available.
- **characteristic-two** (computation): After pullback to a characteristic-two scheme the two signs coincide, so the family set of induced choices need not have two distinct elements.
- **extra-family-unit** (non-example): On a Q-scheme, multiplying any comparison by 2 gives a valid family comparison whose ratio is not the image of a universal sign; the definition does not classify all family isomorphisms.

### Noether isomorphism under arbitrary classifying pullback

Declaration: `StableReductionPartII:MC.5/noether-arbitrary-base-pullback` (theorem).

Choose one universal integral isomorphism e:λ_g^12≅P_g⊗O(Δ), g≥2. For every stable genus-g family C→S classified by c:S→M̄_g, pullback and the Hodge/pairing comparisons give an actual line isomorphism (det f_*ω)^12≅⟨ω,ω⟩⊗c*O(Δ), coherent under arbitrary base change and isomorphisms of families. If S is integral noetherian and the family is generically smooth, c*O(Δ)=O(Δ_S) with its pulled-back effective-Cartier section. For a family lying in the boundary, c*O(Δ) still exists but its pulled-back section can be zero and need not cut out an effective Cartier divisor. Any two universal choices differ by ±1, whose images may coincide over characteristic two. Arbitrary family isomorphisms can instead differ by any unit on S.

**Hypotheses.** All stable-family Hodge and dualizing base-change comparisons have been extended to arbitrary bases as specified in NODAL-BC. The imported integral-noether and universal-units theorems give a universal choice and its universal ambiguity. An effective-Cartier family boundary is asserted only under the stated integral/noetherian/generically-smooth hypotheses.

**Construction or proof.**

1. Apply the stack Picard pullback functor to e; identify its left side using Hodge base change and AV determinant pullback.
2. Identify the pairing by universal-dualizing-pairing and keep the boundary as a line with its pulled-back section.
3. Use nonvanishing of the generic smoothing parameters only when identifying the pulled-back section with a Cartier divisor.
4. Transport the unique ratio unit of two universal comparisons through the same pullback functor; Γ(M̄_g/Z,O×)=Z× supplies ±1.

**Sources.** [Xinyi Yuan](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), §3.1.2, pp. 42–43: States the classifying-pullback comparison and its universal-choice interpretation for generically smooth integral Noetherian families; arbitrary-base line pullback here follows from the explicit stack line and base-change contracts.; [Dennis Eriksson; Gerard Freixas i Montplet](https://jep.centre-mersenne.org/item/10.5802/jep.254.pdf), Definition 4.16, p. 287; Proposition 6.1, pp. 311–312: Provides the nonflat and non-Noetherian pairing base-change input for the stated extension.

**Prerequisites.** `StableReductionPartII:MC.5/integral-noether`, `StableReductionPartII:MC.5/universal-units`, `StableReductionPartII:MC.5/hodge-bundle`, `StableReductionPartII:MC.5/hodge-determinant`, `StableReductionPartII:MC.5/universal-dualizing-pairing`, `StableReductionPartII:MC.5/boundary-divisor`, `SchemeAndStackFoundations:SF.3/picard-groupoid`, `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`, `mathlib:CategoryTheory.Functor.mapIso`.

Current upstream imports: `AV-L0A`, `AV-L0B`, `AV-L0C`.

Unresolved supplier inputs: `GDET`, `GPAIR`, `NODAL-BC`.

**Acceptance.**

- For a stable nodal curve over a field, the boundary line pulls back while its boundary section is zero; do not call that zero locus an effective Cartier divisor.
- For xy=π^m on a trait, the pulled-back boundary section has order m, not one.
- On an F₂-scheme the two universal signs have identical images. On a Q-scheme, multiplying a family comparison by 2 shows why arbitrary comparisons are not exhausted by the universal choices.

## Dependency closure and acceptance

The MC.5 target inventory is preserved as follows. Node IDs in the first column have prefix `StableReductionPartII:MC.5/`; all are imports from the accepted base packet rather than duplicate definitions.

| Imported target | Additional support or correction |
| --- | --- |
| `hodge-bundle` | The rank-g Hodge bundle on every stable pointed stack, with untwisted ω and arbitrary base change. Open: NODAL-BC. |
| `hodge-determinant` | The ordinary determinant line; replace the legacy SF.5 determinant citation by AV-L0B/L0C plus stack descent. Inputs: `SchemeAndStackFoundations:SF.1/line-bundle-section-stack`.  |
| `hodge-forgetting` | Coherent forgetting/stabilization comparison, only where the target stable moduli problem exists. Open: NODAL-BC. |
| `separating-hodge` | Ordered direct-sum and determinant comparison with exchange sign (−1)^{g₁g₂}. Open: NODAL-BC. |
| `nonseparating-hodge` | Ordered-residue exact sequence; branch exchange negates the quotient residue. Open: NODAL-BC. |
| `boundary-divisor` | Universal effective Cartier boundary and its conditional effective-Cartier family pullback.  |
| `rational-noether` | Complex rational GRR identity; it remains a rational Chow computation. Inputs: `StableReductionPartII:MC.5/hodge-determinant-cohomology`, `StableReductionPartII:MC.5/pairing-chern-on-moduli`. Open: CHOW-PIC. |
| `complex-picard-torsion-free` | No torsion in the complex compactified stack Picard group. Inputs: `StableReductionPartII:MC.5/torsion-cover-boundary-monodromy`. Open: TOPOLOGY. |
| `integral-picard-injection` | Restriction from Z to C is injective on Picard groups. Inputs: `StableReductionPartII:MC.5/complex-trivialization-rational-descent`, `StableReductionPartII:MC.5/vertical-divisors-on-stable-moduli`. Open: DESCENT, DIVISORS. |
| `integral-noether` | The integral universal line-isomorphism existence theorem. Inputs: `StableReductionPartII:MC.5/noether-defect-line`, `StableReductionPartII:MC.5/rational-defect-torsion`, `StableReductionPartII:MC.5/complex-picard-torsion-free`, `StableReductionPartII:MC.5/integral-picard-injection`.  |
| `universal-units` | Global functions Z and units ±1 on the integral universal stack. Open: DESCENT. |
| `semi-canonical-noether` | Pullbacks of universal choices; not a classification of all family isomorphisms. Inputs: `StableReductionPartII:MC.5/noether-arbitrary-base-pullback`.  |
| `boundary-thickness` | Residue-weighted sum of node thicknesses at codimension-one traits.  |

The packet's `prerequisites` are resolved pinned declarations, existing nodes or requested existing stages. `removedPrerequisites` first removes the obsolete SF.5 edge from the imported ordinary `hodge-determinant`; its AV-L0B/L0C imports and SF.1 stack descent are explicit edges. `additionalPrerequisites` then adds the exposed proof inputs to imported targets without copying their nodes. `upstreamPrerequisites` names the exact current AV imports missing from the stage registry. `gapDependencies` terminates a chain at an honestly unresolved supplier input. Together these give the dependency graph; the new nodes do not pretend that a proposed Part II stage already exists.

The nine new targets have no dependency cycle, including after the supplementary edges are added to the imported targets. In particular, arbitrary-base pullback derives the semi-canonical convention directly from the universal isomorphism and units; it does not use the semi-canonical definition as a theorem proving itself.

The five existing-stage requests are:

- **tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity**: Import the locally Noetherian proper-flat connected nodal-curve cohomology, relative dualizing line, trace/Serre duality, normalization-residue sequences, and base-change comparisons as actually stated by StableReduction layer 2. The arbitrary-base extension is NODAL-BC, not silently included in this request.
- **SchemeAndStackFoundations:SF.3**: Import the Picard groupoid, its unit-automorphism/global-unit identification and scheme Picard/class/divisor comparisons. Extend its scheme excision and Cartier/Weil rational-section theory to the smooth integral DM stable stack in DIVISORS; that extension is not supplied by the current scheme-only node.
- **SchemeAndStackFoundations:SF.5**: Use the existing rational Chern, projective smooth-scheme GRR and stack-Chow constructions. Supply the missing compatible first-Chern/proper-pushforward and Pic⊗Q→CH¹ comparison on M̄_g/C in CHOW-PIC. This request does not attribute integral determinant/Deligne-pairing or arbitrary nodal/stack GRR to SF.5. Edidin–Graham 1997 Corollary 1 and Propositions 16–19, and 1999 Theorem 3.1, now give precise equivariant comparison sources for the smooth Hilbert quotient presentation.
- **MordellLawrenceVenkatesh:LV.5**: Use the existing surface, mapping-class-group and Dehn-twist definitions; supply a closed-oriented-genus-g mapping-class generation theorem by Dehn twists. The current dehn-twist node gives conjugacy and disjoint commutation, not generation. The analytic Teichmüller/stack comparison is the separately unassigned part of TOPOLOGY. Use Luo1998, §1 main unnumbered theorem, p. 2, for the generation input; its orientation and boundary conventions specialize to the closed surface.
- **SchemeAndStackFoundations:SF.2**: Provide the scheme flat-field-extension H⁰ base-change theorem with its actual evaluation map; extend to the proper stable DM stack by descent in DESCENT, retaining invariant sections/stabilizers. Use it both for Q→C descent of a complex-trivial line and for the integral universal global-function computation.

The unresolved terminal inputs are:

### GDET — Assign the commutative graded determinant realization and scheme descent extension

The exact GDET contract, source range, API and five discriminating tests are in proposedSupplierContracts. NE.2/determinant-functor already owns the virtual determinant for associative rings; it does not supply its commutative graded-invertible-sheaf realization or scheme descent. No copy of that universal determinant is planned here. The proposed SchemeAndStackFoundations, Part II owner is not yet a roadmap/stage and therefore cannot honestly be cited as an existing prerequisite.

Consumers: `StableReductionPartII:MC.5/hodge-determinant-cohomology`, `StableReductionPartII:MC.5/universal-dualizing-pairing`.

### GPAIR — Assign integral Deligne pairing and coherent laws beyond the existing foundations

The exact GPAIR contract in proposedSupplierContracts has acquired sources, arbitrary-base hypotheses, seven API statements and seven tests. No existing roadmap node plans this unmetrized integral curve pairing. Propose SchemeAndStackFoundations, Part II and import it once; this packet specializes it to the universal dualizing line rather than assigning a second generic owner. Arakelov metric refinements are outside this job.

Consumers: `StableReductionPartII:MC.5/universal-dualizing-pairing`, `StableReductionPartII:MC.5/pairing-chern-on-moduli`.

### NODAL-BC — Arbitrary-base nodal dualizing and Hodge comparisons

StableReduction layer 2 explicitly works locally Noetherian. Extend the same dualizing sheaf, trace, Hodge finite-local-freeness and coherent arbitrary base-change maps to finitely presented stable families over arbitrary bases by finite-presentation approximation and descent. Do not create a second nodal dualizing sheaf. The 2024 pairing source removes the Noetherian restriction for the pairing/determinant supplier, not automatically for this coherent-curve input.

Consumers: `StableReductionPartII:MC.5/hodge-bundle`, `StableReductionPartII:MC.5/hodge-determinant-cohomology`, `StableReductionPartII:MC.5/universal-dualizing-pairing`, `StableReductionPartII:MC.5/noether-arbitrary-base-pullback`.

### CHOW-PIC — Stack codimension-one Chern/Picard comparison for the rational computation

Supply compatible first-Chern, pairing and proper-pushforward maps in SF.5’s stack-Chow carrier for M̄_g/C. On its smooth Hilbert quotient presentation [H/PGL], Edidin–Graham 1997 Corollary 1 and Propositions 16–19 identify Pic([H/PGL]) with equivariant CH¹, including stabilizers; their 1999 Theorem 3.1 supplies equivariant rational Riemann–Roch and proper covariance. Eriksson–Freixas Corollary 6.9 supplies the pairing identity on divisorial mixed-quotient schemes. Prove independence of the presentation and compatibility with SF.5/Kresch Chow. The mathematical route and source are acquired; the matching formal supplier interface is absent. The current smooth-scheme GRR node alone does not supply this extension.

Consumers: `StableReductionPartII:MC.5/pairing-chern-on-moduli`, `StableReductionPartII:MC.5/rational-defect-torsion`, `StableReductionPartII:MC.5/rational-noether`.

### TOPOLOGY — Analytic stack/Teichmüller and boundary-cover comparison

Assign the analytic stack/Teichmüller and boundary-cover extension. Frediani–Neumann Theorem 2.5 and Proposition 2.6, p. 11, give Teichmüller representability and contractibility; its §2.3 groupoid discussion must be corrected as E16–E17, using T_g×Mod_g with action face maps. Luo’s main theorem, p. 2, supplies Dehn-twist generation; Mumford Lemma 5.14, pp. 103–105, supplies the nodal smoothing-loop argument. Hall Theorem 1 and Appendix A supply recovery on the proper DM compactification (target Bμ_r, not an unqualified DM-target theorem applied to BG_m). Formalize the analytic quotient, finite-cover descent, monodromy and normal extension. LV.5 owns surfaces, Mod and twists, but no exact supplying node exists for this complete analytic interface. The consumer proof and independent primary sources are now specified; this is an ownership/formal-interface gap, not a missing claim that the sources prove the corrected chain verbatim.

Consumers: `StableReductionPartII:MC.5/torsion-cover-boundary-monodromy`, `StableReductionPartII:MC.5/complex-picard-torsion-free`.

### DESCENT — Proper-DM H⁰ base change and universal functions

Extend the scheme H⁰ flat-field-extension theorem to the actual proper stable DM stack, including compatibility of invariant sections and their evaluation maps. For Γ(M̄_g/Z,O)=Z also supply the proper smooth geometrically connected stack global-function theorem (or prove by a rational-function/vertical-integrality argument); mere scheme atlas global functions are insufficient. The rational-descent argument explicitly uses one-dimensionality and faithful-flat descent, closing the logical step omitted from the base sketch once this supplier is supplied.

Consumers: `StableReductionPartII:MC.5/complex-trivialization-rational-descent`, `StableReductionPartII:MC.5/universal-units`.

### DIVISORS — Cartier/Weil divisor descent on the smooth integral DM stack

Extend SF.3’s scheme locally-factorial Picard/excision and rational-section statements to a smooth integral noetherian DM stack, with valuations, equality detected in codimension one, and descent of rational sections. Apply only to M̄_g/Z with geometrically irreducible reduced prime fibres. The proof of vertical principality is now explicit; the current scheme excision node does not already supply the stack carrier/theorem.

Consumers: `StableReductionPartII:MC.5/vertical-divisors-on-stable-moduli`, `StableReductionPartII:MC.5/integral-picard-injection`.

**Layer acceptance.** All thirteen imported targets and all nine support targets must have their stated carrier and hypotheses; the incoming contracts must acquire a single foundational owner and verified supplier nodes. The sign, nonflat-specialization, boundary-contained-family and residue-weighted-thickness checks must hold as actual maps or computations. The integral theorem must be obtained through Picard torsion-freeness and injection, with no replacement by rational Chern equality. The combined stage is **planned**, not closed: its exact remaining inputs are the seven obligations above. The blueprint pass is complete.

**Planets.** Retain the base Hodge bundle, Hodge determinant, Boundary divisor and Integral Noether formula planets. Add Dualizing Deligne pairing. There are five planets in MC.5 in total; the generic incoming contracts are not extra moduli planets.

## Independent review

The independent review `REV-StableReductionPartII--MC.5` accepts this completed planning pass. It checked all nine support nodes and thirteen imported targets, all eleven primary sources and nine pinned declarations. The seven named supplier gaps remain unresolved, so MC.5 is **planned**, not closed or implemented. All 33 worked tests now record their kind; the dependency overlay explicitly replaces the obsolete ordinary-determinant SF.5 edge with AV-L0B/L0C and stack descent. The [review report](../reviews/REV-StableReductionPartII--MC.5.md) records the checks and corrections.

## Suggested file and sources

The companion [Suggested.lean](../suggested/StableReductionPartII--MC.5.lean) contains four statements on actual scheme-line comparison carriers and nine worked examples. It has no data definitions and constructs no stack, perfect complex or pairing substitute. It checks the class-to-isomorphism interface, the automorphism ratio of comparisons, pullback of actual isomorphisms and scalar signs. The geometric targets above remain fully stated here because their carriers are absent at the pins. `lean-check` completed successfully against the pins with only the thirteen expected omitted-proof warnings.

The sources below were read at the indicated locators on 2026-10-18. Page numbers belong to the explicitly identified edition: printed journal pages for the scans, and the specified preprint pages for Yuan and the arXiv versions. Their acquired-file checksums are recorded in the packet; no source passage is reproduced. These are references for the target statements, not a section-by-section account of any source.

- **Xinyi Yuan, [Arithmetic bigness and a uniform Bogomolov-type result](https://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf)**. Author preprint, August 21, 2024; page numbers refer to this version. Read: §3.1.1, pp. 41–42, including Theorem 3.3; §3.1.2, pp. 42–43.
- **David Mumford, [Stability of projective varieties](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1977a--StabilityLecturesIHES-Swiss.pdf)**. L’Enseignement Mathématique 23 (1977), 39–110; author-hosted journal scan. Read: Definition 5.9 and Theorem 5.10, printed pp. 100–102; Lemma 5.14, statement p. 102 and proof pp. 103–105; integral descent argument pp. 102–103.
- **Pierre Deligne, [Le déterminant de la cohomologie](https://publications.ias.edu/sites/default/files/Number58.pdf)**. Contemporary Mathematics 67 (1987), 93–177; IAS-hosted scan. Read: §§6.1–6.4, printed pp. 141–143; Construction 7.2 and (7.2.1), printed pp. 147–149; §7.4 and Construction 7.5, printed pp. 150–151.
- **Finn Faye Knudsen; David Mumford, [The projectivity of the moduli space of stable curves I: Preliminaries on det and Div](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1976b--DetDiv%2BKnudsenSequel-GT.pdf)**. Mathematica Scandinavica 39 (1976), 19–55; author-hosted journal scan. Read: §1, graded invertible sheaves and Proposition 1, printed pp. 20–21; Lemma 2, printed p. 28, and determinant of a bounded complex, printed pp. 30–32.
- **Dennis Eriksson; Gerard Freixas i Montplet, [Deligne–Riemann–Roch and intersection bundles](https://jep.centre-mersenne.org/item/10.5802/jep.254.pdf)**. Journal de l’École polytechnique — Mathématiques 11 (2024), 247–361; version of record. Read: Definition 1.1, printed p. 258; Propositions 4.14–4.15 and Definition 4.16, printed pp. 286–287; §6.1.1, (6.3), Proposition 6.1 and Remark 6.2, printed pp. 310–312; §6.1.4, Proposition 6.8 and Corollary 6.9, printed pp. 316–318.
- **Finn Faye Knudsen, [The projectivity of the moduli space of stable curves, III: The line bundles on M_g,n, and a proof of the projectivity of M̄_g,n in characteristic 0](https://journals.msp.org/mscand/article/download/1623/1622/1654)**. Mathematica Scandinavica 52 (1983), 200–212; journal scan. Read: §4, descent cocycle and line definitions, printed p. 201; Theorem 4.1(a) and duality proof, printed p. 202; Theorem 4.2(a) and normalization-sequence proof, printed p. 203.
- **Dan Edidin; William Graham, [Equivariant intersection theory](https://arxiv.org/pdf/alg-geom/9609018v3)**. arXiv:alg-geom/9609018v3, May 16, 1997; preprint pagination, not the Inventiones pagination. Read: Theorem 1 and Lemma 2, pp. 7–8; Corollary 1, p. 9; §§5.2–5.3, Propositions 14–19, pp. 28–29.
- **Dan Edidin; William Graham, [Riemann–Roch for equivariant Chow groups](https://arxiv.org/pdf/math/9905081v2)**. arXiv:math/9905081v2, October 12, 1999; preprint pagination. Read: §1.2, conventions, p. 3; Theorem 3.1 and proof, pp. 13–14.
- **Feng Luo, [A presentation of the mapping class groups](https://arxiv.org/pdf/math/9801025v1)**. arXiv:math/9801025v1, January 7, 1998; preprint pagination. Read: §1, Gervais presentation theorem, p. 1; main unnumbered theorem, p. 2; §2, presentation proof, pp. 3–4.
- **Jack Hall, [Generalizing the GAGA principle](https://arxiv.org/pdf/1101.5123v2)**. arXiv:1101.5123v2, January 27, 2011; preprint pagination. Read: Theorem 1, p. 1; Appendix A, Theorem A.1 and Corollaries A.2–A.3, p. 17; proof, p. 18.
- **Paola Frediani; Frank Neumann, [Étale homotopy types of moduli stacks of algebraic curves with symmetries](https://arxiv.org/pdf/math/0404387v1)**. arXiv:math/0404387v1, April 21, 2004; preprint pagination only; the published K-Theory text was not served by the publisher. Read: Theorem 1.5, p. 9; Theorem 2.5 and Proposition 2.6, p. 11; §2.3, quotient-groupoid calculation, pp. 17–18; Proposition 2.14 and proof, p. 19.

Yuan cites Moret-Bailly's 1989 arithmetic Noether paper. A readable primary copy was not obtained, and this document makes no claim to have read it. The acquired Mumford, Deligne and Eriksson–Freixas i Montplet sources supply the proof route and integral pairing construction used here. The Frediani–Neumann findings below concern only its arXiv v1 proof paragraphs; E18 separately concerns the published Eriksson–Freixas i Montplet text. The publisher returned an HTML challenge rather than the version of record, so no finding is attributed to the published K-Theory text. The corrected action-groupoid proof preserves the homotopy-equivalence conclusion. E15 is rejected as an allegation about analytic immersion. The local display typo E18 leaves the intended graded K argument and Corollary 6.9 unchanged. Missing formal supplier results remain planning gaps.

## Independently reviewed source findings

### StableReductionPartII/E15 — error (rejected)

**Version and locator.** arXiv:math/0404387v1, §2.3, p. 18, paragraph following the two local-isomorphism projections

**Finding.** The text invokes rigidity of the marked data and calls the arrow-to-object-pair map an immersion.

**Correction or qualification.** Retain stabilizer arrows after forgetting markings. The action groupoid for G=1 is not a monomorphism over T_g×T_g, but its arrow map is locally a graph because its source projection is a local isomorphism. This is compatible with analytic immersion in the local differential sense.

**Check.** At a genus-two point the identity and hyperelliptic involution give two arrows over (x,x). This disproves global monomorphism, not local analytic immersion. In a source chart the arrow map is a holomorphic graph, hence an immersion in the differential sense. The alleged source error depends on reading immersion as a locally closed embedding and is not established by this example.

**Independent verdict.** Rejected: The two-arrow example tests monomorphism rather than analytic immersion. The local-isomorphism source projection makes the arrow map locally a graph; no contradiction with that analytic meaning follows. Retain the inertia warning without treating the passage as a verified error.

**Recorded effect.** the proof. The original allegation is retained for audit, not as a verified source error.

### StableReductionPartII/E16 — misprint (confirmed)

**Version and locator.** arXiv:math/0404387v1, §2.3, p. 18, fibre formula near the bottom

**Finding.** The fibre over fixed x of the arrow-space projection is identified with T_g^G×Γ_g,G.

**Correction or qualification.** The entire arrow space has that product form in the intended quotient presentation. A fixed source fibre is the discrete group Γ_g,G, with its target determined by the action; for G=1 this is Mod_g.

**Check.** The projection is already stated to be a local isomorphism, hence its point fibres are discrete. With G=1 and g≥2, T_g has positive dimension 3g−3, so its product with Mod_g cannot be such a fibre.

**Independent verdict.** Confirmed: The printed fixed-source fibre cannot contain the positive-dimensional Teichmüller factor when the projection is a local isomorphism. The G=1, g=2 specialization already proves the dimensional contradiction; the full arrow space and a source fibre have been confused.

**Recorded effect.** nothing. No separate correction was found in the searches recorded in the packet.

### StableReductionPartII/E17 — error (confirmed)

**Version and locator.** arXiv:math/0404387v1, Proposition 2.14 proof, p. 19, product-simplicial-object identification

**Finding.** The degreewise products in the action-groupoid nerve are treated as a product simplicial object T_g^G×BΓ_g,G and used to assert a product realization.

**Correction or qualification.** Use the action nerve, whose realization is EΓ_g,G×_Γ_g,G T_g^G. Its projection to BΓ_g,G has contractible fibre T_g^G and yields the required homotopy equivalence. The constant-product simplicial identification is not justified.

**Check.** Already for G=1 and an element γ moving x, the two degree-one face maps of the action arrow (x,γ) are x and γx. In the constant-T_g product with BMod_g both faces keep the same T_g coordinate. The degreewise product bijections therefore do not respect the simplicial maps. This repairs the proof without rejecting the proposition’s homotopy-equivalence conclusion.

**Independent verdict.** Confirmed: For an action moving x the two arrow faces land at different points, whereas the proposed constant-space product keeps x fixed. Thus the degreewise product is not a simplicial identification. The Borel construction gives the required homotopy equivalence without this identification.

**Recorded effect.** the proof. No separate correction was found in the searches recorded in the packet.

### StableReductionPartII/E18 — misprint (confirmed)

**Version and locator.** Published J. Éc. polytech. Math. 11 (2024), Proposition 6.8 proof, printed p. 317, unnumbered projection-formula display after the complete-flag construction

**Finding.** The left side of the projection-formula display uses the factor [E]−r, whereas the right side retains its k₀-th gamma operation.

**Correction or qualification.** Retain γ^{k₀}([E]−r) on the left as well as on the right. The other factors and the complete-flag pushforward remain as in the intended argument.

**Check.** Take f:P¹_k→Spec(k), E=O(1), r=1, k₀=3 and no other gamma factors. The complete-flag map is the identity and its extra product is 1. The printed left side has Euler characteristic χ(O(1))−χ(O)=1. On the right γ³([O(1)]−1)=0 because the gamma series for a line minus 1 has only its linear term. Restoring the gamma operation makes both sides zero and restores the filtration degree needed for n=1.

**Independent verdict.** Confirmed: The rank-one complete-flag example gives 1 on the printed left side and 0 on the right. The preceding argument and right side both require the omitted gamma operation. This is a local display typo, not a counterexample to Proposition 6.8 or Corollary 6.9.

**Recorded effect.** nothing. No separate correction was found in the searches recorded in the packet.

E15–E17 were checked against [arXiv v1](https://arxiv.org/pdf/math/0404387v1), whose history lists only v1. The author publication lists at [Frediani](https://mate.unipv.it/frediani/papers.html) and [Neumann](https://le.ac.uk/people/frank-neumann), and title/author correction searches were checked on 2026-10-18. The [publisher endpoints](https://link.springer.com/article/10.1023/B:KTHE.0000021708.13907.99) returned an HTML challenge, so these verdicts are not attributed to the published K-Theory text.

E18 was checked in the [published JEP PDF](https://jep.centre-mersenne.org/item/10.5802/jep.254.pdf), printed p. 317. The [article page](https://jep.centre-mersenne.org/articles/10.5802/jep.254/), [arXiv history](https://arxiv.org/abs/2305.13129), [Freixas publication list](https://perso.pages.math.cnrs.fr/users/gerard.freixas/research.html), [Eriksson publication list](https://denniseriksson-math.github.io/Dennis-Math/) and title/author correction searches were checked on 2026-10-18 without locating a separate correction. The arXiv versions predate publication; no comparison with their text is claimed. PDF hashes and version-specific reading records are in the packet.
