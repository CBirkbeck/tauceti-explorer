# Local fields and ramification, Part II: general valued fields

This roadmap extends [Local fields and ramification](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/LocalFieldsRamification) from nonarchimedean local fields to arbitrary Krull valuations. Its endpoint is the following statement: if a valued field has residue characteristic exponent p and has no nontrivial finite p-extension, then every algebraic valued extension is tame. The valuation can have infinite height; the field need not be complete or henselian, and its residue field need not be perfect. The separable export says that a separably P-closed field is separably P-tame at every residue prime in P.

The development provides reusable definitions of the extension classes, their tower laws, complements to the unramified and tame towers, rank-one decompletion, composition of valuations, and the algebraic Abhyankar inequality. Its consumers include prime-to-degree alteration distillation and the algebraic valuation input to DiamondEtaleCohomology C8. The latter retains its stronger analytic comparison with modified topological transcendence degree. Kato's Swan conductors and finite-length DVR modules are independent continuations with the same local-field parent; the packet preserves their complete briefs and item assignments under separate proposed roadmap ids.

The reader document specifies every target. The associated suggested Lean file is a compact aid to names and signatures, using carriers available at the pinned libraries. It states the light field-theoretic definitions and selected milestones. The valuation-field henselization, ramification tower, maximal extensions, composition and finite-height constructions are specified here with their APIs and tests; their missing carriers are not replaced by placeholder data in the suggested file. Every target remains unchecked as an implementation claim.

## Conventions and carriers

A valued field consists of a field K and a Mathlib valuation subring V of K. Compatible extensions use a local embedding of valuation rings restricting to V. Equivalence of valuations means equality of these subrings; no choice of numerical value group is part of the extension property. Mathlib's canonical ValuationSubring.ValueGroup includes zero. In expressions involving tensor products or rational rank, Γ_K denotes the group of its nonzero units, written additively. For norm comparisons we use the multiplicative convention with V given by valuation at most one. Passing between these conventions reverses the familiar additive sign in the usual way.

Write κ_K for the residue field, and p=exp.char(κ_K): p is prime in positive residue characteristic and p=1 in characteristic zero. A p-number is a power p^n when p is prime. For p=1 the allowed prime set is empty, so only degree one is allowed. Prime-to-p means all primes when p=1. No Sylow theorem is instantiated with p=1. A P-number always has positive degree; zero is excluded even for the set of all primes.

Fix one algebraic closure K^a, its embedded separable closure K^s, and a prolongation of V. All henselizations and ramification subfields are embedded compatibly in this closure. Equalities of subfields refer to these choices, and tensor comparisons use the prescribed multiplication map. Changing the prolongation conjugates the tower. A splitting is an actual tensor-product isomorphism with both factor maps, not merely trivial intersection. A maximal extension is a Zorn-maximal intermediate field with its named properties, not a canonical choice and not necessarily normal.

Henselian valued field means HenselianLocalRing(V). The relative property “henselian extension” instead means unique prolongation to the extension field. Tame field means K^a=K^t in Temkin's convention, without adding henselianity to the definition. Separably tame means K^s=K^t and does not imply perfection. Totally ramified permits a purely inseparable residue extension; the equation f=1 is a local-field specialization. Unramified and tame extensions are separable. A tame finite henselian extension is defectless, has separable residue extension and prime-to-p value index. The degree formula is asserted with finiteness, and with the henselian hypothesis or its local-field specialization.

Height means Mathlib's ringKrullDim(V), identified with the convex-subgroup rank of Γ_K. Finite height d means the full prime spectrum consists of exactly d+1 prime ideals in a chain; height one is the nontrivial archimedean-value-group case. It does not mean completeness. Γ may be nondiscrete, and finite height need not imply finite rational rank. The bound needed here goes in the other direction: height is bounded by rational rank.

## Existing theory and ownership

The pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The packet records the individual declarations whose actual source statements were read. Use ValuationSubring and its canonical valuation, Valuation.HasExtension for compatibility, HenselianLocalRing, IntermediateField.LinearDisjoint, the algebraic tensor-field theorem, the separable/purely-inseparable disjointness theorem, IsPurelyInseparable.finrank_eq_pow, Valuation.RankOne, IsKrasner and ringKrullDim. Use the existing ValuationSubring.decompositionSubgroup stabilizer and inertiaSubgroup residue-action kernel; the new tower target proves their fixed-field comparisons. For coarsenings reuse ValuationSubring.ofPrime, idealOfLE and their inverse laws. TauCeti.AbsoluteGaloisGroup and the algebraic/separable-closure restriction equivalence supply the existing Galois carrier and topology. Algebra.Etale.of_etale_tensorProduct_of_faithfullyFlat supplies scalar-extension descent; the source-side EGA descent used by the étale criterion is a separate SF.0 request. TauCeti.IsProPSylow, exists_isProPSylow, IsProPSylow.exists_map_conj_eq and IsProPSylow.eq_of_normal already supply the Sylow carrier, existence, conjugacy and normal uniqueness at the pin. Only the surjective-image adapter remains at the Layer 2 boundary; it is already implemented in current main as IsProPSylow.map_of_surjective and is imported when the pin advances.

The current LocalFieldsRamification, LocalGaloisGroups, ProfiniteArithmetic and ProfiniteProPGroups roadmap sources and the current Tau Ceti library have been screened in addition to the pinned baseline. Their local-field and profinite results are imported, not restated as new work. The boundary table gives the direction of each import.

| Supplier | Imported interface | Consumer |
| --- | --- | --- |
| LocalFieldsRamification Layers 2–4 | Unramified local fields, ramification, tame inertia and arithmetic Frobenius | GF.2 local-field comparison |
| SchemeAndStackFoundations key/henselization and SF.0/ordinary-local-henselization; PerfectoidSpaces P3/henselisation-of-pairs | One ordinary pair-henselization carrier, its local comparison and filtered compatibility; two precise SF.0 requests for semilocal tensors and finite-presentation/étale descent | GF.1, GF.2, GF.4 |
| ClassicalAdicEtaleCohomology H1:valuation-nearby-cycles | Strict localization of a valuation ring and the arbitrary-rank strictly henselian pro-p/tame-quotient theorem | GF.2 ramification tower |
| ProfiniteProPGroups Layers 2, 5, 6 | Sylow theory, finite embedding problems and the Sylow comparison of cohomological dimension | GF.2–GF.3 |
| ProfiniteCohomology Layer 11 | Ordinary cd_p, finite-coefficient reduction and closed-subgroup monotonicity | GF.3 |
| SchemeAndStackFoundations SF.4/flattening-by-blowup | General flattening and finite-presentation input, specialized over a finite-height valuation ring | GF.5 unramified composition |

The H1 edge points into this roadmap. The valued-field construction proves that the supplied henselized local rings are valuation rings; it does not define another local-ring functor. SchemeAndStackFoundations:key/henselization reexports the single PerfectoidSpaces:P3/henselisation-of-pairs carrier, whose contract already includes filtered colimits; SF.0/ordinary-local-henselization supplies the local comparison. The SF.0 requests are the integral semilocal tensor formula of EGA IV₄ 18.6.8, without module finiteness, and the valuation-ring finite-presentation/source-side étale-descent inputs of the étale criterion. ModularCurves 4D retains strict henselization and is reached through the H1 import. These imports specify the supplier contracts; the valued-field specializations and comparisons are the targets here.

Two precise additional cohomological inputs are required by the henselian Pank proof: the characteristic-p bound cd_p(G_F)≤1 for every field F of characteristic p, and the section theorem for an arbitrary profinite surjection with pro-p kernel when its quotient has cd_p≤1. ProfiniteProPGroups Layer 5's projectivity interface for total pro-p groups does not state the second result. The packet records these as G1/G2 and proposes a ProfiniteCohomology Part II. They are proof-closure obligations, with exact statements and proof routes, rather than new variants of the existing group or cohomology carriers.

## Layer overview

| Layer | Targets | Internal inputs |
| --- | --- | --- |
| GF.0 | P-extensions, two closedness predicates, split towers | Existing field theory |
| GF.1 | Normalization, valued henselization, tensor factors | GF.0 and local-ring supplier |
| GF.2 | Ramification tower, six classes, comparisons | GF.0–GF.1 and H1 |
| GF.3 | Maximal complements and henselian Pank | GF.0–GF.2 and profinite suppliers |
| GF.4 | Rank-one approximation, decompletion and splitting | GF.1–GF.3 |
| GF.5 | Composition, finite-height chain, Abhyankar inequality | GF.1–GF.2 and general flattening |
| GF.6 | Finite-height descent and general tameness | GF.0–GF.5 |

Each target below gives its packet id, exact statement, construction or proof route, source locator and verification requirements. API and tests are part of the definition's specification; the test labels also identify the intended mathematical examples when a heavy carrier cannot yet be stated in the compact suggested file.

## GF.0. Prime-supported extensions and split towers

Build the degree and field-theoretic interfaces on existing intermediate fields and linear disjointness. Positive degree and the distinction between separable and unrestricted extensions are part of the specification. Maximal P-extensions exist, but their normal closures need not be P-extensions.

### Prime-supported positive integers

Target `LocalFieldsRamificationPartII:GF.0/prime-supported-degree` (definition).

For a set P of prime natural numbers, IsPNumber(P,n) means n > 0 and every prime divisor of n belongs to P. The singleton {p} gives exactly the positive powers of p when p is prime; the empty set gives only 1.

Construction and proof: Use the natural-number prime divisor predicate, retaining positivity. Prove the product criterion by prime divisibility of a product.

API:

- `IsPNumber.one` (simp): 1 is a P-number for every P.
- `IsPNumber.mul_iff` (characterisation): For positive a,b, ab is a P-number exactly when a and b are P-numbers.
- `IsPNumber.mono` (functoriality): P ⊆ Q sends P-numbers to Q-numbers.
- `IsPNumber.singleton_iff` (characterisation): For prime p, n is a {p}-number exactly when n = p^r for some natural r.

Unit tests:

- `pNumber_empty` (degenerate): The empty prime set admits exactly n=1.
- `pNumber_zero` (non-example): 0 is not a P-number, even when P contains every prime.
- `pNumber_six` (computation): 6 is a {2,3}-number and is not a {3}-number.

Uses: Temkin Theorem 2.6.6 — Makes p-closedness a degree condition rather than a normality condition.

Check: The empty prime set admits exactly n=1. 0 is not a P-number, even when P contains every prime. 6 is a {2,3}-number and is not a {3}-number.

Inputs: elementary natural-number prime divisibility.

Sources: temkin17, §2.1.1, p. 103 (Defines degree support by a set of primes; positivity excludes a vacuous zero-degree test.).

Atlas planet: Prime-supported degree.

### Prime-supported algebraic extensions

Target `LocalFieldsRamificationPartII:GF.0/p-extensions` (definition).

IsPExtension(P,L/K) means L/K is algebraic and every finite intermediate E/K has P-number degree. Neither L/K nor its normal closure is required to be Galois.

Construction and proof: Quantify over finite intermediate fields; identify the finite-dimensional case with the single degree [L:K]. Use degree multiplication and finite descent of multiplication tables for towers and filtered unions.

API:

- `IsPExtension.finite_iff` (characterisation): For finite L/K the predicate is equivalent to [L:K] being a P-number.
- `IsPExtension.tower_iff` (relation): For algebraic M/L/K, M/K is a P-extension exactly when M/L and L/K are P-extensions.
- `IsPExtension.directed_union` (structure): A directed union of P-subextensions is a P-extension.
- `IsPExtension.of_algEquiv` (compatibility): Transport by a K-algebra equivalence preserves the predicate.

Unit tests:

- `pExtension_identity` (degenerate): K/K is a P-extension.
- `pExtension_cubic` (computation): Q(cuberoot(2))/Q is a {3}-extension, although its normal closure has degree 6.
- `pExtension_not_compositum` (non-example): The two different cubic subfields in the S3 splitting field of X^3−2 are {3}-extensions, while their compositum is not.

Uses: Temkin §2.4.6 — Purely wild extensions must be p-extensions without a Galois-closure restriction.

Check: K/K is a P-extension. Q(cuberoot(2))/Q is a {3}-extension, although its normal closure has degree 6. The two different cubic subfields in the S3 splitting field of X^3−2 are {3}-extensions, while their compositum is not.

Inputs: `LocalFieldsRamificationPartII:GF.0/prime-supported-degree`.

Sources: temkin17, §2.1.1, p. 103 (Defines algebraic P-extensions through finite subextension degrees, without a normal-closure condition.).

Atlas planet: P-extension.

### Prime-supported closed fields

Target `LocalFieldsRamificationPartII:GF.0/p-closed` (definition).

IsPClosed(P,K) means every finite P-extension E/K is trivial. Equivalently every finite intermediate P-extension in an algebraic closure is the bottom field. This condition includes purely inseparable extensions.

Construction and proof: Use finite intermediate fields in a fixed algebraic closure; prove independence of that choice using algebraic-closure embeddings.

API:

