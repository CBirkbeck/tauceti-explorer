# HQ.3 — q-Hodge filtrations, modification and base change

This is the HQ.3 follow-up of the [accepted HQ.1 packet](../packets/HabiroCohomologyFoundations--HQ.1.json). The 24 existing HQ.3 declarations remain their owners' declarations. This document imports them and adds three targets for finite-projective coefficient change. It does not replace the original packet or its suggested file. The new pass is **planned**, with explicit supplier requests and gaps; no result is claimed formalised.

The source is Ferdinand Wagner's [*q-Hodge complexes over the Habiro ring*, arXiv:2510.04782v2](https://arxiv.org/pdf/2510.04782v2), 8 October 2025, read on 6 October 2026. Definition 3.2, Theorem 3.11, Constructions 3.32, 3.38, 3.42, 3.45, and their surrounding proofs specify the fixed-base construction. Appendix A, Theorem A.1, gives completed q-de Rham base change. **It does not give base change of chosen q-Hodge filtrations or the Habiro–Hodge complex.** The new arguments below therefore identify their extra ingredients and their unresolved exports.

The pinned libraries are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed HQ.3 audit is “not built”. The libraries supply ordinary categorical limit maps and finite/projective module predicates, not the enhanced q-Hodge construction. The suggested file uses those ordinary interfaces and states its limitations at each affected declaration.

## Conventions and objects

Throughout, A is a perfectly covered Λ-ring: it has a faithfully flat Λ-map into a perfect Λ-ring, equivalently each Adams operation ψ^m is faithfully flat. It is p-torsion free for every prime. R is an animated A-algebra. All tensor products, quotients, limits and completions in this document are derived. We use the enhanced derived categories, rather than interpreting ordinary homotopy-category limits as enhanced limits.

Write t=q−1. A descending filtration F has maps F^{i+1}→F^i and is constant in degrees i≤0. Its graded piece is cofib(F^{i+1}→F^i). An ascending filtration C has maps C_{i−1}→C_i, with gr_i C=cofib(C_{i−1}→C_i), and is exhaustive when its colimit is the underlying object.

A module over t^⋆A[q] has, in addition to the descending transition maps, multiplication-by-t maps F^{i−1}→F^i. Its **degree-one filtered quotient** has step i equal to cofib(t:F^{i−1}→F^i). It is not the degreewise quotient cofib(t:F^i→F^i). This is the inherited Convention 3.1 correction E102 and is essential for both pair transport and the base-ring test.

A q-Hodge pair P=(R,F) is the object of Definition 3.2, imported as `HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations`. F is a filtered t^⋆A[q]-module equipped with the following data.

1. **(a)** F^0≃qdR_{R/A}, agreeing with the constant nonpositive steps.
2. **(b)** Its degree-one quotient by t is equivalent, as a filtered A-module, to fil_H dR_{R/A}, with the usual q=1 comparison in nonpositive degrees.
3. **(c)** After rationalisation and t-completion, F is equivalent to the combined Hodge and t-adic filtration on (dR_{R/A}⊗ℚ)[[t]]. This agrees with the canonical unfiltered rational comparison and fits with (b) into its prescribed square.
4. **(c_p)** For each prime p, p-complete first, invert p, and t-complete. The resulting filtration is equivalent to the combined Hodge and t-adic filtration on (dR_{R/A})^∧_p[1/p][[t]]. It agrees with the usual nonpositive-degree comparison, fits with (c) and (b) into the prescribed two squares, and includes a compatibility between those squares. The compatibility itself agrees with the usual one in nonpositive degrees.

These equivalences, squares, and homotopies between compatibility data are part of P. In particular, (c_p) is an independent axiom. An equivalence of underlying complexes or a proof of rational compatibility does not construct the whole pair. The category AniAlg_A^{qHodge} is an iterated pullback of categories of animated algebras and filtered modules, retaining the full enhanced diagram. The pair category has its imported symmetric monoidal structure; the algebra input for P⊗Q is R⊗^L_A S.

The **q-Hodge modification** is

\[
 M_A(P)=qHdg_{R/A}:=
 \left(\operatorname*{colim}_{i\geq0}
   [F^0\xrightarrow{t}F^1\xrightarrow{t}F^2\longrightarrow\cdots]
 \right)^\wedge_t .
\]

This uses the forward multiplication maps, rather than the descending transition maps. Its mod-t conjugate filtration is imported separately. For smooth inputs the comparison with underived q-Ω uses the completed filtration, as in the existing smooth-comparison theorem; qdR and q-Ω are not silently identified for every smooth input. In a framed coordinate model the modified differential is t times the Jackson differential: D(x^r)=(q^r−1)x^{r−1}dx.

For each positive integer m, let F_m be the **twisted q-Hodge filtration** on qdR^{(m)}. The prime-power construction is the recursive Nygaard/relative-Frobenius pullback of Construction 3.32, with the preceding filtration rescaled by Φ_{p^a}(q). The global construction is the filtered arithmetic fracture square of 3.38, with Adams-twisted rational, p-inverted, and p-complete factors. Its comparison for N|N′ and the cofinal factorial N-tower remove the auxiliary choice of N. For n|m the divisor-transition maps are the projections and recursive prime-power maps of 3.41. F_m/(q^m−1), in filtration degree one, is the animated stupid filtration of qW_m dR.

Put

\[
 T_{A,m}(P)=q\text{-}\mathcal Hdg_{R/A,m}:=
 \left(\operatorname*{colim}_{i\geq0}
    [F_m^0\xrightarrow{q^m-1}F_m^1\longrightarrow\cdots]
 \right)^\wedge_{q^m-1}.
\]

Proposition 3.43 identifies (T_{A,m})^∧_{q^n−1} with T_{A,n} when n|m. The **Habiro–Hodge complex** is

\[
 H_A(P)=q\text{-}\mathcal Hdg_{R/A}:=
 \operatorname*{lim}_{k\geq1}T_{A,k!}(P).
\]

The factorial tower is cofinal in the divisibility indexing and avoids pretending that isolated divisor maps automatically provide all higher coherences. Construction 3.45 supplies a coherent tower. H_A is Habiro-complete in the sense owned by `HabiroRings:HR.2/habiro-complete-modules`; its (q^m−1)-completion is T_{A,m}, and H_A^∧_t≃M_A. Theorem 3.11(a) and Lemma 3.46 make H a **symmetric monoidal** lift of M through HR.2's Habiro-complete category. Its tensor is the Habiro-completed derived tensor. This is a factorisation by completion functors; the Habiro-complete category is not being identified with a subcategory of the t-complete category.

## Cyclotomic reduction and the no-go theorem

The exhaustive ascending filtration of Theorem 3.11(b) lives on

\[
 H_A(P)/(q^m-1),
\]

with its lax symmetric monoidal structure. Define, without shifting twice,

\[
 G^i_{A,m}(R):=\operatorname{gr}^i
    (\mathrm{fil}_{H_m}\,qW_m\mathrm{dR}_{R/A}).
\]

The i-th graded piece of the ascending filtration is G^i_{A,m}(R). For smooth S this is qW_m Ω^i_{S/A} in cohomological degree i. The source uses inconsistent conventions for the notation qW_m dR^i after Example 3.12; this document applies the already confirmed E401 convention and uses G^i throughout. If one instead uses unshifted derived forms U^i, then G^i=U^i[−i]. There is no additional [−i] on G^i.

For m=1 the ascending filtration is the conjugate filtration. For smooth inputs it is the cohomological Whitehead filtration, and the Bockstein for q^m−1 identifies the cohomology differential with the q-de Rham–Witt differential, under the existing smooth-reduction theorem. Multiplicative upgrades require compatible E_n or filtered derived-commutative data on the pair; the filtration axioms alone do not supply those upgrades.

**RT-AREA-etale/31 is handled here and in the packet:** on the t-complete modification M_A/(q^m−1) one obtains the t-completed ascending filtration and t-completed graded pieces. For m>1 one must not state the uncompleted G^i comparison on M_A. Finite-projective scalar extension below preserves the distinction and commutes with the appropriate completions.

Lemma 3.3 assumes **A is not a ℚ-algebra**. Then AniAlg_A^{qHodge}→AniAlg_A is not essentially surjective and has no section, even on all smooth A-algebras. The inherited witness uses a prime with nonzero p-completion, a free perfect p-complete δ-ring and its quotient by a generator: a required q-deformed divided-power element cannot simultaneously lift x^p/p and satisfy the p-adic rational ideal condition. Our BC_f transports an existing P. It does not evade this obstruction by choosing P from R.

## Finite-projective coefficient change

Fix a Λ-morphism f:A→B between perfectly covered rings and assume **B is finite projective over A**. R_B means R⊗^L_A B; P_B will mean the transported pair, never an unrelated chosen filtration on R_B. Denote scalar extension by E_f=−⊗^L_A B on the appropriate A[q]-module category.

