# Independent review of Euler systems and Kolyvagin systems, revision 2

**Verdict: accepted as a partial target-level plan. This review is complete.** All nine stages remain `planned`, none is `closed`, and every implementation is `unchecked`. Acceptance establishes the adequacy of the stated targets and proof routes, including explicit supplier contracts; it does not assert formalization or discharge the two recorded limitations.

Reviewer: Codex, session `codex-cc7dWg`, job `REV-EulerSystemsAndKolyvaginSystems~2`, issue [#10780](https://github.com/CBirkbeck/tauceti-explorer/issues/10780), 2026-10-19. This session wrote neither original blueprint PR#9578 (Claude `claude-Tq5V20`) nor revision PR#10887 (Codex `codex-F2G2WN`), and did not perform the preceding review PR#9606 (Codex `codex-mIgt4O`). The claim was confirmed by the bot before work began. Prior review history remains in `previousReview`.

## Scope and verdict

Read all **151 assembled targets**, including every hypothesis, proof step, API and test: **124 imported and 27 local**; 41 definitions, 20 constructions, 69 theorems, 11 lemmas, seven applications and three comparisons. All 61 definitions/constructions have APIs and at least three tests: **427 API entries, 223 tests, 45 planets**. The register below independently covers the assembled set. Its 149 verified and two corrected verdicts refer to the current revision, rather than importing verdicts from the previous review.

Read all **51 baseline records, representing 46 distinct declarations**, at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and TauCeti `f790474821cf4256814db967cb154e7af3d0c369`, including ambient variable hypotheses. The reviewed library audit was also consulted. Existing discrete cohomology, linear algebra, lengths, characteristic polynomials and Fitting ideals are inputs; the packet does not claim they implement compact arithmetic adapters or Euler systems.

The earlier review returned three targets for genuine proof obligations. Revision2 supplies a selected bounded descent construction, a twist-compatible local operator and the coefficient-prime Selmer comparison. I checked their arguments independently below. Two further errors in the whole packet were directly corrected, and one inherited source finding was narrowed. No unresolved mathematical defect was found in the revised target-level routes. The classical all-prime square-index constant remains explicitly outside these routes; it is not inferred from an exponent bound.

## Selected descent and rational anticyclotomic comparison

For an R-linear f:A→B, let a kill both kernel and cokernel. Given x choose b with f(b)=a x and put d(x)=a²b. A different choice differs by ker(f), so a² kills the difference. The same computation proves additivity and scalar compatibility. Then fd=a³ and df=a³. For a factorization f=s r and s(z)=x, with a killing ker(s), one gets r(d(x))=a³z. This last equality compares the selected construction with a cochain lift; it never asserts uniqueness of every preimage. The new tests include multiplication by5 and the nontrivial kernel of Z/25→Z/5.

The ring-class restriction bound uses the common invariant group W(K_c). An auxiliary extension is ramified at the new auxiliary primes while the coefficient field is unramified there; the intersection lies in K_c. Purity at a good prime makes W(K_c) finite. Consequently the H¹ and H² terms of inflation–restriction have a common annihilator independent of the number of auxiliary primes. The comparison is made over the global intermediate field before localization. A bounded kernel at the ramified auxiliary local prime is not assumed. Source checks: Castella–Hsieh, author version dated2July2022, Lemmas4.6–4.7, pp.18–19, and §7, pp.28–38; Nekovář MPIM1990-78, §§6–10, printed pp.11–20.

For n=mℓ and rational Frobenius J, retain J²−hJ+ℓ=0, h=a_ℓℓ^(1−r), and finite evaluation at J². At an inert auxiliary prime the anticyclotomic character is locally trivial, although globally the chi and chi-inverse modules remain distinct. With N=ℓ+1 the cyclic cocycle computation gives A v=B u, where A=(h/π^M)J−N/π^M and B=a_ℓ/π^M−(N/π^M)J. These are integral coefficients divided before reduction. The quadratic Frobenius polynomial, the norm relation and the lifted identity must all be used before reducing; reducing early loses the terms divided by π^M. The preprint’s subsequent key formula has the correct coefficient despite the intermediate display slip recorded as E913.

For M>B₁, odd p gives the two local Frobenius eigenspaces, and admissibility bounds the kernel/cokernel losses of A and B by B₁. No nonunit is cancelled. The rational descent absorbs the order loss B₁, two-vector span loss 2B₁ and bottom scaling into fixed constants. It uses at most two auxiliary primes, so those constants are independent of M. This suffices for the rational rank-one and finiteness conclusion; it does not preserve an incorrectly printed scalar constant for general chi.

## The coefficient prime in the integral application

Keller–Yin v2, Theorem1.2.2, Proposition1.2.5, Propositions1.3.4–1.3.5, Lemma1.3.6 and Theorem1.4.1 (pp.13–25) supply the character and residual comparison pattern. The revised route keeps the full/unramified Selmer groups separate from the ordinary ones. Both residual character orientations are needed, including the locally1/omega cases and the finite terms for a globally trivial character. Residual H⁰ vanishing is a lattice hypothesis, not a consequence of irreducibility assumed in an Eisenstein setting.

The precise finite-character unramified mu=0 arithmetic input belongs to CMAllPrimeMainConjectures CZ.3. It is an explicit extension of that owner’s theta-component theorem, not an ordinary Selmer conclusion disguised as supplier data. The residual extension comparison then yields unramified mu=0 for the rank-two lattice in both orientations. Away-p local corrections and the strict-p unramified correction have mu=0; O-finite corrections may have positive O-rank and still disappear at the coefficient prime.

Write R=Lambda_(π). The resulting full/zero duals vanish over R. With the actual ordinary filtration, including its higher-weight cyclotomic twist, the supplier’s local rank-one modules and Poitou–Tate give

- 0→L_q→X_(o,f)→X_(0,f)→0, with X_(0,f)=0, hence X_(o,f) free of rank one;
- 0→S_ord→L_o→X_(o,f)→X_ord→0, with S_ord and L_o of rank one and the first map injective.

The cokernel S_ord→L_o is torsion, so its map into the free X_(o,f) is zero. Thus X_ord is free over R. In X_ord pseudo-isomorphic to Lambda⊕M⊕M, the torsion module M has mu=0. This is the missing coefficient-prime inequality. The argument is consistent with the compact algebraic milestone in the suggested file. It does not divide a coefficient-rank-dependent specialization error by that rank. CGLS Proposition4.2.1 (pp.28–29) is used only for its rational comparison, not as an integral mu theorem.

This contract is sufficient for a target-level conditional proof. It does **not** assert that the CM supplier has already been implemented or verified at the exceptional characters. Packaging must honor generic ES.8 → CM CZ.2/CZ.3 → residual transfer → ordinary comparison → late Eisenstein application. The packet’s bundle or ES PartII proposal is necessary: do not turn this node order into a cycle of unsplit roadmap names.

## Corrections applied in this review

1. **ES.4/variant-bounds(a).** The 1999 Rubin draft, IX.Theorem3.3, p.137, has the wrong finite-depth dependence on the order of the Euler class. The published Theorem9.3.3, pp.179–180, uses a₁=intersection of the non-p local defect annihilators, a₂=Ann(a₁c_K), and annihilator **((M):a₂)a₁**. Over a DVR, with M=π^m, a₁=(π^a), a₂=(π^b), the exponent is m−b+a. Zero and primitive classes distinguish this from the reversed formula. Passing to infinite depth also needs a compatible nonzero lattice class of bounded divisibility; the packet now says so. Added three explicit acceptance checks and the published locator, using an assembly overlay rather than changing the imported part.
2. **ES.8/rubin-iwasawa-divisibility.** A torsion/zero Euler class has index0, making the ideal inclusion automatic. It does not force char(X)=0. The zero Euler family with X=0 and char(0)=unit is the elementary control. Packet and reader now agree.
3. **E911.** The full-exponent statement of LTXZZ Lemma2.3.4, published p.127, is valid. Its proof has a stray p in the coefficient notation. The shorter-exponent quotient used in saturation is a legitimate application/generalization, not a correction to the lemma’s statement. The earlier broader accusation is withdrawn while preserving its history.
4. **E912–E914.** Added the draft Rubin finite-depth defect, the MPIM1990-78 divided-coefficient slip, and Howard’s published p.1464 coefficient-prime specialization slip. The latter should use T^m+p, already used on p.1463: length Lambda/(p^a,T^m+p)=ma, whereas T+p^m gives length a. The roadmap already used the correct Eisenstein family.

No Lean statement needed changing for these arithmetic/source corrections. All source statements in these deliverables are in our own words.

## Closure, suppliers and ownership

The internal graph is acyclic, with no forward layer dependency after the seven inherited stage reassignments. Stable node IDs are preserved; assigned stage and `realises` control placement. ES.8 rank-one work has no ES.6/ES.7 prerequisites. The existing eight restructuring proposals, including the later CM bundle/PartII route, were checked as proposals; no campaign edge was changed.

The 26 whole-packet supplier requests replace the imported requests. They describe compact cohomology and local duality in ArithmeticGaloisDuality/SelmerIwasawaCohomology, generic Gorenstein/bidual/characteristic-ideal algebra in PadicMeasuresIwasawaAlgebras, ring-class geometry in HeegnerPointEulerSystems, maximal-order algebra in ClassicalArithmeticCompletion, and the CM character arithmetic above. Their exact statements, rather than stage names alone, were checked against the consumers. Future implementation of these contracts is distinguished from a missing argument in the present proof sketches.

Two limitations remain in `gaps`: the original Kolyvagin1990 text was not read, so derivative targets cite Rubin’s available replacement; and the classical square-index constant uniform in K is not supplied by the exponent theorem or the self-dual profile. The latter remains an open arithmetic application request for HE.7. Lemma-level refinements listed in `coverage.remaining` are proof work beneath the stated targets, not invented additional theorem claims. Acceptance does not mark them complete.

Checked the current read-only upstream roadmap tree at commit `0d144d044dacebca17b654695b6f1ad58f159b27` and current TauCeti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including all nine roadmaps newer than the atlas snapshot and the four named Completed roadmaps. No duplicate Euler/Kolyvagin/Stark system target was found there. Read nearby ProfiniteCohomology and ClassFieldTheory layers: current all-degree discrete Shapiro does not eliminate the compact-coefficient adapter, and the ring-class quotient is a geometric specialization rather than a replacement for class field theory. Current generic Fitting ideals and the elliptic two-descent API remain library inputs, not fresh ES constructions.

The upstream order file reports PadicMeasuresIwasawaAlgebras as merged, but that roadmap was not present in the supplied current read-only tree. I checked its atlas supplier statements and do not claim to have read an absent upstream L6 file. A packager must resolve the actual upstream name/version or retain the exact extension contract; it must not replan generic algebra under ES.

## Source and API checks

Relevant source statements and proof passages were read directly, not accepted from prior review annotations. Besides the repaired branches above, checks covered Rubin’s norm/derivative and Iwasawa arguments; MR04’s cartesian, stub/core-vertex and specialization arguments; MR2016’s higher-rank regulator and structure results; BSSII’s Gorenstein bidual, derivative and regulator hypotheses; Sakamoto’s Gorenstein comparison; Sano’s normalized transfer; and the stated Rubin–Stark/Brumer–Stark boundary. Self-dual and error-tolerant branches were checked in Howard, Zanarella, Zhang, Nekovář’s CM manuscript, CGLS, CGS and BCGS. The packet’s p>3 restriction avoids silently importing the p=3 step of the BCGS coefficient argument.

Exact versions and SHA-256 identities remain in `sources` and the 22 `sourceVersions` records. Reading was of the relevant statements and proof routes, not every page of every book. Published Rubin page images42–43,103,122,175 and179–180 distinguish the book from the 1999 draft. MR04 is the author’s20October2003 version; no comparison with the publisher’s Memoir is claimed. Nekovář’s cyclic calculation is the1990 MPIM preprint; the1992 Inventiones version was not collated. LTXZZ pp.126–135 and Zhang §8.1 pp.234–237 were read in the maintainer-cleared published copies, in place. Those files and their passages were never copied. Curtis–Reiner and the original Kolyvagin article were not read and are not newly certified as sources.

Each definition/construction API was checked for its carrier, coefficient hypotheses, constructors, normalizations, functoriality and downstream uses. Tests include zero/empty cases, actual small-ring calculations and failures when assumptions are removed. Examples that would accept an indiscrete local condition or a wrongly normalized transfer are not substitutes for these tests. The finite-singular orientation, exterior bidual for nonfree modules, primitive/nonprimitive index and bounded-loss rather than exact descent are consistently reflected in the APIs. The 45 planets are mathematical object/theorem names, at most six per layer, not source locators or helper declarations.

## Source finding verdicts

All 22 current findings are confirmed **at the scope recorded below**. E911’s narrower scope supersedes its old review, which remains historical. For inherited findings, the source locator and mathematical witness were rechecked; the current verdicts name this review. E912–E914 are additional findings, scoped to the exact text read. Their contextual corrections do not imply that the published main arithmetic theorems are false.

| Finding | Locator | Checked scope |
| --- | --- | --- |
| E901 | Chapter IV §8, Example 8.2, p. 78 (author's 1999 draft) | The norm relation divides by the relative ray-class degree [K(q):K(1)]. The additional class-number factor in [K(q):K] changes the congruence. The published p.103 comparison corrects this denominator. |
| E1 | Hypothesis 4.7(ii), p. 22 of arXiv:1805.08448v1 | Read BSS Hypothesis4.7(ii) with its coefficient-trivializing field: membership in that field’s absolute Galois group makes tau act trivially, contradicting the rank-one quotient when rank(T)>1. The finite-level hypothesis identifies the intended smaller field. |
| E2 | 1999 course draft Chapter IX §1, p.133; also book-format author copy §9.1 p.175 (PDF p.181) | With ramification only at N the Euler-factor product away from N is empty, so the proposed zero-at-higher-level family cannot have an arbitrary nonzero bottom class. The ramification-away-from-N correction repairs this particular example; the published p.175 wording was also checked. |
| E3 | Archived author copy, Proposition 3.4.4(ii), p.27 (PDF p.33) | A one-vertex graph with stalk Z_p/p has cyclic sections but those sections cannot be an ideal of the domain Z_p. The free-hub or principal-artinian restrictions in the assembled target are essential. |
| E4 | Lemma 2.1.4, p.15; repeated use in Lemma 3.5.2, p.28, archived author copy | For the F_3 representation generated by a nontrivial upper unipotent and diag(-1,1), the common invariant space is zero but the quotient by the first coordinate is trivial. This refutes arbitrary-subquotient propagation; coefficient-ideal propagation survives. |
| E5 | Proposition 3.4.4(iii), p.27, archived author copy | For R=F_3[[x,y]], the hub R mapping onto R/(y) has a section (x,x mod y) whose generated ideal at the hub is (x), while its value at the other vertex generates the maximal-ideal multiple. Thus the non-hub edge assertion needs its stated restriction. |
| E801 | §5.3, Definition 5.3.8, p. 61, in the authors' version of 20 October 2003 (the published Memoir was not available) | At the zero class, the coordinate gcd is zero while the characteristic ideal of the torsion part of a torsion-free module is the unit ideal. Definition5.3.8 and the subsequent zero branch cannot both use the latter convention. The explicit zero index is retained. |
| E802 | Ch. II §3, proof of Theorem 3.8, p. 29, in the 1999 draft | The draft proof needs the chosen local functional psi composed with localization; phi has not been introduced there. The published Theorem2.3.8 p.43 has the consistent symbol. |
| E803 | Ch. VI §2, proof of Proposition 2.1(ii), p. 91, in the 1999 draft (published: Proposition 6.2.1, p. 122) | An infinite-order unramified character is trivial on inertia, not on the whole decomposition group away from p. Read the draft local proof and compared the published Proposition6.2.1 p.122 argument; the finding is scoped to the draft. |
| E902 | IV.Example8.2 p.78 (1999 draft), also4.8.2 p.103 (book-format author copy) | The valuation of a uniformizer gives the missing full Kummer-cohomology summand. Residue units identify the finite/unramified subgroup, which is sufficient for the Euler-class calculation. This limitation remains necessary in both Rubin copies. |
| E903 | Theorem2.4.5 proof p.23, arXiv1908.09197v1 | The coefficient rings in the p-branch have different characteristic and Z_p-rank: F_p[[T]] is not a finite Z_p-order, whereas Z_p[[T]]/(p+T^m) is free of rank m. The revised proof uses primitive specialization and actual finite quotients. |
| E904 | §7.2 p.29, author version dated2July2022 | The map Z/p^2 to Z/p has a p-annihilated kernel but several lifts of zero. Bounded kernel and cokernel permit the selected scaled construction, not uniqueness of the unrestricted fibre. |
| E906 | §7.2(K2) p.30, author version dated2July2022 | Conjugation interchanges the chi-inverse and chi coefficient modules. For nonquadratic chi it does not give an involution on either single module. The revised local Frobenius operator retains both twists and avoids this scalar assertion. |
| E907 | Data6.4.2 and Proposition6.4.3 pp.38–40, archived51page author manuscript | The separated coordinate pairing of two countable direct sums of F_p has evaluation map direct-sum to direct-product. Even for maximal orders it is not surjective. Finiteness in the revised target removes this counterexample. |
| E905 | Theorem2.3.8 proof, printed p.43 (book-format author copy hosted by W.Stein); compare draft II.3.8 p.29 | Multiplication by p has zero, hence pseudo-null, kernel, while its cokernel has height-one support and changes the value ideal. The draft’s cokernel condition is the condition needed in the published proof. |
| E908 | Proposition2.6.7, published p.135 | Rows (1,0) and (1,lambda) have lambda-abundant image but cannot be diagonalized by a basis with unit determinant in the claimed way. The scaled matrix inverse used by the packet has the required bounded loss without this basis claim. |
| E909 | Lemma2.3.5(b), published pp.127–128 | For k=F_49 and weights 7 and 6, coefficient-linear End has weights 0 and plus/minus1, but restriction of scalars introduces the Frobenius twist carrying weight1 to weight7. Thus the missing prime-field Hom is real. The revised hypotheses quantify over these twists. |
| E910 | Lemma2.6.4 and Proposition2.6.6, published pp.134–135; definitions pp.132–133 | Checked the cyclotomic Kummer example over Q(sqrt(5),i) at 3: conjugation inverts the cubic kernel and every lift of that conjugation coset squares to one. The associated evaluations vanish despite a nonzero fixed line. Realised-span data, rather than a fixed-line assertion alone, are required. |
| E911 | Lemma2.3.4, published p.127 | Read the published statement and proof on p.127. The induction is on the free rank; it does not require the exponent to be renamed. A shorter coefficient quotient may legitimately be used in the later saturation argument, but that application does not make the original full-exponent lemma false. The trailing p has no role in the coefficient ring. |
| E912 | 1999 draft ChapterIX, Theorem3.3, p.137; compare published Chapter9, Theorem9.3.3, pp.179–180 | The printed 1999 factor reverses the expected dependence on class order: zero c_K has order1 and would force vanishing, whereas a primitive class gives only the automatic coefficient annihilator. The published formula gives the opposite, correct zero/primitive controls. Published p.179 explicitly displays (M/a₂)a₁. The roadmap additionally spells out the compatibility and bounded-divisibility condition used on passing to infinite depth. |
| E913 | MPIM1990-78 preprint, §9, printed p.18 (PDFp.21), divided identity immediately before the key formula | The preceding identity has N·a_y−M₁·a_x on the left. Dividing the entire identity by M gives (N/M)·a_y−(M₁/M)·a_x. The next displayed key formula uses M₁/M consistently. This is a local intermediate display slip and does not alter the operator relation used here. |
| E914 | Published Theorem2.2.10 proof, p.1464, paragraph immediately before the functional equation; compare p.1463 | The Q=T+p^m family approaches (T), not (p): Λ/(p^a,T+p^m) has Z_p-length a, with no slope m. The Eisenstein family Λ/(p^a,T^m+p) instead has length ma, which detects ord_(p). The packet already uses the latter family, so only the source register needs correction. |

## Baseline declaration register

Each declaration below was read at the corresponding pin, with its variable hypotheses. The `provides` text describes the part consumed here; arithmetic adapters are supplied separately. Repeated part/whole records are deduplicated in this table.

| Declaration | Module | Consumed interface |
| --- | --- | --- |
| `mathlib:Squarefree` | `Mathlib/Algebra/Squarefree/Basic.lean` | Squarefree elements of a monoid; used for the index set N(P) of squarefree products. |
| `mathlib:Module.length` | `Mathlib/RingTheory/Length.lean` | The length of a module as an element of ℕ∞. |
| `mathlib:LinearMap.charpoly` | `Mathlib/LinearAlgebra/Charpoly/Basic.lean` | The characteristic polynomial of an endomorphism of a finite free module; the Euler polynomials are its reversals. |
| `mathlib:LinearMap.aeval_self_charpoly` | `Mathlib/LinearAlgebra/Charpoly/Basic.lean` | Cayley–Hamilton: aeval f f.charpoly = 0. |
| `mathlib:MonoidAlgebra` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean` | The group ring k[G], in which N_Γ and D_σ live. |
| `mathlib:Representation.norm` | `Mathlib/RepresentationTheory/Basic.lean` | For a representation ρ of a finite group, norm ρ = Σ_g ρ g. |
| `mathlib:SimpleGraph` | `Mathlib/Combinatorics/SimpleGraph/Basic.lean` | Simple graphs; the graph X(P) is one. |
| `mathlib:exteriorPower.pairingDual` | `Mathlib/LinearAlgebra/ExteriorPower/Pairing.lean` | The linear map ⋀^n(Dual R M) → Dual R (⋀^n M), with pairingDual (ιMulti f) (ιMulti v) = det(f j (v i)). |
| `mathlib:exteriorPower.bijective_pairingDual` | `Mathlib/LinearAlgebra/ExteriorPower/Basis.lean` | pairingDual R M n is bijective for M finite free. |
| `mathlib:exteriorPower.map` | `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean` | Functoriality of exterior powers. |
| `mathlib:Module.Dual` | `Mathlib/LinearAlgebra/Dual/Defs.lean` | The dual module M →ₗ[R] R. |
| `mathlib:Module.IsReflexive` | `Mathlib/LinearAlgebra/Dual/Defs.lean` | Reflexive modules: evaluation M → Dual (Dual M) is bijective. |
| `mathlib:Module.Injective` | `Mathlib/Algebra/Module/Injective.lean` | Injective modules; R self-injective is Module.Injective R R. |
| `tauceti:TauCeti.ContCohomology.explicitCor1` | `TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction.lean` | Corestriction H¹(U, M) → H¹(G, M) for a finite-index subgroup, on continuous cochains of discrete modules. |
| `tauceti:TauCeti.ContCohomology.explicitCor1_comp_res1` | `TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction.lean` | cor ∘ res = multiplication by the index on H¹. |
| `tauceti:TauCeti.ContCohomology.DiscreteShortExact.explicitCor_delta0` | `TauCeti/RepresentationTheory/Homological/ContCohomology/DeltaNaturality.lean` | Corestriction commutes with the connecting map δ⁰ of a short exact sequence of discrete modules (Rubin, Proposition IV.4.5(iii)). |
| `tauceti:NumberField.Chebotarev.frobeniusPrimeSet` | `TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.lean` | The set of primes of K unramified in L whose Artin symbol is a given conjugacy class. |
| `tauceti:NumberField.artinSymbol` | `TauCeti/NumberTheory/NumberField/ArtinSymbol.lean` | The Artin symbol (Frobenius conjugacy class) of an unramified prime in a finite Galois extension of number fields. |
| `tauceti:TauCeti.GlobalNumberFields.RayClassGroup` | `TauCeti/NumberTheory/NumberField/Global/RayClass/Basic.lean` | The ray class group of a modulus: ideals prime to the modulus modulo the ray. |
| `mathlib:IsAdic` | `Mathlib/Topology/Algebra/Nonarchimedean/AdicTopology.lean` | IsAdic J: the topology of the ring is the J-adic topology; used for the maximal-ideal topology of a coefficient ring. |
| `mathlib:IsAdicComplete` | `Mathlib/RingTheory/AdicCompletion/Basic.lean` | IsAdicComplete I M: M is I-adically Hausdorff and complete; used for completeness of a coefficient ring. |
| `mathlib:IsModuleTopology` | `Mathlib/Topology/Algebra/Module/ModuleTopology.lean` | IsModuleTopology R A: A carries the module topology induced from R; for a finitely generated module over a coefficient ring this is the m-adic topology. |
| `tauceti:TauCeti.IsSmoothDiscrete` | `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean` | An object of TopRep R G whose module is discrete with open point stabilisers; the discrete G-modules with continuous action. |
| `mathlib:Submodule.torsion` | `Mathlib/Algebra/Module/Torsion/Basic.lean` | The submodule of elements killed by a non-zero-divisor; the saturation of N in M is the preimage of the torsion of M/N. |
| `mathlib:cyclotomicCharacter` | `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean` | The p-adic cyclotomic character (L ≃+* L) →* ℤ_pˣ; used to type the Tate twist ℤ_p(1) in the universal-norm unit test. |
| `mathlib:PontryaginDual` | `Mathlib/Topology/Algebra/PontryaginDual.lean` | The Pontryagin dual A →ₜ* Circle of a topological group; Hom(·, Q_p/Z_p) of a discrete p-primary module is its p-part, as SelmerIwasawaCohomology L2 records. |
| `mathlib:Ideal.span` | `Mathlib/RingTheory/Ideal/Span.lean` | The ideal generated by a set, used to define ind_Λ(x) as the span of {φ(x)}. |
| `mathlib:Module.IsTorsion` | `Mathlib/Algebra/Module/Torsion/Basic.lean` | A torsion module: every element is killed by a non-zero-divisor; for the domain Λ this is 'torsion Λ-module' in Rubin and Mazur–Rubin. |
| `mathlib:Ideal.height` | `Mathlib/RingTheory/Ideal/Height.lean` | The height of an ideal (infimum of the heights of its minimal primes), for 'height at least two' and 'height-one prime'. |
| `mathlib:IsIntegralClosure` | `Mathlib/RingTheory/IntegralClosure/IsIntegralClosure/Defs.lean` | The characteristic predicate of an integral closure, for S_𝔓 = integral closure of Λ/𝔓 in its fraction field. |
| `mathlib:IsDiscreteValuationRing` | `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean` | A local PID that is not a field; S_𝔓 is one. |
| `mathlib:Polynomial.IsDistinguishedAt` | `Mathlib/RingTheory/Polynomial/Eisenstein/Distinguished.lean` | Monic polynomials with non-leading coefficients in an ideal; the generators g and g + p^N of height-one primes and their perturbations. |
| `mathlib:UniqueFactorizationMonoid` | `Mathlib/RingTheory/UniqueFactorizationDomain/Defs.lean` | Unique factorization, used for gcds in Ind(c) and for principal characteristic ideals; Mathlib/RingTheory/PowerSeries/Ideal.lean gives the instance for R⟦X⟧ over a principal ideal domain (one variable only). |
| `mathlib:PowerSeries` | `Mathlib/RingTheory/PowerSeries/Basic.lean` | O⟦X⟧, the model of Λ for d = 1 (via PadicMeasuresIwasawaAlgebras L4), noetherian and factorial over a DVR. |
| `mathlib:MvPowerSeries` | `Mathlib/RingTheory/MvPowerSeries/Basic.lean` | O⟦X_1, …, X_d⟧, the model of Λ for Z_p^d; no factoriality instance at the pinned commit, which is why the multivariable structure theory is requested from PadicMeasuresIwasawaAlgebras L4. |
| `mathlib:IsRegularLocalRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean` | Noetherian local rings whose maximal ideal is generated by dim R elements; O⟦Z_p^d⟧ is one of dimension d + 1 (not proved at the pinned commit). |
| `mathlib:Module.length_eq_add_of_exact` | `Mathlib/RingTheory/Length.lean` | Additivity of length in short exact sequences. |
| `mathlib:Module.Finite` | `Mathlib/RingTheory/Finiteness/Defs.lean` | Finitely generated modules (X∞, H¹_∞(K, T), H¹(Q, 𝐓)). |
| `tauceti:TauCeti.ContCohomology.H1` | `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean` | First continuous cochain cohomology H¹(G, M): continuous 1-cocycles modulo coboundaries, as a bare additive group |
| `tauceti:TauCeti.coind` | `TauCeti/RepresentationTheory/Homological/ContCohomology/Coinduced.lean` | The coinduced module of a subgroup U ≤ G: locally constant maps f : G → A with f(u·g) = u·f(g), with the right-translation action; for U trivial this is Rubin's 𝕎_M = Maps_cont(G_K, W_M), for U = D it is Ind_D(W_M) |
| `tauceti:TauCeti.ContCohomology.explicitShapiro1` | `TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro.lean` | Shapiro's lemma in degree one: for profinite G and a closed subgroup U, H¹(G, Coind_U^G A) ≅ H¹(U, A) for discrete A |
| `mathlib:Module.equiv_directSum_of_isTorsion` | `Mathlib/Algebra/Module/PID.lean` | A finitely generated torsion module over a PID is a finite direct sum of cyclic modules R/(p_i^{e_i}) with p_i irreducible |
| `mathlib:Polynomial.X_sub_C_dvd_sub_C_eval` | `Mathlib/Algebra/Polynomial/Div.lean` | X − C a divides p − C(p.eval a), giving the quotient Q with (x − 1)Q(x) = P(x) − P(1) |
| `mathlib:Polynomial.divByMonic` | `Mathlib/Algebra/Polynomial/Div.lean` | Division by a monic polynomial, used to write Q_q = (P − P(1)) /ₘ (X − 1) |
| `mathlib:LinearMap.ker` | `Mathlib/Algebra/Module/Submodule/Ker.lean` | The ker submodule of a (semi)linear map; specialized here to R-linear maps over a commutative ring. |
| `mathlib:LinearMap.range` | `Mathlib/Algebra/Module/Submodule/Range.lean` | The range submodule of a (semi)linear map; specialized here to R-linear maps over a commutative ring. |

## Target register

Every row covers the statement, coefficient and arithmetic hypotheses, proof route, direct suppliers, source locator, and (where present) every API and test. “Verified” is a target-level verdict, not a completed Lean proof. IDs are relative to `EulerSystemsAndKolyvaginSystems:`; the assigned layer can differ from the stable ID. The packet’s `review.checked` carries the individual rationale and complete source list.

| Stable target ID | Assigned layer | Verdict | Source locators checked |
| --- | --- | --- | --- |
| `ES.0/canonical-selmer-structure` | ES.0 | verified | mr-ks Definition 3.2.1, p. 23; mr-higher Definition 5.1, pp. 9–10; bss2 §6.2, p. 38; mr-higher Lemma 5.2 and Corollary 5.3, p. 10 |
| `ES.0/cartesian-condition` | ES.0 | verified | mr-ks Definition 1.1.4, p. 8; mr-higher Definition 3.1 and Remark 3.2, p. 7 |
| `ES.0/cartesian-length-linearity` | ES.0 | verified | mr-ks Lemma 1.1.5, p. 8 |
| `ES.0/core-rank` | ES.0 | verified | mr-higher Proposition 3.3(iii) and Definition 3.4, p. 8; mr-ks Theorem 4.1.5 and Definition 4.1.11, pp. 36–38 |
| `ES.0/core-rank-formula` | ES.0 | verified | mr-ks Theorem 5.2.15, p. 59; mr-higher Theorem 5.4, p. 10 |
| `ES.0/core-rank-independence-of-modulus` | ES.0 | verified | mr-ks Theorem 4.1.13 and Definition 5.2.4, pp. 38, 56; mr-ks Corollary 5.2.6, p. 56 |
| `ES.0/example-cyclotomic-twist` | ES.1 | verified | mr-ks Lemma 6.1.5 and Proposition 6.1.6, pp. 71–72 |
| `ES.0/example-elliptic` | ES.1 | verified | mr-ks Proposition 6.2.2 and Lemma 6.2.3, p. 74 |
| `ES.0/hypotheses-implications` | ES.1 | verified | mr-ks Remark 3.5.1, p. 28; mr-higher Remark 4.3, p. 9 |
| `ES.0/hypotheses-mr2004` | ES.1 | verified | mr-ks §3.5, pp. 27–28; mr-ks §3.5, p. 27 |
| `ES.0/hypotheses-mr2016` | ES.1 | verified | mr-higher §4, hypotheses (H.1)–(H.7), p. 9; mr-higher Lemma 4.5, p. 9 |
| `ES.0/non-example-inadmissible` | ES.1 | verified | mr-ks Lemma 6.1.5, proof, p. 71; rubin-es Chapter II, Remark 2.7, p. 25 |
| `ES.0/quotient-category` | ES.0 | verified | mr-ks Example 1.1.3, p. 8 |
| `ES.0/quotient-dual-propagation` | ES.0 | verified | mr-ks Example 1.3.3, p. 12 |
| `ES.0/selmer-length-difference` | ES.0 | verified | mr-ks Proposition 2.3.5, p. 17 |
| `ES.0/selmer-torsion-identification` | ES.0 | verified | mr-ks Lemma 3.5.3, p. 28; mr-ks Lemma 3.5.4, p. 29; mr-higher Proposition 3.3(i)–(ii), pp. 7–8; Gomez erratum to MR04 Lemma 2.1.4, p. 32 (arXiv v1); bss2 Proposition 3.5, Lemmas 3.6–3.7 and Corollary 3.8, arXiv v1 pp. 15–17 |
| `ES.0/selmer-triple` | ES.0 | verified | mr-ks Chapter 3, first paragraph, p. 19; mr-higher Definition 4.1, p. 8; mr-ks Chapter 1 opening and §1.1, p. 7; Chapter 2 opening, p. 13; mr-ks Definition 2.1.1, p. 13; Definition 2.3.1, pp. 16–17; mr-higher Definition 2.1, p. 6 |
| `ES.1/abundant-tuple-existence` | ES.1 | verified | ltxzz-published §2.6, Proposition 2.6.6 and its proof, pp. 134–135; ltxzz-published §2.6, Lemma 2.6.4 and Definition 2.6.5, p. 134 |
| `ES.1/abundant-tuples` | ES.1 | verified | ltxzz-published Definition 2.6.5, published p.134; ltxzz-published Lemma 2.6.4, published p.134; ltxzz-published Lemma 2.6.4 and Definition 2.6.5, published pp.133–135 |
| `ES.1/chebotarev-nonvanishing` | ES.1 | verified | mr-ks Proposition 3.6.1, p. 30; bss2 Lemma 3.9, p. 17 |
| `ES.1/chebotarev-prescribed-kernels` | ES.1 | verified | mr-ks Proposition 3.6.2, p. 30 |
| `ES.1/conductor-ideal` | ES.1 | verified | mr-ks Definition 2.2.1, p. 16; mr-higher Definition 2.2, p. 6; howard Definition 1.2.1, p. 1444 |
| `ES.1/error-tolerant-chebotarev` | ES.1 | verified | cgls §3.3.1, Proposition 3.3.6 and its proof, pp. 19–21 (arXiv v2); cgls §3.3.1, Corollary 3.3.7, p. 21 (arXiv v2); cgs §6.3, Proposition 6.3.1, its proof and Remark 6.3.2, pp. 22–23 (arXiv v2) |
| `ES.1/finite-singular-comparison` | ES.1 | verified | mr-ks Definition 1.2.2, p. 10; rubin-es Chapter IV, Definition 5.3, pp. 67–68 |
| `ES.1/finite-singular-decomposition` | ES.1 | verified | mr-ks Lemma 1.2.1, p. 10 |
| `ES.1/kolyvagin-primes` | ES.1 | verified | mr-ks Definition 3.1.6, p. 21; mr-higher Definition 4.2, p. 9; rubin-es Chapter IV, Definition 1.1, p. 57 |
| `ES.1/modified-selmer-structures` | ES.1 | verified | mr-ks Example 2.1.8, p. 15; mr-ks Example 2.3.2, p. 17 |
| `ES.1/ray-class-tower` | ES.1 | verified | rubin-es Chapter IV §1, p. 55 |
| `ES.1/reducibility-depth` | ES.1 | verified | ltxzz-published Definition 2.3.2, published p.126; ltxzz-published Lemma 2.3.3, published p.126; ltxzz-published Definition 2.3.2, Lemmas 2.3.3–2.3.4, published pp.126–128 |
| `ES.1/residual-two-class-detection` | ES.1 | verified | zhang §8.1, discussion before Lemma 8.1, pp. 234–235; zhang §8.1, Lemma 8.1, p. 235; zhang §8.1, Lemma 8.2, p. 235 |
| `ES.1/rubin-prime-selection` | ES.4 | verified | rubin-es Chapter V, Lemma 2.3, p. 81; rubin-es Chapter V, Lemma 3.1, p. 87 |
| `ES.1/selmer-field-saturation` | ES.1 | verified | ltxzz-published Lemma 2.3.4, published pp.127–128; ltxzz-published Lemma 2.3.5, published pp.127–128; ltxzz-published Lemma 2.3.5, published pp.127–128 |
| `ES.1/transverse-condition` | ES.1 | verified | mr-ks Definition 1.1.6(iv) and Lemma 1.2.4, pp. 9, 11 |
| `ES.1/transverse-duality` | ES.1 | verified | mr-ks Proposition 1.3.2, p. 12 |
| `ES.1/twist-error-constants` | ES.1 | verified | cgls §3.2, (3.2)–(3.3) and Theorem 3.2.1, p. 17 (arXiv v2); cgls §3.3.1, Lemmas 3.3.3–3.3.4 and Remark 3.3.5, pp. 18–19 (arXiv v2); cgs §6.1 and §6.3, before Proposition 6.3.1, pp. 21–22 (arXiv v2); ky §3, Lemma 3.0.3 and the definition of C₁ after it, p. 36 (arXiv v2) |
| `ES.2/classes-unramified-outside-p` | ES.2 | verified | rubin-es Chapter II, before Theorem 2.10, p. 25; bss2 Lemma 6.6, p. 38 |
| `ES.2/conductor-presentation` | ES.2 | verified | rubin-es Chapter II, Remarks 1.3 and 1.4, pp. 22–23 |
| `ES.2/euler-factor-change` | ES.2 | verified | rubin-es Chapter IX, Lemma 6.1, p. 141; mr-ks Remark 3.2.3, p. 23 |
| `ES.2/euler-polynomial` | ES.2 | verified | rubin-es Chapter IV, Lemma 1.2 and its proof, p. 57; mr-ks Remark 3.2.3, p. 23; bss2 §6.1, pp. 36–37 |
| `ES.2/euler-system-module` | ES.2 | verified | rubin-es Chapter II, Definition 1.1, pp. 21–22; rubin-es Chapter II, Remark 2.8, p. 25 |
| `ES.2/rigidity-variants` | ES.2 | verified | rubin-es Chapter IX §1, p. 133; rubin-es Chapter IX, Definition 3.1, p. 136; rubin-es Chapter IX, Definition 4.1, p. 138; rubin-es Chapter IX, Definition 5.1, p. 140 |
| `ES.2/ring-class-anticyclotomic-euler-system` | ES.2 | verified | ch §7.1 and §7.2, Definition 7.1, pp. 28–29 (author's version); ch §7.3, Proposition 7.4, p. 31 (author's version); ch §4.4, Lemma4.7 and proof, pp.18–19 |
| `ES.2/twisting` | ES.2 | verified | rubin-es Chapter II, Proposition 4.2, p. 30; rubin-es Chapter II, Lemma 4.3, p. 31 |
| `ES.2/universal-euler-system` | ES.2 | verified | rubin-es Chapter IV, Definitions 2.1–2.2, p. 58; rubin-es Chapter IV, Proposition 3.1, p. 59; rubin-es Chapter IV, Proposition 3.4, p. 61 |
| `ES.3/anticyclotomic-derivative` | ES.3 | verified | rubin-es Chapter IX, Remark 4.4, p. 139; rubin-es Chapter IX §4, p. 138 |
| `ES.3/congruence` | ES.3 | verified | rubin-es Chapter IV, Corollary 8.1, p. 77 |
| `ES.3/congruence-units-example` | ES.3 | verified | rubin-es Chapter IV §8, Example 8.2, p. 78 (1999 draft); rubin-es-2000 Chapter 4 §8, Example 4.8.2 and (4.13), p. 103 (published version); rubin-es Chapter II §1, Remark 1.5, p. 23 |
| `ES.3/derivative-class` | ES.3 | verified | rubin-es Chapter IV, Definition 4.10, p. 66; rubin-es Chapter IV, Lemma 4.13, p. 67 |
| `ES.3/derivative-classes-unramified` | ES.3 | verified | rubin-es Chapter IV §6, Proposition 6.1, Corollary 6.2 and Lemma 6.3, p. 69; rubin-es Chapter IV §6, Remark 6.4 and Corollary 6.5 with proof, pp. 69–70 |
| `ES.3/derivative-invariance` | ES.3 | verified | rubin-es Chapter IV, Lemma 4.2, p. 62 |
| `ES.3/derivative-local-properties` | ES.3 | verified | rubin-es Chapter IV, Theorem 5.1, p. 67; rubin-es Chapter IV, Theorem 5.4, p. 68; rubin-es Chapter IX, Theorem 5.2, p. 140 |
| `ES.3/derivative-operators` | ES.3 | verified | rubin-es Chapter IV, Definition 4.1 and (4), p. 62 |
| `ES.3/euler-to-kolyvagin` | ES.3 | verified | mr-ks Theorem 3.2.4, pp. 23–24; mr-ks Appendix A, proof of Theorem 3.2.4, (33), p. 80; mr-ks Theorem 3.2.7, p. 24 |
| `ES.3/finite-part-formula` | ES.3 | verified | mr-ks Appendix A, Proposition A.2, p. 79; mr-ks Appendix A, Theorem A.4, p. 80 |
| `ES.3/key-relation` | ES.3 | verified | rubin-es Chapter IV §7, identity (9), Lemma 7.1 and Remark 7.2, p. 74; rubin-es Chapter IV §7, Lemma 7.3 and its proof, pp. 75–76; rubin-es Chapter IV §5, Lemma 5.2 and Definition 5.3, pp. 67–68; §7, proof of Theorem 5.4, p. 76 |
| `ES.3/kolyvagin-system-module` | ES.3 | verified | mr-ks Definition 3.1.3, p. 20; mr-ks Definition 3.1.6, p. 21; mr-ks Definition 3.1.8, p. 21 |
| `ES.3/lifting-to-induced-module` | ES.3 | verified | rubin-es Chapter IV, Proposition 4.5, pp. 63–64; rubin-es Chapter IV, Proposition 4.8, p. 65 |
| `ES.3/local-lifts` | ES.3 | verified | rubin-es Chapter IV §6, Definition 6.6 and Lemma 6.7, pp. 70–71; rubin-es Chapter IV §6, Proposition 6.8 with proof and Remark 6.9, pp. 71–73; rubin-es Chapter IV §6, proof of Theorem 5.1, pp. 73–74 |
| `ES.3/rigidity-variant-derivative-classes` | ES.3 | verified | rubin-es Chapter IX §1, condition (ii)′ and the adaptation of Chapters IV–V, pp. 133–135; rubin-es Chapter IX §1, Example 1.1 and Theorem 1.2, pp. 135–136 |
| `ES.3/ring-class-derivative-classes` | ES.3 | verified | ch §7.2, from the choice of ν through (K3), pp. 29–30 (author's version); ch §7.2, Definition 7.2, p. 30 (author's version); ch §7.3, Lemma 7.5 and Proposition 7.6, p. 31; §7.4, Proposition 7.8 with footnote 5, pp. 32–33 (author's version); nekovar-kuga-preprint §6, Proposition6.3 and Corollary6.4, printed pp.11–12; §§7,9, printed pp.12–19; Proposition10.2 proof, printed p.20 (MPIM1990-78) |
| `ES.3/ring-class-local-operator` | ES.3 | verified | nekovar-kuga-preprint §7, printed pp.12–14; §9, printed pp.16–19; Proposition10.2 proof, printed p.20 (MPIM1990-78); ch §4.4, Lemma4.7 and its proof, pp.18–19; §7.2, pp.29–30 |
| `ES.3/ring-class-uniform-restriction` | ES.3 | verified | nekovar-kuga-preprint §6, Proposition6.3 and Corollary6.4, printed pp.11–12 (MPIM1990-78); ch §7.1–7.2, p.29; §6, p.28, purity discussion |
| `ES.3/selected-bounded-descent` | ES.3 | verified | ch §7.2, p.29, bounded restriction and the printed uniqueness claim |
| `ES.3/two-prime-test` | ES.3 | verified | mr-ks Appendix A, Theorem A.4 and (33), p. 80 |
| `ES.4/abundant-localization` | ES.4 | verified | ltxzz-published Proposition 2.4.6(2), published pp.130–131; ltxzz-published Proposition 2.6.7, published pp.134–135; ltxzz-published Proposition 2.4.6(2), published pp.130–131; Proposition 2.6.7, published pp.134–135 |
| `ES.4/core-vertices` | ES.4 | verified | mr-ks Definition 4.1.8 and Corollary 4.1.9, p. 38; mr-ks Theorem 4.1.10 and Definition 4.1.11, p. 38; mr-higher §11, p. 22 |
| `ES.4/howard-descent-with-errors` | ES.4 | verified | cgls Theorem 3.2.1, arXiv v2 p. 17; cgls Proposition 3.3.6, arXiv v2 p. 19; cgls Lemma 3.3.9, arXiv v2 p. 22 |
| `ES.4/kolyvagin-bound` | ES.4 | verified | mr-ks Theorem 5.2.2, p. 56; mr-ks Corollary 4.4.5, p. 47 |
| `ES.4/leading-vertices` | ES.4 | verified | mr-ks Theorem 4.1.16, p. 39 |
| `ES.4/maximal-order-evaluation-bound` | ES.4 | verified | nekovar §6.4, data6.4.1–6.4.2 and Proposition6.4.3 with proof, pp.38–40 (archived author manuscript) |
| `ES.4/nekovar-all-prime-descent` | ES.4 | verified | nekovar Theorem 3.2, pp. 18–19; §3.5, p. 19; §5.19, pp. 33–34; Proposition 6.4.3, pp. 38–40; Theorem 7.3 and §§7.4–7.6, pp. 45–51 (author copy) |
| `ES.4/rank-one-from-nonzero-class` | ES.4 | verified | cgls §3.3.1, Theorem 3.3.8 and its proof, (3.8)–(3.10), pp. 21–22 (arXiv v2) |
| `ES.4/rational-anticyclotomic-descent` | ES.4 | verified | ch §7.2, Theorem 7.3, p. 30 (author's version); ch §7.5, Lemmas 7.10–7.16 and the descent argument, pp. 33–37 (author's version); ch §7.4, Theorem 7.9 and its proof, p. 33 (author's version); §6, Hypothesis (H), p.26; §4.1, pp.14–15 |
| `ES.4/rubin-bound` | ES.4 | verified | rubin-es Chapter II, Theorem 2.2, p. 24; rubin-es Chapter II, Theorem 2.3, p. 24; rubin-es Chapter V, Lemma 2.5, p. 82; rubin-es Appendix A, Corollary 2.6, p. 148 |
| `ES.4/rubin-hypotheses` | ES.4 | verified | rubin-es Chapter II §2, p. 24; rubin-es Chapter II, Definition 2.1, p. 24; rubin-es Chapter V, Lemma 3.2, p. 87 |
| `ES.4/self-dual-module-induction` | ES.4 | verified | cgls §3.3.2, Lemma 3.3.9 and its proof, p. 22 (arXiv v2); cgls §3.3.2, (3.11)–(3.13), Lemma 3.3.10 and Proposition 3.3.11, pp. 22–23 (arXiv v2) |
| `ES.4/selmer-sheaf` | ES.4 | verified | mr-ks Definition 3.1.2, pp. 19–20; mr-ks Definition 3.1.1, p. 19 |
| `ES.4/sheaf-monodromy` | ES.4 | verified | mr-ks Definition 3.4.2 and Proposition 3.4.4, pp. 26–27 |
| `ES.4/stub-sheaf` | ES.4 | verified | mr-ks Definition 4.3.1, p. 41; mr-ks Theorem 4.3.4, p. 41; mr-ks Theorem 4.4.1, p. 45; mr-ks Theorem 4.2.2, p. 40 |
| `ES.4/uniform-near-trivial-bound` | ES.4 | verified | cgs §6.1, Theorem 6.1.1, p. 22, and §6.4, its proof, pp. 24–28 (arXiv v2); bcgs §1.3, Theorem 1.3.1 with proof and Remark 1.3.2, pp. 15–16 (arXiv v2); ky §3, Theorem 3.0.2 and Lemma 3.0.3, pp. 35–36 (arXiv v2) |
| `ES.4/variant-bounds` | ES.4 | corrected | rubin-es Chapter IX, Theorem 3.3, p.137 (1999 draft); corrected by published Theorem9.3.3, pp.179–180, source issue E912; rubin-es Chapter IX, Theorem 4.3, p. 139; rubin-es-2000 Chapter9, Theorem9.3.3, pp.179–180 |
| `ES.4/vertex-step` | ES.4 | verified | mr-ks Lemma 4.1.7, p. 37; mr-ks Corollary 2.3.6, p. 17 |
| `ES.4/weak-cassels-structure` | ES.4 | verified | cgls Proposition 3.3.2 and Lemma 3.3.1, arXiv v2 pp. 18–19; howard Theorem 1.4.2, pp. 1448–1450; Lemma 1.5.3 and Proposition 1.5.5, pp. 1450–1451 |
| `ES.5/cassels-structure` | ES.5 | verified | howard Proposition 1.4.1, p. 1448; howard Theorem 1.4.2 and its proof, pp. 1448–1450; howard Lemma 1.5.3, p. 1450 |
| `ES.5/divisibility-invariants` | ES.5 | verified | mr-ks Definition 5.2.11, pp. 57–58; mr-ks Definition 4.5.5, p. 49; mr-ks Definition 4.5.7, p. 49 |
| `ES.5/howard-dvr-theorem` | ES.5 | verified | howard Theorem 1.6.1, p. 1453 |
| `ES.5/howard-hypotheses` | ES.5 | verified | howard §1.3, hypotheses H.0–H.5, p. 1446; howard §1.3, hypothesis H.4, p. 1446; howard Definition 1.2.3, p. 1445 |
| `ES.5/howard-stub` | ES.5 | verified | howard Definition 1.5.4, p. 1451; howard Proposition 1.5.9, proof, p. 1452 |
| `ES.5/kolyvagin-dual-selmer` | ES.5 | verified | mr-ks Definition 3.3.1, p. 25; mr-ks Theorem 4.5.12, p. 51 |
| `ES.5/rank-one-module-theorem` | ES.5 | verified | mr-ks Corollary 4.5.2, p. 48; mr-ks Theorem 5.2.10, p. 57 |
| `ES.5/self-dual-core-vertex-rigidity` | ES.5 | verified | zanarella §2.2, Proposition 2.2.8 and Corollary 2.2.9, pp. 14–15 (arXiv v1); zanarella §2.2, Theorem 2.2.12, Corollary 2.2.13 and Proposition 2.2.14, pp. 17–18 (arXiv v1) |
| `ES.5/self-dual-divisibility-profile` | ES.5 | verified | zanarella §2.3, Lemma 2.3.1, Definition 2.3.2 and Propositions 2.3.3–2.3.4, pp. 18–20 (arXiv v1); bcgs §2.2.1, definitions of M(n), M_{r,N′} and M_∞, pp. 16–17; Lemma 2.2.4, p. 18 (arXiv v2); bcgs §2.2.2, Proposition 2.2.1, p. 17, and its proof, pp. 17–18 (arXiv v2) |
| `ES.5/self-dual-eigenspace-localisation` | ES.5 | verified | zanarella §2.2, Lemma 2.2.10 and its proof, pp. 15–16 (arXiv v1); zanarella §2.2, Corollary 2.2.11, pp. 16–17 (arXiv v1) |
| `ES.5/self-dual-structure-theorem` | ES.5 | verified | zanarella §2.3, Theorem 2.3.6 and its proof, p. 20 (arXiv v1); bcgs §2.2.2, Theorem 2.2.2, p. 17, with Lemma 2.2.4 and the proof, pp. 18–20 (arXiv v2) |
| `ES.5/sharpness-examples` | ES.5 | verified | mr-ks Proposition 6.2.6, p. 75 |
| `ES.5/structure-theorem` | ES.5 | verified | mr-ks Theorem 5.2.12, p. 58; mr-ks Corollary 5.2.13, p. 58; mr-ks Theorem 4.5.9, p. 50; mr-ks Theorem 4.5.6, p.49 (authors’ 2003 copy) |
| `ES.6/bidual-functoriality` | ES.6 | verified | bss2 Proposition 2.3, p. 8; bss2 Proposition 2.4, p. 8; bss2 Corollary 2.7, pp. 10–11 |
| `ES.6/bss-hypotheses` | ES.6 | verified | bss2 Hypothesis 3.2, p. 13; bss2 Hypothesis 4.2, p. 20; bss2 Hypothesis 4.7, p. 22 |
| `ES.6/exterior-bidual` | ES.6 | verified | bss2 Definition 2.1, p. 7; dk §1.2, p. 8 |
| `ES.6/kolyvagin-systems-rank-r` | ES.6 | verified | mr-higher Definition 10.4, p. 21; bss2 §5.2, p. 25; mr-higher Proposition 12.3, p. 24 |
| `ES.6/regulator-isomorphism` | ES.6 | verified | mr-higher Theorem 12.4, p. 25; bss2 Theorem 5.2, pp. 25–26; bss2 Theorem 5.25, p. 36 |
| `ES.6/rubin-lattice` | ES.6 | verified | dk §1.2, (8)–(10), p. 8; dk §1.2, p. 8 |
| `ES.6/stark-comparison` | ES.6 | verified | sakamoto Lemma 4.13 and Proposition 4.14, pp. 2313–2314 |
| `ES.6/stark-structure` | ES.6 | verified | mr-higher Theorem 6.10, p. 15; mr-higher Theorem 8.9, p. 19; bss2 Theorem 4.6, p. 21 |
| `ES.6/stark-systems` | ES.6 | verified | mr-higher Definition 6.8, p. 14; bss2 §4.1, p. 19; bss2 Definition 4.1, p. 20 |
| `ES.7/fitting-bounds` | ES.7 | verified | bss2 Corollary 6.15, p. 42 |
| `ES.7/higher-kolyvagin-derivative` | ES.7 | verified | bss2 Theorem 6.12, p. 41; bss2 Corollary 6.13, p. 42; bss2 Proposition 6.10, p. 40 |
| `ES.7/higher-rank-euler-systems` | ES.7 | verified | bss2 Definition 6.4, p. 37; bss2 Hypothesis 6.1, p. 37 |
| `ES.7/rank-one-comparison` | ES.7 | verified | bss2 Remark 6.5, p. 37 |
| `ES.7/rubin-brumer-stark` | ES.7 | verified | dk §1.2, p. 8; dk Conjecture 1.5, p. 8 |
| `ES.7/rubin-stark-class-group` | ES.7 | verified | bss2 §7, equation (14) and Theorem 7.1(i)–(iii), pp. 47–50; Remarks 7.2–7.3, p. 50 |
| `ES.7/rubin-stark-minus-comparison` | ES.7 | verified | bss2 §7, pp. 48–50; dk §1.2, equations (8)–(10), Conjecture 1.5 and Theorem 1.6, pp. 7–9 |
| `ES.8/admissible-zp-d-extension` | ES.8 | verified | rubin-euler-systems-1999 Ch. II §1, Definition 1.1(ii), p. 21 (published: Definition 2.1.1(ii)); rubin-euler-systems-1999 Ch. II §1, Remark 1.2, p. 22; rubin-euler-systems-1999 Ch. II §3, opening paragraph and Notation, pp. 26–27 |
| `ES.8/augmentation-prime-divisibility` | ES.8 | verified | cgs §6.5, Theorem 6.5.1 and its proof, p. 28 (arXiv v2); ky §3, Theorem 3.0.5 and its proof, pp. 36–37 (arXiv v2); ky §1.2, Theorem1.2.2, pp.13–14; §1.4, Theorem1.4.1, pp.24–25 |
| `ES.8/blind-spot-and-lambda-primitivity` | ES.8 | verified | mazur-rubin-kolyvagin-systems §5.3, Definition 5.3.9, p. 61; mazur-rubin-kolyvagin-systems §3.1, Definition 3.1.6, p. 21 |
| `ES.8/characteristic-ideal-bound-with-error` | ES.8 | verified | rubin-euler-systems-1999 Ch. VII §1, Theorem 1.9, p. 101; rubin-euler-systems-1999 Ch. VII §1, Lemma 1.8, p. 101 |
| `ES.8/error-tolerant-self-dual-lambda-adic-bound` | ES.8 | verified | castella-grossi-lee-skinner-eisenstein §3.4, Theorem 3.4.1, p. 26; castella-grossi-lee-skinner-eisenstein §3.4, Corollary 3.4.2, p. 27; castella-grossi-lee-skinner-eisenstein §3.4, proof of Theorem 3.4.1, p. 27 |
| `ES.8/euler-to-lambda-adic-kolyvagin` | ES.8 | verified | mazur-rubin-kolyvagin-systems §5.3, Theorem 5.3.3, p. 61; mazur-rubin-kolyvagin-systems §5.3, Theorem 5.3.3, p. 61; mazur-rubin-kolyvagin-systems Appendix A, proof of Theorem 5.3.3, pp. 81–82 |
| `ES.8/exceptional-height-one-primes` | ES.8 | verified | mazur-rubin-kolyvagin-systems §5.3, Definition 5.3.12, p. 62 |
| `ES.8/generic-core-rank` | ES.8 | verified | mazur-rubin-kolyvagin-systems §5.3, Lemma 5.3.16, p. 65; mazur-rubin-kolyvagin-systems §5.3, Definition 5.3.17, p. 65 |
| `ES.8/height-one-specialization` | ES.8 | verified | mazur-rubin-kolyvagin-systems §5.3, p. 62; mazur-rubin-kolyvagin-systems §5.3, Corollary 5.3.15, p. 64; mazur-rubin-kolyvagin-systems §5.3, proof of Theorem 5.3.10, p. 66 |
| `ES.8/iwasawa-class-of-an-euler-system` | ES.8 | verified | rubin-euler-systems-1999 Ch. II §1, discussion after Remark 1.2, p. 22; rubin-euler-systems-1999 Ch. II §3, Definition 3.1, p. 28; rubin-euler-systems-1999 Ch. VI §2, p. 91 |
| `ES.8/iwasawa-evaluation-maps` | ES.8 | verified | rubin-euler-systems-1999 Ch. VII §1, Definition 1.2, p. 98; rubin-euler-systems-1999 Ch. VII §1, Lemma 1.3, p. 98; rubin-euler-systems-1999 Ch. VII §1, Definition 1.1, p. 97 |
| `ES.8/iwasawa-large-image-hypotheses` | ES.8 | verified | rubin-euler-systems-1999 Ch. II §3, Hypotheses Hyp(K∞, T), p. 27 (published p. 41); rubin-euler-systems-1999 Ch. II §3, p. 27; rubin-euler-systems-1999 Ch. II §2, Remark 2.4, p. 24 |
| `ES.8/iwasawa-poitou-tate-sequence` | ES.8 | verified | rubin-euler-systems-2000 Ch. 2 §3, Proposition 2.3.7 and proof, pp. 42–43; rubin-euler-systems-1999 Ch. II §3, Proposition 3.7, p. 29 |
| `ES.8/kolyvagin-sequence-induction` | ES.8 | verified | rubin-euler-systems-1999 Ch. VII §1, Proposition 1.6, p. 100; rubin-euler-systems-1999 Ch. VII §1, Proposition 1.4, pp. 98–99; rubin-euler-systems-1999 Ch. VII §1, after Proposition 1.6, p. 100 |
| `ES.8/lambda-adic-ind` | ES.8 | verified | mazur-rubin-kolyvagin-systems §5.3, Definition 5.3.8, p. 61; mazur-rubin-kolyvagin-systems §5.3, Definition 5.3.8, p. 61; mazur-rubin-kolyvagin-systems §5.3, proof of Theorem 5.3.10, p. 66 |
| `ES.8/lambda-adic-kolyvagin-systems` | ES.8 | verified | mazur-rubin-kolyvagin-systems §3.1, Definition 3.1.3, p. 20; mazur-rubin-kolyvagin-systems §3.1, Definition 3.1.6, p. 21; buyukboduk-lambda-adic-kolyvagin-systems §3.2, Remark 3.24, p. 27 |
| `ES.8/lambda-adic-selmer-structure` | ES.8 | verified | mazur-rubin-kolyvagin-systems §5.3, Definition 5.3.2, p. 60; mazur-rubin-kolyvagin-systems §5.3, after Definition 5.3.2, p. 60; howard-heegner-point-kolyvagin-system §2.2, Definition 2.2.6, p. 25 |
| `ES.8/lambda-index` | ES.8 | verified | rubin-euler-systems-1999 Ch. II §3, Definition 3.1, p. 28; rubin-euler-systems-2000 Ch. 2 §3, proof of Theorem 2.3.8, p. 43 |
| `ES.8/leopoldt-tower-hypothesis` | ES.8 | verified | rubin-euler-systems-1999 Ch. II §3, Hypothesis Hyp(K∞/K), p. 27 (published p. 41); rubin-euler-systems-1999 Ch. II §3, p. 27 |
| `ES.8/mazur-rubin-lambda-adic-main-theorem` | ES.8 | verified | mazur-rubin-kolyvagin-systems §5.3, Theorem 5.3.10, p. 62; mazur-rubin-kolyvagin-systems §5.3, Theorem 5.3.10(iii), p. 62; mazur-rubin-kolyvagin-systems §5.3, proof of Theorem 5.3.10, p. 67 |
| `ES.8/ordinary-coefficient-prime-comparison` | ES.8 | verified | ky §1.3, Proposition1.3.4, Lemmas1.3.5–1.3.6, pp.19–23; §1.4, pp.23–25; §3, pp.34–37; cgls §3.4, pp.24–25; §4.2, Proposition4.2.1, pp.28–29 |
| `ES.8/rank-one-leopoldt-case` | ES.8 | verified | rubin-euler-systems-1999 Ch. VII §3, Lemma 3.7, p. 109; rubin-euler-systems-1999 Ch. VII §3, proof of Lemma 3.7, p. 109 |
| `ES.8/residual-primitivity-implies-lambda-primitivity` | ES.8 | verified | buyukboduk-lambda-adic-kolyvagin-systems §4.1.1, proof of Proposition 4.1, pp. 28–29 |
| `ES.8/residual-unramified-mu-zero` | ES.8 | verified | ky §1.2, Theorem1.2.2 and Proposition1.2.5, pp.13–17; §1.3, Lemma1.3.6, pp.21–23; §1.4, Theorem1.4.1, pp.23–25; cgls §1.4, Proposition1.4.2, p.11; §1.5, Theorem1.5.1, p.12 (arXiv v2) |
| `ES.8/restricted-iwasawa-selmer-module` | ES.8 | verified | rubin-euler-systems-1999 Ch. II §3, Definition 3.1, p. 28 (published Definition 2.3.1); rubin-euler-systems-1999 Ch. VII §4, proof of Lemma 4.1, p. 110; rubin-euler-systems-1999 Ch. VII §2, proof of Lemma 2.4, p. 103 |
| `ES.8/restriction-control-over-the-tower` | ES.8 | verified | rubin-euler-systems-1999 Ch. VII §3, Proposition 3.4(iii), p. 107; rubin-euler-systems-1999 Ch. VII §3, Lemma 3.2, p. 106; rubin-euler-systems-1999 Ch. VII §3, opening, pp. 105–106 |
| `ES.8/rubin-iwasawa-divisibility` | ES.8 | corrected | rubin-euler-systems-1999 Ch. II §3, Theorem 3.3, p. 28 (published Theorem 2.3.3, p. 42); rubin-euler-systems-1999 Ch. VII §1, end, pp. 101–102 |
| `ES.8/rubin-rational-iwasawa-divisibility` | ES.8 | verified | rubin-euler-systems-1999 Ch. II §3, Theorem 3.4, p. 28 (published Theorem 2.3.4, p. 42); rubin-euler-systems-1999 Ch. VII §1, end, p. 102 |
| `ES.8/self-dual-lambda-adic-kolyvagin-bound` | ES.8 | verified | howard-heegner-point-kolyvagin-system §2.2, Theorem 2.2.10, p. 26; howard-heegner-point-kolyvagin-system §2.2, Theorem 2.2.10(b)–(c), p. 26; howard-heegner-point-kolyvagin-system §2.2, proof of Theorem 2.2.10, p. 27 |
| `ES.8/self-dual-lambda-primitivity-equality` | ES.8 | verified | zanarella §2.4, Proposition 2.4.1, Definitions 2.4.2–2.4.3 and Proposition 2.4.4, pp. 21–22 (arXiv v1); zanarella §2.4, Theorem 2.4.5 and its proof, pp. 22–24 (arXiv v1) |
| `ES.8/specialization-control` | ES.8 | verified | mazur-rubin-kolyvagin-systems §5.3, Proposition 5.3.14, p. 64; mazur-rubin-kolyvagin-systems §5.3, Lemma 5.3.13, p. 62; howard-heegner-point-kolyvagin-system §2.2, Proposition 2.2.8, p. 26 |
| `ES.8/true-iwasawa-selmer-and-singular-quotient` | ES.8 | verified | rubin-euler-systems-1999 Ch. II §3, Remark 3.6, pp. 28–29 (published Remark 2.3.6, p. 42); rubin-euler-systems-1999 Ch. II §3, Remark 3.6, p. 29 |
| `ES.8/true-selmer-iwasawa-divisibility` | ES.8 | verified | rubin-euler-systems-2000 Ch. 2 §3, Theorem 2.3.8, p. 43; rubin-euler-systems-2000 Ch. 2 §3, proof of Theorem 2.3.8, p. 43 |
| `ES.8/twisting-by-characters-of-gamma` | ES.8 | verified | rubin-euler-systems-1999 Ch. VI, introduction, p. 89; rubin-euler-systems-1999 Ch. VI §3, Theorem 3.5, p. 93; rubin-euler-systems-1999 Ch. VI §2, Proposition 2.1, p. 91 |
| `ES.8/twisting-invariance-of-iwasawa-theorems` | ES.8 | verified | rubin-euler-systems-1999 Ch. VI §4, Theorem 4.1, p. 94; rubin-euler-systems-1999 Ch. VI §4, proof of Theorem 4.1, p. 94; rubin-euler-systems-1999 Ch. VI §1, Lemma 1.2, p. 89 |
| `ES.8/unramified-at-split-primes-condition` | ES.8 | verified | rubin-euler-systems-1999 Ch. IX §2, p. 136; rubin-euler-systems-1999 Ch. IX §2, p. 136 |
| `ES.8/weak-leopoldt-from-an-euler-system` | ES.8 | verified | rubin-euler-systems-1999 Ch. II §3, Theorem 3.2, p. 28 (published Theorem 2.3.2, p. 41); rubin-euler-systems-1999 Ch. VII §4, opening, p. 110; rubin-euler-systems-1999 Ch. II §3, Remark 3.5, p. 28 |
| `ES.8/weak-leopoldt-from-lambda-adic-kolyvagin` | ES.8 | verified | mazur-rubin-kolyvagin-systems §5.3, Theorem 5.3.6, p. 61; mazur-rubin-kolyvagin-systems §5.3, Corollary 5.3.19, p. 65; mazur-rubin-kolyvagin-systems §5.3, proof of Theorem 5.3.6, pp. 65–66 |
| `ES.8/x-infinity-finitely-generated` | ES.8 | verified | rubin-euler-systems-1999 Ch. VII §4, Lemma 4.1 and proof, p. 110 |

## Assembly and validation

Both imported files retain their original SHA-256 pins: ES.0 part `7ce915210b8a29761cd15199968017928c6a1b6c2322daff12fc6b2f8789dcf2` (89 nodes), ES.8 part `eab9fb0a60fcbf40dee7bf007491b13612ac1719ea27d9125d4fa7c5ee25c395` (35 nodes). Reconstruct with string-leaf corrections, field additions, prerequisite removals/additions, then stage assignments, then the 27 local records. Stage assignment changes `parentStageId` and `realises`, preserving IDs. The whole `requests` list replaces the parts’ union.

The separate assembly audit checked both hashes and every replacement, 151 unique IDs, coverage membership, assigned layers, the internal DAG, no forward stage edge, all implementation statuses, 61 APIs/test suites and planet limits. Reader conservation checked 151 target headings and all 427 API names and 223 test names; corrected target text and source notes were inspected directly.

- `python3 scripts/check_blueprint.py research/blueprint/packets/EulerSystemsAndKolyvaginSystems.json`: zero errors, zero warnings.
- Packet-aware source issue and version validators: pass. The standalone errata-file wrapper is not the blueprint packet’s protocol.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/EulerSystemsAndKolyvaginSystems.lean`: pass.
- `lean-check research/blueprint/suggested/EulerSystemsAndKolyvaginSystems.lean`: exit 0, 15 warnings, all `declaration uses sorry`, no errors, using the shared pinned build after checking available memory. This 356-line file is unchanged by this review. Its nine light real-bodied definitions and selected-descent/exact-sequence signatures were read; it introduces no admitted data or arithmetic carrier development.
- Deliverable-path/intake validation and `git diff --check`: pass.

Only the whole packet, reader, this review report and its handoff note change. No imported part, supplier, campaign graph, atlas data or upstream file changes. The next step is packaging the accepted plan while preserving its conditional contracts and resolving the late CM/ES bundle or PartII order.