- `IsPClosed.finite_test` (characterisation): It suffices to test finite subextensions of one algebraic closure.
- `IsPClosed.antitone` (functoriality): Q-closedness implies P-closedness if P ⊆ Q.
- `IsPClosed.no_extension` (characterisation): Every algebraic P-extension of a P-closed field equals the base, by testing each element.

Unit tests:

- `pClosed_empty` (degenerate): Every field is closed for the empty prime set.
- `pClosed_algClosed` (compatibility): An algebraically closed field is P-closed for every P.
- `pClosed_finite_field` (non-example): F_q is not {p}-closed for any prime p, since F_(q^p) has degree p.

Uses: Temkin Theorem 2.6.6 — The endpoint has full p-closedness.; PrimeToDegreeAlterations, separable distillation — The separable endpoint requires only separable P-closedness and must not assert perfection of the original field.

Check: Every field is closed for the empty prime set. An algebraically closed field is P-closed for every P. F_q is not {p}-closed for any prime p, since F_(q^p) has degree p.

Inputs: `LocalFieldsRamificationPartII:GF.0/p-extensions`.

Sources: temkin17, §2.1.1, p. 103; Remark 2.4.7, p. 108; derived separable interface for the extraction repair E6 (Uses the absence of nontrivial P-extensions, with finite testing and separable/full closure distinguished in this interface.).

Atlas planet: P-closed field.

### Maximal prime-supported extensions

Target `LocalFieldsRamificationPartII:GF.0/maximal-p-extension` (theorem).

Inside an algebraic closure every P-extension is contained in a maximal P-extension K_P/K, and K_P is P-closed. If exp.char K = q is prime and q belongs to P, a P-closed K is perfect. Every characteristic-zero field is perfect.

Construction and proof: Apply Zorn to P-subextensions; directed unions remain P-extensions. An additional finite P-extension would yield a larger P-extension by transitivity. In characteristic q, a missing q-th root gives a degree-q purely inseparable extension; in characteristic zero use the perfect-field instance.

Check: For P empty the maximal extension is K itself; for P all primes it is the algebraic closure. For P={3}, do not close a chosen cubic extension under normal closure.

Inputs: `LocalFieldsRamificationPartII:GF.0/p-closed`, `mathlib:IsPurelyInseparable.finrank_eq_pow`.

Sources: temkin17, §2.1.1, p. 103; §2.3.9, p. 106; proof of Theorem 2.6.6, p. 112 (The maximal P-extension argument uses directed unions and Zorn; perfection follows when the characteristic prime belongs to P.).

Atlas planet: Maximal P-extension.

### Linearly disjoint complements

Target `LocalFieldsRamificationPartII:GF.0/split-tower` (definition).

For algebraic L/M/K in a fixed ambient L, a splitting is an intermediate E/K with E linearly disjoint from M over K and E M = L. Its comparison is the multiplication isomorphism E ⊗_K M ≅ L, with the prescribed two embeddings. Splitting is existence of such an E, without a canonical choice.

Construction and proof: Use the existing IntermediateField lattice and linear disjointness. The tensor multiplication is injective by linear disjointness and has image the compositum because the tensor is a field in the algebraic case.

API:

- `SplitTower.complement` (data): A witness consists of E, its linear-disjointness proof and E M = L.
- `SplitTower.tensorEquiv` (equivalence): Multiplication gives an M-algebra equivalence E ⊗_K M ≅ L respecting both factors.
- `SplitTower.of_tensorEquiv` (constructor): An equivalence with the prescribed factor maps recovers a splitting.
- `SplitTower.transport` (functoriality): Compatible algebra equivalences of towers transport witnesses.

Unit tests:

- `split_identity` (degenerate): The tower M/M/K splits with E=K.
- `split_biquadratic` (computation): Q(sqrt(2),sqrt(3))/Q(sqrt(2))/Q splits with E=Q(sqrt(3)).
- `split_not_intersection` (non-example): Two distinct cubic subfields in an S3 extension have intersection Q but are not linearly disjoint; their tensor product does not give the degree-6 compositum.

Uses: Temkin Theorems 2.4.9 and 2.5.5 — Records the actual field splitting, not merely an intersection calculation.

Check: The tower M/M/K splits with E=K. Q(sqrt(2),sqrt(3))/Q(sqrt(2))/Q splits with E=Q(sqrt(3)). Two distinct cubic subfields in an S3 extension have intersection Q but are not linearly disjoint; their tensor product does not give the degree-6 compositum.

Inputs: `mathlib:IntermediateField.LinearDisjoint`, `mathlib:IntermediateField.LinearDisjoint.isField_of_isAlgebraic`.

Sources: temkin17, §2.1.2, p. 103 (Defines a complement by the multiplication tensor isomorphism, which requires linear disjointness as well as the compositum equality.).

Atlas planet: Split tower.

### Separably prime-supported closed fields

Target `LocalFieldsRamificationPartII:GF.0/separably-p-closed` (definition).

SeparablyPClosed(P,K) means that every finite separable P-extension E/K is trivial. Test finite separable intermediate fields in one algebraic closure; no perfection condition is imposed.

Construction and proof: Restrict the finite-extension test to separable extensions and use embeddings into an algebraic closure to make the condition independent of the chosen closure.

API:

- `SeparablyPClosed.of_pClosed` (relation): A P-closed field is separably P-closed.
- `SeparablyPClosed.antitone` (functoriality): Q-closedness in the separable sense implies P-closedness in that sense when P ⊆ Q.
- `SeparablyPClosed.finite_test` (characterisation): Test finite separable P-subextensions in one algebraic closure.
- `SeparablyPClosed.perfection` (compatibility): The perfection of a separably P-closed field is P-closed, by Frobenius descent and preservation of finite separable degrees.

Unit tests:

- `separable_closed_empty` (degenerate): Every field is separably closed for the empty prime set.
- `separable_closed_imperfect` (non-example): The separable closure of F_p(t) is separably {p}-closed and is not {p}-closed, since t has no p-th root.
- `separable_closed_finite` (non-example): F_q has a nontrivial separable degree-p extension for every prime p.

Uses: PrimeToDegreeAlterations, separable distillation — Keeps the maximal separable P-extension distinct from a maximal unrestricted one.

Check: Every field is separably closed for the empty prime set. The separable closure of F_p(t) is separably {p}-closed and is not {p}-closed, since t has no p-th root. F_q has a nontrivial separable degree-p extension for every prime p.

Inputs: `LocalFieldsRamificationPartII:GF.0/p-extensions`, `LocalFieldsRamificationPartII:GF.0/p-closed`.

Sources: temkin17, Remark 2.4.7, p. 108; derived interface for the separable distillation repair E6 (The separable reformulation motivates this finite separable P-extension predicate; its perfection API is derived by Frobenius descent.).

## GF.1. Valued henselization and normalization

Transfer the supplied local-ring henselization to valued fields. Normalization is semilocal in a finite field extension, but need not be a finite module. This distinction matters in the tensor decomposition. The normalization/prolongation theorem and the integrally closed subalgebra consequence work at arbitrary height.

### Normalization and valuation prolongations

Target `LocalFieldsRamificationPartII:GF.1/normalization-and-prolongations` (theorem).

For a valuation subring V of K and a finite extension L/K, the integral closure B of V in L is semilocal. Its maximal ideals correspond to the extensions of the valuation ring to L, and B_m is the corresponding valuation ring. More generally every localization A_q of an integrally closed V-subalgebra A ⊆ L is a valuation ring of Frac(A). No finiteness of B as a V-module is asserted.

Construction and proof: For normalization B and a maximal ideal m, apply Aïd Proposition 3.3: normalize a polynomial relation by a coefficient of least valuation and use its successive tail sums. At the first unit coefficient, either x or its inverse belongs to B_m. Proposition 3.6 identifies this localization with any prolongation having centre m. Proposition 4.1 bounds dim_κ(B/J(B)) by [L:K], by lifting residue-independent elements and normalizing the coefficients of a field-linear relation. This reduced finite-dimensional algebra is a finite product of fields; Theorem 4.4 makes B semilocal and enumerates all prolongations. The maximal-ideal theorem supplies existence; no finite-module normalization is needed. For an integrally closed V-subalgebra A of L, pass to Frac(A), still finite over K. A contains the integral closure there; localize at q over its contraction and apply ValuationSubring.ofLE to the resulting overring.

Check: A finite field extension can have nonfinite normalization over a nondiscrete valuation ring; no finite-module assumption enters the tensor decomposition.

Inputs: `mathlib:ValuationSubring`, `mathlib:ValuationSubring.ofLE`.

Sources: temkin17, Lemma 2.3.2 proof, pp. 104–105; Lemma 2.3.4 and proof, p. 105 (Temkin uses normalization and proves the integrally closed subalgebra consequence; the normalization proof is supplied by the public preprint below instead of the unread Bourbaki citation.); aid25, Propositions 3.3, 3.6, Theorem 3.7, pp. 5–9; Theorem 4.4, pp. 12–13 (Proves the localization/prolongation correspondence and semilocality for a finite extension, using a finite-dimensional reduced residue algebra.).

Atlas planet: Prüfer subalgebras.

### Henselization as a valued field

Target `LocalFieldsRamificationPartII:GF.1/valued-henselization` (construction).

For V ⊆ K construct K^h = Frac(V^h), using the imported local-ring henselization. V^h is a valuation ring, K^h/K is separable algebraic and immediate (unchanged residue field and value group), and every compatible embedding into a henselian valued field has a unique extension from K^h. Henselianity of K means exactly HenselianLocalRing(V).

Construction and proof: Use the single pair-henselization carrier reexported by SchemeAndStackFoundations:key/henselization and its ordinary-local comparison. The local HenselianRing instance gives HenselianLocalRing by the simple-root criterion, and the canonical quotient gives the residue-field comparison. Local essentially étale extensions of valuation rings are valuation rings with unchanged value group; pass to the filtered union of pointed étale neighborhoods and take fraction fields. Identify immediate residue and value-group maps and use the local universal property to obtain the valued-field universal property.

API:

- `ValuedHenselization.integerRing` (compatibility): The integer ring is the supplied V^h, not a newly defined henselization functor.
- `ValuedHenselization.lift` (universal-property): Compatible embeddings into henselian valued fields extend uniquely.
- `ValuedHenselization.immediate` (structure): The residue field and value group comparison maps are isomorphisms.
- `ValuedHenselization.map` (functoriality): Local compatible maps induce maps of henselizations with identity and composition laws.
- `ValuedHenselization.henselian_iff` (characterisation): K is henselian exactly when K → K^h is an isomorphism, and exactly when every finite extension admits one prolongation.

Unit tests:

- `henselization_trivial` (degenerate): For the trivial valuation K^h=K.
- `henselization_complete_rank_one` (compatibility): For a complete rank-one nonarchimedean field K, K^h=K.
- `henselization_not_completion` (non-example): The p-adic henselization of Q is algebraic and immediate over Q and embeds densely in Q_p; it is not Q_p.

Uses: Temkin Lemma 2.3.2 — Produces the factors of the henselian tensor decomposition.; Temkin Lemma 2.5.2 — Supplies the intermediate dense field in rank-one decompletion.

Check: For the trivial valuation K^h=K. For a complete rank-one nonarchimedean field K, K^h=K. The p-adic henselization of Q is algebraic and immediate over Q and embeds densely in Q_p; it is not Q_p.

Inputs: `mathlib:ValuationSubring`, `mathlib:HenselianLocalRing`, `SchemeAndStackFoundations:key/henselization`, `SchemeAndStackFoundations:SF.0/ordinary-local-henselization`.

Sources: temkin17, §2.3.1, p. 104 (Uses the immediate separable algebraic henselization of the valued field.); stacks, §15.125, Lemmas 15.125.5–6 (tag 0ASF) (The local étale and henselian constructions preserve the valuation-ring property.).

Atlas planet: Valued-field henselization.

### Tensor decomposition by prolongations

Target `LocalFieldsRamificationPartII:GF.1/henselian-tensor-decomposition` (theorem).

Let L/K be finite, V ⊆ K a valuation ring, and w_1,…,w_r all distinct prolongations to L, counted as valuation rings on the fixed L. Then L ⊗_K K^h ≅ ∏_(i=1)^r L_(w_i)^h as K^h-algebras, with each projection induced by the selected prolongation. This includes inseparable finite extensions.

Construction and proof: The normalization B is semilocal, integral over V, with localizations B_mi the valuation rings. Invoke EGA IV 18.6.8 to identify B ⊗_V V^h with the product of their henselizations. Invert the nonzero elements of V. The resulting factors are precisely the henselized fraction fields. Integral, rather than finite-module, normalization is enough for the supplier theorem.

Check: For a henselian K there is one factor; for a split prime of a number field there are several factors, so the tensor cannot be called a field.

Inputs: `LocalFieldsRamificationPartII:GF.1/normalization-and-prolongations`, `LocalFieldsRamificationPartII:GF.1/valued-henselization`, `SchemeAndStackFoundations:SF.0`.

Sources: temkin17, Lemma 2.3.2 and proof, pp. 104–105 (The finite field tensor splits into the henselizations at its distinct prolongations, including inseparable extensions.); ega4, Proposition 18.6.8 and proof, p. 139 (The ring-level product comparison applies to an integral semilocal algebra over a local ring, without module finiteness.).