The algebraic starting point is [Stacks, Lemma 10.78.2](https://stacks.math.columbia.edu/tag/00NV): B is a retract of a finite free A-module. Thus, on underlying modules, E_f is a retract of a finite power functor. In the enhanced category finite powers are finite biproducts, so E_f is exact and preserves all limits as well as colimits. The coherent B-linear exchange statement is requested from DD.1. Ordinary `Module.Finite` and `Module.Projective` record the hypothesis; they do not already implement its enhanced consequences.

In particular, E_f commutes with derived cofibers, p- and cyclotomic completions, rationalisations, filtered colimits, and the factorial inverse limit. Use derived Koszul completion from DD.1; no unqualified replacement by limits of ordinary A/I^n quotients is made. This is why finite projectivity, rather than flatness alone, is the range developed here.

The next three targets describe the complete chain: extend the chosen pair; compare the twisted filtrations with their gluing maps; map the completed colimits and take the inverse limit. Each theorem is conditional on the exact supplier interfaces listed below. Fixed-base functoriality in Wagner is not a proof of coefficient-change naturality.

### 1. Finite-projective scalar extension of chosen q-Hodge filtrations

Node: `HabiroCohomologyFoundations:HQ.3/finite-projective-base-change-of-chosen-filtrations`.

For f : A → B as above, put R_B = R ⊗^L_A B and (E_f F)^i = F^i ⊗^L_A B, retaining the filtered (q−1)^⋆B[q]-module structure. Transport the equivalences (a), (b), (c), (c_p), their comparison squares and compatibility between squares through scalar extension to obtain a pair P_B. This defines a functor BC_f : AniAlg_A^{qHodge} → AniAlg_B^{qHodge}, with coherent identity and composition equivalences. It depends on P, and is not a choice of filtration on a bare algebra. The complete enhanced finite-projective exchange and filtered de Rham base-change interfaces are requested from DD.1 and DD.2. In this range E_f qHdg_A(P) ≃ qHdg_B(P_B), since E_f commutes both the modification colimit and q−1-completion.

The proof or construction uses the following steps.

1. Use the Stacks splitting B ⊕ K ≃ A^r. On underlying enhanced A-modules E_f is a retract of a finite power functor; it is exact, t-exact and commutes all small limits and colimits. Request the coherent enhanced statement from DD.1, including its B-linear form; do not infer it merely from the two ordinary Mathlib classes.
2. The HQ.2 derived q-de Rham base-change equivalence is initially q−1-completed. DD.1 shows E_f of a q−1-complete object is complete here, removing that extra completion and giving clause (a).
3. For (b), tensor the cofiber F^{i−1} → F^i given by multiplication by q−1, using DD.1 exactness, and apply DD.2 filtered derived de Rham base change. Do not replace this filtered quotient by F^i/(q−1).
4. For (c) and each (c_p), use DD.1 to commute E_f with q−1- and p-completions, localisations and the limits in the combined filtration, and DD.2 for the Hodge steps. Apply the functor to the entire defining diagram, including the chosen homotopies and their higher compatibility data. Clause (c_p) is transported independently, never deduced from (c).
5. Construct BC_f by the iterated-pullback description of the category of pairs. Unit and associativity of derived tensor yield coherent identity/composition; the underlying algebra is animated base change. Transport the filtered module structure via (q−1)^⋆A[q] → (q−1)^⋆B[q].
6. Use the imported definition of qHdg as the q−1-completed colimit along multiplication by q−1. DD.1 exchanges E_f with these two operations; identify the resulting map with qHdg_B of P_B.

Direct dependencies: `mathlib:Module.Finite`, `mathlib:Module.Projective`, `HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations`, `HabiroCohomologyFoundations:HQ.2/derived-base-change-and-its-completion-hypotheses`, `HabiroCohomologyFoundations:HQ.2/the-quotient-convention-for-filtered-modules`, `HabiroCohomologyFoundations:HQ.2/the-combined-hodge-and-q-minus-one-adic-filtration`, `HabiroCohomologyFoundations:HQ.3/the-q-hodge-complex`, `DerivedDeRhamCohomology:DD.1`, `DerivedDeRhamCohomology:DD.2`, `DerivedDeRhamCohomology:DD.2/derived-base-change-kunneth`, `mathlib:CategoryTheory.preservesColimitIso`.

The planning API is:

| Declaration | Role and statement |
| --- | --- |
| `QHodgeBaseChange.pair` | constructor: The scalar-extension functor BC_f on chosen pairs, retaining Definition 3.2 equivalences and higher compatibility data. |
| `QHodgeBaseChange.filtration` | data: Natural equivalence fil(P_B) ≃ E_f fil(P) as modules over (q−1)^⋆B[q]; evaluation at every step is F^i ⊗^L_A B. |
| `QHodgeBaseChange.underlying` | compatibility: For forgetful functors U_A,U_B, BC_f ⋙ U_B ≃ U_A ⋙ (−⊗^L_A B). |
| `QHodgeBaseChange.clauseData` | compatibility: Transport the full defining diagram: degree-one q−1 quotient, rational completion, and p-completion then p-inversion then q−1-completion. Comparisons with the filtered de Rham diagrams commute with all supplied squares and homotopies. |
| `QHodgeBaseChange.identity` | simp: BC_id ≃ id on the category of chosen pairs, with the identity on algebra and every filtration step. |
| `QHodgeBaseChange.composition` | functoriality: For finite-projective A → B → C, BC_g ∘ BC_f ≃ BC_{gf}, compatible with the tensor associator and the unit and associativity coherences. |
| `QHodgeBaseChange.modification` | equivalence: E_f qHdg_A(P) ≃ qHdg_B(P_B), induced by the maps of modification colimits and q−1-completion; no additional completion on the left in this finite-projective range. |

The unit tests distinguish the intended construction from plausible replacements.

- **`QHodgeBaseChangeTests.identity` (degenerate):** For f=id_A the extended pair is P, and the map on F^i is the tensor-unit equivalence for every i.
- **`QHodgeBaseChangeTests.split` (computation):** For the diagonal Λ-map A → A×A with componentwise Adams operations, B is free of rank two; R_B ≃ R×R and every filtration step and each clause datum splits into two copies. After the two projections to A both recovered pairs are P.
- **`QHodgeBaseChangeTests.filteredQuotient` (characterisation):** For the base pair R=A with F^i=(q−1)^i A[[q−1]] (constant for i≤0), its degree-one filtered quotient is B in step 0 and zero in positive steps. The degreewise quotient instead has B in every positive step and fails (b). This tests the cofiber F^{i−1} → F^i, not its unshifted substitute.

Acceptance: All four clauses, with their supplied coherences, survive scalar extension. No section of the forgetful functor on bare algebras is asserted. Identity and successive finite-projective extensions give the tensor unit and associator, not unrelated chosen equivalences.

### 2. Finite-projective base change of the twisted q-Hodge filtrations

Node: `HabiroCohomologyFoundations:HQ.3/finite-projective-base-change-of-twisted-filtrations`.

For P_B constructed above, scalar extension identifies E_f fil^⋆_{qHodge,m} qdR^{(m)}_{R/A} with fil^⋆_{qHodge,m} qdR^{(m)}_{R_B/B} for every positive m. The equivalence is over (q^m−1)^⋆B[q], is natural in P and f, and respects every divisor transition n | m and the lax symmetric monoidal structures. This conclusion requires the precise finite-projective relative-Frobenius/Nygaard base-change compatibility requested from PR.3 and the finite-projective filtered décalage compatibility requested from AI.1. These interfaces remain open; the packet does not report this theorem as established or formalised.

Suggested theorem name: `TwistedQHodgeBaseChange.equivalence`.

The proof or construction uses the following steps.

1. Use the Λ-morphism relation fψ_A^d=ψ_B^df and derived tensor associativity to identify the coefficient-twisted algebra R_B⊗_{B,ψ_B^d}B with R⊗_{A,ψ_A^d}B. This does not require that an Adams-operation square be cartesian.
2. For m=p^a use Construction 3.32 inductively: a=0 is E_f of F, p-completed, by the first node. For a>0, compare the rescaled previous filtration and the cyclotomic-adic filtration by DD.1, and the Nygaard/Frobenius leg by the PR.3 and AI.1 requested compatibilities. Exact scalar extension preserves the defining pullback.
3. For arbitrary m use the imported animated fracture square and Construction 3.38. DD.1 exchanges E_f with each finite product, pullback, p-completion, localisation and cyclotomic completion; the Λ relation handles every ψ^d twist. The diagrams of gluing maps match by relative-Frobenius naturality, not just objectwise equivalence.
4. Track the comparison for N | N′ through the same diagrams; the choice-independent construction can use the factorial N-tower and E_f preserves its limit by DD.1. This also avoids asserting arbitrary tensor commutes with products over primes.
5. Follow Construction 3.41 on divisor projections and recursive prime-power transition maps. The same comparisons supply a natural transformation of the factorial descent diagrams; record identity, composition, and multiplicative coherences on the level of diagrams, not only maps in a homotopy category.

Direct dependencies: `HabiroCohomologyFoundations:HQ.3/finite-projective-base-change-of-chosen-filtrations`, `HabiroCohomologyFoundations:HQ.3/the-twisted-q-hodge-filtration-p-adically`, `HabiroCohomologyFoundations:HQ.3/the-twisted-q-hodge-filtration-globally`, `HabiroCohomologyFoundations:HQ.4/the-nygaard-filtration-on-twisted-q-de-rham-complexes`, `HabiroCohomologyFoundations:HQ.4/the-arithmetic-fracture-squares-and-cyclotomic-descent`, `HabiroCohomologyFoundations:HQ.3/the-twisted-q-hodge-filtration-deforms-the-stupid-filtration`, `DerivedDeRhamCohomology:DD.1`, `PrismaticCohomology:PR.3`, `AInfCohomology:AI.1`.

Acceptance: At m=1 this is precisely the extended input filtration. At m=p the relative-Frobenius pullback square commutes, rather than only the q−1-specialisation. The divisor transitions commute before passage to limits, including m=6,n=2 and m=p²,n=p.

### 3. Finite-projective base change of the Habiro–Hodge complex

Node: `HabiroCohomologyFoundations:HQ.3/finite-projective-habiro-hodge-base-change`.

Write T_A(P)_k = q-𝓗dg_{R/A,k!} for k≥1 and H_A(P)=lim_k T_A(P)_k, as in Construction 3.45. The twisted-filtration comparison induces equivalences σ_k : E_f T_A(P)_k ≃ T_B(P_B)_k, coherent with all transition maps. Define β_f(P): E_f H_A(P) → H_B(P_B) as E_f(lim T_A) → lim E_f(T_A) → lim T_B. In the finite-projective range this is an equivalence and E_f H_A is already Habiro-complete, so it equals Habiro-completed scalar extension. For every m the map commutes with partial descent, reduction by q^m−1, and the exhaustive ascending filtration on H_A/(q^m−1); its i-th graded comparison is E_f G^i_{A,m}(R) ≃ G^i_{B,m}(R_B), where G^i is the associated graded of the animated stupid filtration, with its intrinsic cohomological shift. Identity, composition and Künneth compatibility use tensor associativity and the imported strict monoidality. The source does not state β_f; this is the construction planned here, conditional on the second node’s supplier interfaces.

The proof or construction uses the following steps.

1. Use the second node to map the colimits in Construction 3.42, whose forward maps multiply by q^m−1, and use DD.1 to exchange E_f with their cyclotomic completions. Obtain σ_m with divisor-transition compatibility from Proposition 3.43; restrict to the factorial tower.
2. Form the limit comparison and then the limit of σ_k. The ordinary categorical shadow uses limit.post followed by limMap, with their projection formulas. DD.1 supplies the actual enhanced limit comparison; preserve all natural-transformation coherences.
3. Finite projectivity makes the first comparison invertible, and the second is a limit of equivalences. Thus β is an equivalence. Using the factorial formula from HR.2, E_f commutes with Habiro completion, so E_f of a Habiro-complete object is Habiro-complete; do not replace this by a smashing localisation.
4. Complete β at q^m−1 and invoke the imported partial-descent equivalences; at m=1 recover QHodgeBaseChange.modification. Reduction is a derived cofiber and is preserved by E_f.
5. The ascending filtration in Theorem 3.11(b) is the colimit filtration on the REDUCTION OF H_A, obtained from the twisted filtration and the abstract colimit-filtration lemma. E_f commutes with its colimits and cofibers. The second node and the imported deformation-to-stupid-filtration comparison identify its graded pieces after scalar extension, so no separate unrestricted q-Witt base-change theorem is assumed.
6. The tensor unit and associator identify the identity and composite maps by projections to every partial descent. Tensor multiplication and the imported strict monoidality give the Künneth square for P⊗Q (the product of affine inputs); distinguish this from a categorical product of rings. Scalar extension transports E_n structures when P has compatible such data.

Direct dependencies: `HabiroCohomologyFoundations:HQ.3/finite-projective-base-change-of-chosen-filtrations`, `HabiroCohomologyFoundations:HQ.3/finite-projective-base-change-of-twisted-filtrations`, `HabiroCohomologyFoundations:HQ.3/the-m-truncated-descent`, `HabiroCohomologyFoundations:HQ.3/the-partial-descents-are-compatible`, `HabiroCohomologyFoundations:HQ.3/the-habiro-hodge-complex`, `HabiroCohomologyFoundations:HQ.3/the-habiro-hodge-complex-is-symmetric-monoidal`, `HabiroCohomologyFoundations:HQ.3/habiro-descent-the-q-de-rham-witt-filtration`, `HabiroCohomologyFoundations:HQ.3/the-abstract-colimit-filtration-lemma`, `HabiroCohomologyFoundations:HQ.4/the-derived-q-de-rham-witt-complex-and-its-stupid-filtration`, `HabiroRings:HR.2/habiro-complete-modules`, `HabiroRings:HR.2/the-monoidal-structure`, `DerivedDeRhamCohomology:DD.1`, `mathlib:CategoryTheory.Limits.limit.post`, `mathlib:CategoryTheory.Limits.limMap`, `mathlib:CategoryTheory.Limits.limMap_π`, `mathlib:CategoryTheory.Limits.limit.post_π`, `mathlib:CategoryTheory.Limits.isIso_limMap`, `mathlib:CategoryTheory.preservesLimitIso`.

The planning API is:

| Declaration | Role and statement |
| --- | --- |
| `HabiroHodgeBaseChange.map` | constructor: β_f(P)=lim(σ) ∘ [E_f(lim T_A)→lim E_f(T_A)], a B[q]-linear map, natural in chosen pairs. |
| `HabiroHodgeBaseChange.projection` | characterisation: For every factorial stage k, β_f(P) followed by π_{B,k} equals E_f(π_{A,k}) followed by σ_k; this determines β. |
| `HabiroHodgeBaseChange.isIso` | equivalence: For finite-projective f and the requested enhanced and Frobenius/Nygaard compatibilities, β is an equivalence; E_f H_A is already Habiro-complete. |
| `HabiroHodgeBaseChange.identity` | simp: β_id is the identity under the tensor-unit identifications. |
| `HabiroHodgeBaseChange.composition` | functoriality: For A → B → C in the range, β_{gf}=β_g ∘ E_g(β_f), with the canonical tensor-associativity and target-pair identifications and their coherences. |
| `HabiroHodgeBaseChange.partialDescent` | compatibility: The q^m−1-completion of β identifies with σ_m under H_A^∧_{q^m−1}≃T_{A,m}, for every m, not only factorial m. |
| `HabiroHodgeBaseChange.qMinusOne` | compatibility: At m=1 the completed β is QHodgeBaseChange.modification: E_f qHdg_A(P)≃qHdg_B(P_B). |
| `HabiroHodgeBaseChange.cyclotomicFiltration` | compatibility: The reduced β lifts to an equivalence of exhaustive ascending filtered modules on H/(q^m−1). Its graded map is E_f G^i_{A,m}≃G^i_{B,m}, where G^i=gr^i of the animated stupid filtration, with no additional shift. |
| `HabiroHodgeBaseChange.kuenneth` | compatibility: For chosen pairs P,Q, scalar extension of H_A(P)⊗̂_{H,A[q]}H_A(Q)≃H_A(P⊗Q) followed by β_{P⊗Q} agrees with β_P⊗̂β_Q followed by the B-base Künneth equivalence; the unit square also commutes. |

The unit tests distinguish the intended construction from plausible replacements.

- **`HabiroHodgeBaseChangeTests.identity` (degenerate):** For f=id_A and the identity stagewise comparison, β is id on the limit, with identity projections at all factorial stages.
- **`HabiroHodgeBaseChangeTests.split` (computation):** For f:A→A×A diagonal, E_f H_A≃H_A×H_A; σ_m is the corresponding two-copy comparison at every m, and β has the two expected component maps. This distinguishes tensoring before the limit from forgetting one component.
- **`HabiroHodgeBaseChangeTests.coordinate` (computation):** For the coordinate q-Hodge filtration on A[x] and finite-projective A→B, the q−1-completion of β is coefficient extension of the complex with differential D(x^r)=(q^r−1)x^{r−1}dx (r≥1). In particular D(x²)=(q²−1)x dx. The differential has not been replaced by (q−1)r x^{r−1}dx.
- **`HabiroHodgeBaseChangeTests.unboundedDenominators` (non-example):** Do not infer the needed limit/completion exchange from flatness: for the Λ-map ℤ→ℚ, ℤ[[t]]⊗ℚ→ℚ[[t]] is not surjective. Its image has a common nonzero integer denominator for all coefficients, whereas the series with coefficients 1/(n+1)! has no such denominator. This lies outside the finite-projective hypothesis and prevents silently upgrading this range to all Λ-maps.

Acceptance: The defining projection identity is π_{B,k}β = σ_k E_f(π_{A,k}). For A → A×A, E_f H_A ≃ H_A×H_A and β identifies both component maps with the identity on H_A; the coefficient-change map H_A → H_B obtained by the tensor unit followed by β is diagonal. At q−1 the polynomial one-coordinate model sends x^r to (q^r−1)x^{r−1}dx after base change; it does not introduce division by r or by q−1. For m>1 the ascending filtration and uncompleted q-Witt graded pieces are stated on H/(q^m−1); on qHdg/(q^m−1) take q−1-completion of the filtration and graded pieces.

## Why the broader assertion remains open

The flat Λ-map ℤ→ℚ is a useful diagnostic: ℤ[[t]]⊗ℚ has a common nonzero denominator across every coefficient of each element, whereas ℚ[[t]] does not. The series ∑_{n≥0} t^n/(n+1)! lies outside the image. Thus the *uncompleted* scalar-extension comparison with t-completion is not an equivalence. One cannot apply “tensor commutes with completion” on the ground that ℚ is flat.

This diagnostic does not say that suitably **completed** base change over ℚ fails. It says that the argument used in this pass does not prove it. For a broader Λ-map one must specify how to obtain a target pair and a coherent map of twisted descent towers, with all of (c_p), Frobenius and divisor compatibilities. The canonical comparison E(lim T)→lim E(T) still provides a map once those data exist; its being an equivalence is a separate assertion. No unrestricted map-of-pairs construction or unrestricted Habiro base-change equivalence is claimed here.

## Supplier boundaries and acceptance

The precise outstanding exports are recorded as packet requests; none is planned a second time in HQ.3.

- **`DerivedDeRhamCohomology:DD.1`:** Enhanced coherent finite-projective scalar extension: if B is finite projective over A, −⊗^L_A B is exact and t-exact, preserves all small limits and colimits, and commutes with derived principal and finite-generated-ideal completion (via derived Koszul quotients), filtered cofibers, Rees degree-one quotients, Day convolution and completed colimits. Require identity/composition/naturality of these comparisons, also after p- and cyclotomic completion and on factorial towers. No unqualified Rlim of ordinary quotients over nonnoetherian rings.
- **`DerivedDeRhamCohomology:DD.2`:** Filtered enhancement of the imported DerivedDeRhamCohomology:DD.2/derived-base-change-kunneth: for animated R and finite-projective A→B, fil_H dR_{R/A}⊗^L_A B ≃ fil_H dR_{R⊗^L_A B/B}, with comparison squares, multiplicativity and identity/composition coherence. The existing node gives unfiltered base change, so reuse it; request only the filtered enhancement it does not explicitly state.
- **`PrismaticCohomology:PR.3`:** For perfectly covered Λ A→B with B finite projective over A, identify the p-completed relative q-de Rham/prismatic complexes over the q-de Rham prisms (Â_p[[q−1]],([p]_q)) and (B̂_p[[q−1]],([p]_q)) after completed coefficient extension. Prove compatibility with relative Frobenius, its iterates and the Frobenius-twisted relative Nygaard filtration, including filtered E∞ structures, divisor transitions and identity/composition coherences. Extend the polynomial calculation by animation. This is the input used in Wagner 3.32/3.38, not unrestricted prismatic base change or equality with Nygaard completion.
- **`AInfCohomology:AI.1`:** Finite-projective flat base-change compatibility for Lη_f and its filtered décalage construction, for f=Φ_{p^a}(q) and [m/d]_q in the torsion-free complexes of HQ.4, with naturality under relative Frobenius and coefficient twists. Prove on f-torsionfree representatives by kernels and tensor exactness, then descend; do not assume Lη is exact or commutes with arbitrary completion.

The new declarations serve coefficient changes in the HQ.3 stage and its consumers HQ.5, HQ.8, HR.6 and `RefinedTraceMethods:RT.4:q-Hodge`. Those consumers retain their own hypotheses for geometric descent, comparison maps, or chosen filtrations. In particular this affine finite-projective argument does not claim arbitrary base change of global cohomology of a smooth scheme.

The stage is accepted at planning level when all four pair clauses and their coherences are tracked, relative Frobenius and divisor maps commute, β has the projection characterisation, its identity/composition and Künneth squares have the prescribed identifications, and its reduced filtration sits on the correct object with the correct shift. The seven new unit tests supply identity, two-copy, shifted-quotient, coordinate, and denominator checks. The inherited coordinate/Koszul and smooth/étale tests below continue to apply.

## Reused HQ.3 declarations, APIs and tests

The following are references to the accepted packet, not new declarations in this follow-up. Their full prerequisites, sources and proof gaps remain in [the HQ.1 packet](../packets/HabiroCohomologyFoundations--HQ.1.json), and their original prototype is [the HQ.1 suggested file](../suggested/HabiroCohomologyFoundations--HQ.1.lean). The reader states the convention-free cyclotomic graded comparison and the factorisation clause, without the incompatible shift or inclusion gloss.

### For smooth inputs, q-Omega is the q-Hodge completion of the derived complex and the decalage of the q-Hodge complex

Imported `HabiroCohomologyFoundations:HQ.3/the-smooth-comparison-of-q-omega-with-the-q-hodge-completion` (theorem).

Let S be a smooth A-algebra, where A is a perfectly covered Λ-ring, and suppose qdR_{S/A} is equipped with a q-Hodge filtration. Then: (a) qΩ_{S/A} ≃ qdR̂_{S/A}, the completion of qdR_{S/A} at the q-Hodge filtration; (b) Lη_{(q−1)} qHdg_{S/A} ≃ qΩ_{S/A}, so that Lη_{(q−1)} of the Habiro–Hodge complex is a Habiro descent of qΩ_{S/A}. The source prints qΩ_{R/A} in (b); R is a misprint for S (source issue E2). Neither statement asserts that the uncompleted derived complex agrees with the underived one; for a general smooth algebra it does not.

Acceptance supplied by the imported node:

- Both clauses carry the hypothesis that a q-Hodge filtration has been chosen.
- The first clause is about the completion at the q-Hodge filtration, not about the Hodge completion of the de Rham complex alone.
- The proof of (a) names the use of the (c_p) datum.
- The packet contains no statement that the derived and underived q-de Rham complexes of a smooth algebra agree.

### q-Hodge filtrations: the four conditions and the coherences between them

Imported `HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations` (definition).

Let A be a perfectly covered Lambda-ring and R an animated A-algebra. A q-Hodge filtration on the derived q-de Rham complex of R over A is a filtered module over the filtered ring given by the (q-1)-adic filtration on the polynomial ring in q over A, indexed by the non-negative integers and constant below zero, equipped with: (a) an equivalence of modules over the polynomial ring in q from the derived q-de Rham complex onto the zeroth filtration step, so that the filtration is a descending filtration on that complex; (b) an equivalence of filtered A-modules from the quotient of the filtration by q-1, taken in the sense that q-1 sits in filtration degree one, onto the Hodge filtration on the derived de Rham complex, agreeing in filtration degrees at most zero with the usual identification; (c) an equivalence of filtered modules from the (q-1)-completed rationalisation of the filtration onto the combined Hodge and (q-1)-adic filtration on the power series ring in q-1 over the rationalised derived de Rham complex, agreeing in degrees at most zero with the usual identification and fitting with (b) into a commutative square; and (c_p) for every prime p an equivalence of filtered modules from the (q-1)-completed localisation at p of the p-completed filtration onto the combined Hodge and (q-1)-adic filtration on the power series ring over the p-completed derived de Rham complex with p inverted, agreeing in degrees at most zero with the usual identification, compatible with (c) in a commutative square, compatible with (b) in a second commutative square, and with those two compatibilities themselves compatible. Since these are statements in higher category theory, every compatibility is itself a datum. Pairs consisting of an animated A-algebra and a q-Hodge filtration on its derived q-de Rham complex form a category, expressible as an iterated pullback of the category of animated A-algebras with categories of filtered modules.

API supplied by the imported node:

- `QHodgeFiltration` — structure: The data of a q-Hodge filtration on the derived q-de Rham complex of an animated A-algebra: a filtered (q-1)^* A[q]-module with the equivalences c_0, c_{(q-1)}, c_Q, c_{Q_p} and all the coherences of Definition 3.2.
- `QHodgeFiltration.zerothEquiv` — projection: Clause (a): the equivalence from the derived q-de Rham complex onto the zeroth step.
- `QHodgeFiltration.modQSubOneEquiv` — characterisation: Clause (b): the equivalence c_{(q-1)} from the filtered quotient by q-1 onto the Hodge filtration of derived de Rham cohomology, agreeing in degrees at most zero with the unfiltered one.
- `QHodgeFiltration.rationalEquiv` — compatibility: Clause (c): the equivalence c_Q with the combined Hodge and (q-1)-adic filtration after (q-1)-completed rationalisation, with its square against c_{(q-1)}.
- `QHodgeFiltration.pAdicRationalEquiv` — compatibility: Clause (c_p): the equivalence c_{Q_p}, with its squares against c_Q and c_{(q-1)} and the compatibility between them.
- `PairsCat` — structure: The category of pairs (R, q-Hodge filtration), as an iterated pullback of animated A-algebras and categories of filtered modules, with the forgetful functor PairsCat.forget to animated A-algebras.
- `PairsCat.forget_filtration` — projection: The forgetful functor to (q-1)-complete filtered (q-1)^* A[q]-modules.
- `QHodgeFiltration.ofUnderived` — constructor: For smooth S, a filtration of the underived q-de Rham complex satisfying the analogues of (a) to (c_p) pulls back along the map from the derived complex to a q-Hodge filtration (Remark 3.6).
- `QHodgeFiltration.ofRational` — example: Over a Q-algebra A the combined Hodge and (q-1)-adic filtration, transported along the rational comparison, is a q-Hodge filtration.

Unit tests supplied by the imported node:

- `QHodgeFiltration.dimOneDetermined` — characterisation: For S smooth over Z of relative dimension at most one, any filtered q-deformation of the Hodge filtration on the q-de Rham complex is (q-1)^{n-1} times its first step in every degree n >= 1, since the Hodge filtration vanishes from degree two on (paragraph 1.14).
- `QHodgeFiltration.naivePullback` — non-example: For smooth S, the pullback of the Hodge filtration along the map from the q-de Rham complex to the de Rham complex contains (q-1) times the whole complex in every step, so it satisfies clause (c) only in degrees at most one (paragraph 1.14); already for S = Z its second step is (q-1) Z[[q-1]] instead of (q-1)^2 Z[[q-1]], so it is not a q-Hodge filtration.
- `QHodgeFiltration.agreement_nonpos` — characterisation: In filtration degrees at most zero each of c_{(q-1)}, c_Q and c_{Q_p} is the already-known unfiltered identification; a definition without this requirement admits filtrations whose zeroth step is identified with the q-de Rham complex by an arbitrary automorphism.
- `QHodgeFiltration.ofRational` — degenerate: If A is a Q-algebra, the combined Hodge and (q-1)-adic filtration is a q-Hodge filtration (clause (c_p) is vacuous because every p-completion vanishes), so the forgetful functor is essentially surjective; this is the case Lemma 3.3 excludes.

### The forgetful functor is not essentially surjective, so it has no section

Imported `HabiroCohomologyFoundations:HQ.3/no-functorial-choice-of-q-hodge-filtration` (theorem).

Let A be a perfectly covered Lambda-ring which is not an algebra over the rationals. Then the forgetful functor from pairs to animated A-algebras is not essentially surjective: there is an animated A-algebra whose derived q-de Rham complex admits no q-Hodge filtration at all. In particular the forgetful functor admits no section, not even when restricted to the full subcategory of smooth A-algebras, because a section on smooth algebras could be animated to a section on all animated algebras.

Acceptance supplied by the imported node:

- The hypothesis that A is not a rational algebra is present and used.
- The witness object and the reason it fails are both recorded.
- The deduction from non-essential-surjectivity to the absence of a section on smooth algebras is by animation and is written out.

### The q-Hodge complex, as the completed colimit of the filtration along multiplication by q-1

Imported `HabiroCohomologyFoundations:HQ.3/the-q-hodge-complex` (construction).

Given a pair of an animated A-algebra R and a q-Hodge filtration on its derived q-de Rham complex, the q-Hodge complex is the (q-1)-completion of the colimit of the sequence fil^0 -> fil^1 -> fil^2 -> ... whose maps are multiplication by q-1. It does not matter whether the filtration or its completion is used, since every element of the i-th step becomes divisible by (q-1)^i in the colimit and the result is (q-1)-complete. If S is smooth and a filtration of the underived q-de Rham complex of S is given that satisfies the analogues of clauses (a) to (c_p), its pullback along the canonical map from the derived to the underived complex is a q-Hodge filtration, because the de Rham complex of S is the Hodge completion of the derived one and every filtration is the pullback of its completion; the associated q-Hodge complex is computed by the same colimit on the underived filtration. This is how the coordinate-dependent construction on a framed smooth algebra produces an object of the theory.

API supplied by the imported node:

- `qHodge` — constructor: For a pair, the (q-1)-complete A[q]-module given by the completed colimit along multiplication by q-1.
- `qHodge.ofCompletion` — characterisation: The construction is unchanged when the filtration is replaced by its completion.
- `qHodge.map` — functoriality: A functor from the category of pairs to (q-1)-complete A[q]-modules, with map_id and map_comp.
- `qHodge.ofUnderived` — compatibility: For smooth S and a filtration of the underived complex satisfying the analogues of the clauses, the q-Hodge complex of the pulled-back filtration is the colimit computed on the underived filtration.
- `qHodge.modQSubOne` — projection: Its reduction modulo q-1 carries the conjugate filtration.
- `qHodge.framed` — example: For a framed smooth algebra with the coordinate filtration, it is the q-difference complex with every differential multiplied by q-1.

Unit tests supplied by the imported node:

- `qHodge.framed` — computation: For a framed smooth algebra with the coordinate filtration (q-1)^{max(n - *, 0)}, the q-Hodge complex is the q-difference complex with every differential multiplied by q-1.
- `qHodge.polynomial_one` — computation: For S = A[x] with the coordinate filtration, the q-Hodge complex is A[x][[q-1]] -> A[x][[q-1]] dx with x^n -> (q^n - 1) x^{n-1} dx, whereas the q-de Rham complex has x^n -> [n]_q x^{n-1} dx.
- `qHodge.ofCompletion` — characterisation: Replacing the filtration by its completion does not change the answer; a construction that omitted the final (q-1)-completion would fail this.
- `qHodge.ne_qdR` — non-example: The q-Hodge complex is not the q-de Rham complex: in the polynomial example the cokernel of the differential in degree one has the summand A[[q-1]]/(q-1) x^0 dx, zero for the q-de Rham complex since [1]_q = 1.

### The category of pairs is symmetric monoidal and the q-Hodge complex functor is monoidal

Imported `HabiroCohomologyFoundations:HQ.3/the-symmetric-monoidal-structure-on-pairs` (theorem).

The category of pairs of an animated A-algebra and a q-Hodge filtration carries a canonical symmetric monoidal structure, in which the tensor product of two pairs has underlying algebra the derived tensor product over A and underlying filtration the (q-1)-completed derived tensor product of the two filtrations over the filtered coefficient ring. With this structure the q-Hodge complex functor into (q-1)-complete modules over the polynomial ring in q carries a canonical symmetric monoidal structure, not merely a lax one.

Acceptance supplied by the imported node:

- The formula for the tensor product of two pairs is recorded, including the completion.
- The passage from lax to strict monoidality is by reduction modulo q-1 and is justified by completeness.
- The proof cites the symmetric monoidality of the Hodge-graded de Rham functor as its base case.

### The conjugate filtration on the q-Hodge complex modulo q-1, and its associated graded

Imported `HabiroCohomologyFoundations:HQ.3/the-conjugate-filtration` (construction).

Let a pair be given. Localising the filtration at q-1 and completing gives the (q-1)-adic filtration on the q-Hodge complex. Before taking the colimit the diagram is a bifiltered object with one ascending filtration, given by the steps of the colimit, and one descending filtration, given by the filtration on each step. Passing to the associated graded in the descending direction exhibits the reduction of the q-Hodge complex modulo q-1 as the colimit of the associated graded pieces along multiplication by q-1, and this presentation is an exhaustive ascending filtration, the conjugate filtration. Its associated graded is the shifted derived de Rham forms, equivalently the associated graded of the Hodge filtration on the derived de Rham complex.

API supplied by the imported node:

- `qHodge.conjFil` — constructor: The exhaustive ascending filtration on the reduction of the q-Hodge complex modulo q-1, given by the colimit of the Hodge-graded pieces along multiplication by q-1.
- `qHodge.gr_conjFil` — characterisation: Its n-th graded piece is the n-th derived de Rham form shifted by -n, equivalently the n-th Hodge graded piece of derived de Rham cohomology.
- `qHodge.conjFil_exhaustive` — characterisation: Its colimit is the whole reduction modulo q-1.
- `qHodge.conjFil_zero` — simp: The zeroth step is the zeroth Hodge graded piece, which is R.
- `qHodge.conjFil_laxMonoidal` — compatibility: A lax symmetric monoidal structure compatible with the one on the reduction modulo q-1, whose associated graded is the symmetric monoidal Hodge-graded de Rham functor.

Unit tests supplied by the imported node:

- `qHodge.conjFil_zero` — computation: The zeroth step, and zeroth graded piece, is R, the zeroth Hodge graded piece of derived de Rham cohomology.
- `qHodge.conjFil_smooth_finite` — computation: For S smooth of relative dimension d, the n-th graded piece is Omega^n_{S/A} in cohomological degree n, which vanishes for n > d and is non-zero for n = d when S is non-zero; so the filtration reaches the whole object exactly at stage d.
- `qHodge.conjFil_ascending` — non-example: The conjugate filtration is ascending; reading the bifiltration in the other direction yields the (q-1)-adic filtration on the q-Hodge complex instead, whose graded pieces are copies of the reduction modulo q-1, not the shifted de Rham forms.
- `qHodge.conjFil_underlying` — non-example: Its underlying object is the reduction of the q-Hodge complex modulo q-1, not the de Rham complex: for A = Z and S = Z[x] with the coordinate filtration it has H^1 = Z[x] dx (the differential x^n -> (q^n-1) x^{n-1} dx vanishes modulo q-1), while H^1 of the de Rham complex of Z[x] is the torsion module, the sum over n of Z/n.

### One graded lemma produces both the conjugate filtration and the q-Witt filtration

Imported `HabiroCohomologyFoundations:HQ.3/the-abstract-colimit-filtration-lemma` (theorem).

Let M be a graded module over the graded ring obtained from A by adjoining a generator of degree one and a generator of degree minus one. Then the degree-zero part of the base change of M along inverting the degree one generator, taken modulo the product of the two generators, admits a canonical exhaustive ascending filtration whose associated graded is the quotient of M by both generators. The proof filters the localisation of the polynomial ring on the degree one generator by the powers of that generator, whose associated graded is the direct sum of shifted copies of A, and transports that filtration along the base change.

Acceptance supplied by the imported node:

- The lemma is stated for an arbitrary graded module, so that it can be applied for every index m.
- The proof of the identification of the associated graded is recorded.
- The filtration produced is identified with the conjugate filtration by inspection, and that identification is recorded as part of the statement's use.

### The p-adic twisted q-Hodge filtration, by recursion on the exponent

Imported `HabiroCohomologyFoundations:HQ.3/the-twisted-q-hodge-filtration-p-adically` (construction).

Fix a prime p. For a pair (R, q-Hodge filtration), define filtrations on the p-completed twisted derived q-de Rham complexes of index p^a by recursion on a. For a = 0 the twisted complex is the derived q-de Rham complex and the filtration is the given q-Hodge filtration, p-completed. For a >= 1, rescale the filtration of index p^{a-1} by Phi_{p^a}(q), meaning that its transition maps are multiplied by Phi_{p^a}(q), equip the p-completed twisted complex of index p^{a-1} with its Phi_{p^a}(q)-adic filtration, and take the pullback of filtered objects whose other leg is the prismatic Nygaard filtration of the p-completed twisted complex of index p^a mapping by the relative Frobenius. By induction the result is a filtered module over (q^{p^a}-1)^* A[q]. Reducing the defining square modulo q^{p^a}-1 (with the quotient convention) gives the Hodge-against-Nygaard square, so the reduction of the twisted q-Hodge filtration is the p-completed animated stupid filtration on qW_{p^a} dR. The construction is lax symmetric monoidal in the pair, and there are canonical maps from the filtration of index p^a to that of index p^{a-1}, compatible with the relative Frobenius, forming a symmetric monoidal transformation.

API supplied by the imported node:

- `twistedQHodgeFil_pAdic` — constructor: For a prime p and a >= 0, the filtration on the p-completed twisted derived q-de Rham complex of index p^a.
- `twistedQHodgeFil_pAdic_zero` — simp: For a = 0 it is the p-completed given q-Hodge filtration.
- `twistedQHodgeFil_pAdic_succ` — characterisation: For a >= 1 it is the pullback of the prismatic Nygaard filtration and the Phi_{p^a}(q)-rescaled filtration of index p^{a-1}.
- `filRescale` — constructor: The rescaling of a filtration by a polynomial f, restriction along t -> f t; lax symmetric monoidal.
- `twistedQHodgeFil_pAdic_mod` — compatibility: Its reduction modulo q^{p^a}-1 is the p-completed animated stupid filtration on qW_{p^a} dR.
- `twistedQHodgeFil_pAdic.transition` — data: The canonical map to the filtration of index p^{a-1}, compatible with the relative Frobenius; a symmetric monoidal transformation.
- `twistedQHodgeFil_pAdic.laxMonoidal` — structure: The lax symmetric monoidal structure in the pair.
- `twistedQHodgeFil_pAdic_rational` — equivalence: After inverting p and completing at Phi_{p^a}(q) it is the combined Hodge and Phi_{p^a}(q)-adic filtration (the first compatibility lemma node).

Unit tests supplied by the imported node:

- `twistedQHodgeFil_pAdic_zero` — degenerate: For a = 0 the filtration is the p-completion of the given q-Hodge filtration.
- `twistedQHodgeFil_pAdic_mod` — characterisation: Reducing modulo q^{p^a}-1 gives the stupid filtration on the p-completed q-de Rham-Witt complex; a construction producing the Nygaard filtration instead fails this already for S = A and a = 1, where the first Nygaard term is non-zero in degree zero.
- `filRescale_notMonoidal` — non-example: Rescaling by Phi_p(q) is lax but not strong monoidal: it does not preserve the unit, since the rescaled unit filtration (A[q] in every non-negative degree with transition maps multiplication by Phi_p(q)) is not equivalent to the unit filtration (transition maps the identity), Phi_p(q) not being a unit of A[q].
- `twistedQHodgeFil_pAdic_rational` — compatibility: After inverting p and completing at Phi_{p^a}(q), the filtration is the combined Hodge and Phi_{p^a}(q)-adic filtration on the p-completion of dR_{R/A} base-changed along psi^{p^a}; for a = 0 this is clause (c_p).

### The global twisted q-Hodge filtration, glued along a fracture square

Imported `HabiroCohomologyFoundations:HQ.3/the-twisted-q-hodge-filtration-globally` (construction).

Fix m and a non-zero integer N divisible by m. Using the animated fracture square of the m-th twisted derived q-de Rham complex, put a filtration on each factor: (a) on the factors obtained by inverting N and completing at Phi_d(q), for d | m, the q-Hodge filtration base-changed along psi^d; (b) on the p-completed, p-inverted factors, for p | N and d | m, again the base-changed q-Hodge filtration; (c) on the (p, Phi_{d_p}(q))-complete factors, for p | N and d_p | m_p, the p-adic twisted q-Hodge filtration of index p^{v_p(m)} base-changed along psi^{d_p}. Each is a filtered module over (q^m-1)^* A[q]. The filtrations (a) and (b) agree by inspection; (c) and (b) agree because, after reducing by base change to m = p^a, both are identified with the combined Hodge and Phi_{p^a}(q)-adic filtration, by the two compatibility lemmas of the p-adic construction and clause (c_p). The glued filtration does not depend on N: enlarging N to N' only replaces the lower left corner by a pullback over primes l | N' not dividing N, which do not divide m, so the iterated Frobenii there are identities and the filtrations are the base-changed q-Hodge filtration; letting N run through a totally ordered cofinal family, such as the factorials n! with n >= m, and taking the limit gives a canonical construction. The result is functorial and lax symmetric monoidal in the pair. For n | m there are canonical maps to the filtration of index n (projection to the factors indexed by divisors of n, followed on the p-complete factors by the p-adic transition maps), forming a symmetric monoidal transformation of lax symmetric monoidal functors.

API supplied by the imported node:

- `twistedQHodgeFil` — constructor: For each positive integer m, a filtration on the m-th twisted derived q-de Rham complex, functorial in the pair.
- `twistedQHodgeFil.gluing` — characterisation: Its restrictions to the factors of the fracture square are the three families of filtrations (a), (b), (c).
- `twistedQHodgeFil.indep` — characterisation: The construction does not depend on the auxiliary integer N.
- `twistedQHodgeFil_mod` — compatibility: Its reduction modulo q^m-1 is the animated stupid filtration on qW_m dR (the Proposition 3.39 node).
- `twistedQHodgeFil.transition` — data: For n | m, the canonical map to the filtration of index n; the maps form a symmetric monoidal transformation.
- `twistedQHodgeFil.laxMonoidal` — structure: The lax symmetric monoidal structure in the pair.
- `twistedQHodgeFil_one` — example: For m = 1 it is the given q-Hodge filtration.

Unit tests supplied by the imported node:

- `twistedQHodgeFil_one` — degenerate: For m = 1 the twisted complex is the derived q-de Rham complex and the filtration is the given q-Hodge filtration.
- `twistedQHodgeFil_mod` — characterisation: Its reduction modulo q^m−1, in filtration degree one, is the animated stupid filtration on qW_m dR, whose n-th graded piece is G^n_{A,m}; apply inherited E401 and do not shift this already graded object again.
- `twistedQHodgeFil.indep` — characterisation: The filtrations built with N and with a multiple N' agree; a construction depending on N would not be canonical.
- `twistedQHodgeFil_rationalFactor` — computation: On the factor obtained by inverting N and completing at Phi_d(q), d | m, the filtration is the q-Hodge filtration base-changed along psi^d; in particular for R smooth with the coordinate filtration it is (q-1)^{max(n - *, 0)} base-changed along psi^d, that is Phi_d(q)^{max(n - *, 0)} up to units.

### Adjoining the twisted filtration divided by powers of q^m-1, and its compatibility in m

Imported `HabiroCohomologyFoundations:HQ.3/the-m-truncated-descent` (construction).

For each m, the m-th partial descent of a pair is the (q^m-1)-completion of the colimit of the twisted q-Hodge filtration along multiplication by q^m-1, fil^0 -> fil^1 -> ... ; informally it is obtained from the m-th twisted complex by adjoining the i-th filtration step divided by (q^m-1)^i for all i >= 1. By the argument of the q-Hodge complex it is lax symmetric monoidal in the pair. For m = 1 it is the q-Hodge complex. Its compatibility for divisors of m and the denominator lemma it rests on are separate nodes.

API supplied by the imported node:

- `partialDescent` — constructor: For each positive integer m, the (q^m-1)-complete A[q]-module obtained as the completed colimit of the twisted q-Hodge filtration along q^m-1, functorial in the pair.
- `partialDescent_one` — example: For m = 1 it is the q-Hodge complex.
- `partialDescent.laxMonoidal` — structure: The lax symmetric monoidal structure in the pair.
- `partialDescent.completion` — characterisation: For n | m, the (q^n-1)-completion of the m-th partial descent is the n-th (the Proposition 3.43 node).
- `partialDescent_mod` — characterisation: Its reduction modulo q^m-1 is the colimit of the graded pieces of the twisted q-Hodge filtration along q^m-1, an exhaustive ascending filtration.

Unit tests supplied by the imported node:

- `partialDescent_one` — degenerate: For m = 1 the partial descent is the q-Hodge complex, since the twisted complex is the q-de Rham complex and the filtration is the given one.
- `partialDescent.completion` — characterisation: For n | m the (q^n-1)-completion of the m-th partial descent is the n-th.
- `partialDescent_framed_rational` — computation: For a framed smooth S with the coordinate filtration, after inverting N and completing at Phi_d(q) the m-th partial descent is the psi^d-twisted coordinate complex with every differential multiplied by Phi_d(q) up to a unit.
- `partialDescent_isComplete` — characterisation: Each partial descent is (q^m-1)-complete by construction, so the limit over m is Habiro-complete.

### The Habiro-Hodge complex, and the symmetric monoidality of the descent

Imported `HabiroCohomologyFoundations:HQ.3/the-habiro-hodge-complex` (construction).

The Habiro-Hodge complex of a pair is the limit over the positive integers, ordered by divisibility, of the partial descents; the limit may be computed along the cofinal sequence of factorials, so only the individual transition equivalences are needed. It is Habiro-complete, its (q^m-1)-completions are the partial descents, and its (q-1)-completion is the q-Hodge complex. It carries a lax symmetric monoidal structure, compatible with the one on the q-Hodge complex, obtained as in the monoidality proof for the q-Hodge complex and compatible with the transition equivalences; this gives a lax symmetric monoidal lift of the q-Hodge complex functor through the Habiro-complete objects.

API supplied by the imported node:

- `qHabiroHodge` — constructor: For a pair, the Habiro-complete object of the derived category of A[q] given by the limit of the partial descents.
- `qHabiroHodge.qSubOneCompletion` — projection: Its (q-1)-completion is the q-Hodge complex.
- `qHabiroHodge.completion` — characterisation: Its (q^m-1)-completion is the m-th partial descent.
- `qHabiroHodge.limit_factorial` — characterisation: The limit may be computed along the factorials.
- `qHabiroHodge.map` — functoriality: A functor on the category of pairs, with map_id and map_comp.
- `qHabiroHodge.laxMonoidal` — structure: The lax symmetric monoidal structure, compatible with the one on the q-Hodge complex; it is strict (the Lemma 3.46 node).
- `qHabiroHodge.tensorEquiv` — compatibility: For finitely many pairs, the canonical map from the completed tensor product of their Habiro-Hodge complexes to the Habiro-Hodge complex of their tensor product in the category of pairs is an equivalence (the Kuenneth form of strict monoidality).

Unit tests supplied by the imported node:

- `qHabiroHodge_etale` — computation: For an etale A-algebra with its q-Hodge filtration, the Habiro-Hodge complex is the relative Habiro ring (the etale-case node).
- `qHabiroHodge.qSubOneCompletion` — characterisation: Its (q-1)-completion is the q-Hodge complex; a construction returning the q-de Rham complex instead fails this already for S = A[x] with the coordinate filtration.
- `qHabiroHodge_smoothCohomology` — computation: For smooth S with a q-Hodge filtration, the cohomology of its reduction modulo q^m-1 is qW_m Omega_{S/A}, as graded A[q]/(q^m-1)-modules, and as graded algebras when the pair is at least an E_1-algebra in the category of pairs.
- `qHabiroHodge_ne_qdR` — non-example: It descends the q-Hodge complex, not the q-de Rham complex; the latter is recovered only after the decalage at q-1, and only for smooth inputs.

### The descent theorem: the q-Hodge complex factors symmetric monoidally through Habiro-complete objects

Imported `HabiroCohomologyFoundations:HQ.3/habiro-descent` (theorem).

Over a perfectly covered Λ-ring, M=qHdg has a symmetric monoidal factorisation through the Habiro-complete category, with lift H=q-𝓗dg, followed by t-completion. This is a factorisation by a completion functor, not an inclusion of one complete subcategory into the other.

Acceptance supplied by the imported node:

- The factorisation is through the Habiro-complete objects and is called non-trivial.
- Symmetric monoidality is strict.

### The framed q-Hodge filtration and its explicit Koszul model

Imported `HabiroCohomologyFoundations:HQ.3/the-coordinate-model-and-the-etale-case` (comparison).

Let S be smooth over A with an etale framing A[x_1, ..., x_n] -> S. The filtration of the coordinate-dependent q-de Rham complex whose n-th step is (q-1)^{max(n - *, 0)} times the complex, pulled back along the map from the derived complex, is a q-Hodge filtration once the data of the definition are constructed at the level of complexes and pulled back; the framed pair is an E_0-algebra in the category of pairs (the source announces an E-infinity refinement in its companion paper). Its q-Hodge complex is the coordinate-dependent q-Hodge complex, in which every q-differential is multiplied by q-1, because the framed filtration is already complete.  Import the raw uncompleted framed Habiro Koszul complex from HQ.4 and compare it to this pair's Habiro–Hodge descent object. The source asserts that comparison without proof; it remains a gap. Theorem 3.11(b) and Corollary 3.31 give the cohomology of the uncompleted Habiro–Hodge reduction modulo q^m−1; Corollary 3.54 identifies its differential as the Bockstein. None of these replaces the object by its q−1 completion.

Acceptance supplied by the imported node:

- The framed filtration is given by an explicit formula and the pair is an E_0-algebra.
- The Koszul model is described with the construction of the scaling operators and the reason they exist, and its unproved status is recorded.

### Operadic and derived commutative upgrades of the descent, and the differential on cohomology

Imported `HabiroCohomologyFoundations:HQ.3/multiplicative-upgrades` (theorem).

Suppose the q-Hodge filtration of a pair is an E_n-algebra in filtered (q-1)^* A[q]-modules, 0 <= n <= infinity, compatibly with the E-infinity structure of the derived q-de Rham complex and with all the data of the definition, so that the pair is an E_n-algebra in the category of pairs. Then the Habiro-Hodge complex is an E_n-algebra in the Habiro-complete objects, the filtration of Theorem 3.11(b) on its reduction modulo q^m-1 is a filtered E_n-algebra, and the identification of its associated graded is a graded E_n-monoidal equivalence. If instead the filtration is a filtered derived commutative algebra over (q-1)^* A[q], compatible with the derived commutative structure of the derived q-de Rham complex and with all the data of the definition, then the Habiro-Hodge complex is a derived commutative A[q]-algebra, the filtration on its reduction is a filtered derived commutative algebra, and the associated graded identification is one of graded derived commutative algebras; by transfer of structure the associated graded is a derived differential graded algebra.

Acceptance supplied by the imported node:

- Every upgrade carries the hypothesis that the input already has the structure.
- No upgrade beyond the input's structure is claimed.

### The q-divided power of the witness cannot be corrected into the p-th step

Imported `HabiroCohomologyFoundations:HQ.3/the-witness-admits-no-q-hodge-filtration` (lemma).

Let p be a prime with the p-completion of A non-zero, and let R be the quotient by x of the free p-complete perfect delta-ring on a generator x over the p-completion of A (the witness of Lemma 3.3); the same computation applies to the free p-complete delta-ring Z_p{x} over itself (Example 4.24 with exponent one). The p-completed derived q-de Rham complex of R is the q-PD envelope, (p, q-1)-completed, of the ideal (x), and is static; the Hodge filtration on the p-completed derived de Rham complex is the divided power filtration of the PD envelope. No element of the q-PD envelope that reduces modulo q-1 to the divided power x^p/p lies, after (q-1)-completed rationalisation, in the ideal (x, q-1)^p. Consequently the p-completed derived q-de Rham complex of R admits no filtration satisfying clauses (b) and (c_p) of a q-Hodge filtration.

Acceptance supplied by the imported node:

- The witness, the expansion and the failing term are all recorded.
- The computation is carried out for exponent one; for exponents at least two the same computation succeeds, which is the HQ.5 well-behavedness theorem.

### After inverting p the p-adic twisted q-Hodge filtration is the combined Hodge and cyclotomic-adic filtration

Imported `HabiroCohomologyFoundations:HQ.3/the-p-adic-twisted-filtration-after-inverting-p` (lemma).

For every prime p and every a >= 0 there is a canonical equivalence of filtered (q^{p^a}-1)^* A[q]-modules from the p-adic twisted q-Hodge filtration of index p^a, with p inverted and completed at Phi_{p^a}(q), onto the combined Hodge and Phi_{p^a}(q)-adic filtration on the p-completion of dR_{R/A} base-changed along psi^{p^a}, with p inverted, completed at Phi_{p^a}(q); it is compatible with the rational comparison of the p-completed derived q-de Rham complex.

Acceptance supplied by the imported node:

- The case a = 0 is recorded as the axiom (c_p).

### At lower cyclotomic points the p-adic twisted q-Hodge filtrations of successive indices agree

Imported `HabiroCohomologyFoundations:HQ.3/the-p-adic-twisted-filtration-at-lower-cyclotomic-points` (lemma).

For every prime p, every a >= 1 and every 0 <= i <= a-1, the canonical map from the p-adic twisted q-Hodge filtration of index p^a to that of index p^{a-1} induces an equivalence of filtered (q^{p^a}-1)^* A[q]-modules after inverting p and completing at Phi_{p^i}(q).

Acceptance supplied by the imported node:

- The range of i is recorded.

### The twisted q-Hodge filtration reduces modulo q^m-1 to the stupid filtration on the derived q-de Rham-Witt complex

Imported `HabiroCohomologyFoundations:HQ.3/the-twisted-q-hodge-filtration-deforms-the-stupid-filtration` (theorem).

For every pair and every m, the equivalence from the m-th twisted derived q-de Rham complex modulo q^m-1 to qW_m dR_{R/A} (the animated deformation statement) upgrades canonically to an equivalence of filtered A[q]/(q^m-1)-modules from the twisted q-Hodge filtration modulo q^m-1, taken with the quotient convention, onto the animated stupid filtration fil_{Hdg_m} qW_m dR_{R/A}. The equivalence is one of lax symmetric monoidal functors of the pair; so if the pair is an E_n-algebra in the category of pairs, it is an equivalence of filtered E_n-algebras.

Acceptance supplied by the imported node:

- The quotient convention is used; the lax monoidality of the equivalence is recorded.

### Adjoining the Nygaard filtration divided by Phi_p(q) recovers the q-de Rham complex; divided by q^p-1 it gives zero

Imported `HabiroCohomologyFoundations:HQ.3/nygaard-denominators` (lemma).

For every animated A-algebra R and prime p, the relative Frobenius from the p-completed p-th twisted derived q-de Rham complex to the p-completed derived q-de Rham complex induces functorial equivalences: adjoining to the p-completed twisted complex the Nygaard filtration divided by powers of Phi_p(q), then (p, q-1)-completing, gives the p-completed derived q-de Rham complex; adjoining it divided by powers of q^p-1 gives the p-completed derived q-de Rham complex with q-1 inverted, (p, q-1)-completed, which is zero.

Acceptance supplied by the imported node:

- Both denominators are treated, including the vanishing one.

### The partial descents are compatible under completion

Imported `HabiroCohomologyFoundations:HQ.3/the-partial-descents-are-compatible` (theorem).

For every pair, every positive integer m and every divisor n of m, the transition map of the twisted q-Hodge filtrations induces an equivalence from the (q^n-1)-completion of the m-th partial descent onto the n-th partial descent. In particular the m-th partial descent is a descent of the q-Hodge complex along Z[q] completed at q^m-1 -> Z[[q-1]].

Acceptance supplied by the imported node:

- The factor-by-factor argument and the reduction to the denominator lemma are recorded.

### The Habiro-Hodge complex functor is symmetric monoidal

Imported `HabiroCohomologyFoundations:HQ.3/the-habiro-hodge-complex-is-symmetric-monoidal` (theorem).

The lax symmetric monoidal functor sending a pair to its Habiro-Hodge complex, with values in the Habiro-complete objects of the derived category of A[q], is symmetric monoidal.

Acceptance supplied by the imported node:

- The localisation at q^d-1 for proper divisors, and the use of gh_1, are recorded.

### The descent theorem, clause (b): the q-de Rham-Witt filtration on the reduction modulo q^m-1

Imported `HabiroCohomologyFoundations:HQ.3/habiro-descent-the-q-de-rham-witt-filtration` (theorem).

For a perfectly covered Λ-ring and m≥1, H_A(P)/(q^m−1) has an exhaustive ascending filtration, natural in P and lax symmetric monoidal. Its i-th graded piece is G^i_{A,m}(R), the associated graded of the animated stupid filtration, with its intrinsic shift. For smooth S this is qW_m Ω^i in cohomological degree i. At m=1 this is the conjugate filtration. On the t-complete modification one takes the t-completion of the filtration and these graded pieces.

Acceptance supplied by the imported node:

- The derived forms and their shift are stated; the case m = 1 is the conjugate filtration.

### For an etale algebra the Habiro-Hodge complex is the relative Habiro ring

Imported `HabiroCohomologyFoundations:HQ.3/the-etale-case` (theorem).

If R is etale over A, with its q-Hodge filtration (for etale R clause (b) forces the q-Hodge filtration to be the (q-1)-adic filtration, the framed filtration with no coordinates), then the Habiro-Hodge complex of R over A is the relative Habiro ring of R over A, as E-infinity algebras over the Habiro ring.

Acceptance supplied by the imported node:

- The identification is of E-infinity algebras and uses uniqueness of etale deformations.

### For smooth algebras the reduction modulo q^m-1 has cohomology the q-de Rham-Witt complex, with the Bockstein as differential

Imported `HabiroCohomologyFoundations:HQ.3/the-cohomology-of-the-reduction-for-smooth-algebras` (theorem).

Let S be smooth over A with a q-Hodge filtration. Then: (a) the filtration of Theorem 3.11(b) on the reduction of the Habiro-Hodge complex modulo q^m-1 is its Whitehead (Postnikov) filtration, fil_n = tau^{<= n} in cohomological indexing; (b) the identification of the associated graded becomes an isomorphism of graded A[q]/(q^m-1)-modules from H^* of that reduction onto qW_m Omega_{S/A}, and an isomorphism of graded algebras as soon as the pair is at least an E_1-algebra in the category of pairs; (c) under this isomorphism the differential of qW_m Omega_{S/A} corresponds to the Bockstein differential for q^m-1.

Acceptance supplied by the imported node:

- The three clauses are stated with the E_1 hypothesis for (b) and the indexing of (a).

## Planets and implementation boundary

The accepted HQ.3 packet already supplies the six planets: q-Hodge filtration; No functorial q-Hodge filtration; q-Hodge complex; Twisted q-Hodge filtration; Habiro-Hodge complex; Habiro descent. This follow-up adds no planet and proposes no new layer. Its three declarations extend the existing construction within HQ.3.

The [suggested file](../suggested/HabiroCohomologyFoundations--HQ.3.lean) includes every new construction/API name and seven named examples. It exposes honest ordinary diagram shadows: algebra labels and filtration diagrams, completion/colimit comparisons supplied independently, the map `limit.post` followed by `limMap`, identity/composition, two projections, the t-adic shifted-quotient test and the concrete denominator obstruction. It does not model an ∞-category by an ordinary homotopy category or supply an opaque proposition for missing q-Hodge/Frobenius/Nygaard conditions. Its docstrings list the missing enhanced hypotheses and portions of each API. Successful elaboration of these signatures does not establish the new mathematical comparison. All implementation statuses remain unchecked.

Status: **complete planning pass; HQ.3 planned, not closed**. Outstanding work is exactly the four supplier exports and the unrestricted Λ-base-change gap. Inherited proof gaps of the HQ.1 packet are retained, including its technical twisted-filtration and HR.2 infrastructure gaps. Source versions, checks and the prototype limitations are recorded in [the handoff](../handoff/BP-HabiroCohomologyFoundations--HQ.3.md).