Atlas planet: Henselian tensor decomposition.

## GF.2. The ramification tower and extension classes

Construct the embedded tower using the strict-localization and strict tame-quotient inputs. Express the six classes intrinsically at the selected prolongation and establish their tower laws. Defect is retained in the tame criterion; the local-field degree formula is used only in the explicitly stated comparison.

### The valuation-ring étale criterion

Target `LocalFieldsRamificationPartII:GF.2/unramified-etale-criterion` (theorem).

For finite valued L/K, L^h/K^h is unramified exactly when O_L is essentially étale over O_K. Adding equality of residue fields gives the strict version. Étale implies essentially étale always; if the valuation has finite height the two are equivalent. There is no noetherian or rank-one hypothesis in the essentially étale equivalence.

Construction and proof: The essentially étale direction identifies the strict henselizations. In the other direction, descend the finite field generators from a pointed étale neighborhood of O_K^sh. Intersect the pointed étale domain A′ with L to obtain a Prüfer domain A. The domain A′ is torsion-free and hence flat over A. It is of finite type over A; apply the requested valuation-ring finite-presentation theorem locally on Spec(A). On the open image of Spec(A′)→Spec(A), use EGA IV₄ 17.7.5(iv) to descend finite presentation and 17.7.7 to descend étaleness at the selected point. The selected localization of A is O_L. This source-side descent is distinct from the pinned scalar-extension descent theorem. At finite height Spec(O_K) has finitely many points; an étale algebra has finite fibres, so the relevant localization is obtained by one inversion and remains étale.

Check: The definition of unramified used here is the henselized one specified in GF.2. Strictly essentially étale means equal residue fields, not separably closed residue fields.

Inputs: `LocalFieldsRamificationPartII:GF.1/normalization-and-prolongations`, `LocalFieldsRamificationPartII:GF.1/valued-henselization`, `SchemeAndStackFoundations:SF.0`, `LocalFieldsRamificationPartII:GF.2/unramified-extension`, `mathlib:Algebra.Etale.of_etale_tensorProduct_of_faithfullyFlat`.

Sources: temkin17, Lemma 2.3.8 and proof, pp. 105–106 (Proves the essentially étale equivalence without a height bound and the étale equivalence at finite height.); ega4, Lemma 17.7.5(iv), pp. 73–74; Proposition 17.7.7, pp. 74–75 (Finite presentation descends along a faithfully flat morphism locally of finite presentation, with the stated quasi-compactness or quasi-separatedness condition; for locally finitely presented source and target, étaleness of the composite descends at a point where the intermediate map is flat.); stacks-finiteness, §15.26, Lemmas 15.26.2 and 15.26.6(1), tag 054A (A flat finite-type algebra over an arbitrary valuation ring is finitely presented; applying this at valuation localizations supplies the Prüfer step.).

Atlas planet: Unramified étale criterion.

### The ramification tower

Target `LocalFieldsRamificationPartII:GF.2/ramification-tower` (construction).

Fix a prolongation of V to K^a and the embedded separable closure K^s. Define K^h ⊆ K^u ⊆ K^t ⊆ K^s, where K^u is the maximal unramified extension of K^h and K^t its maximal tame extension. The integer ring of K^u is V^sh. In Gal(K^s/K), use the existing ValuationSubring.decompositionSubgroup for D and its existing inertiaSubgroup for I; view I in G_K through its subgroup inclusion. Prove that D fixes K^h and I fixes K^u, and use the H1 wild subgroup W to identify its fixed field with K^t. D/I ≅ Gal(κ^s/κ). D and I may be proper subgroups; K^h/K need not be normal, so no quotient by D is used.

Construction and proof: Use the imported strict-localization theorem to realize K^u and the decomposition/inertia correspondence. Over K^u apply the strictly henselian arbitrary-rank tame theorem to form K^t. Translate closed subgroups and fixed fields by infinite Galois theory. The Kummer pairing describes Gal(K^t/K^u) using the prime-to-p divisible hull of Γ_K and all prime-to-p roots of unity in K^u. For prime p use the pinned IsProPSylow carrier and its existence, conjugacy and normal uniqueness results to compare the supplied wild subgroup and to transport it under a change of prolongation. For p=1 use W=1 directly.

API:

- `RamificationTower.integerRing_unramified` (compatibility): O_(K^u) is the supplied strict henselization V^sh.
- `RamificationTower.fixedFields` (characterisation): Inside K^s, the fixed fields of the existing D,I and the supplied W are K^h,K^u,K^t, respectively. Fixed fields inside K^a can contain purely inseparable elements and are not used for these identifications; no duplicate stabilizer or inertia kernel is introduced.
- `RamificationTower.residueQuotient` (equivalence): D/I identifies topologically with the residue absolute Galois group.
- `RamificationTower.tamePairing` (relation): Gal(K^t/K^u) is the continuous character group of Γ_K ⊗ Z_(p)/Γ_K into prime-to-p roots of unity.
- `RamificationTower.prolongation_conjugate` (functoriality): A different prolongation conjugates D,I,W and transports the embedded tower.

Unit tests:

- `tower_henselian` (compatibility): For henselian K, K^h=K and D is the whole Galois group.
- `tower_trivial_valuation` (degenerate): For trivial V, K^u=K^t=K^s and I=W=1.
- `tower_char_zero_residue` (characterisation): If exp.char κ=1 then K^t=K^s and W=1.
- `tower_not_galois_bottom` (non-example): The p-adic henselization of Q need not be normal over Q; treat D as a subgroup, not a quotient.
- `tower_imperfect_ambient` (non-example): For trivially valued F_p(t), W=1 and (K^s)^W=K^s, whereas (K^a)^W=K^a is strictly larger. The fixed-field comparison must name its ambient separable closure.

Uses: Temkin §2.3.12 — Defines total ramification and pure wildness by disjointness.; ClassicalAdicEtaleCohomology H1 — Supplies, rather than consumes, the strictly henselian quotient theorem.

Check: For henselian K, K^h=K and D is the whole Galois group. For trivial V, K^u=K^t=K^s and I=W=1. If exp.char κ=1 then K^t=K^s and W=1. The p-adic henselization of Q need not be normal over Q; treat D as a subgroup, not a quotient. For trivially valued F_p(t), W=1 and (K^s)^W=K^s, whereas (K^a)^W=K^a is strictly larger. The fixed-field comparison must name its ambient separable closure.

Inputs: `LocalFieldsRamificationPartII:GF.1/valued-henselization`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/strict-localisation-of-a-valuation-ring`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/tame-quotient-of-a-henselian-valued-field`, `tauceti:TauCeti.AbsoluteGaloisGroup`, `mathlib:ValuationSubring.decompositionSubgroup`, `mathlib:ValuationSubring.inertiaSubgroup`, `tauceti:TauCeti.IsProPSylow`, `tauceti:TauCeti.exists_isProPSylow`, `tauceti:TauCeti.IsProPSylow.exists_map_conj_eq`, `tauceti:TauCeti.IsProPSylow.eq_of_normal`.

Sources: temkin17, §§2.2.3–2.2.6, p. 104; §2.3.5 and Remark 2.3.6, p. 105 (Defines the decomposition, inertia and wild subgroups and their fixed fields after selecting a prolonged valuation.).

Atlas planet: Ramification tower.

### Unramified algebraic extensions

Target `LocalFieldsRamificationPartII:GF.2/unramified-extension` (definition).

A selected valued algebraic extension L/K is unramified when L^h/K^h is unramified in the henselian sense: it lies in the maximal unramified extension of K^h. Over a henselian base these finite extensions correspond to finite separable residue extensions; the value group is unchanged.

Construction and proof: Pull back the strict-henselization classification along the henselized selected embedding. Keep the prolongation as data when K is not henselian.

API:

- `IsUnramified.henselization_iff` (characterisation): L/K is unramified exactly when L^h/K^h is unramified.
- `IsUnramified.residue_separable` (structure): The induced residue extension is separable algebraic.
- `IsUnramified.valueGroupEquiv` (equivalence): The value group inclusion is an isomorphism.
- `IsUnramified.henselian_residue_classification` (equivalence): For henselian K, finite unramified extensions are equivalent to finite separable residue extensions, compatibly with embeddings.

Unit tests:

- `unramified_identity` (degenerate): K/K is unramified.
- `unramified_finite_field` (computation): F_(p^r)((t))/F_p((t)) is unramified of degree r.
- `unramified_eisenstein` (non-example): Q_p(p^(1/ell))/Q_p is ramified for every prime ell, since its value group grows.

Uses: Temkin Lemmas 2.3.8 and 2.6.3(i) — Connects the field definition to étaleness and to composition.

Check: K/K is unramified. F_(p^r)((t))/F_p((t)) is unramified of degree r. Q_p(p^(1/ell))/Q_p is ramified for every prime ell, since its value group grows.

Inputs: `LocalFieldsRamificationPartII:GF.1/valued-henselization`, `LocalFieldsRamificationPartII:GF.2/ramification-tower`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/strict-localisation-of-a-valuation-ring`.

Sources: temkin17, §2.2.3, p. 104; §2.3.7, p. 105 (Extends the henselian residue-field classification to a selected nonhenselian extension through henselization.).

### Strictly unramified extensions

Target `LocalFieldsRamificationPartII:GF.2/strictly-unramified-extension` (definition).

A valued algebraic extension L/K is strictly unramified when it is unramified and κ_L=κ_K via the induced embedding. This is a relative condition and does not require either residue field to be separably closed.

Construction and proof: Conjoin unramifiedness with bijectivity of the residue map. The universal property of henselization identifies this class with subextensions of K^h for the chosen prolongation.

API:

- `IsStrictlyUnramified.iff` (characterisation): The predicate is unramifiedness plus equality of residue fields.
- `IsStrictlyUnramified.le_henselization` (characterisation): In the chosen algebraic closure, it holds exactly for subextensions of K^h.
- `IsStrictlyUnramified.henselian_base` (simp): Over a henselian base a strictly unramified algebraic extension is trivial.

Unit tests:

- `strict_henselization_extension` (compatibility): K^h/K is strictly unramified.
- `strict_identity_finite_residue` (degenerate): F_p((t))/F_p((t)) is strictly unramified although F_p is not separably closed.
- `strict_not_unramified_quadratic` (non-example): The unramified quadratic extension of Q_p is not strictly unramified.

Uses: Temkin §2.4.1 — Forms the complementary pair with henselian extensions.

Check: K^h/K is strictly unramified. F_p((t))/F_p((t)) is strictly unramified although F_p is not separably closed. The unramified quadratic extension of Q_p is not strictly unramified.

Inputs: `LocalFieldsRamificationPartII:GF.2/unramified-extension`.

Sources: temkin17, §2.3.7, p. 105; Lemma 2.4.2, p. 107 (Adds equality of residue fields to unramifiedness; the maximal such subextension is the henselization.).

### Tame algebraic extensions

Target `LocalFieldsRamificationPartII:GF.2/tame-extension` (definition).

A selected valued algebraic L/K is tame when L^h/K^h is tame. For finite henselian L/K, let M/K be its maximal unramified subextension; tameness means [L:M] is prime to p=exp.char κ_K. Equivalently κ_L/κ_K is separable, Γ_L/Γ_K has order prime to p, and [L:K]=[κ_L:κ_K]·[Γ_L:Γ_K]. For arbitrary algebraic extensions require this at every finite henselian level. The equality retains finiteness and excludes defect.

Construction and proof: Use the prime-to-p tame tower over K^u supplied by H1. Descend to finite henselian subextensions using their maximal unramified part. The finite degree formula follows from the Kummer pairing over K^u and the residue classification. It must not be imposed on the degree [L:K] of a nonhenselian extension, where multiple prolongations change that degree.

API:

- `IsTame.henselization_iff` (characterisation): Tameness is invariant under passing to the selected henselizations.
- `IsTame.finite_henselian_iff` (characterisation): For finite henselian extensions, separable residue, prime-to-p e and the degree formula characterize tameness.
- `IsTame.baseChange` (functoriality): Every prolongation on a compositum of a tame L/K with an arbitrary valued base change remains tame.
- `IsTame.le_tameClosure` (characterisation): In the chosen valued algebraic closure, L/K is tame exactly when L ⊆ K^t.
- `IsTame.isSeparable` (structure): Tame extensions are separable.

Unit tests:

- `tame_radical` (computation): For ell≠p prime, Q_p(p^(1/ell))/Q_p is tame of degree ell.
- `tame_wild_eisenstein` (non-example): Q_p(p^(1/p))/Q_p is not tame.
- `tame_trivial_imperfect` (degenerate): With trivial valuation, finite separable extensions are tame, but nontrivial purely inseparable extensions are not.
- `tame_defect_condition` (non-example): A nontrivial immediate Artin–Schreier defect extension of a henselian field is not tame, despite e=f=1.

Uses: Temkin Theorem 2.6.6 — The endpoint concerns every algebraic extension, with defect excluded.; PrimeToDegreeAlterations — Consumes tame extensions at arbitrary valuation points.

Check: For ell≠p prime, Q_p(p^(1/ell))/Q_p is tame of degree ell. Q_p(p^(1/p))/Q_p is not tame. With trivial valuation, finite separable extensions are tame, but nontrivial purely inseparable extensions are not. A nontrivial immediate Artin–Schreier defect extension of a henselian field is not tame, despite e=f=1.

Inputs: `LocalFieldsRamificationPartII:GF.2/unramified-extension`, `LocalFieldsRamificationPartII:GF.2/ramification-tower`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/tame-quotient-of-a-henselian-valued-field`.

Sources: temkin17, §2.2.5–2.2.6, p. 104; §2.3.7, p. 105 (Defines the tame closure by prime-to-residue-characteristic ramification; the finite criterion retains separability and the defectless degree equation.).

Atlas planet: Tame extension.

### Henselian extensions in the relative sense

Target `LocalFieldsRamificationPartII:GF.2/henselian-extension` (definition).

An algebraic valued extension L/K is a henselian extension if the valuation ring of K has exactly one prolongation to the underlying field L, namely the chosen one. This does not say that L itself is henselian.

Construction and proof: Define uniqueness among valuation subrings of L restricting to V. Finite tensor decomposition and filtered compatibility supply the disjointness characterization in the separate comparison theorem.

API:

- `IsHenselianExtension.prolongation_unique` (characterisation): Every prolongation to L equals the selected one.
- `IsHenselianExtension.identity` (constructor): The identity extension has the property for every K.
- `IsHenselianExtension.of_henselian_base` (compatibility): Every algebraic extension of a henselian valued field has the property.

Unit tests:

- `henselian_extension_identity` (degenerate): Q/Q with its p-adic valuation is a henselian extension, while Q is not henselian.
- `henselian_extension_purely_inseparable` (characterisation): A purely inseparable algebraic extension has unique prolongation.
- `henselian_extension_split_prime` (non-example): Q(sqrt(2))/Q with the 7-adic valuation has two prolongations and is not a henselian extension.

Uses: Temkin Lemma 2.5.2 — The descended field must have unique prolongation, not just a chosen valuation.

Check: Q/Q with its p-adic valuation is a henselian extension, while Q is not henselian. A purely inseparable algebraic extension has unique prolongation. Q(sqrt(2))/Q with the 7-adic valuation has two prolongations and is not a henselian extension.

Inputs: `mathlib:ValuationSubring`, `LocalFieldsRamificationPartII:GF.1/normalization-and-prolongations`.

Sources: temkin17, §2.3.10 and Lemma 2.3.11, p. 106 (Uses unique prolongation as a relative property, separate from henselianity of the extension field.).

### Unique prolongation and henselization disjointness

Target `LocalFieldsRamificationPartII:GF.2/henselian-disjointness` (comparison).

For algebraic valued L/K, L/K is a henselian extension exactly when L and K^h are linearly disjoint over K. In that case the canonical multiplication map identifies L ⊗_K K^h with L^h.

Construction and proof: For finite L/K the tensor decomposition has one field factor exactly when there is one prolongation. The algebraic tensor is a field exactly when its multiplication map for the selected embedding is injective. Pass to finite subextensions using the supplied filtered-colimit compatibility of local henselization; uniqueness and linear disjointness are both finite-character conditions.

Check: For Q(sqrt(2))/Q at 7 the tensor has two factors and disjointness fails. For a purely inseparable extension the tensor with the separable henselization is a field.

Inputs: `LocalFieldsRamificationPartII:GF.2/henselian-extension`, `LocalFieldsRamificationPartII:GF.1/henselian-tensor-decomposition`, `mathlib:IntermediateField.LinearDisjoint`, `PerfectoidSpaces:P3/henselisation-of-pairs`.

Sources: temkin17, Lemma 2.3.11 and proof, p. 106 (Unique prolongation is equivalent to linear disjointness from the henselization.); ega4, Proposition 18.6.14(ii) and proof, pp. 141–142 (Local henselization commutes with filtered local colimits, giving the infinite algebraic passage; this is already in the imported P3 contract.).

### Totally ramified extensions

Target `LocalFieldsRamificationPartII:GF.2/totally-ramified-extension` (definition).

A selected algebraic valued extension L/K is totally ramified if L and K^u are linearly disjoint over K. Equivalently L/K is a henselian extension and κ_L/κ_K is purely inseparable. Equality of residue fields is not required.

Construction and proof: Use disjointness from the unramified tower and the residue correspondence after henselization.

API:

- `IsTotallyRamified.linearDisjoint` (characterisation): The predicate means disjointness from K^u.
- `IsTotallyRamified.henselian_residue` (characterisation): It is unique prolongation together with a purely inseparable residue extension.
- `IsTotallyRamified.localField_compat` (compatibility): For finite nonarchimedean local fields it agrees with the existing totally ramified condition f=1.

Unit tests:

- `totally_identity` (degenerate): K/K is totally ramified.
- `totally_residue_inseparable` (computation): F_p(u^(1/p))((t))/F_p(u)((t)) is totally ramified in this convention, with e=1 and residue degree p.
- `totally_unramified_nontrivial` (non-example): A nontrivial unramified extension of a henselian K is not totally ramified.

Uses: Temkin Lemma 2.4.4 — Defines the tame totally ramified complement.

Check: K/K is totally ramified. F_p(u^(1/p))((t))/F_p(u)((t)) is totally ramified in this convention, with e=1 and residue degree p. A nontrivial unramified extension of a henselian K is not totally ramified.

Inputs: `LocalFieldsRamificationPartII:GF.2/ramification-tower`, `mathlib:IntermediateField.LinearDisjoint`, `LocalFieldsRamificationPartII:GF.2/henselian-disjointness`.

Sources: temkin17, §2.2.4, p. 104; §2.3.12, p. 106 (Characterizes disjointness from the maximal unramified field by unique prolongation and purely inseparable residue extension.).

### Purely wild extensions

Target `LocalFieldsRamificationPartII:GF.2/purely-wild-extension` (definition).

A selected algebraic valued extension L/K is purely wild if L and K^t are linearly disjoint over K. Equivalently it is a totally ramified p-extension. Over a henselian K this is also equivalent to purely inseparable residue extension and a p-primary torsion value-group quotient, with defect allowed.

Construction and proof: Apply the strict henselian pro-p inertia theorem over K^u; translate the disjointness criterion by the henselian tensor comparison. For infinite extensions read p-primary as elementwise p-power torsion and test finite subextensions.

API:

- `IsPurelyWild.linearDisjoint` (characterisation): It means linear disjointness from K^t, with the canonical selected embeddings.
- `IsPurelyWild.total_pExtension` (characterisation): It is total ramification together with IsPExtension({p},L/K).
- `IsPurelyWild.henselian_invariants` (characterisation): Over henselian K, the residue extension is purely inseparable and the value quotient is p-primary torsion.
- `IsPurelyWild.purelyInseparable` (compatibility): Every purely inseparable extension is purely wild; use the baseline separable/purely-inseparable disjointness theorem.

Unit tests:

- `wild_artin_schreier` (computation): A root a of a^p−a=t^(−1) gives a purely wild degree-p extension of F_p((t)); its ramification index is p.
- `wild_purely_inseparable` (compatibility): F_p((t^(1/p)))/F_p((t)) is purely wild.
- `wild_not_tame_radical` (non-example): For ell≠p the nontrivial tame radical extension of Q_p is not purely wild.
- `wild_char_zero_residue` (degenerate): With residue characteristic zero, a purely wild algebraic extension is trivial.

Uses: Temkin Theorems 2.4.9 and 2.5.5 — Specifies the maximal complements, including inseparable parts.

Check: A root a of a^p−a=t^(−1) gives a purely wild degree-p extension of F_p((t)); its ramification index is p. F_p((t^(1/p)))/F_p((t)) is purely wild. For ell≠p the nontrivial tame radical extension of Q_p is not purely wild. With residue characteristic zero, a purely wild algebraic extension is trivial.

Inputs: `LocalFieldsRamificationPartII:GF.2/totally-ramified-extension`, `LocalFieldsRamificationPartII:GF.2/tame-extension`, `LocalFieldsRamificationPartII:GF.0/p-extensions`, `mathlib:IntermediateField.LinearDisjoint`, `ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/tame-quotient-of-a-henselian-valued-field`.

Sources: temkin17, §2.2.7, p. 104; §2.3.12, p. 106 (Identifies disjointness from the tame closure with totally ramified p-extensions, allowing inseparable extensions and defect.).

Atlas planet: Purely wild extension.

### Tame fields in the adopted convention

Target `LocalFieldsRamificationPartII:GF.2/tame-field` (definition).

A valued field K is tame if K^a=K^t, equivalently every algebraic valued extension of K is tame for every prolongation. No henselian hypothesis is added to this definition. A tame field is perfect.

Construction and proof: Use the chosen closure equality, then prove independence of prolongation by conjugacy. A purely inseparable extension is purely wild and cannot also be nontrivially tame.

API:

- `IsTameField.closure_eq` (characterisation): K^a=K^t characterizes the predicate.
- `IsTameField.all_extensions` (characterisation): Every algebraic extension with every prolongation is tame.
- `IsTameField.perfect` (structure): The underlying field is perfect.
- `IsTameField.algebraicExtension` (functoriality): Any algebraic valued extension of a tame field is tame as a field.

Unit tests:

- `tame_field_trivial_valuation` (characterisation): A trivially valued field is tame exactly when it is perfect.
- `tame_field_algClosed` (compatibility): Every valuation of an algebraically closed field is tame.
- `tame_field_Qp` (non-example): Q_p is not a tame field, although it is henselian.

Uses: Temkin Theorem 2.6.6 — Defines the full endpoint, including all algebraic extensions.

Check: A trivially valued field is tame exactly when it is perfect. Every valuation of an algebraically closed field is tame. Q_p is not a tame field, although it is henselian.

Inputs: `LocalFieldsRamificationPartII:GF.2/tame-extension`, `LocalFieldsRamificationPartII:GF.2/purely-wild-extension`.

Sources: temkin17, §2.3.9, p. 106 (Defines tameness by equality of tame and algebraic closures and derives perfection, without building henselianity into the predicate.).

Atlas planet: Tame field.

### Separably tame fields

Target `LocalFieldsRamificationPartII:GF.2/separably-tame-field` (definition).

A valued field K is separably tame if K^s=K^t, equivalently every finite separable extension is tame for every prolongation. This does not assert that K is perfect.

Construction and proof: Use equality in the selected separable closure and test finite subextensions.

API:

- `IsSeparablyTameField.closure_eq` (characterisation): The tame closure is the entire separable closure.
- `IsSeparablyTameField.of_tame` (relation): A tame field is separably tame.
- `IsTameField.iff_perfect_and_separablyTame` (characterisation): Full tameness is perfection together with separable tameness.

Unit tests:

- `separably_tame_trivial` (degenerate): Every trivially valued field is separably tame.
- `separably_tame_imperfect` (non-example): The trivially valued F_p(t) is separably tame and is not tame.
- `separably_tame_Qp` (non-example): Q_p is not separably tame, because it has a separable wildly ramified degree-p extension.

Uses: Temkin Remark 2.4.7 — Provides the endpoint for maximal separable purely wild fields.; PrimeToDegreeAlterations, extraction E6 — Only the separable conclusion is exported for an imperfect separably P-closed field.

Check: Every trivially valued field is separably tame. The trivially valued F_p(t) is separably tame and is not tame. Q_p is not separably tame, because it has a separable wildly ramified degree-p extension.

Inputs: `LocalFieldsRamificationPartII:GF.2/tame-extension`, `LocalFieldsRamificationPartII:GF.2/tame-field`.

Sources: temkin17, §2.3.9, p. 106; Remark 2.4.7, p. 108 (Uses equality of tame and separable closures as the separable counterpart, leaving the original field potentially imperfect.).

### Tower and filtered-union laws

Target `LocalFieldsRamificationPartII:GF.2/tower-laws` (theorem).

For each of the six properties strictly unramified, unramified, tame, henselian extension, totally ramified and purely wild, an algebraic tower M/L/K has the property exactly when both steps do. Each property is preserved under directed unions of subextensions. For a selected prolongation, L^h=LK^h, L^u=LK^u and L^t=LK^t inside a common valued algebraic closure. Unramified and tame extensions are preserved by every valued base change and every selected prolongation on the compositum.

Construction and proof: The first three properties are membership in their maximal closure. For the disjointness properties use the displayed compositum identities and tensor associativity. All finite linear-independence relations occur at finite levels; commute local henselization with filtered colimits for the union statement. For an arbitrary compatible valued base change the residue characteristic is unchanged. A pointed essentially étale algebra remains essentially étale. For tame extensions, pass to the strict henselizations and use their prime-to-p radical description; base change preserves that description. This proves the two base-change laws without asserting degree preservation for arbitrary base changes.

Check: Check each of the six properties separately on identity towers. The compositum formulas must use the chosen prolongations and preserve the two multiplication maps.

Inputs: `LocalFieldsRamificationPartII:GF.2/strictly-unramified-extension`, `LocalFieldsRamificationPartII:GF.2/unramified-extension`, `LocalFieldsRamificationPartII:GF.2/tame-extension`, `LocalFieldsRamificationPartII:GF.2/henselian-disjointness`, `LocalFieldsRamificationPartII:GF.2/totally-ramified-extension`, `LocalFieldsRamificationPartII:GF.2/purely-wild-extension`, `PerfectoidSpaces:P3/henselisation-of-pairs`.

Sources: temkin17, Lemma 2.4.2(i)–(ii) and proof, p. 107 (Proves transitivity in both directions and stability under filtered unions for the six extension classes, together with the closure-compositum formulas.).

### Compatibility with the local-field roadmap

Target `LocalFieldsRamificationPartII:GF.2/local-field-comparison` (comparison).

For finite extensions of nonarchimedean local fields, these definitions agree with LocalFieldsRamification Layers 2–4: unramified iff e=1, totally ramified iff f=1, tame iff p does not divide e, and wild inertia is the same closed subgroup P_K in the absolute Galois group. The arbitrary-rank character pairing restricts to the existing tame inertia character with its arithmetic Frobenius action x↦x^q.

Construction and proof: A local field is henselian, its residue field is perfect, and its finite extensions satisfy [L:K]=ef. Substitute these three supplied facts into the henselian criteria. Compare the action on uniformizer roots with the existing tame character. Keep the arithmetic Frobenius convention from the supplier rather than choosing an opposite generator.

Check: The equality tame iff p∤e is asserted here only for finite local-field extensions; it is not an arbitrary-rank definition.

Inputs: `LocalFieldsRamificationPartII:GF.2/tower-laws`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`.

Sources: temkin17, §2.2.3–2.2.7, p. 104; comparison with the local-field special case (The henselian formulas specialize to the imported local-field ef formulas and tame inertia; this node only proves the compatibility.).

### The tame tower under perfection

Target `LocalFieldsRamificationPartII:GF.2/perfection-tame-tower` (comparison).

Let K have characteristic q>0 and let K^perf be its perfection with the unique prolonged valuation. The canonical equivalence of separable extensions identifies L/K with L K^perf/K^perf, preserves degrees, and preserves unramified and tame extensions after the corresponding henselizations. In a common algebraic closure (K^perf)^t=K^t K^perf. The residue fields and value groups change by purely inseparable extension and q-divisible hull, respectively. In characteristic zero the comparison is the identity. For every prime set P, K is separably P-closed if and only if K^perf is P-closed.

Construction and proof: Use separable/purely-inseparable linear disjointness and Frobenius descent of a finite separable polynomial to identify finite separable extensions and their degrees. Unique valuation prolongation across purely inseparable fields gives the valued correspondence. Henselization commutes with the purely inseparable base change after taking the corresponding fraction fields. Separable residue extensions descend uniquely, and the prime-to-q part of the value quotient is unaffected by adjoining q-power roots. The strict henselian inertia pairing therefore identifies the tame towers. This is a statement about the separable tame theory, not that all algebraic extensions of an imperfect K become tame. A finite separable extension of K^perf descends to a finite purely inseparable level. Apply a sufficiently high Frobenius power to its defining polynomial to descend to K with the same degree; conversely use separable/purely-inseparable disjointness. Since K^perf is perfect, this proves the closedness equivalence for each P.

Check: For F_p(t) with its t-adic valuation the perfection changes Z to Z[1/p]. A prime-to-p radical remains tame of the same degree; an Artin–Schreier extension with pole order one must not be declared tame after perfection.

Inputs: `LocalFieldsRamificationPartII:GF.2/tame-extension`, `LocalFieldsRamificationPartII:GF.2/unramified-extension`, `mathlib:IntermediateField.linearDisjoint_of_isPurelyInseparable_of_isSeparable`, `mathlib:IsPurelyInseparable.finrank_eq_pow`, `tauceti:TauCeti.absoluteGaloisGroupRestrictEquiv`, `LocalFieldsRamificationPartII:GF.0/separably-p-closed`.

Sources: temkin17, §2.4.6, p. 108; proof of Theorem 2.5.5, p. 110; derived comparison for the separable repair E6 (The proof passes through perfection in the splitting argument; the stated comparison expands the required separable/tame invariance using disjointness and the residue/value descriptions.).

## GF.3. Maximal complements and henselian Pank splitting

Zorn gives maximal extensions in each class. The elementary complementary pairs are established before the non-elementary purely wild complement theorem. Keep the full and separable closures distinct, and translate to profinite quotients only under the normality hypotheses that make the quotient exist.

### Maximal extensions with prescribed ramification properties

Target `LocalFieldsRamificationPartII:GF.3/maximal-ramification-extension` (construction).

In a chosen valued algebraic closure, any extension satisfying a specified subset S of the six GF.2 properties is contained in a maximal such extension. Also construct maximal separable S-extensions by restricting to K^s. Maximal means no proper algebraic extension in the same class, and does not specify a canonical subfield.

Construction and proof: Order the admissible intermediate fields by inclusion. The GF.2 directed-union theorem supplies upper bounds for chains; apply Zorn in the fixed algebraic closure. Repeat in the separable closure.

API:

- `MaximalRamificationExtension.exists` (constructor): Every admissible intermediate field has a maximal enlargement.
- `MaximalRamificationExtension.no_further_extension` (characterisation): A maximal field has no nontrivial further extension with all properties in S.
- `MaximalRamificationExtension.separable` (data): The construction within K^s records a maximal separable extension.
- `MaximalRamificationExtension.transport` (functoriality): A valued isomorphism transports maximality; it does not make choices canonical.

Unit tests:

- `maximal_empty_properties` (degenerate): With S empty, the maximal object is the algebraic closure.
- `maximal_tame` (characterisation): With S={tame}, the maximal object is K^t.
- `maximal_wild_not_algebraic_closure` (non-example): For Q_p a maximal purely wild extension cannot contain a nontrivial tame radical of prime-to-p degree.

Uses: Temkin Lemma 2.4.4 and Theorems 2.4.9, 2.5.5 — Choose maximal complements while retaining which extension class was maximized.

Check: With S empty, the maximal object is the algebraic closure. With S={tame}, the maximal object is K^t. For Q_p a maximal purely wild extension cannot contain a nontrivial tame radical of prime-to-p degree.

Inputs: `LocalFieldsRamificationPartII:GF.2/tower-laws`.

Sources: temkin17, Lemma 2.4.2(iii), p. 107; Remark 2.4.7, p. 108 (Uses closure under chains to construct maximal extensions satisfying any prescribed subset of the six properties; the separable version works inside the separable closure.).

Atlas planet: Maximal ramification extension.

### Unramified and tame complements

Target `LocalFieldsRamificationPartII:GF.3/elementary-complements` (theorem).

If K_hu/K is maximal among extensions that are both henselian extensions and unramified, then K^h ⊗_K K_hu ≅ K^u. If K_rt/K is maximal among tame totally ramified extensions, then K^u ⊗_K K_rt ≅ K^t. Both maps are multiplication maps with the chosen factor embeddings.

Construction and proof: The disjointness halves follow from the definitions. For the first compositum equality, maximality forces the residue field of K_hu to be separably closed: otherwise lift a finite separable residue extension to a further henselian unramified extension. For the second equality compare residue fields and value groups. If Γ_(K_rt) is smaller than the prime-to-p divisible hull, adjoin a missing prime-to-p root and contradict maximality.

Check: With trivial valuation the first complement is K^s and the second is K. In each case check tensor injectivity as well as the compositum equality.

Inputs: `LocalFieldsRamificationPartII:GF.3/maximal-ramification-extension`, `LocalFieldsRamificationPartII:GF.0/split-tower`, `LocalFieldsRamificationPartII:GF.2/ramification-tower`, `LocalFieldsRamificationPartII:GF.2/henselian-disjointness`.

Sources: temkin17, Lemma 2.4.4 and proof, pp. 107–108 (Constructs the first two complement pairs by maximality, separably closed residue and prime-to-p divisibility of the value group.).

Atlas planet: Elementary ramification complements.

### Field-theoretic splitting equivalences

Target `LocalFieldsRamificationPartII:GF.3/splitting-equivalences` (theorem).

For a class C of valued fields closed under algebraic extensions, the following assertions, each quantified over K in C, are equivalent: some maximal purely wild K_w splits K^a/K^t/K; every maximal purely wild K_w does; every maximal purely wild K_w is a tame field; and K is tame exactly when it has no nontrivial purely wild extension. There are corresponding separable assertions, replacing K^a by K^s and tame by separably tame. Over henselian K only, the splitting is equivalent to a continuous section Gal(K^t/K)→G_K of the quotient map G_K→Gal(K^t/K). For nonhenselian K use a closed complement to W as a subgroup factorization, without assuming W normal in G_K.

Construction and proof: Every complement implies existence of one. Existence for K with no nontrivial purely wild extension forces that complement to be K, hence K^a=K^t. Conversely a tame field has no nontrivial purely wild extension. Apply that characterization to a maximal purely wild K_w, which admits no further purely wild extension. If K_w is tame, then K^a/(K^t K_w) is both tame and purely wild, hence trivial. The same argument inside K^s gives the separable version. For henselian fields use the Galois correspondence and perfection to translate the splitting to a continuous section. In the nonhenselian case K^t/K can fail to be normal; the printed semidirect-product formulation needs this correction.

Check: For Q with its 2-adic valuation, the S3 splitting field of X^3−X−2 has wild inertia of order 2. This subgroup is not normal in S3, ruling out a general quotient by wild inertia.

Inputs: `LocalFieldsRamificationPartII:GF.3/maximal-ramification-extension`, `LocalFieldsRamificationPartII:GF.0/split-tower`, `LocalFieldsRamificationPartII:GF.2/tower-laws`, `LocalFieldsRamificationPartII:GF.2/tame-field`, `LocalFieldsRamificationPartII:GF.2/separably-tame-field`, `mathlib:IntermediateField.linearDisjoint_of_isPurelyInseparable_of_isSeparable`, `tauceti:TauCeti.absoluteGaloisGroupRestrictEquiv`.

Sources: temkin17, §2.4.6 and Remark 2.4.7, p. 108, with source issue E11 corrected (The field formulations relate complements to tameness of maximal purely wild fields. The group formulation is restricted here to the normal case, correcting E11.).

Atlas planet: Splitting equivalences.

### Pank splitting over a henselian field

Target `LocalFieldsRamificationPartII:GF.3/henselian-pank` (theorem).

Let K be henselian with arbitrary-rank valuation and residual characteristic exponent p. Every maximal purely wild K_w/K gives a multiplication isomorphism K^t ⊗_K K_w ≅ K^a. The separable version gives K^t ⊗_K K_sw ≅ K^s for every maximal separable purely wild K_sw. For p=1 these statements reduce to K^t=K^s and K_w=K^perf.

Construction and proof: For prime p, G1 gives cd_p(G_(κ_K))≤1. A p-Sylow S of G_K/W maps onto a p-Sylow T of G_(κ_K); its kernel lies in the prime-to-p group I/W and is trivial, so S≅T. The existing Sylow comparison of ordinary cohomological dimension gives cd_p(G_K/W)=cd_p(S)=cd_p(T)=cd_p(G_(κ_K))≤1. No finite-generation hypothesis or free-pro-p criterion is needed. Use the general pro-p-kernel lifting theorem on G_K→G_K/W and on the closed subgroup corresponding to any given purely wild subextension. The section yields a complement containing that subextension on the field side, giving the result for every maximal choice. Pass between the separable and full algebraic closures through perfection, which preserves the tame tower. The p=1 case is separate and uses no pro-1 Sylow terminology.

Check: A Schur–Zassenhaus argument alone is insufficient when the residue absolute Galois group has p-quotients. The two additional supplier inputs are listed as gaps and a proposed Profinite Cohomology Part II.

Inputs: `LocalFieldsRamificationPartII:GF.3/splitting-equivalences`, `LocalFieldsRamificationPartII:GF.2/ramification-tower`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-2-profinite-sylow-theory`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-5-presentations-extensions-and-the-rank-interpretations`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`, `LocalFieldsRamificationPartII:GF.2/perfection-tame-tower`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-6-cohomological-dimension-of-pro-p-groups`, `tauceti:TauCeti.IsProPSylow`, `tauceti:TauCeti.exists_isProPSylow`, `tauceti:TauCeti.IsProPSylow.exists_map_conj_eq`, `tauceti:TauCeti.IsProPSylow.eq_of_normal`.

Sources: temkin17, Theorem 2.4.9, p. 109; Kuhlmann–Pank–Roquette Theorems 2.1–2.2, pp. 42–44, Corollary 2.5 and proof of Theorem 2.2, p. 44 (States the henselian splitting of the tame tower by maximal purely wild fields; the original proof identifies the additional cohomological inputs G1 and G2.); kpr86, Theorems 2.1–2.2, pp. 42–44; Corollary 2.5 and proof of Theorem 2.2, p. 44 (Gives the original henselian complement theorem and its group-theoretic proof route.).

Atlas planet: Pank theorem.

## GF.4. Height-one approximation and decompletion

Use rank one exactly where approximation is required. The completion supplies density and root control, while the object being descended is an extension of the henselization. The maximal compatible-pair argument is essential for infinite separable extensions.

### Rank-one norm and root-continuity bridge

Target `LocalFieldsRamificationPartII:GF.4/rank-one-krasner` (theorem).

For a nontrivially valued height-one K, choose an order embedding of its actual value group into positive reals and the associated ultrametric norm. Its completion is henselian, contains K^h, and K is dense in K^h. In a normal algebraic extension of a henselian rank-one normed field the Krasner inequality gives x∈K(y), with x separable, y algebraic, and |x−y| strictly smaller than every distance from x to a distinct conjugate. Roots of a monic separable polynomial vary continuously with its coefficients; sufficiently close monic polynomials of the same degree have their roots uniquely paired beyond the largest conjugate-closeness bound.

Construction and proof: Embed the archimedean ordered value group in the reals, transfer the norm and use Newton approximation in the complete ultrametric field to obtain Hensel lifting. The henselization universal property embeds K^h in the completion, proving density. Extend the rank-one norm to a normal algebraic closure of the henselian field. Uniqueness of valuation prolongations makes all automorphisms isometries. The usual conjugate-separation argument proves the IsKrasner interface even without completeness of the base; the pinned complete-space theorem alone does not provide this generality. For root continuity evaluate f−g at each root, bound its value by the coefficient minimum, and factor the other polynomial into linear terms. If no root were close, the sum of the factor values would contradict that bound. Theorems 14 and 16 give a non-strict root-distance bound at a threshold chosen strictly beyond all conjugate distances; separability and disjoint balls then give uniqueness. To require a strict root-distance bound at a prescribed threshold, first enlarge that threshold.

Check: Strict inequalities are required: for f=(X−1)(X+1) over Q with the 2-adic valuation, taking the conjugate-closeness bound itself does not distinguish the two roots.

Inputs: `mathlib:Valuation.RankOne`, `mathlib:IsKrasner.krasner`, `mathlib:IsKrasner.of_completeSpace_of_normal`, `LocalFieldsRamificationPartII:GF.1/valued-henselization`.

Sources: temkin17, §2.5.1 and Lemma 2.5.2 proof, p. 109 (Uses rank-one density and Krasner separation to descend a finite separable polynomial.); cks23, Theorems 14 and 16 and proofs, author pp. 12–15 (Gives root-distance at least the chosen threshold; uniqueness requires the threshold strictly greater than every conjugate-closeness value. The local proof misprint E12 does not strengthen this conclusion.).

Atlas planet: Krasner approximation.

### Descent from the henselization

Target `LocalFieldsRamificationPartII:GF.4/rank-one-decompletion` (theorem).

If K has height one and L/K^h is separable algebraic, there is an algebraic henselian extension E/K and a compatible valued isomorphism E^h ≅ L with E ⊗_K K^h ≅ L. For finite L/K^h choose E/K finite of the same degree. No claim is made for inseparable L/K^h or arbitrary height.

Construction and proof: At finite degree choose a primitive element of L/K^h and its monic separable minimal polynomial f. Approximate its coefficients by those of g∈K[X]. Root continuity and Krasner give K^h(beta)=L; degree equality forces g irreducible over both K and K^h. Put E=K(beta). Its tensor with K^h is L, so it has unique prolongation. For an infinite separable extension use maximal compatible pairs (E, E^h↪L) under extension. A chain has an upper bound by filtered compatibility. If E^h is not all L, apply the finite argument over E to a proper finite subextension of L/E^h, contradicting maximality. Arbitrary unrelated finite descents cannot simply be unioned.

Check: For L=K^h one may take E=K. At finite degree require [E:K]=[L:K^h]. In the infinite case verify compatibility of the chosen embeddings along every chain.

Inputs: `LocalFieldsRamificationPartII:GF.4/rank-one-krasner`, `LocalFieldsRamificationPartII:GF.2/henselian-disjointness`, `LocalFieldsRamificationPartII:GF.0/split-tower`, `PerfectoidSpaces:P3/henselisation-of-pairs`.

Sources: temkin17, Lemma 2.5.2 and proof, pp. 109–110 (Approximates a finite separable generator over the henselization and extends to infinite algebraic extensions through maximal compatible pairs.).

Atlas planet: Height-one decompletion.

### Maximal separable wildness under henselization

Target `LocalFieldsRamificationPartII:GF.4/maximal-wild-henselization` (comparison).

If K has height one, then E/K is a maximal separable purely wild extension exactly when E/K is a henselian extension and E^h/K^h is maximal separable purely wild.

Construction and proof: A further separable purely wild extension above E remains such after henselization. Conversely descend a finite nontrivial separable purely wild extension above E^h using decompletion over E, and use the henselian-disjointness comparison to retain its degree and pure wildness.

Check: Verify the extension E/K has unique prolongation in the reverse implication. Henselization alone must not turn an arbitrary non-purely-wild E/K into a maximal purely wild extension.

Inputs: `LocalFieldsRamificationPartII:GF.4/rank-one-decompletion`, `LocalFieldsRamificationPartII:GF.2/purely-wild-extension`, `LocalFieldsRamificationPartII:GF.2/henselian-disjointness`.

Sources: temkin17, Corollary 2.5.3 and proof, p. 110 (Transfers maximal separable pure wildness between a height-one field and its henselization, using the preceding descent theorem.).

### Pank splitting in height one

Target `LocalFieldsRamificationPartII:GF.4/rank-one-pank` (theorem).

If K has height one, without a henselian hypothesis, every maximal purely wild K_w satisfies K^t ⊗_K K_w ≅ K^a. Every maximal separable purely wild K_sw satisfies K^t ⊗_K K_sw ≅ K^s.

Construction and proof: If K is perfect, so is K_w. The preceding comparison makes K_w K^h maximal purely wild over K^h, and henselian Pank plus tensor associativity gives the splitting. For imperfect K pass to its perfection, apply the perfect case and the tame-tower comparison, and obtain one complement over K. The corrected field-theoretic splitting equivalences promote existence to every maximal choice.

Check: At residue exponent 1, K^t=K^s and the full complement is K, since K has characteristic zero. For imperfect positive-characteristic K, retain the purely inseparable part of the full complement.

Inputs: `LocalFieldsRamificationPartII:GF.3/henselian-pank`, `LocalFieldsRamificationPartII:GF.4/maximal-wild-henselization`, `LocalFieldsRamificationPartII:GF.3/splitting-equivalences`, `LocalFieldsRamificationPartII:GF.2/perfection-tame-tower`.

Sources: temkin17, Theorem 2.5.5 and proof, p. 110; Remark 2.4.7, p. 108 (Proves the nonhenselian height-one splitting by descent from henselian Pank and by passage through perfection.).

Atlas planet: Height-one Pank theorem.

### Tameness in height one

Target `LocalFieldsRamificationPartII:GF.4/rank-one-p-closed` (theorem).

If K has height one, residual characteristic exponent p, and is p-closed (with p=1 meaning the empty prime set), then K is tame.

Construction and proof: A maximal purely wild extension is a p-extension; p-closedness makes it trivial. Height-one Pank then gives K^t=K^a.

Check: Every residue-characteristic-zero height-one field satisfies the empty-prime closedness hypothesis. Q_p fails the prime-p hypothesis because X^p−p gives a nontrivial p-extension.

Inputs: `LocalFieldsRamificationPartII:GF.4/rank-one-pank`, `LocalFieldsRamificationPartII:GF.0/p-closed`, `LocalFieldsRamificationPartII:GF.2/purely-wild-extension`.

Sources: temkin17, Corollary 2.5.6 and proof, p. 110 (Uses the absence of p-extensions to make a maximal purely wild complement trivial, so the height-one field is tame.).

Atlas planet: Height-one tameness.

## GF.5. Composed valuations and finite height

Use residue pullback for composition and existing Krull dimension for height. The composition criteria remember both coarse and residual ramification. The final residue exponent controls the additional value-group condition even when the coarse residue field has characteristic zero.

### Composition by a residue valuation

Target `LocalFieldsRamificationPartII:GF.5/composed-valuation` (construction).

Let V be a valuation subring of K and R a valuation subring of κ_V. Define V∘R as the inverse image of R under V→κ_V, viewed as a subring of K. It is a valuation ring. Conversely, if U⊆V are valuation subrings of K, U is this pullback of the induced valuation ring on κ_V, and V=U_P for P=U∩m_V. Use the existing ofPrime/idealOfLE inverse laws to identify coarsenings; do not construct a second localization API.

Construction and proof: For x outside V its inverse lies in the maximal ideal of V and thus in the pullback. For a unit of V, use the valuation-ring alternative for its residue. This proves the valuation-ring axiom for the inverse image. For a coarsening V of U, reduce U in κ_V and use the localization inverse laws at P. The associated ordered groups fit into 0→Γ_R→Γ_U→Γ_V→0 with convex kernel, and the final residue field is κ_R.

API:

- `ComposedValuation.mem` (simp): x is integral exactly when x∈V and its residue belongs to R.
- `ComposedValuation.residueEquiv` (equivalence): The final residue field identifies with κ_R.
- `ComposedValuation.valueGroupExact` (structure): Γ_R is the convex kernel of Γ_(V∘R)→Γ_V.
- `ComposedValuation.recover` (compatibility): For U≤V the pullback recovers U and the associated prime is U.idealOfLE V.
- `ComposedValuation.assoc` (functoriality): Three successive residue-valuation pullbacks associate under the canonical residue identifications.

Unit tests:

- `compose_trivial_residue` (degenerate): Taking the trivial valuation on κ_V recovers V.
- `compose_Qp_t` (computation): Compose the t-adic valuation on Q_p((t)) with the p-adic valuation on Q_p. The resulting valuation has lexicographic value group Z×Z, with v(t)=(1,0), v(p)=(0,1).
- `compose_not_product_ring` (non-example): In that example p^(−1) belongs to the coarse ring Q_p[[t]] and not to the composed valuation ring.

Uses: Temkin Lemma 2.6.3 — Separates coarse and residue ramification.; Temkin Theorem 2.6.6 — Provides the induction on height.

Check: Taking the trivial valuation on κ_V recovers V. Compose the t-adic valuation on Q_p((t)) with the p-adic valuation on Q_p. The resulting valuation has lexicographic value group Z×Z, with v(t)=(1,0), v(p)=(0,1). In that example p^(−1) belongs to the coarse ring Q_p[[t]] and not to the composed valuation ring.

Inputs: `mathlib:ValuationSubring`, `mathlib:ValuationSubring.ofPrime`, `mathlib:ValuationSubring.idealOfLE`, `mathlib:ValuationSubring.idealOfLE_ofPrime`, `mathlib:ValuationSubring.ofPrime_idealOfLE`.

Sources: temkin17, §2.6.1, p. 110 (Describes a valuation as a coarsening followed by a valuation on its residue; the construction uses the inverse image of the residue valuation ring.).

Atlas planet: Composed valuation.

### Height and the coarsening chain

Target `LocalFieldsRamificationPartII:GF.5/finite-height-chain` (construction).

Use ringKrullDim(V) as valuation height, without defining a second dimension invariant. If this dimension equals a natural d, construct the ordered chain of the d+1 prime ideals of V. For every 0≤i≤d construct the unique coarsening K_i of height i, and the induced valued residue field κ_i of height d−i. Identify height with the convex-subgroup rank of the ordered value group. Height zero means the trivial valuation.

Construction and proof: Use prime ideals/convex subgroups and their reverse-order coarsening correspondence. For finite height, a chain of dimension d has exactly d+1 primes; localize at the unique prime producing height i.

API:

- `ValuationHeight.prime_chain` (characterisation): Height d is equivalent to Spec(V) consisting of exactly d+1 prime ideals, necessarily totally ordered; the enumeration covers all primes, rather than merely exhibiting a subchain.
- `ValuationHeight.coarsening` (constructor): For i≤d construct the unique height-i coarsening K_i.
- `ValuationHeight.residual` (structure): Its induced residue valuation has height d−i.
- `ValuationHeight.rankOne_compat` (compatibility): Height one for a nontrivial valuation is equivalent to the existence of the Mathlib RankOne structure on its actual value group.

Unit tests:

- `height_trivial` (degenerate): The trivial valuation has height 0.
- `height_discrete` (computation): A nontrivial discrete valuation has height 1, with exactly the zero and maximal prime ideals; exhibiting these two primes alone would not rule out larger height.
- `height_lex` (computation): The composite Q_p((t)) example has height 2 although its coarse t-adic valuation has height 1.

Uses: Temkin Theorem 2.6.6 — The induction uses both smaller heights and finite-height approximation.

Check: The trivial valuation has height 0. A nontrivial discrete valuation has height 1, with exactly the zero and maximal prime ideals; exhibiting these two primes alone would not rule out larger height. The composite Q_p((t)) example has height 2 although its coarse t-adic valuation has height 1.

Inputs: `LocalFieldsRamificationPartII:GF.5/composed-valuation`, `mathlib:ValuationSubring.ofPrime`, `mathlib:ringKrullDim`.

Sources: temkin17, §2.6.1–2.6.2, pp. 110–111 (Uses the totally ordered prime ideals and coarsenings of a valuation ring to split finite height into coarse and residual heights; ringKrullDim supplies the existing dimension invariant.).

Atlas planet: Finite-height coarsenings.

### Abhyankar inequality and the height bound

Target `LocalFieldsRamificationPartII:GF.5/abhyankar-and-rank` (theorem).

For a valued field extension L/K of finite transcendence degree, rr(Γ_L/Γ_K)+trdeg(κ_L/κ_K) ≤ trdeg(L/K), where rr(A)=dim_Q(A⊗_Z Q). For every ordered abelian group of finite rational rank, its convex-subgroup rank is at most that rational rank. Consequently a field of finite transcendence degree over its prime field, and every algebraic extension of it, has finite valuation height. The general inequality is owned here; no analytic topological-transcendence-degree equality is asserted.

Construction and proof: Choose finitely many elements with rationally independent values modulo Γ_K and units with algebraically independent residues over κ_K. In any polynomial relation, collect monomials by value. Rational independence separates value blocks, and residue independence prevents cancellation in a block of least value. Thus all chosen elements are algebraically independent. In a strict finite chain of convex subgroups select one element per successive difference. They are rationally independent: the summand in the highest convex layer cannot be canceled by lower layers. Hence height≤rational rank. A valuation on Q has rank at most one (the p-adic or trivial restriction), and on a finite prime field is trivial. Apply the inequality to finite-transcendence-degree extensions; an algebraic extension has torsion value quotient and algebraic residue extension, so the bound persists.

Check: For K=F_p(t) with t-adic valuation, rational rank 1 plus residue transcendence degree 0 equals trdeg(K/F_p)=1. For a Gauss valuation with t of value 0 the two contributions are 0 and 1 instead.

Inputs: `LocalFieldsRamificationPartII:GF.5/finite-height-chain`, `mathlib:ValuationSubring`.

Sources: kkv16, Kuhlmann–Kuhlmann–Visan, §2 Lemma 2.1, author pp. 6–7, and formula (12), p. 8; Temkin Theorem 2.6.6 proof, p. 112 (The independence argument bounds rational rank plus residue transcendence degree. The convex-chain argument in this node then gives the finite-height consequence needed by Temkin.); kkv16, Lemma 2.1, author pp. 6–7; inequality (12), author p. 8 (Proves algebraic independence of lifts with independent values and residues; this gives the general valuation inequality.).

Atlas planet: Abhyankar inequality.

### Unramifiedness under composition

Target `LocalFieldsRamificationPartII:GF.5/unramified-composition` (theorem).

Let L/K be algebraic, K of finite height d, and 0≤i≤d. Then L/K is unramified exactly when both L_i/K_i and κ_(L_i)/κ_(K_i), with their induced residual valuations, are unramified.

Construction and proof: Reduce to finite extensions by the tower/union laws. From an étale valuation-ring map, localize for the coarse extension and quotient for the residual extension; radical equality follows because the étale quotient is reduced. For the converse use Temkin 2010 Proposition 2.2.2. The composed ring map is torsion-free hence flat; the coarse and residual maximal-ideal equations imply the composed one. At finite height invert one element to obtain the coarsening. Scale coarse generators into the fine ring and add residue generators to obtain finite type. For finite presentation apply the imported flattening-by-blowup theorem over Spec(V), with the generic point as the quasi-compact open: that point is open at finite height and the generic algebra is a finite separable field. Every finitely generated nonzero ideal of a valuation ring is principal, so the admissible blowup is an isomorphism, and its strict transform is the original flat algebra. The imported theorem therefore supplies finite presentation. Flatness, finite presentation and the separable residual fibre give étaleness.

Check: For the composite valuation on Q_p((t)), an unramified constant extension gives both required unramified steps. The extension s^ell=t, ell>1, fails at the coarse step.

Inputs: `LocalFieldsRamificationPartII:GF.5/composed-valuation`, `LocalFieldsRamificationPartII:GF.5/finite-height-chain`, `LocalFieldsRamificationPartII:GF.2/unramified-etale-criterion`, `LocalFieldsRamificationPartII:GF.2/unramified-extension`, `SchemeAndStackFoundations:SF.4/flattening-by-blowup`.

Sources: temkin17, Lemma 2.6.3(i) and proof, p. 111; Temkin 2010 Proposition 2.2.2 and proof, author pp. 11–12 (Proves unramifiedness of a composed extension from the coarse and residual conditions; the auxiliary finite-presentation input is imported from general flattening.); stacks-finiteness, Tag 054A, Lemmas 15.26.3–4 and 15.26.6, accessed 18 October 2026 (Alternative public proof of the valuation-ring finite-type/flat to finite-presentation implication; the general flattening theorem is imported from its owner.); temkin10, Proposition 2.2.2 and proof, author pp. 11–12 (Provides the composed-ring generation and maximal-ideal argument.).

Atlas planet: Unramified composition.

### Tameness under composition

Target `LocalFieldsRamificationPartII:GF.5/tame-composition` (theorem).

Under the preceding finite-height hypotheses let p=exp.char κ_K be the FINAL residue exponent and p_i=exp.char κ_(K_i) the coarse residue exponent. Then L/K is tame exactly when L_i/K_i and the residual valued extension are tame and Γ_(L_i)/Γ_(K_i) has no nonzero p-torsion. The torsion condition is automatic if p_i=p. For p=1 it is vacuous.

Construction and proof: Reduce to finite subextensions and pass compatibly to the maximal unramified extensions using the preceding composition result. Over a strictly henselian field, a tame finite extension is generated by prime-to-p radicals. Their coarse and residual extensions are tame, with no coarse p-torsion. Conversely, if the finite extension over the strict henselization is not tame, its degree is divisible by p. If the coarse extension is tame, its degree is the product of its coarse e and f. Either coarse e has a p-factor or the residual degree has one, which prevents residual tameness. Here p is the residual exponent of the induced residual valuation, not necessarily the characteristic of the coarse residue field.

Check: Take K=Q_p((t)) with the t-adic/p-adic composite valuation and L=Q_p((s)), s^p=t. The coarse extension is tame in residue characteristic zero and the residual extension is the identity on Q_p; the coarse value quotient Z/p violates the extra condition, and the full extension is wild.

Inputs: `LocalFieldsRamificationPartII:GF.5/unramified-composition`, `LocalFieldsRamificationPartII:GF.2/tame-extension`, `LocalFieldsRamificationPartII:GF.2/ramification-tower`.

Sources: temkin17, Lemma 2.6.3(ii) and proof, pp. 111–112, with source issue E4 corrected (Adds the absence of final-residue-prime torsion in the coarse value quotient to the two tame conditions; the final prime corrects the printed proof.).

Atlas planet: Tame composition.

### Tame fields under composition

Target `LocalFieldsRamificationPartII:GF.5/tame-field-composition` (theorem).

For finite-height K and K_i as above, K is tame exactly when K_i and its residually valued κ_i are tame fields and Γ_(K_i) is p-divisible, with p the final residue exponent. If p_i=p, divisibility follows from tameness of K_i and need not be assumed separately.

Construction and proof: Apply tame composition to K^a/K. Its coarse field is an algebraic closure of K_i and its residue is an algebraic closure of κ_i. The absence of p-torsion in the algebraically closed value-group quotient is equivalent to p-divisibility of the original coarse group. If K_i is tame with residual exponent p, its algebraic radical extensions already give this divisibility.

Check: The coarse t-adic field Q_p((t)) is tame in residue characteristic zero, but the composed field cannot be declared tame: its coarse value group Z is not p-divisible and its residual valued Q_p is not tame.

Inputs: `LocalFieldsRamificationPartII:GF.5/tame-composition`, `LocalFieldsRamificationPartII:GF.2/tame-field`.

Sources: temkin17, Corollary 2.6.4 and proof, p. 112 (Applies the preceding extension criterion to an algebraic closure; the torsion condition becomes p-divisibility of the coarse value group.).

Atlas planet: Tame-field composition.

## GF.6. The general tameness theorem and separable export

First prove the finite-height result by induction through the composed-valuation criterion. Descend each finite extension to a relatively algebraically closed subfield of finite transcendence degree to remove the height restriction. Export the separable statement through perfection without asserting that the original field is perfect.

### Residues and values of a p-closed field

Target `LocalFieldsRamificationPartII:GF.6/p-closed-residue-divisibility` (theorem).

Let K be p-closed, p prime, with final residue characteristic p. For every coarsening V_i, the field κ_i is p-closed as an abstract field, and Γ_(K_i) is p-divisible. If exp.char κ_i=1, use characteristic-zero-residue tameness for the coarse field, not an induction hypothesis with the wrong residue prime.

Construction and proof: Every element of K has a p-th root: if X^p−a had no root it would be irreducible for prime p (the binomial irreducibility criterion), giving a forbidden degree-p extension. Thus each coarsened value group is p-divisible. If a coarse residue field has characteristic p, lifting an element to a unit and taking such a root proves that residue field perfect. A finite p-extension of a coarse residue field is therefore separable: the residue field is either of characteristic zero or perfect of characteristic p. Choose its primitive monic irreducible polynomial and lift its coefficients to the coarse valuation ring. A factorization upstairs would have monic integral factors, whose reductions contradict residual irreducibility. Its degree is a p-power, so it defines a forbidden nontrivial finite p-extension of K.

Check: Include the trivial coarsening, whose residue is K itself. For a nontrivial coarsening, identify the final residue prime separately from the characteristic of its intermediate residue field.

Inputs: `LocalFieldsRamificationPartII:GF.0/p-closed`, `LocalFieldsRamificationPartII:GF.0/maximal-p-extension`, `LocalFieldsRamificationPartII:GF.5/composed-valuation`.

Sources: temkin17, Proof of Theorem 2.6.6, p. 112 (The finite-height proof uses p-closedness of the coarsened residue fields and p-divisibility of coarsened values; this node supplies the lifting arguments.).

### Tameness at finite height

Target `LocalFieldsRamificationPartII:GF.6/finite-height-tameness` (theorem).

Every finite-height valued field K of residual characteristic exponent p that is p-closed is tame.

Construction and proof: At height zero, p-closedness gives perfection when needed and the trivial valuation is tame on a perfect field. Height one is GF.4. At height d>1 choose 0<i<d. The coarsening and its residually valued residue field have smaller heights. Their fields are p-closed; apply induction when their residual exponent is p, and use automatic tameness when the coarse residue characteristic is zero. Use p-divisibility of the coarse value group and the tame-field composition criterion.

Check: Verify height zero through perfection, height one through the Pank corollary, and a height-two mixed-characteristic example through the extra coarse p-divisibility condition.

Inputs: `LocalFieldsRamificationPartII:GF.4/rank-one-p-closed`, `LocalFieldsRamificationPartII:GF.5/tame-field-composition`, `LocalFieldsRamificationPartII:GF.6/p-closed-residue-divisibility`, `LocalFieldsRamificationPartII:GF.0/maximal-p-extension`.

Sources: temkin17, Theorem 2.6.6 proof, p. 112; Corollary 2.5.6, p. 110 (Inducts on finite valuation height using height-one tameness and the composed-valuation criterion.).

Atlas planet: Finite-height tameness.

### Finite-height descent inside a p-closed field

Target `LocalFieldsRamificationPartII:GF.6/finite-height-descent` (theorem).

Let K be a p-closed valued field with final residue exponent p, and L/K finite. There is a subfield K_0⊆K, relatively algebraically closed in K, of finite transcendence degree over the prime field, and a finite L_0/K_0 such that multiplication gives L_0⊗_(K_0)K ≅ L with the selected valuation. K_0 is p-closed and has finite height. Although K_0 need not be finitely generated after taking relative algebraic closure, its transcendence degree and valuation-height bound remain finite.

Construction and proof: K is perfect. A finite primitive polynomial for L/K uses finitely many coefficients; adjoin these to the prime field and then take the relative algebraic closure K_0 in K. K_0 is perfect because any purely inseparable root in perfect K is algebraic over K_0. The extension K/K_0 is regular: a relatively algebraically closed perfect subfield is linearly disjoint from every finite algebraic extension. One proof passes to a finite normal closure and uses the Galois correspondence; the purely inseparable part is trivial over perfect K_0. Thus the polynomial still defines L_0 and its multiplication tensor is L. If K_0 had a nontrivial finite p-extension E, regular disjointness would make EK/K a p-extension of the same degree, contradicting p-closedness. Apply the Abhyankar/height bound to K_0.

Check: Include every coefficient of the primitive polynomial before taking relative algebraic closure. Verify regular disjointness preserves its degree; do not assert the relatively closed subfield is finitely generated.

Inputs: `LocalFieldsRamificationPartII:GF.5/abhyankar-and-rank`, `LocalFieldsRamificationPartII:GF.0/maximal-p-extension`, `LocalFieldsRamificationPartII:GF.0/split-tower`, `mathlib:IntermediateField.linearDisjoint_of_isPurelyInseparable_of_isSeparable`.

Sources: temkin17, Theorem 2.6.6 proof, last paragraph, p. 112 (Descends a finite extension to the relative algebraic closure of a field generated by finitely many coefficients; finite transcendence degree, not finite generation, gives finite height.).

Atlas planet: Finite-height descent.

### Tameness of p-closed valued fields

Target `LocalFieldsRamificationPartII:GF.6/general-tameness` (theorem).

Let K be a field with any Krull valuation, including a valuation of infinite height, and let p be its residue characteristic exponent. If K has no nontrivial finite p-extension, then every algebraic valued extension of K is tame: K^a=K^t. When p=1, p-extension means a degree-1 extension, and the conclusion holds for every valued field of residue characteristic zero.

Construction and proof: For each finite L/K descend the selected valuation and its field extension to L_0/K_0 as above. Finite-height tameness makes L_0/K_0 tame; stability of tame extensions under arbitrary valued base change makes L/K tame. Every finite subextension is tame, so the full algebraic closure is tame by the directed-union law. No completeness, perfect residue field, discreteness or henselian hypothesis is used.

Check: With trivial valuation the conclusion reduces to perfection. At residue exponent 1 the hypothesis is automatic. A field such as Q_p must fail the p-closed hypothesis rather than contradict the conclusion.

Inputs: `LocalFieldsRamificationPartII:GF.6/finite-height-tameness`, `LocalFieldsRamificationPartII:GF.6/finite-height-descent`, `LocalFieldsRamificationPartII:GF.2/tame-extension`, `LocalFieldsRamificationPartII:GF.2/tower-laws`.

Sources: temkin17, Theorem 2.6.6 and proof, p. 112 (Combines finite-height induction with regular subfield descent and stability of tameness under valued base change, removing the height restriction.).

Atlas planet: General tameness theorem.

### The separable prime-supported tameness export

Target `LocalFieldsRamificationPartII:GF.6/separable-p-closed-tameness` (application).

For a prime set P, if K has no nontrivial finite separable P-extension, then every finite separable L/K is tame for every prolongation whose final residue characteristic p belongs to P. At residue characteristic zero the same conclusion is automatic. For fully P-closed K the corresponding assertion holds for all algebraic extensions. These are respectively separable P-tameness and P-tameness; neither asserts tameness at residue primes outside P.

Construction and proof: The perfection K^perf is P-closed: finite separable extensions descend by a sufficiently high Frobenius twist, preserving degree, while purely inseparable extensions of the perfect field are trivial. For a valuation with residual prime p∈P, the perfection is p-closed. Apply general tameness there, then descend tameness of finite separable L/K through the perfection comparison. For fully P-closed K apply the p-closed theorem directly. Export this exact statement to the separable field/alteration distillation route. A separably closed imperfect field shows why one must retain the word separable in the first conclusion.

Check: For the imperfect separable closure of F_p(t), the hypothesis holds but t^(1/p) gives a non-tame algebraic extension. The separable conclusion survives.

Inputs: `LocalFieldsRamificationPartII:GF.0/p-closed`, `LocalFieldsRamificationPartII:GF.2/perfection-tame-tower`, `LocalFieldsRamificationPartII:GF.6/general-tameness`, `LocalFieldsRamificationPartII:GF.0/separably-p-closed`.

Sources: temkin17, Lemma 3.2.5, p. 116 for the full assertion; derived separable variant from Theorem 2.6.6 and the perfection comparison, repairing extraction E6 (Lemma 3.2.5 gives the full P-closed export. The separable export is derived here through perfection and applies only to finite separable extensions at the primes in P.).

## Worked acceptance cases

For K=Q_p((t)), compose the t-adic valuation with the p-adic valuation on its residue Q_p. The value group is Z×Z in lexicographic order; t and p have values (1,0) and (0,1). Its height is two. For L=Q_p((s)) with s^p=t, the coarse extension has residue characteristic zero and is tame. The induced residual extension of Q_p is the identity. Nevertheless the coarse value quotient is Z/p, so the composite extension is not tame. This checks the extra p-torsion condition in GF.5 and detects using the coarse residue characteristic in place of the final one. In contrast, for a height-two p-closed field both the coarse value p-divisibility and the residual p-closedness hold, and the finite-height induction applies.

For K=F_p((t)), a root a of a^p−a=t^(−1) has value −1/p in the additive convention. The extension has degree p and ramification index p, so it is purely wild. A prime-to-p radical t^(1/ell) instead gives a tame extension. An immediate Artin–Schreier defect extension over a henselian valued field fails tameness even though e=f=1: the omitted degree factor cannot be recovered by a residue-separability test alone.

For the trivial valuation, K^h=K and K^u=K^t=K^s. Every finite separable extension is unramified and tame, whereas a nontrivial purely inseparable extension is purely wild. Thus a trivially valued field is tame exactly when perfect, and is always separably tame. This checks the separation between the two field predicates and explains the separable export for imperfect separably P-closed fields.

For K=Q with the 7-adic valuation, Q(sqrt(2))/Q has two prolongations, since 2 is a nonzero square modulo 7. Its tensor with K^h has two field factors. Thus choosing one prolongation does not make the extension a henselian extension, and equality of intersection with K^h cannot replace tensor linear disjointness.

## Source correction: the nonhenselian group formulation

Temkin's published §2.4.6(4), p. 108, uses Gal(K^t/K) and a semidirect decomposition for arbitrary valued K. The quotient requires an additional normality hypothesis. The field conditions used in this roadmap have a direct proof and remain meaningful without it.

Take Q with its 2-adic valuation and let N be the splitting field of X³−X−2. Testing the integer roots ±1,±2 proves irreducibility. The discriminant is −104, which is not a rational square, so Gal(N/Q)=S3. The simple root 0 modulo 2 lifts into Q_2. The remaining quadratic factor has discriminant in the square class of −104, whose 2-adic valuation is 3, so it gives a ramified quadratic extension of Q_2. Both decomposition and wild inertia therefore have order two in S3. That subgroup is not normal, so the image of W is not normal in this finite quotient. Consequently W is not normal in the full absolute Galois group, and K^t/K is not Galois.

Use the subgroup factorization W H=G with W∩H=1 in the separable splitting comparison. It is a semidirect product when W is normal, in particular for henselian K. The quotient section has direction Gal(K^t/K)→G_K. The equivalence of the four field conditions is proved by maximality, the tame/wild intersection and the tower-compositum identities; it does not rely on the invalid quotient. The rank-one and general p-closed tameness endpoints use these field conditions.

The packet also retains three previously recorded source corrections: remove the nonexistent part number from the citation of Corollary 2.5.6; use the final residue exponent in Lemma 2.6.3(ii); and supply the separable valued-field input for the geometric distillation repair. The last geometric step belongs to PrimeToDegreeAlterations. The auxiliary reading of Lemma 3.3.7, p. 120 also confirms its previously recorded direction and field-label misprints (E2): the compositum of the conjugates is the Galois closure, whose tameness is the conclusion.

The author-hosted Ćmiel–Kuhlmann–Szewczyk copy has a local sign misprint in the proof of Theorem 16(c), p. 14 (E12): the computed threshold gives a non-strict root-distance bound. For f=X and g=X−2 over Q_2 that bound is attained. The theorem statement on p. 13 is correct. GF.4 chooses a threshold strictly beyond the conjugate distances, which is sufficient for Krasner and unique pairing.

## Proof-closure obligations and interfaces

GF.0 is closed as a target-level plan. GF.1–GF.6 are planned, with precise supplier and proof-closure obligations recorded in the packet. No implementation is asserted. G1 requires the full characteristic-p absolute Galois bound, including arbitrary discrete p-primary coefficients. Its proposed route is Artin–Schreier exactness, additive normal-basis acyclicity, filtered passage and cohomological dévissage. G2 requires continuous sections through arbitrary profinite pro-p kernels, including the relative form needed to enlarge a prescribed purely wild subextension. Its proposed route starts with finite embedding problems and must establish compatible inverse-limit lifting for arbitrary, possibly infinite-rank quotients. These inputs are used only in GF.3; GF.4 and GF.6 inherit them through Pank.

The general finite-presentation input in GF.5 is supplied by SF.4/flattening-by-blowup. To check its use, note that the generic point of a finite-height valuation spectrum is open and quasi-compact, the generic finite separable algebra is finitely presented, and every finitely generated nonzero ideal of a valuation ring is principal. The admissible blowup is therefore the identity; the flat algebra equals its strict transform. This obtains the needed finite presentation without an unread textbook argument. Stacks tag 054A gives an alternative direct graded-algebra proof of the valuation-ring implication.

The alias LocalFieldsPartIIGeneralValuedFields resolves to this roadmap. PrimeToDegreeAlterations should import GF.2 for extension predicates and GF.6/separable-p-closed-tameness for the separable field input. DiamondEtaleCohomology C8 should import GF.5/abhyankar-and-rank and keep its analytic comparison as a separate target. No reverse dependency on either consumer is introduced.

## Sources and attribution

Statements, proofs and examples above are expressed in our own words. The main source is Temkin's published article, with the original henselian Pank argument and publicly readable supporting proofs. The EGA inputs were read in the cleared reference copy. No passage from a source is reproduced.

- **temkin17**: Michael Temkin, *Tame distillation and desingularization by p-alterations*, Annals of Mathematics 186 (2017), 97–126. [Source](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n1-p03-p.pdf). Read: §2, pp. 103–112, statements and proofs; §3.2.1–3.2.6, pp. 115–116; page image of §2.4.6, p. 108; Theorems 3.2.12 and 3.3.6 and their proofs, pp. 118 and 120; Lemma 3.3.7 and proof, p. 120; Theorem 4.2.1 and proof through Step 4, pp. 121–122, for the separable export boundary.
- **kpr86**: Franz-Viktor Kuhlmann, Matthias Pank, Peter Roquette, *Immediate and purely wild extensions of valued fields*, Manuscripta Mathematica 55 (1986), 39–67; scanned author-hosted article. [Source](https://www.fvkuhlmann.de/KPR.pdf). Read: §1 conventions p. 41; Theorems 2.1–2.2, Lemma 2.3 and Proposition 2.4, pp. 42–43; Corollary 2.5 and proof of Theorem 2.2, p. 44; limited Schur–Zassenhaus form p. 45.
- **temkin10**: Michael Temkin, *Stable modification of relative curves*, Journal of Algebraic Geometry 19 (2010), 603–677; author preprint pagination. [Source](https://math.huji.ac.il/~temkin/papers/Stable_Modification.pdf). Read: Proposition 2.2.2 and proof, author pp. 11–12.
- **kkv16**: F.-V. Kuhlmann, K. Kuhlmann, C. Vişan, *Valuations on rational function fields that are invariant under permutation of the variables*, Journal of Algebra 464 (2016), 279–296; author preprint pagination. [Source](https://www.fvkuhlmann.de/symmval.pdf). Read: §2 Lemma 2.1, author pp. 6–7; Abhyankar inequality (12), author p. 8.
- **cks23**: H. Ćmiel, F.-V. Kuhlmann, P. Szewczyk, *Continuity of roots for polynomials over valued fields*, Communications in Algebra 51 (2023), 1383–1412; author preprint pagination. [Source](https://www.fvkuhlmann.de/CoRfinal.pdf). Read: Theorems 14 and 16, Example 15 and proof, author pp. 12–15.
- **stacks**: The Stacks Project Authors, *The Stacks Project: Extensions of valuation rings*, §15.125, tag 0ASF, accessed 2026-10-18. [Source](https://stacks.math.columbia.edu/tag/0ASF). Read: Lemmas 15.125.2–6 and proofs (fundamental inequality, purely inseparable normalization, étale and henselian valuation rings).
- **ega4**: A. Grothendieck, with J. Dieudonné, *Éléments de géométrie algébrique IV, quatrième partie*, Publications Mathématiques de l’IHÉS 32 (1967). [Source](https://www.numdam.org/item/PMIHES_1967__32__5_0/). Read: Lemma 17.7.5(iv), pp. 73–74; Proposition 17.7.7, pp. 74–75; Proposition 18.6.8 and proof, p. 139; Proposition 18.6.14 and proof, pp. 141–142; read in the cleared reference copy, without copying text.
- **aid25**: Cédric Aïd, *A Choice-free look at algebraic extensions of valuations*, arXiv:2511.07177v1, 10 November 2025. [Source](https://arxiv.org/pdf/2511.07177v1). Read: Propositions 2.6–2.7, pp. 4–5; Propositions 3.3 and 3.6 and Theorem 3.7, pp. 5–9; Propositions 4.1–4.3 and Theorem 4.4 with proofs, pp. 10–13.
- **stacks-finiteness**: The Stacks Project Authors, *The Stacks Project: Flatness and finiteness conditions*, §15.26, tag 054A, accessed 18 October 2026. [Source](https://stacks.math.columbia.edu/tag/054A). Read: Lemmas 15.26.2–4 and 15.26.6 with proofs; numbering at access date.
