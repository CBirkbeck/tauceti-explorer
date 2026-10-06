# Habiro rings: relative arithmetic constructions and cohomological coefficients

*Roadmap `HabiroRings`: the complete blueprint, assembled from its six reviewed parts.*

This document is definitive. Its machine form is six part packets, and it is generated from them as their independent reviews left them, so that the two agree node for node:

- `research/blueprint/packets/HabiroRings.json`: stages HR.1–HR.7 with HR.5-number-field-comparison, 50 nodes. Written by BP-HabiroRings, corrected in place and accepted by REV-HabiroRings on 25 September 2026; its coverage and structural notes were brought in line with the accepted restructuring RS-10 by FIX-RT-AREA-etale~2, accepted by REV-FIX-RT-AREA-etale~2 on 30 September 2026, which changed no node. It leaves HR.1, HR.2, HR.3, HR.4 and HR.6 `partial`, and HR.5, HR.5-number-field-comparison and HR.7 `source_decomposed`.
- `research/blueprint/packets/HabiroRings--HR.1.json`: stage HR.1, 17 nodes. Big Witt coalgebras, Wilkerson's comparison and free Λ-rings, which fill the first packet's two HR.1 gaps. Written by BP-HabiroRings--HR.1, corrected in place and accepted by REV-HabiroRings--HR.1 on 6 October 2026.
- `research/blueprint/packets/HabiroRings--HR.2.json`: stage HR.2, 5 nodes. The spherical cyclotomic localization, the spectral Habiro completion and the solid Habiro unit and tensor calculations of Wagner's Lemma B.8. Written by BP-HabiroRings--HR.2, corrected in place and accepted by REV-HabiroRings--HR.2 on 6 October 2026.
- `research/blueprint/packets/HabiroRings--HR.3.json`: stage HR.3, 7 nodes. The finite descent index, the coherent diagram of completed categories, the reconstruction functor and the mapping spaces of prime-edge data. Written by BP-HabiroRings--HR.3, corrected in place and accepted by REV-HabiroRings--HR.3 on 6 October 2026.
- `research/blueprint/packets/HabiroRings--HR.4.json`: stage HR.4, 7 nodes. Marked étale deformations and their completions, which supply the unique complete étale lift that Theorem 2.9 needs. Written by BP-HabiroRings--HR.4, corrected in place and accepted by REV-HabiroRings--HR.4 on 6 October 2026.
- `research/blueprint/packets/HabiroRings--HR.6.json`: stage HR.6, 3 nodes. The order-one fibre of a transported line, the triviality of the completed regulator, and the field scalar square. Written by BP-HabiroRings--HR.6, corrected in place and accepted by REV-HabiroRings--HR.6 on 6 October 2026.

The follow-up packets import the first packet's nodes by id and never restate them; no node id occurs in two packets. The document replaces the six part documents. Each follow-up review corrected its packet and asked that the reader be brought in line at assembly (counts, API items, signs and dependencies), so the node text here is generated from the corrected packets and none of the part documents' node text is reused. The suggested Lean file `research/blueprint/suggested/HabiroRings.lean` joins the six parts' files. It is a naming proposal, not an implementation, and `implementationStatus` is `unchecked` for every node. Pins: Mathlib `082e2d3`, Tau Ceti `f790474`.

## Purpose and scope

This roadmap owns the **relative Habiro ring** of an étale algebra over a perfectly covered Λ-ring, after Ferdinand Wagner's *q-Hodge complexes over the Habiro ring* (§2 and Appendix B) and his companion *q-Witt vectors and q-Hodge complexes* (§2). For a perfectly covered Λ-ring A and an étale A-algebra R, the finite stages

H_{R/A,m}, glued by cyclotomic descent from E_d = (R ⊗_{A,ψ^d} A)[q]^∧_{Φ_d(q)}, d | m,

along the linearised Frobenius isomorphisms of the p-completions, are static rings with H_{R/A,m}/(q^m − 1) ≅ q-W_m(R/A) (Theorem 2.9), and the relative Habiro ring is their limit H_{R/A} = lim_m H_{R/A,m} along the transitions, which deform the q-Witt Frobenii F_{m/d}. It has an equaliser presentation by compatible cyclotomic Taylor series (Lemma 2.12, with its ℓ-adic step repaired), it recovers Habiro's ring for A = R = ℤ (Remark 2.14) and the Habiro ring of a number field of Garoufalidis, Scholze, Wheeler and Zagier for R = O_F[1/disc F] (Corollary 2.13), and it is the Habiro–Hodge complex of R, so that the Habiro cohomology of Spec R is H_{R/A}, concentrated in degree zero (Corollary 3.13). The roadmap builds the foundations this needs that no other roadmap owns: Λ-rings and perfect covering, the local Frobenius of an étale algebra, Habiro-complete objects of the derived category, finite cyclotomic descent, and, as interim owner until the q-Witt roadmap is installed, big Witt vectors and the degree-zero q-Witt rings. It is independent of algebraic K-theory: K₃ enters only through the modules HabiroNumberFields HB.7 constructs, in HR.6.

- **HR.1, relative bases and local Frobenius.**
  - Λ-rings in torsion-free Adams form: ψ^1 = id, ψ^{mn} = ψ^m ∘ ψ^n and the Frobenius congruence ψ^p(x) ≡ x^p mod p, with the δ-structures of PrismaticCohomology PR.0; perfect Λ-rings, the colimit perfection, and perfect covering in three equivalent descriptions, with the toric examples and the non-example ℤ[x, y]/(xy).
  - Étale pairs (A, R); the relative Frobenius of an étale algebra in characteristic p; the unique Frobenius lift φ_p on R̂_p and the linearised Frobenius (R̂_p ⊗_{A,ψ^p} A)^∧_p ≅ R̂_p, natural, compatible with base change and with prime-power iterates.
  - The big Witt comonad (Dwork's criterion, universal Frobenius polynomials, the Witt-ring Frobenius congruence), Λ-rings as big Witt coalgebras and Wilkerson's comparison with the Adams form on torsion-free rings, the cofree adjunction, exterior operations, and the free Λ-rings L(I), with their universal property, local presentations of ψ^p and faithful flatness: free Λ-rings are perfectly covered.
- **HR.2, Habiro-complete modules and derived detection.**
  - Habiro-complete objects of D(A[q^{±1}]), the Habiro completion as the left adjoint of the inclusion, the two-term resolution of the localisation inverting all q^m − 1, completeness along the factorial tower and on homotopy groups, derived Nakayama, the detection of vanishing, degree bounds and staticity by cyclotomic reductions (Corollary B.4), and the completed tensor product.
  - The spherical versions: the cyclotomic localization of S[q^{±1}] and the spectral Habiro completion with its unit S_H.
  - **HR.2:solid**, a proposed sub-layer: Habiro-complete solid spectra (B.6–B.7), the bounded-below solid comparison (Lemma B.8), the solid idempotence of the Habiro unit, completed countable free solid modules and their tensor products. It rests on light solid spectra, which nothing in the atlas supplies yet (gap G-solid).
- **HR.3, finite cyclotomic arithmetic descent.** The divisor poset and its cyclotomic intersections, Wagner's general descent principle (Lemma 2.2), the cyclotomic descent equivalence at the level of categories and of morphisms, Corollary 2.4 and the fracture pieces of Remark 2.5; then the finite descent index of singletons and maximal prime-power chains, the coherent diagram of completed categories, the verification of the descent hypotheses, the reconstruction functor and the mapping spaces of prime-edge data.
- **HR.4, relative q-Witt rings and finite étale lifts.** Truncated big Witt vectors, q-Witt vectors and relative q-Witt rings with their Frobenius, Verschiebung and ghost maps; the theorem that restriction maps do not extend; étale base change and ghost pushouts; the finite stages H_{R/A,m}, Theorem 2.9, the Frobenius transitions of Remark 2.10 and the staticity of their limit; and marked étale deformations with their completions, which give the unique complete principal étale lift and the coherent ghost comparison Theorem 2.9 uses.
- **HR.5, the relative Habiro ring and its Taylor presentation.** The limit H_{R/A}, compatible roots and the canonical and Frobenius re-expansion maps over the full cyclotomic coefficient algebra, the ℓ-adic Taylor comparison that replaces the false irreducibility line of Lemma 2.12's proof, the equaliser presentation, the untwisted cases and completed base change.
- **HR.5-number-field-comparison.** Habiro's ring as H_{ℤ/ℤ}, the étaleness of O_F[1/Δ], and Corollary 2.13 against HabiroNumberFields HB.6's ring.
- **HR.6, coefficient and cohomology interfaces.** The degree-zero identification with Habiro cohomology (Corollary 3.13), completed scalar extension, the K₃-indexed lines of HB.7 transported to H_{R/ℤ}, the (q − 1)-completion and its kernel, and the triviality of the regulator classes after (q − 1)-completion, proved through the order-one fibre conditionally on HB.7's effective descent.
- **HR.7, acceptance tests.** Φ_5 over 𝔽_11, inverting a prime, the failure of constant families to glue over ℤ[∛2][1/6], and the difference between the stages and the naive completions.

The blueprint has 89 nodes: 50 in the first packet and 17, 5, 7, 7 and 3 in the follow-up packets for HR.1, HR.2, HR.3, HR.4 and HR.6. Every layer is planned:

- HR.5, HR.5-number-field-comparison and HR.7 are `source_decomposed` in the first packet.
- HR.1, HR.2, HR.3, HR.4 and HR.6 are `planned` by their follow-up packets. None is `closed`: each still names supplier refinements or records gaps, listed under Gaps and Requests.
- The first packet's coverage records for those five layers still read `partial`, with the gaps the follow-ups answer; the layer sections say which remain.

**What is not here.**

- The classical cyclotomic completions, their factorial expansions, Taylor maps and rigidity: HabiroCyclotomicCompletions HC.1–HC.5.
- Generic derived completion, the enhanced derived and ∞-categorical machinery, spectra and their smash products: DerivedDeRhamCohomology DD.1, EnhancedDerivedSheaves E0–E5 and StableHomotopyKTheory H.5–H.6.
- The positive-degree q-de Rham–Witt complex, q-Hodge filtrations and the Habiro cohomology functor: HabiroCohomologyFoundations HQ.1–HQ.8.
- The explicit Frobenius-glued Habiro ring of a number field, finite regulators and the K₃-indexed modules: HabiroNumberFields HB.6–HB.7. No K₃ group is constructed here.
- Light solid spectra in general: the draft roadmap SolidAnalyticRings SA.1 is their designated owner (see Boundaries).
- The early Taylor-glued ring H^Tay_{R/A} that RS-10 adds to HR.1: not planned by any packet yet (see Boundaries).

## Boundaries

The roadmap's ownership follows the restructuring proposal RS-10, which REV-RS-10~2 accepted on 29 September 2026. RS-10 is accepted but not installed: its new roadmaps QWittVectors and SolidAnalyticRings are drafts with no stages in the atlas. Until they are installed, the packets keep the current suppliers, and this roadmap holds some of their mathematics as interim owner.

**Suppliers.** These are the prerequisites of the nodes below that lie outside the roadmap.

- **The pinned libraries.**
  - Mathlib supplies étale, formally étale, smooth and unramified algebras with the adic lifting lemmas, adic completion, faithful flatness, localisation, polynomial expansion, cyclotomic polynomials and their separability, p-typical Witt vectors, the p-adic integers, number fields with their discriminants, power series, Picard groups, Nakayama's lemma and the equaliser of commutative rings.
  - Tau Ceti supplies the exact cyclotomic integers and their conjugate-residue maps, used in the Φ_5 test.
  - The declarations are listed under "What the pinned libraries have". Neither library has Λ-rings, big Witt vectors, q-Witt vectors or anything named Habiro (library audit AUDIT-17: every layer not built, HR.7 a process layer).
- **PrismaticCohomology PR.0.** δ-rings and their equivalence with Frobenius lifts on p-torsion-free rings: the stage, cited by `HR.1/lambda-rings-with-commuting-adams-operations` and `HR.1/the-etale-frobenius-lift`, and the node `PR.0/torsionfree-frobenius-equivalence`, cited by `HR.1/adams-to-witt-section` and `HR.1/wilkerson-comparison`.
- **HabiroCyclotomicCompletions HC.1, HC.3, HC.4, HC.5.** The factorial polynomials, their cofinality, the completion and its topology (HC.1); p-adic closeness, the p-adic re-expansion and the Taylor maps (HC.3); cyclotomic comaximality, the congruence Φ_{p^e n} ≡ Φ_n^d mod p and rootwise Taylor injectivity (HC.4); the decomposition after inverting a prime (HC.5). All are cited by node id except two stage citations of HC.1 and HC.5 beside their nodes.
- **DerivedDeRhamCohomology DD.1.** Generic derived completion at finitely generated ideals, derived Nakayama, the bounded-torsion comparison with classical completion, and regular quotient towers: a stage, cited by sixteen nodes, with requests from the first packet and from the HR.1, HR.2, HR.3 and HR.4 parts.
- **EnhancedDerivedSheaves E0, E1, E3, E5.** Limits, slices and straightening (E0), the enhanced derived category with its tensor product (E1), accessible localisations, adjoints and Kan extensions (E3), symmetric monoidal ∞-categories, algebra and module objects, presentability and the spectral comparison (E5). Cited by stage and by nine node ids; the HR.3 part's requests state exactly which finite-diagram statements are still missing.
- **StableHomotopyKTheory H.5 and H.6.** Spectra, smash products and S[ℤ] (H.5), cofibres, derived limits with lim¹ and completion of spectra (H.6), for the spectral nodes of HR.2.
- **VStackSheavesAndLisseCategories VS2.** Solid abelian groups and their derived tensor product, for the ℤ-relative part of HR.2:solid only. VS2 does not supply light solid spectra.
- **QSeriesPartitionsAndMockModularForms QM.0.** The node `QM.0/q-binomial-coefficient`, for P_aP_b | P_{a+b} in the countable solid tensor calculation.
- **HabiroCohomologyFoundations HQ.3, HQ.4, HQ.5.** The Habiro–Hodge complex, Habiro descent, q-Hodge filtrations and their multiplicative upgrade (HQ.3), the étale base change of q-de Rham–Witt complexes and the derived-to-underived comparison of Corollary 3.31 (HQ.4), and algebraic Habiro cohomology of a scheme (HQ.5), all for `HR.6/the-degree-zero-identification` only. For Corollary 3.31 the first packet cites `HQ.4/hodge-against-nygaard`, the Nygaard pullback lemma used inside that proof; the HR.6 part corrects the supplier to `HQ.4/derived-q-de-rham-witt-forms-of-smooth-algebras` (see that node). This is a late return edge: HR.1–HR.5 precede HQ.3–HQ.5, and HR.6 consumes them.
- **HabiroNumberFields HB.6 and HB.7.** GSWZ's ring with its Frobenius and gluing condition and its comparison with Habiro's ring (HB.6), for Corollary 2.13; the K₃-indexed invertible modules, their operations, order-one sections, effective descent, field pullback and Picard character (HB.7), for HR.6.

**Consumers.** These come from the atlas stage links, the RS-10 links, and the nodes of other packets that cite this roadmap's node ids.

- **HabiroCohomologyFoundations** is the main consumer. The atlas links HR.2 → HQ.3 and HR.4 → HQ.4; RS-10 adds links from HR.1, HR.3 and HR.5 to the layers HQ.1–HQ.8 and HQ.5-trace. At node level its packets cite `HR.1/lambda-rings-with-commuting-adams-operations`, `HR.1/perfectly-covered`, `HR.2/habiro-complete-modules`, `HR.2/completeness-via-the-factorial-tower`, `HR.2/the-detection-results`, `HR.2/the-monoidal-structure`, `HR.2/the-solid-comparison-is-bounded-below`, `HR.3/the-complete-descent-corollary`, `HR.4/relative-q-witt-rings`, `HR.4/the-etale-lift`, `HR.4/there-is-no-restriction-map`, `HR.5/the-relative-habiro-ring`, `HR.5/the-equaliser-presentation` and `HR.5-number-field-comparison/the-number-field-ring`, and its HQ.1 packet files five requests with this roadmap (see Requests).
- **HabiroCyclotomicCompletions.** `HC.5/ordinary-versus-derived-completion` cites `HR.2/habiro-complete-modules`; RS-10 records HR.2 → HC.5 and HR.2 → HC.6 for that comparison only.
- **HabiroNumberFields.** `HB.6/coefficient-rings-and-frobenius` cites `HR.1/the-etale-frobenius-lift`, and `HB.6/prime-to-p-taylor-equivalence` cites `HR.5/the-ell-adic-taylor-comparison`. RS-10 links HR.1 to HB.6, HB.7 and KU-habiroring.
- **HabiroNahmSeries.** HB.9 cites `HR.1/the-etale-frobenius-lift`; HB.10 cites `HR.5/the-equaliser-presentation`, `HR.5-number-field-comparison/the-number-field-ring`, `HR.6/the-degree-zero-identification`, `HR.6/completed-scalar-extension`, `HR.6/the-transported-regulator` and `HR.6/the-regulator-dies-after-q-minus-one-completion`.
- **RefinedTraceMethods.** The atlas links HR.5-number-field-comparison → RT.4:Habiro-comparison, the π_0 comparison with the GSWZ ring.
- **KTheoryFiniteLocalFields.** `L.5/relative-k-of-truncated-polynomial-over-perfect-field` cites `HR.4/truncated-big-witt-vectors`.

**Owners.** RS-10 gives each piece of mathematics that more than one roadmap planned exactly one owner. The rows that concern this roadmap:

| Mathematics | Owner | Formerly also planned in |
|---|---|---|
| Ordinary cyclotomic completion and cofinal indexing | HabiroCyclotomicCompletions HC.1 | HabiroNumberFields HB.6, HR.2, HR.3, HR.5 |
| Normalised factorial expansions and ordinary invertibility of q | HabiroCyclotomicCompletions HC.2 | ArithmeticQuantumTopology QT.2, HR.2 |
| Root evaluations, Taylor maps and convergent p-adic re-expansion | HabiroCyclotomicCompletions HC.3 | ArithmeticQuantumTopology QT.4, HabiroNumberFields HB.6, HR.5 |
| Cyclotomic prime adjacency and classical rigidity | HabiroCyclotomicCompletions HC.4 | ArithmeticQuantumTopology QT.4, HR.3 |
| Derived Habiro completion and its correction to the ordinary module completion | **HR.2** | HabiroCyclotomicCompletions HC.5 |
| Λ-rings, Adams operations and perfectly covered bases | QWittVectors QW.1 (held by **HR.1** until QWittVectors is installed) | HR.1, HabiroCohomologyFoundations HQ.1 |
| Étale p-completed Frobenius lifts and the early twisted Taylor ring | **HR.1** | HabiroNumberFields HB.6, HR.5, HabiroCohomologyFoundations HQ.1 |
| Derived cyclotomic descent before its q-Hodge application | **HR.3** | HabiroCohomologyFoundations HQ.4 |
| Absolute q-Witt rings, degree-zero ghost maps and the restriction obstruction | QWittVectors QW.2 (held by **HR.4**) | HR.4, HabiroCohomologyFoundations HQ.4 |
| Relative q-Witt rings over Λ-bases | QWittVectors QW.3 (held by **HR.4**) | HR.4 |
| Étale q-Witt base change and comparisons | QWittVectors QW.4 (held by **HR.4**) | HR.4 |
| Number-field K₃-indexed Habiro modules | HabiroNumberFields HB.7 | HR.6 |

Under RS-10, as the first packet's and the HR.4 part's ownership records apply it, QWittVectors QW.0 becomes the permanent owner of big Witt vectors on truncation sets (held by HR.4 in `HR.4/truncated-big-witt-vectors`, which the HR.1 part uses) and QW.1 of the big Witt coalgebra comparison the HR.1 part plans. RS-10's HR.2 entry makes SolidAnalyticRings SA.1 the owner of the light solid spectra that Wagner's B.6–B.8 use, with HR.2 keeping them, planned only as far as those statements need, until SA.1 is installed. When those roadmaps are installed, the nodes move with their consumers in one step; no parallel node is created meanwhile.

**Reconciliation notes.**

- **The early Taylor ring.** RS-10 narrows HR.1 to the étale Frobenius lifts and adds "the early Taylor-glued ring H^Tay_(R/A) for polynomial/toric Lambda bases and etale R, its ring/functor/H_Z-algebra API, as specified by PLAN-HABIRO §6.2", which HB.6, HQ.1 and HR.5 are to import. No packet plans it: the HR.1 part records it as a separate obligation (its `ownership.futureScope`), and the atlas stage text of HR.1 does not yet contain it. The equaliser presentation `HR.5/the-equaliser-presentation` plans the same object for perfectly covered A as a theorem about H_{R/A}; the early ring is its definition-first form, to be planned in HR.1 when RS-10 is installed, with HR.5 proving the comparison.
- **Light solid spectra.** The first packet and the HR.2 part both leave light solid spectra without a supplier (gap G-solid). The HR.2 part proposes a new roadmap, "Artin v-stacks, solid and lisse coefficient categories, Part II: light solid spectra". RS-10 instead names SolidAnalyticRings SA.1, whose draft stage text already covers solid abelian groups and solid spectra with Wagner B.6–B.8 among its sources. One owner is enough: the recommendation is SA.1, with HR.2:solid importing it, so that no second Part II is designed.
- **Big Witt vectors.** `HR.4/truncated-big-witt-vectors` plans W_S for arbitrary truncation sets as the interim owner. The HR.1 part uses it at the full truncation set, which makes HR.1 depend on a node of HR.4 (see Dependencies). Both move to QW.0 and QW.1 together.

## Conventions

The six parts wrote the same objects in slightly different notations. The prose of every node below uses the forms listed here: q-W_m for the q-Witt rings, which the parts wrote both q-W_m and qW_m (Wagner's q𝕎_m); ℤ, ℚ and 𝔽_ℓ where Z, Q and F_ℓ denote number systems, as in ℤ[1/p], H_{R/ℤ}, ⊗_ℤ, ℤ_ℓ and 𝔽_11; and → for ASCII arrows. Lean names, code spans, API and test names, locators and the literal source excerpts keep their own form. A letter is converted only where its meaning is unambiguous: Z still names a closed subset in Wagner's descent principle (`HR.3/the-general-descent-principle`), Q a complete object or the poset Q(m) in the HR.2 and HR.3 parts, and F_p the Frobenius of Witt vectors in the HR.1 part.

- **Rings and Λ-rings.** Rings are commutative and unital. A Λ-ring is the arithmetic λ-ring, never an Iwasawa algebra. HR.1 takes it in torsion-free Adams form: a torsion-free ring A with ring endomorphisms ψ^m, m ≥ 1, such that ψ^1 = id, ψ^{mn} = ψ^m ∘ ψ^n and ψ^p(x) ≡ x^p mod pA for every prime p (not ψ^p ≡ id mod p, which the toric ℤ[x] violates). The sources' form is a big Witt coalgebra s : A → W(A) with ψ^m = gh_m ∘ s; the HR.1 part defines it for all rings (`HR.1/lambda-coalgebra`) and proves the two forms equivalent on torsion-free rings (`HR.1/wilkerson-comparison`). In the Lean file `Adams A` is `LambdaRing A`.
- **Perfect covering.** A Λ-ring is perfect when every ψ^p is bijective, and perfectly covered when it admits a faithfully flat Λ-map to a perfect Λ-ring; equivalently every ψ^m is faithfully flat, or A → A_∞, the colimit perfection, is faithfully flat. It is a hypothesis, never automatic.
- **Pairs.** An étale pair (A, R) is a perfectly covered Λ-ring A with an étale A-algebra R: finitely presented and formally étale (Mathlib's `Algebra.Etale`), not necessarily finite. R carries no Adams operations. R ⊗_{A,ψ^m} A is the Frobenius twist, with A acting on the right factor through ψ^m. R̂_p is the classical p-adic completion; all rings involved are p-torsion free, so it is also the derived one.
- **Big Witt vectors.** A truncation set S is a set of positive integers closed under divisors. W_S(R) has underlying set R^S and ghost maps gh_n(x) = Σ_{d|n} d·x_d^{n/d}. W_m(R) is W_S(R) for S = T_m, the divisors of m, and W(R) is the full big Witt ring. For d | m there are the Frobenius F_{m/d} : W_m → W_d, the Verschiebung V_{m/d} : W_d → W_m, the restriction Res_{m/d} : W_m → W_d and the Teichmüller lift τ. The HR.1 part works on the full W(A) with the Frobenius F_m : W(A) → W(A), Witt coordinates c_n, and exterior operations λ^n defined through the generating series with −t, so that λ^3 = c_3 − c_1c_2.
- **q-Witt rings.** q-W_m(R) is the initial q-FV-system, the quotient W_m(R)[q]/I_m of q-Witt Lemma 2.9; q-W_m(R/A) is the relative version over a Λ-ring A (q-Witt Definition 2.40, Lemma 2.41). Their transition maps are the Frobenii F_{m/d}: restriction maps do not extend (`HR.4/there-is-no-restriction-map`), and no interface names one.
- **Derived conventions.** Categories of modules are the derived ∞-categories, quotients M/f are derived quotients (cofibres of multiplication by f), limits are derived limits with their lim¹ terms, and "static" means homotopy concentrated in degree zero.
- **Habiro completion.** Rr = ℤ[q^{±1}, (q^m − 1)^{−1} : m ≥ 1]. An object M of D(A[q^{±1}]) is Habiro-complete when RHom_{ℤ[q^{±1}]}(Rr, M) = 0, and its Habiro completion is M^∧_H = lim_m M^∧_{(q^m − 1)} over the positive integers ordered by divisibility. Completion is not inverting the q^m − 1. P_n = (q; q)_n = ∏_{i=1}^n (1 − q^i), with P_0 = 1; it is monic up to the sign (−1)^n, and monic division uses (−1)^n P_n.
- **Cyclotomic descent.** T(m) is the set of divisors of m, I_S = (Φ_d(q) : d ∈ S) ⊆ A[q] and D̂_S the derived I_S-complete objects. For p prime and p ∤ d, T_{d,p} = {d, pd, …, p^{v_p(m)} d} (the HR.3 part's C(m, d, p)). P(m) is the poset of the singletons {d} and the chains T_{d,p} with at least two elements; Q(m) is the poset of all non-empty subsets of T(m).
- **The relative Habiro ring.** E_d = (R ⊗_{A,ψ^d} A)[q]^∧_{Φ_d(q)}; h_d : (E_{pd})^∧_p ≃ (E_d)^∧_p is induced by the linearised Frobenius; H_{R/A,m} is the gluing of Corollary 2.4, with transitions t_{m,d} : H_{R/A,m} → H_{R/A,d} for d | m, and H_{R/A} = lim_m H_{R/A,m}. In the Lean file these are `RelHabiroStage` and `HabiroRings.relativeHabiro`.
- **Roots and Taylor coordinates.** (ζ_m) is a compatible system of roots of unity: ζ_{mn} = ζ_mζ_n for coprime m, n and ζ_{p^α} = ζ_{p^{α+1}}^p. The coefficient algebra at m is the full tensor product (R ⊗_{A,ψ^m} A) ⊗_ℤ ℤ[ζ_m], never a quotient through one embedding of ζ_m. can and φ/A are the canonical and Frobenius maps of the equaliser presentation.
- **Number fields.** F is a number field with ring of integers O_F and discriminant disc F; Δ is an integer divisible by disc F, and by 6·disc F wherever K₃ enters. H_R is GSWZ's ring for R = O_F[1/Δ], constructed in HabiroNumberFields HB.6, and κ : H_{R/ℤ} ≅ H_R is Corollary 2.13. For ξ ∈ K₃(F), H_{R,ξ} is HB.7's invertible module and M_ξ = κ^*H_{R,ξ}; c : H_{R/ℤ} → R[[X]], X = q − 1, is the (q − 1)-completion.
- **The spherical nodes.** In the HR.2 part, R denotes the spherical group ring S[q^{±1}] = S[ℤ], not an étale algebra; T is its cyclotomic localization, L_H the spectral Habiro completion and S_H = L_H(R). Sp■ is the ∞-category of light solid spectra and ⊗■ its tensor product.
- **Numbering.** Wagner's *q-Hodge complexes over the Habiro ring* is cited by its arXiv v2 numbering (one counter per section, appendix sections lettered), and *q-Witt vectors and q-Hodge complexes* by its arXiv v5 numbering, which the q-Hodge paper and the stage texts use; v4's numbering differs (v4's Corollary 2.51 and Lemma 2.45 are v5's Corollary 2.52 and Lemma 2.46). Locators give the statement number and the page; the first packet gives PDF pages, the HR.4 part printed pages. Hesselholt's *The big de Rham–Witt complex* is cited by its published numbering, which arXiv v3 shares.
- **Identifiers.** Node ids are `HabiroRings:<layer>/<slug>`; below they are written without the roadmap prefix. The follow-up packets' nodes keep their layer in their ids; HR.2:solid is a display sub-layer only. Each node's **Library** line gives the module and namespace its packet proposes. The suggested Lean file puts every declaration in the one namespace `TauCeti.Habiro`, including those of the HR.1 and HR.6 parts, whose packets propose `HabiroHR1` (a working namespace the HR.1 part asked the assembly to replace) and `TauCeti.HabiroCoefficients`; the relative names are those of the packets.

## Sources

Every statement below is taken from these sources, at the versions recorded. The parts gave the same document different source ids, and each node keeps the id its packet uses; this list gives every alias, the files each part read with their hashes, and the sections each part read. Excerpts are quoted literally, from the PDF text layer or the TeX, with displayed formulas checked on the rendered pages. The primary sources are Wagner's two papers; Hesselholt and Borger supply the big Witt theory of the HR.1 part, Lurie the ∞-categorical inputs of HR.2 and HR.3, the Stacks Project the étale deformation theory of the HR.4 part, and GSWZ the number-field rings of HR.6.

- **Ferdinand Wagner, *q-Hodge complexes over the Habiro ring*.** arXiv:2510.04782v2 (8 October 2025), the current version; the author copy dated 14 January 2026 was also read.
  - Source ids: `Wagner.qHodgeHabiro.2025` (first packet, HR.3 packet, HR.4 packet); `Q` (HR.1 packet); `Wagner.HR2.v2` (HR.2 packet); `Wagner.v2` (HR.6 packet); `Wagner.author.2026` (HR.6 packet).
  - `Wagner.qHodgeHabiro.2025`: arXiv:2510.04782v2 (8 October 2025), the current version: LaTeX e-print (the hash recorded) and PDF (SHA-256 591d0bdf…, 82 pp.). Statements are numbered by one counter per section, shared by the numbered paragraphs and the theorem environments, with lettered appendix sections; locators give the statement number and the PDF page, and excerpts are copied from the PDF text layer or the TeX with the mathematics as printed. <https://arxiv.org/abs/2510.04782>, SHA-256 `9c338455871808eb2265681199279607b4b179b3973752d48eca3f711bc25b47`, accessed 2026-09-25.
  - `Wagner.qHodgeHabiro.2025`: arXiv:2510.04782v2, 8 October 2025, 82-page PDF <https://arxiv.org/pdf/2510.04782v2>, SHA-256 `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b`, accessed 2026-10-05.
  - `Wagner.author.2026`: Author-hosted PDF dated 14 January 2026, exact bytes fetched 6 October 2026 <https://ferdinand-wagner.github.io/papers/q-Habiro.pdf>, SHA-256 `7c6b0e3106da456baad6c6f416714d6141d7b39e1107affc9d8a5be99bb92075`, accessed 2026-10-06.
  - Read by the first packet (`Wagner.qHodgeHabiro.2025`): 1.22(e) Perfectly covered Λ-rings (PDF p.12), from the live TeX, not the commented-out §1.1 draft the packet quoted ('many', not 'all', examples of interest). 2.1–2.2 (PDF pp.13–14): the setup with condition (c) and the Lurie input HA 2.2.1.9. 2.7–2.9 and the end of the proof of Theorem 2.9 (PDF pp.15–17): the Frobenius lift, the linearised Frobenius, Remark 2.8, and the use of Corollary B.4 for staticity. Theorem 3.11(a) (PDF p.25): Habiro-complete objects over A[q]. Theorem A.1, final paragraph (PDF p.69): base change along maps of Λ-rings. Appendix B in full, B.1–B.8 with proofs (PDF pp.77–80). §2.1 (PDF pp. 13–15): Setup 2.1, Lemma 2.2 with its proof sketch, Remark 2.3, Corollary 2.4 with its proof, Remarks 2.5 and 2.6, read in full. §2.2 (PDF pp. 15–17): 2.7 with footnote (2.1), Remark 2.8, Theorem 2.9 with its proof and Remark 2.10, read in full; Appendix B (PDF pp. 77–78): Lemmas B.2 and B.3 and Corollary B.4, as Theorem 2.9 uses them. Excerpts are copied from the PDF text layer with its glyphs restored (q-W for the q-Witt symbol, arrows, sub- and superscripts); displays were checked on the rendered pages. REV-HabiroRings (C3), PDF of arXiv v2 (SHA-256 591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b) with its text layer, and the TeX: §1.1 Question 1.1 (p. 3); 1.4 (p. 4); 1.14 (p. 8); 1.22(d)–(e) (pp. 11–12). §2.1 Corollary 2.4 (p. 14) and Remark 2.5 (p. 15); §2.2, 2.7–2.14 in full, statements and proofs (PDF pp. 15–19). §3.2, Theorem 3.11, Example 3.12 and Corollary 3.13 with its proof (PDF pp. 25–27); §4.1 opening and Theorem 4.11 (pp. 53, 58). Appendix B, B.1–B.8 statements and the proofs of B.2–B.4 (PDF pp. 77–79). the author copy https://guests.mpim-bonn.mpg.de/ferdinand/q-Habiro.pdf (dated 8 Oct 2025, SHA-256 bfa3dfb59d0d11202ccf5336c36a491ad89ba8fad51d70391027370125fa4304) has the same text at every locator cited here.
  - Read by the HR.3 packet (`Wagner.qHodgeHabiro.2025`): 1.22(c)–(d), pp. 11–12: derived quotients, completion and fracture conventions. 2.1–2.6, pp. 13–15: setup, proof sketch of Lemma 2.2, complete proof of Corollary 2.4, fracture description and derived-commutative variant.
  - Read by the HR.4 packet (`Wagner.qHodgeHabiro.2025`): §2.1, pp.13–15: Lemma 2.2 and Corollary 2.4 proof, finite completed descent. §2.2, pp.15–17: construction 2.7, Theorem 2.9 and its full proof, Remark 2.10.
  - Read by the HR.1 packet (`Q`): §1.22(e), p.12; §2.7 and §3.1, imported parent interfaces.
  - Read by the HR.2 packet (`Wagner.HR2.v2`): Appendix B.1–B.8, printed/PDF pp.77–80.
  - Read by the HR.6 packet (`Wagner.v2`): §1.1 paragraph 1.4, printed p.4; Theorem 3.11, Example 3.12 and Corollary 3.13 with proof, printed pp.25–27; Corollary 2.13 checked against the parent supplier.
  - Read by the HR.6 packet (`Wagner.author.2026`): Paragraph 1.4, printed p.4; Theorem 3.11, Example 3.12 and Corollary 3.13, printed pp.25–27. The completion-triviality assertion still has no proof there; inherited E6 persists.
- **Ferdinand Wagner, *q-Witt vectors and q-Hodge complexes*.** arXiv:2410.23078v5 (6 October 2025), the current version, whose numbering the q-Hodge paper cites; author copies of 8 October 2025 and 14 January 2026 were also read.
  - Source ids: `Wagner.qWitt.2024` (first packet, HR.4 packet); `W` (HR.1 packet); `Wagner.qWitt.v5` (HR.6 packet).
  - `Wagner.qWitt.2024`: arXiv:2410.23078v5 (6 October 2025), LaTeX source and PDF. Statements are numbered by one counter per section; v5's numbering is the one Wagner's q-Hodge paper and the stage texts cite (for example Lemma 2.46, Proposition 2.48, Corollaries 2.51 and 2.52), and it differs from v4's. <https://arxiv.org/abs/2410.23078>, SHA-256 `800822a7f26d26d2cb9011e404674ee3256e1f1a95418ac3580ae385dd906f87`, accessed 2026-09-25.
  - `Wagner.qWitt.2024`: arXiv:2410.23078v5, submitted 6 October 2025; PDF dated 7 October 2025; numbered printed pages <https://arxiv.org/pdf/2410.23078v5>, SHA-256 `c1c7426f374a9f56d5ad6fb743f6cfc95e74ba9c35a96babd7ae5101a9dded01`.
  - Read by the first packet (`Wagner.qWitt.2024`): 2.31–2.37 (PDF pp.26–29): Λ-rings as big-Witt coalgebras, the Adams operations ψ^m = gh_m ∘ s, and the δ-ring argument for torsion freeness (proof of Proposition 2.36). Lemma 2.46 with proof and Remark 2.47 with footnote (2.3) (PDF pp.31–32): the toric structure in Adams form, the colimit perfection and perfectly covered Λ-rings with the proof that the descriptions agree. Edition: arXiv:2410.23078v5 (submitted 6 October 2025; PDF dated October 7, 2025, 82 pp.), e-print SHA-256 800822a7f26d26d2cb9011e404674ee3256e1f1a95418ac3580ae385dd906f87, PDF SHA-256 c1c7426f374a9f56d5ad6fb743f6cfc95e74ba9c35a96babd7ae5101a9dded01. This is v5: v4 is the 31 January 2025 version (90 KB). The Habiro paper cites it as [Wag24] with this numbering. §1 (PDF pp. 2–3): 1.1–1.3, in particular 1.3 'A theory without restrictions'. §2.1 (PDF pp. 8–10): Lemmas 2.1–2.4 with proofs and Remark 2.5. §2.2 (PDF pp. 10–23): 2.6–2.14 in full, including the proof of Lemma 2.9; the statements of Proposition 2.15 and Lemma 2.17; Corollaries 2.19–2.22, Lemma 2.23, Corollary 2.24, Remark 2.25, Corollary 2.26 and Lemma 2.27 with proofs. §2.3 (PDF pp. 23–26): Proposition 2.28, Corollary 2.29 and Lemma 2.30 with proofs. §2.4 (PDF pp. 26–29): 2.31–2.39 in full. §2.5 (PDF pp. 29–32): 2.40–2.47 in full, including footnote (2.3). §2.6 (PDF pp. 33–36): Proposition 2.48, Remark 2.49, Lemma 2.50 and Corollaries 2.51 and 2.52 in full. arXiv:2410.23078v5 (PDF SHA-256 c1c7426f374a9f56d5ad6fb743f6cfc95e74ba9c35a96babd7ae5101a9dded01; e-print SHA-256 800822a7f26d26d2cb9011e404674ee3256e1f1a95418ac3580ae385dd906f87): §1.3 (p. 3); Lemma 2.46, Remark 2.47, Proposition 2.48, Corollaries 2.51–2.52 (pp. 31–35); 3.11 (p. 40); Proposition 3.31 (p. 50). v4 (PDF SHA-256 59cbbaed9a41a09db94fddfb338cec54011d2094dc4b6f9bb9f5b8fc76a36e2f) checked only for numbering: its Corollary 2.51 and Lemma 2.45 are v5's Corollary 2.52 and Lemma 2.46.
  - Read by the HR.4 packet (`Wagner.qWitt.2024`): §2.6, pp.33–35: Proposition 2.48, Remark 2.49, Lemma 2.50, Corollaries 2.51–2.52 and their proofs. Parent HR.4 extraction and accepted RS-10/QW.0–QW.4 stage contracts for the imported §§1.3 and 2.2–2.5 theory; those sections are not newly re-extracted here.
  - Read by the HR.1 packet (`W`): §2.31–2.33, pp.26–27. Remark 2.47 and footnote (2.3), p.32.
  - Read by the HR.6 packet (`Wagner.qWitt.v5`): §3.4 Proposition 3.31 and Lemma 3.32, statements and proofs, printed pp.50–52; Corollary 3.33 statement. Imported through HQ.4, never duplicated here.
- **Lars Hesselholt, *The big de Rham–Witt complex*.** Acta Mathematica 214 (2015), 135–207, the version of record, and arXiv:1006.3125v3.
  - Source ids: `H` (HR.1 packet); `H-published` (HR.1 packet).
  - `H`: arXiv:1006.3125v3; source numbering of this version (Acta Math. 214 (2015)) <https://arxiv.org/pdf/1006.3125v3>, SHA-256 `1b21e5adf08ea73ea1aac471100d6b191d57d47d95ff27ae0f25ee5e1d9f2973`, accessed 2026-10-06.
  - `H-published`: Acta Mathematica 214 (2015), 135–207; DOI 10.1007/s11511-015-0124-y, version of record <https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6800-11511_2015_Article_124.pdf>, SHA-256 `accc403fe6979590661b1d11744eae2adf990ebba92d4927a85815b6ac313de8`, accessed 2026-10-06.
  - Read by the HR.1 packet (`H`): §1 pp.6–19, Lemmas 1.1, 1.4, 1.8, 1.9, Proposition 1.14, 1.18, Proposition 1.19, Definitions 1.21/1.23, Remark 1.22 and Lemma 1.24. §2 p.24, cofree adjunction.
  - Read by the HR.1 packet (`H-published`): Proposition 1.14 and its proof, p.150. §2, cofree adjunction paragraph, p.162.
- **James Borger, *The basic geometry of Witt vectors, I: The affine case*.** arXiv:0801.1691v6.
  - Source ids: `B` (HR.1 packet).
  - `B`: arXiv:0801.1691v6 (14 December 2015 revision) <https://arxiv.org/pdf/0801.1691v6>, SHA-256 `d8d7c8f62311b4b60cf4d298af4e8519460e33b69ce9a34da4641488e6766019`, accessed 2026-10-06.
  - Read by the HR.1 packet (`B`): §1.6–1.9, pp.8–10. §1.17–1.18, pp.12–13.
- **Stavros Garoufalidis, Peter Scholze, Campbell Wheeler and Don Zagier, *The Habiro ring of a number field*.** arXiv:2412.04241v2.
  - Source ids: `GSWZ.v2` (HR.6 packet).
  - `GSWZ.v2`: arXiv:2412.04241v2, 27 August 2025; PDF dated 13 August 2025 <https://arxiv.org/pdf/2412.04241v2>, SHA-256 `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9`, accessed 2026-10-06.
  - Read by the HR.6 packet (`GSWZ.v2`): Definition 1.1 and (13), printed pp.6–7; §1.5 in full (Definitions 1.3–1.4, Theorems 1–2, Proposition 1.5), printed pp.8–11; §3.2 through §3.3 in full, printed pp.39–45, especially order-one constants and the proof of Theorem 2. §§4.5–4.6, printed pp.54–57, in full: global abelian generator claim and numerical cubic-field knot comparisons, read to delimit the missing nontrivial Picard witness.
- **Ferdinand Wagner, *q-Hodge filtrations, Habiro cohomology, and ku* (thesis).** author PDF of 15 August 2025.
  - Source ids: `Wagner.Thesis.2025` (HR.2 packet).
  - `Wagner.Thesis.2025`: Author PDF, 15 August 2025; accessed 6 October 2026 <https://guests.mpim-bonn.mpg.de/ferdinand/q-Thesis.pdf>, SHA-256 `d074047f202ee7e64298801b15327a9a634b6f7b6e4bcd5be7b2fda959ad876c`.
  - Read by the HR.2 packet (`Wagner.Thesis.2025`): §§5.1–5.3, printed pp.85–86 (PDF pp.89–90); generic solidity and compact generator recollections.
- **Guido Bosco, *Rational p-adic Hodge theory for rigid-analytic varieties*.** arXiv:2306.06100v1.
  - Source ids: `Bosco.2023` (HR.2 packet).
  - `Bosco.2023`: arXiv:2306.06100v1, 9 June 2023; PDF dated 12 June 2023; accessed 6 October 2026 <https://arxiv.org/pdf/2306.06100v1>, SHA-256 `a142fc46709b8a54ef552a052f8a0c96006b578ef2565bbe4bcea6100505c7e9`.
  - Read by the HR.2 packet (`Bosco.2023`): Appendix A.1, Notation A.2, Proposition A.3, Lemmas A.4–A.5, printed/PDF pp.92–93.
- **Jacob Lurie, *Higher Algebra*.** author PDF of 18 September 2017.
  - Source ids: `Lurie.HA.2017` (HR.2 packet, HR.3 packet).
  - `Lurie.HA.2017`: 18 September 2017 author PDF; accessed 6 October 2026 <https://www.math.ias.edu/~lurie/papers/HA.pdf>, SHA-256 `112b145a95a62daefb8275851cac9ab6430004cfc8f751a33a8d981fd7ad68c3`.
  - Read by the HR.2 packet (`Lurie.HA.2017`): Proposition 2.2.1.9 and its hypotheses, printed pp.196–197. Theorem 7.1.2.13 and proof, printed pp.1212–1213.
  - Read by the HR.3 packet (`Lurie.HA.2017`): Lemma 1.2.4.15 with proof, p. 74, and its use in the proof of Proposition 1.2.4.13. Definition 2.1.3.1, p. 184: algebras as operadic sections. Proposition 2.2.1.9 with proof, pp. 197–200: compatible monoidal localization. Proposition 3.2.2.1, Warning 3.2.2.2 and Corollary 3.2.2.3, pp. 357–358: limits of algebra objects; only statements and the short corollary proof, not the entire proof of 3.2.2.1. Corollary 3.2.2.4, pp. 358–359: fixed-category limit criterion, obtained by specializing 3.2.2.3 to D^⊗=O^⊗; read in REV-HabiroRings--HR.3.
- **Jacob Lurie, *Higher Topos Theory*.** author PDF of 9 April 2017.
  - Source ids: `Lurie.HTT.2017` (HR.3 packet).
  - `Lurie.HTT.2017`: 9 April 2017 author PDF <https://www.math.ias.edu/~lurie/papers/HTT.pdf>, SHA-256 `58855f3a0ad6d9c470ded74a38938b9468927592e9ae1209bab6a068e67ede6e`, accessed 2026-10-05.
  - Read by the HR.3 packet (`Lurie.HTT.2017`): Theorem 3.2.0.1, pp. 169–170: marked straightening/unstraightening statement, not its entire proof. Corollary 3.3.3.2 with proof, p. 216: limits as coherent sections. Definition 5.5.3.2, Proposition 5.5.3.3, Corollary 5.5.3.4 with proof, p. 467: presentable fibrations and adjoint reversal. Propositions 5.5.3.5 and 5.5.3.12–13 with proofs, pp. 467, 469–470: products, pullbacks and limits in Pr^L.
- **The Stacks Project, Tag 04D1.** Lemma 10.143.10, étale ring maps lift along surjections.
  - Source ids: `Stacks.04D1` (HR.4 packet).
  - `Stacks.04D1`: Tag 04D1, Lemma 10.143.10, live HTML accessed 6 October 2026 <https://stacks.math.columbia.edu/tag/04D1>, SHA-256 `11a0a6e46f55de460fce17a06dc9202700ba0c0cf36583839f4cc0993f37a85a`.
  - Read by the HR.4 packet (`Stacks.04D1`): Entire lemma and proof: lift the equations of a zero-dimensional Jacobian presentation and invert the determinant.
- **The Stacks Project, Tag 0ALI.** Lemma 15.11.2, nilpotent invariance of étale algebras.
  - Source ids: `Stacks.0ALI` (HR.4 packet).
  - `Stacks.0ALI`: Tag 0ALI, Lemma 15.11.2, live HTML accessed 6 October 2026; use its nilpotent specialization <https://stacks.math.columbia.edu/tag/0ALI>, SHA-256 `77f4af37f94371d067830836f2d56c59f8c87104c013130ed8ecb0b4e484f588`.
  - Read by the HR.4 packet (`Stacks.0ALI`): Entire lemma and proof of the equivalence of étale algebra categories; the additional henselian-pair conclusion is not a target.

**Versions read.** The parts record the files they read under `sourceVersions` (PROTOCOL.md section 18). Of the papers, only Hesselholt's has a version of record, which the HR.1 part read beside arXiv v3. Wagner's two papers, GSWZ, Borger and Bosco were read as arXiv preprints, with the author copies of Wagner's papers collated at the passages the source issues concern; Lurie's books and Wagner's thesis as author PDFs; and the Stacks Project as its live pages.

- first packet: preprint; <https://arxiv.org/abs/2510.04782v2>; read 2026-09-25; SHA-256 `9c338455871808eb2265681199279607b4b179b3973752d48eca3f711bc25b47`; e-print (LaTeX) of v2, the current version (v1 6 October 2025, v2 8 October 2025).
- first packet: preprint; <https://arxiv.org/pdf/2510.04782v2>; read 2026-09-25; SHA-256 `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b`; PDF of v2, dated October 9, 2025, 82 pp.; page numbers in locators are PDF pages.
- first packet: author copy; <https://ferdinand-wagner.github.io/papers/q-Habiro.pdf>; read 2026-09-25; SHA-256 `7c6b0e3106da456baad6c6f416714d6141d7b39e1107affc9d8a5be99bb92075`; dated January 14, 2026; checked for the Theorem 2.9 and Corollary 2.4 findings, which it still prints.
- first packet: preprint; <https://arxiv.org/abs/2410.23078v5>; read 2026-09-25; SHA-256 `800822a7f26d26d2cb9011e404674ee3256e1f1a95418ac3580ae385dd906f87`; e-print of the companion paper, v5 (6 October 2025).
- first packet: preprint; <https://arxiv.org/pdf/2410.23078v5>; read 2026-09-25; SHA-256 `c1c7426f374a9f56d5ad6fb743f6cfc95e74ba9c35a96babd7ae5101a9dded01`; PDF of v5, dated October 7, 2025, 82 pp..
- first packet: author copy; <https://ferdinand-wagner.github.io/papers/q-Witt.pdf>; read 2026-09-25; SHA-256 `6b8cb470137f83bb65e94c0e001e7bd9a458eb31af58a12da097e4f5fde10049`; dated January 14, 2026, 81 pp.; still prints the 2.6, 2.4, 2.35 and 2.48 misprints.
- first packet: author copy; <https://guests.mpim-bonn.mpg.de/ferdinand/q-Witt.pdf>; read 2026-09-25; SHA-256 `f0387284f29bfada538468c3e2018351ca3662ee39b68fd9a988d733eab28cb5`; dated October 8, 2025; same findings.
- first packet: author copy; <https://guests.mpim-bonn.mpg.de/ferdinand/q-Habiro.pdf>; read 2026-09-25; SHA-256 `bfa3dfb59d0d11202ccf5336c36a491ad89ba8fad51d70391027370125fa4304`.
- first packet: preprint; <https://arxiv.org/pdf/2510.04782v2>; FIX-RT-AREA-etale~2 targeted PDF recheck: §1.16–1.17 p.8; Theorem 3.11 and Example 3.12 pp.25–26; Corollary 3.54 pp.51–52. Earlier source/archive records are preserved.; read 2026-09-30; SHA-256 `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b`.
- first packet: preprint; <https://arxiv.org/pdf/2410.23078v5>; FIX-RT-AREA-etale~2 targeted PDF recheck: Targeted version/locator verification only; no new full-paper reading claimed. Earlier source/archive records are preserved.; read 2026-09-30; SHA-256 `c1c7426f374a9f56d5ad6fb743f6cfc95e74ba9c35a96babd7ae5101a9dded01`.
- HR.1 packet: preprint; <https://arxiv.org/pdf/1006.3125v3>; arXiv:1006.3125v3; source numbering of this version (Acta Math. 214 (2015)); read 2026-10-06; SHA-256 `1b21e5adf08ea73ea1aac471100d6b191d57d47d95ff27ae0f25ee5e1d9f2973`.
- HR.1 packet: preprint; <https://arxiv.org/pdf/0801.1691v6>; arXiv:0801.1691v6 (14 December 2015 revision); read 2026-10-06; SHA-256 `d8d7c8f62311b4b60cf4d298af4e8519460e33b69ce9a34da4641488e6766019`.
- HR.1 packet: preprint; <https://arxiv.org/pdf/2410.23078v5>; arXiv:2410.23078v5 (6 October 2025); read 2026-10-06; SHA-256 `c1c7426f374a9f56d5ad6fb743f6cfc95e74ba9c35a96babd7ae5101a9dded01`.
- HR.1 packet: preprint; <https://arxiv.org/pdf/2510.04782v2>; arXiv:2510.04782v2 (8 October 2025); read 2026-10-06; SHA-256 `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b`.
- HR.1 packet: published; <https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6800-11511_2015_Article_124.pdf>; Acta Mathematica 214 (2015), 135–207; DOI 10.1007/s11511-015-0124-y; read 2026-10-06; SHA-256 `accc403fe6979590661b1d11744eae2adf990ebba92d4927a85815b6ac313de8`.
- HR.4 packet: preprint; <https://arxiv.org/pdf/2510.04782v2>; arXiv:2510.04782v2, 8 October 2025, 82-page PDF; numbered printed pages; read 2026-10-06; SHA-256 `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b`.
- HR.4 packet: preprint; <https://arxiv.org/pdf/2410.23078v5>; arXiv:2410.23078v5, submitted 6 October 2025; PDF dated 7 October 2025; numbered printed pages; read 2026-10-06; SHA-256 `c1c7426f374a9f56d5ad6fb743f6cfc95e74ba9c35a96babd7ae5101a9dded01`.
- HR.4 packet: author copy; <https://ferdinand-wagner.github.io/papers/q-Witt.pdf>; Author copy dated 14 January 2026, collation of §2.6 only; findings scoped to the read preprint and this copy. No version of record identified.; read 2026-10-06; SHA-256 `6b8cb470137f83bb65e94c0e001e7bd9a458eb31af58a12da097e4f5fde10049`.

## What the pinned libraries have

The reviewed library audit AUDIT-17 records HR.1–HR.6 and HR.5-number-field-comparison as not built and HR.7 as a process layer. Neither library has Λ-rings, big Witt vectors, q-Witt vectors, Habiro-complete objects or anything named Habiro; Mathlib has only the p-typical Witt vectors, which `HR.4/truncated-big-witt-vectors` compares with and does not reuse. What they have is the commutative algebra the layers build on, and every node cites it rather than replanning it:

- étale, formally étale, formally smooth and formally unramified algebras, with the adic lifting lemmas that give the Frobenius lift and the marked deformations, and étaleness of localisations and base changes;
- adic completion with its universal property, faithful flatness and its local criteria, localisation, polynomial and multivariate expansion;
- cyclotomic polynomials with ∏_{d|n} Φ_d = X^n − 1, their separability and irreducibility over ℚ, primitive roots, the Chinese remainder theorem and the equaliser of commutative rings;
- p-typical and truncated Witt vectors with their ghost components, Frobenius, Verschiebung and Teichmüller lifts;
- the p-adic integers, rings of integers of number fields, their discriminants and the unramifiedness criterion;
- power series, invertible modules and Picard groups, Nakayama's lemma, and matrices with unit determinant;
- divisors and prime factorisations of integers;
- the nerve of an ordinary category as a quasicategory, the derived category of an abelian category and light condensed modules, the last two cited only to record what they do not provide (no enhanced module ∞-categories, no light solid spectra);
- in Tau Ceti, the exact cyclotomic integers and the conjugate-residue map at all roots of Φ_e modulo p ≡ 1 mod e.

Each declaration below was read at its module at the pinned commits by the part that cites it, and confirmed by that part's review. The description is the citing packet's `provides` field; where several parts cite a declaration, the first part's description is given and the other parts are named.

**Mathlib** (106 declarations).

- `mathlib:AdicCompletion` (Mathlib/RingTheory/AdicCompletion/Basic.lean): The classical I-adic completion; not the derived or the Habiro completion. Cited by the first packet, HR.4 packet.
- `mathlib:AdicCompletion.eval_surjective` (Mathlib/RingTheory/AdicCompletion/Basic.lean): Evaluation from ordinary completion onto each quotient is surjective. Cited by the HR.4 packet.
- `mathlib:AdicCompletion.isAdicComplete` (Mathlib/RingTheory/AdicCompletion/Completeness.lean): The completion at a finitely generated ideal (here (p)) is adically complete. Cited by the first packet, HR.4 packet.
- `mathlib:AdicCompletion.ker_evalOneₐ_eq_map` (Mathlib/RingTheory/AdicCompletion/Completeness.lean): For a finitely generated ideal, the kernel of evaluation at level one is its extension to the completed ring; gives the marked reduction equivalence. Cited by the HR.4 packet.
- `mathlib:AdicCompletion.liftAlgHom` (Mathlib/RingTheory/AdicCompletion/Algebra.lean): A compatible family of algebra maps into ideal-power quotients gives an algebra map into their completion. Cited by the HR.4 packet.
- `mathlib:AdicCompletion.ofAlgEquiv` (Mathlib/RingTheory/AdicCompletion/Algebra.lean): A complete ring is algebra-isomorphic to its ordinary completion; assembles maps and their inverses. Cited by the HR.4 packet.
- `mathlib:AdicCompletion.pow_smul_top_eq_ker_eval` (Mathlib/RingTheory/AdicCompletion/Completeness.lean): For I finitely generated and every n, I^n acting on the completion has image equal to the kernel of evaluation at n. With eval_surjective, this identifies the completed ring modulo the extended I^n with the original quotient. No change of completion ideal or noetherian hypothesis is needed. Cited by the HR.4 packet.
- `mathlib:Algebra.Etale` (Mathlib/RingTheory/Etale/Basic.lean): Étale algebras: formally étale and of finite presentation. Cited by the first packet, HR.4 packet.
- `mathlib:Algebra.Etale.baseChange` (Mathlib/RingTheory/Etale/Basic.lean): Étale is stable under base change: R ⊗_A A' and the Frobenius twist B ⊗_{A,Frob} A. Cited by the first packet, HR.4 packet.
- `mathlib:Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero` (Mathlib/RingTheory/Smooth/StandardSmoothOfFree.lean): Every étale algebra admits a submersive finite presentation of relative dimension zero; the presentation needed for object lifting already exists. Cited by the HR.4 packet.
- `mathlib:Algebra.Etale.of_formallyUnramified_of_flat` (Mathlib/RingTheory/Smooth/Fiber.lean): Finitely presented, flat and formally unramified implies étale.
- `mathlib:Algebra.Etale.of_isLocalizationAway` (Mathlib/RingTheory/Etale/Basic.lean): A localisation away from one element is étale (ℤ[1/N] over ℤ). Cited by the first packet, HR.4 packet.
- `mathlib:Algebra.Etale.of_restrictScalars` (Mathlib/RingTheory/Etale/Basic.lean): A map between étale A-algebras is étale (the relative Frobenius).
- `mathlib:Algebra.FormallyEtale` (Mathlib/RingTheory/Etale/Basic.lean): Formally étale algebras.
- `mathlib:Algebra.FormallyEtale.iff_comp_bijective` (Mathlib/RingTheory/Etale/Basic.lean): Unique lifts along square-zero ideals: uniqueness of deformations of étale algebras in the static case.
- `mathlib:Algebra.FormallySmooth.exists_lift` (Mathlib/RingTheory/Smooth/Basic.lean): Existence of a map from a formally smooth algebra through an arbitrary nilpotent ideal, not merely a square-zero ideal. Cited by the HR.4 packet.
- `mathlib:Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete` (Mathlib/RingTheory/Smooth/AdicCompletion.lean): A map from a formally smooth algebra to S/I lifts to S when S is I-adically complete: existence of the Frobenius lift. Cited by the first packet, HR.4 packet.
- `mathlib:Algebra.FormallyUnramified.ext_of_iInf` (Mathlib/RingTheory/Unramified/Basic.lean): Two maps from a formally unramified algebra into B that agree modulo I, with ⨅ I^i = ⊥, are equal: uniqueness of the Frobenius lift. Cited by the first packet, HR.4 packet.
- `mathlib:Algebra.FormallyUnramified.isOpenImmersion_SpecMap_lmul` (Mathlib/AlgebraicGeometry/Morphisms/FormallyUnramified.lean): The diagonal of a formally unramified, essentially finite type algebra is an open immersion.
- `mathlib:Algebra.FormallyUnramified.lift_unique` (Mathlib/RingTheory/Unramified/Basic.lean): Two algebra maps from a formally unramified source agreeing modulo a nilpotent target ideal are equal. Cited by the HR.4 packet.
- `mathlib:Algebra.formallyUnramified_iff_forall` (Mathlib/RingTheory/Unramified/Locus.lean): Formally unramified iff unramified at every prime.
- `mathlib:Algebra.Smooth.flat` (Mathlib/RingTheory/Smooth/Flat.lean): Every smooth algebra is flat, with no noetherian hypothesis; étale algebras are smooth by the existing instance. Supplies preservation of regularity under étale object lifting. Cited by the HR.4 packet.
- `mathlib:Algebra.SubmersivePresentation.isStandardSmoothOfRelativeDimension` (Mathlib/RingTheory/Smooth/StandardSmooth.lean): A finite submersive presentation of dimension n supplies standard smoothness of that dimension; use n=0 after adjoining an inverse of the lifted Jacobian. Cited by the HR.4 packet.
- `mathlib:Algebra.TensorProduct.map` (Mathlib/RingTheory/TensorProduct/Maps.lean): Scalar extension of algebra maps, including the actual reduction map on marked deformations. Cited by the HR.4 packet.
- `mathlib:Algebra.TensorProduct.quotientTensorEquiv` (Mathlib/RingTheory/TensorProduct/Quotient.lean): Quotient/base-change compatibility, followed by B⊗_B E≅E, identifies (B/I)⊗_B E with E/IE. The quoted declaration itself is over the specified original scalar ring; descend scalars to B/I through the quotient. Cited by the HR.4 packet.
- `mathlib:AlgebraicGeometry.Flat.isIso_of_surjective_of_mono` (Mathlib/AlgebraicGeometry/Morphisms/FlatMono.lean): A flat, quasi-compact, surjective monomorphism of schemes is an isomorphism (Stacks 06NC).
- `mathlib:AlgebraicGeometry.universallyInjective_eq_diagonal` (Mathlib/AlgebraicGeometry/Morphisms/UniversallyInjective.lean): Universally injective = surjective diagonal.
- `mathlib:CategoryTheory.Nerve.quasicategory` (Mathlib/AlgebraicTopology/Quasicategory/Nerve.lean): The nerve of an ordinary category is a quasicategory; used only for the finite indexing poset, not for derived categories. Cited by the HR.3 packet.
- `mathlib:CommRing.Pic.mapRingHom` (Mathlib/RingTheory/PicardGroup.lean): Ordinary scalar extension along any ring homomorphism induces a Picard group homomorphism. Cited by the HR.6 packet.
- `mathlib:CommRing.Pic.mapRingHom_comp_mapRingHom` (Mathlib/RingTheory/PicardGroup.lean): Picard scalar extension respects composition of ring homomorphisms. Cited by the HR.6 packet.
- `mathlib:CommRing.Pic.mapRingHom_id` (Mathlib/RingTheory/PicardGroup.lean): The identity ring map induces the identity Picard map. Cited by the HR.6 packet.
- `mathlib:CommRing.Pic.mk` (Mathlib/RingTheory/PicardGroup.lean): Existing multiplicative Picard class of an actual invertible module. Cited by the HR.6 packet.
- `mathlib:CommRing.Pic.mk_eq_mk_iff` (Mathlib/RingTheory/PicardGroup.lean): Equality of two module classes iff their actual modules are linearly equivalent. Cited by the HR.6 packet.
- `mathlib:CommRing.Pic.mk_eq_one_iff` (Mathlib/RingTheory/PicardGroup.lean): Pic.mk R M = 1 iff there is an R-linear equivalence M ≃ R. Cited by the HR.6 packet.
- `mathlib:CommRingCat.equalizerFork` (Mathlib/Algebra/Category/Ring/Constructions.lean): The equaliser fork in commutative rings, given by RingHom.eqLocus.
- `mathlib:CommRingCat.equalizerForkIsLimit` (Mathlib/Algebra/Category/Ring/Constructions.lean): Its universal property: the generic equaliser the HR.7 stage text mentions, already in Mathlib.
- `mathlib:DerivedCategory` (Mathlib/Algebra/Homology/DerivedCategory/Basic.lean): Localization of cochain complexes at quasi-isomorphisms under HasDerivedCategory; ordinary derived category only. Cited by the HR.2 packet.
- `mathlib:frobenius` (Mathlib/Algebra/CharP/Lemmas.lean): The Frobenius x ↦ x^p of a ring of characteristic p.
- `mathlib:Ideal.mem_jacobson_iff` (Mathlib/RingTheory/Jacobson/Ideal.lean): x lies in jacobson I iff for every y there is z with z*y*x+z−1 in I. For I=0 and x=X, invert 1+yX. Cited by the HR.6 packet.
- `mathlib:Ideal.quotientInfRingEquivPiQuotient` (Mathlib/RingTheory/Ideal/Quotient/Operations.lean): Chinese remainder theorem for pairwise coprime ideals; the idempotent decomposition of the componentwise repair.
- `mathlib:IsAddTorsionFree` (Mathlib/Algebra/Group/Monoid.lean): Torsion-freeness of the underlying additive group of a Λ-ring (nsmul injective for n ≠ 0). Cited by the first packet, HR.1 packet.
- `mathlib:IsAdicComplete` (Mathlib/RingTheory/AdicCompletion/Basic.lean): I-adic completeness (Hausdorff and precomplete) of a module; classical, not derived, completeness.
- `mathlib:IsAdicComplete.liftRingHom` (Mathlib/RingTheory/AdicCompletion/RingHom.lean): Universal property of an adically complete ring: extension of φ_p from R to R̂_p.
- `mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot` (Mathlib/RingTheory/Flat/TorsionFree.lean): Over a Dedekind domain, flat iff torsion free.
- `mathlib:IsLocalization` (Mathlib/RingTheory/Localization/Defs.lean): Localisation at a submonoid, for the localisation inverting all q^m − 1 in B.1.
- `mathlib:IsPrimitiveRoot` (Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean): Primitive k-th roots of unity.
- `mathlib:LaurentPolynomial` (Mathlib/Algebra/Polynomial/Laurent.lean): The Laurent ring ℤ[q^{±1}] and A[q^{±1}]. Cited by the first packet, HR.2 packet.
- `mathlib:LightCondMod` (Mathlib/Condensed/Light/Module.lean): LightCondensed (ModuleCat R), sheaves of ordinary R-modules, not hypersheaves of spectra or solid spectra. Cited by the HR.2 packet.
- `mathlib:LinearMap.surjective_of_surjective_comp_mkQ` (Mathlib/RingTheory/Nakayama.lean): For finite N, a linear map M→N surjective modulo I*N is surjective if I is contained in jacobson(0). No local/noetherian hypothesis. Cited by the HR.6 packet.
- `mathlib:LinearMap.toSpanSingleton` (Mathlib/LinearAlgebra/Span/Basic.lean): For s in P, the linear map B → P sending b to b*s. Cited by the HR.6 packet.
- `mathlib:Matrix.isUnit_iff_isUnit_det` (Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean): A finite square matrix over a commutative ring is a unit iff its determinant is a unit; supplies each weighted local matrix inverse. Cited by the HR.1 packet.
- `mathlib:Module.FaithfullyFlat` (Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean): Faithful flatness, for the ψ^m and for A → A_∞ in the definition of perfect covering. Cited by the first packet, HR.1 packet.
- `mathlib:Module.Flat` (Mathlib/RingTheory/Flat/Basic.lean): Flatness (used in the non-example ℤ[x,y]/(xy)).
- `mathlib:Module.flat_iff_of_isLocalization` (Mathlib/RingTheory/Flat/Localization.lean): For S a localization of R and an S-module M with the compatible scalar tower, Flat S M ↔ Flat R M. Supplies the restriction of scalars needed before flat_of_localized_maximal. Cited by the HR.1 packet.
- `mathlib:Module.flat_of_localized_maximal` (Mathlib/RingTheory/Flat/Localization.lean): For every maximal P of R, requires Flat R (LocalizedModule P.primeCompl M), with the original base R. Then Flat R M. For the ψᵖ-twisted target, first restrict flatness over R_P along the localization using Module.flat_iff_of_isLocalization. Cited by the HR.1 packet.
- `mathlib:Module.Free.of_basis` (Mathlib/LinearAlgebra/FreeModule/Basic.lean): A module with a basis is free: ℤ[x] is free over ℤ[x^m] with monomial basis. Cited by the first packet, HR.1 packet.
- `mathlib:Module.Invertible` (Mathlib/RingTheory/PicardGroup.lean): Canonical dual contraction is bijective; inherited finite/projective instances, dual and tensor invertibility, and invertibility after ordinary algebra scalar extension. No freeness hypothesis. Cited by the HR.6 packet.
- `mathlib:Module.Invertible.bijective_of_surjective` (Mathlib/RingTheory/PicardGroup.lean): A surjective linear map between invertible modules over a commutative semiring is bijective. Cited by the HR.6 packet.
- `mathlib:Module.Invertible.free_iff_linearEquiv` (Mathlib/RingTheory/PicardGroup.lean): For invertible M, Free R M iff there exists an R-linear equivalence M ≃ R. Cited by the HR.6 packet.
- `mathlib:MvPolynomial` (Mathlib/Algebra/MvPolynomial/Basic.lean): Polynomial ring on an arbitrary index type; the free Λ-ring uses I × positive integers. Cited by the HR.1 packet.
- `mathlib:MvPolynomial.eval₂Hom` (Mathlib/Algebra/MvPolynomial/Eval.lean): Ring evaluation of polynomials along a coefficient ring homomorphism and chosen values of variables; constructs coaction and free lifts. Cited by the HR.1 packet.
- `mathlib:MvPolynomial.eval₂Hom_X'` (Mathlib/Algebra/MvPolynomial/Eval.lean): Evaluation sends X i to its assigned value; generator contract of the free lift. Cited by the HR.1 packet.
- `mathlib:MvPolynomial.expand` (Mathlib/Algebra/MvPolynomial/Expand.lean): expand p = bind₁ (X i ↦ X i ^ p): the toric Adams operations ψ^m on ℤ[x_i | i ∈ I].
- `mathlib:MvPowerSeries.toAdicCompletionAlgEquiv` (Mathlib/RingTheory/MvPowerSeries/Equiv.lean): Power series are the completion of a polynomial ring at the variable ideal, for finite variable sets. Apply the one-variable equivalence for the localization-series test. Cited by the HR.4 packet.
- `mathlib:Nat.divisors` (Mathlib/NumberTheory/Divisors.lean): The finset of positive divisors of n (empty for n = 0). Cited by the first packet, HR.3 packet.
- `mathlib:Nat.exists_eq_pow_mul_and_not_dvd` (Mathlib/Data/Nat/Factorization/Basic.lean): For nonzero n and p≠1, n=p^e n₀ with p not dividing n₀. This supplies existence of the prime-free chain representative. Cited by the HR.3 packet.
- `mathlib:Nat.factorization` (Mathlib/Data/Nat/Factorization/Defs.lean): Prime multiplicities v_p(m) as a finitely supported function; zero at primes not dividing m. Cited by the HR.3 packet.
- `mathlib:Nat.factorization_eq_zero_of_not_dvd` (Mathlib/Data/Nat/Factorization/Defs.lean): If p does not divide n, its multiplicity in n.factorization is zero. Cited by the HR.3 packet.
- `mathlib:Nat.factorization_le_iff_dvd` (Mathlib/Data/Nat/Factorization/Defs.lean): For nonzero d,n, d.factorization≤n.factorization iff d divides n; supplies both chain containment and the strict prime-edge exponent bound. Cited by the HR.3 packet.
- `mathlib:Nat.factorization_mul` (Mathlib/Data/Nat/Factorization/Defs.lean): For a,b nonzero, (ab).factorization=a.factorization+b.factorization. Cited by the HR.3 packet.
- `mathlib:Nat.Prime.factorization_pow` (Mathlib/Data/Nat/Factorization/Defs.lean): For p prime, (p^k).factorization=Finsupp.single p k. Cited by the HR.3 packet.
- `mathlib:Nat.primeFactors` (Mathlib/Data/Nat/PrimeFin.lean): The finite set of prime factors, with membership Prime p and p dividing a nonzero integer. Cited by the HR.3 packet.
- `mathlib:NumberField.discr` (Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean): The absolute discriminant of a number field.
- `mathlib:NumberField.not_dvd_discr_iff_isUnramifiedIn` (Mathlib/NumberTheory/NumberField/Discriminant/Different.lean): A prime p does not divide disc F iff (p) is unramified in O_F.
- `mathlib:NumberField.RingOfIntegers` (Mathlib/NumberTheory/NumberField/Basic.lean): The ring of integers O_F.
- `mathlib:PadicInt` (Mathlib/NumberTheory/Padics/PadicIntegers.lean): The p-adic integers ℤ_p.
- `mathlib:Polynomial.cyclotomic` (Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean): The n-th cyclotomic polynomial Φ_n over any ring. Cited by the first packet, HR.3 packet.
- `mathlib:Polynomial.cyclotomic.dvd_X_pow_sub_one` (Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean): Φ_n divides X^n − 1 over any ring.
- `mathlib:Polynomial.cyclotomic.irreducible_rat` (Mathlib/RingTheory/Polynomial/Cyclotomic/Roots.lean): Φ_n is irreducible over ℚ for n > 0.
- `mathlib:Polynomial.cyclotomic_prime_pow_eq_geom_sum` (Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean): cyclotomic (p^(n+1)) R = Σ_{i < p} (X^(p^n))^i for p prime.
- `mathlib:Polynomial.expand` (Mathlib/Algebra/Polynomial/Expand.lean): The one-variable toric Adams operation f(x) ↦ f(x^p).
- `mathlib:Polynomial.expand_mul` (Mathlib/Algebra/Polynomial/Expand.lean): expand (p·q) = expand p ∘ expand q: the composition law ψ^(mn) = ψ^m ∘ ψ^n for the toric structure.
- `mathlib:Polynomial.prod_cyclotomic_eq_X_pow_sub_one` (Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean): ∏_{d | n} Φ_d = X^n − 1 for n > 0. Cited by the first packet, HR.3 packet.
- `mathlib:Polynomial.separable_cyclotomic` (Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean): Φ_n is separable over a field in which n ≠ 0; the repair of the p. 18 proof line.
- `mathlib:PowerSeries` (Mathlib/RingTheory/PowerSeries/Basic.lean): Formal power series in one variable; no substitution of non-nilpotent constants. Cited by the first packet, HR.1 packet.
- `mathlib:PowerSeries.coeff` (Mathlib/RingTheory/PowerSeries/Basic.lean): The nth coefficient linear map; defines exterior operations from their signed product. Cited by the HR.1 packet.
- `mathlib:PowerSeries.constantCoeff` (Mathlib/RingTheory/PowerSeries/Basic.lean): Ring homomorphism R[[X]] → R, with the existing constant section C and variable X. Cited by the HR.6 packet.
- `mathlib:PowerSeries.constantCoeff_surj` (Mathlib/RingTheory/PowerSeries/Basic.lean): Constant coefficient is surjective, via the constant series section. Cited by the HR.6 packet.
- `mathlib:PowerSeries.isUnit_iff_constantCoeff` (Mathlib/RingTheory/PowerSeries/Inverse.lean): A series over a commutative ring is a unit iff its constant coefficient is a unit. Cited by the HR.6 packet.
- `mathlib:PowerSeries.X_dvd_iff` (Mathlib/RingTheory/PowerSeries/Basic.lean): X divides a series iff its constant coefficient is zero; identifies the kernel with the principal X ideal. Cited by the HR.6 packet.
- `mathlib:RingHom.eqLocus` (Mathlib/Algebra/Ring/Subring/Basic.lean): The equaliser of two ring maps as a subring; the ordinary-ring form of Lemma 2.12.
- `mathlib:RingHom.FaithfullyFlat` (Mathlib/RingTheory/RingHom/FaithfullyFlat.lean): Faithfully flat ring map through its induced Algebra, not just injectivity. Cited by the HR.1 packet.
- `mathlib:RingHom.FaithfullyFlat.iff_flat_and_comap_surjective` (Mathlib/RingTheory/RingHom/FaithfullyFlat.lean): Faithfully flat iff flat with surjective map on prime spectra; localized free presentations give nonzero fibres. Cited by the HR.1 packet.
- `mathlib:RingHom.FaithfullyFlat.stableUnderComposition` (Mathlib/RingTheory/RingHom/FaithfullyFlat.lean): Composition of faithfully flat ring maps is faithfully flat, giving composite Adams indices. Cited by the HR.1 packet.
- `mathlib:RingHom.quotientKerEquivOfSurjective` (Mathlib/RingTheory/Ideal/Quotient/Operations.lean): For a surjective ring homomorphism f:R→S, the quotient of R by ker(f) is ring-equivalent to S, with the prescribed quotient map. Cited by the HR.6 packet.
- `mathlib:Submodule.mkQ_surjective` (Mathlib/LinearAlgebra/Quotient/Defs.lean): Every element of the ordinary module quotient has a lift. Cited by the HR.6 packet.
- `mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange` (Mathlib/LinearAlgebra/TensorProduct/Tower.lean): Coherent ordinary iterated scalar-extension equivalence M tensor_A (A tensor_R N) ≃ M tensor_R N, with the stated algebra and scalar-tower structures. Cited by the HR.6 packet.
- `mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange` (Mathlib/LinearAlgebra/TensorProduct/Tower.lean): Scalar extension distributes over module tensor products. Cited by the HR.6 packet.
- `mathlib:TensorProduct.lid` (Mathlib/LinearAlgebra/TensorProduct/Associator.lean): Tensor unit equivalence R tensor_R M ≃ M; pure tensor r tensor m maps to r*m. Cited by the HR.6 packet.
- `mathlib:TensorProduct.quotTensorEquivQuotSMul` (Mathlib/LinearAlgebra/TensorProduct/Quotient.lean): For an R-module M and ideal I, (R/I) tensor_R M is R-linearly equivalent to M/(I*top). Cited by the HR.6 packet.
- `mathlib:TruncatedWittVector` (Mathlib/RingTheory/WittVector/Truncated.lean): Truncated p-typical Witt vectors of length n, Fin n → R with the Witt ring structure.
- `mathlib:WittVector` (Mathlib/RingTheory/WittVector/Defs.lean): p-typical Witt vectors W(R) only; the big and divisor-truncated Witt vectors W_m of the q-Witt paper are not in Mathlib, so HR.4 compares with, and does not reuse, this.
- `mathlib:WittVector.frobenius` (Mathlib/RingTheory/WittVector/Frobenius.lean): The p-typical Witt vector Frobenius, a ring endomorphism with ghostComponent n ∘ frobenius = ghostComponent (n+1).
- `mathlib:WittVector.ghostComponent` (Mathlib/RingTheory/WittVector/Basic.lean): The n-th ghost component, a ring map W p R → R evaluating the n-th Witt polynomial.
- `mathlib:WittVector.teichmuller` (Mathlib/RingTheory/WittVector/Teichmuller.lean): The multiplicative Teichmüller lift R → W p R, with ghostComponent n (teichmuller r) = r^(p^n).
- `mathlib:WittVector.verschiebung` (Mathlib/RingTheory/WittVector/Verschiebung.lean): The p-typical Verschiebung, an additive map with ghostComponent (n+1) ∘ verschiebung = p · ghostComponent n.

**Tau Ceti** (3 declarations).

- `tauceti:TauCeti.Cyclotomic` (TauCeti/RingTheory/Cyclotomic/Basic.lean): Exact cyclotomic integers ℤ[ζ_e], represented by coefficient lists.
- `tauceti:TauCeti.Cyclotomic.conjugateResidues_lift` (TauCeti/RingTheory/Cyclotomic/Lift.lean): Every residue tuple is realised, so the residue map is surjective.
- `tauceti:TauCeti.Cyclotomic.conjugateResiduesRingHom` (TauCeti/RingTheory/Cyclotomic/Lift.lean): For a primitive e-th root α modulo p, the ring map ℤ[ζ_e] → (Z/p)^{φ(e)} of residues at all conjugate roots; the splitting of Φ_e modulo p ≡ 1 mod e.

## Layer overview

Each layer section opens with the coverage records of the packets that cover it and an overview of the layer. It then states every node, the first packet's nodes and the follow-up's together, in an order in which every node comes after the nodes of the same layer it uses: its statement and hypotheses, the proof or construction, for definitions and constructions the API and the unit tests, the acceptance checks, the uses that justify the API, the dependencies and the sources. Where a reviewer asked the assembly to carry a correction into a node of another packet, an **Assembly note** follows the node; it records the correction and changes nothing in the packet.

| Layer | Title | Nodes | Planets | Coverage | Packets |
|---|---|---|---|---|---|
| HR.1 | Relative bases and local Frobenius | 23 | 6 | planned | `HabiroRings.json` (6), `HabiroRings--HR.1.json` (17) |
| HR.2 | Habiro-complete modules and derived detection | 9 | 3 | planned | `HabiroRings.json` (7), `HabiroRings--HR.2.json` (2) |
| HR.2:solid | Solid Habiro-complete spectra (proposed) | 5 | 2 | part of HR.2 | `HabiroRings.json` (2), `HabiroRings--HR.2.json` (3) |
| HR.3 | Finite cyclotomic arithmetic descent | 12 | 5 | planned | `HabiroRings.json` (5), `HabiroRings--HR.3.json` (7) |
| HR.4 | Relative q-Witt rings and finite étale lifts | 19 | 6 | planned | `HabiroRings.json` (12), `HabiroRings--HR.4.json` (7) |
| HR.5 | The relative Habiro ring and its Taylor presentation | 6 | 2 | source_decomposed | `HabiroRings.json` (6) |
| HR.5-number-field-comparison | Number-field comparison | 3 | 1 | source_decomposed | `HabiroRings.json` (3) |
| HR.6 | Coefficient and cohomology interfaces | 8 | 2 | planned | `HabiroRings.json` (5), `HabiroRings--HR.6.json` (3) |
| HR.7 | Acceptance tests and executable boundary | 4 | 0 | source_decomposed | `HabiroRings.json` (4) |

In all, 89 nodes and 27 planets. The coverage column gives the latest record: the follow-up packet's for HR.1, HR.2, HR.3, HR.4 and HR.6, the first packet's otherwise. HR.2 is displayed as the two sub-layers that the first packet and the HR.2 part both propose: HR.2 keeps the algebraic theory of Appendix B.1–B.5 and the two spherical nodes, and HR.2:solid takes the solid nodes B.6–B.8 with the three solid calculations of the HR.2 part. The split is awaiting the maintainer; the node ids are unchanged, and every layer stays within the six planets a layer may show.

**The path to the main theorems.** The critical path runs HR.1 → HR.2 → HR.3 → HR.4 → HR.5 → HR.5-number-field-comparison: the linearised Frobenius (HR.1) gives the gluing data; the detection results of HR.2 give staticity; Corollary 2.4 (HR.3) glues; Theorem 2.9 (HR.4), with the marked complete deformations of the HR.4 part, identifies the stages with étale lifts of the relative q-Witt rings; HR.5 passes to the limit and proves the equaliser presentation; and HR.5-number-field-comparison specialises to ℤ and to number fields. HR.2:solid is off this path: no node of HR.3–HR.5 uses it, and its only consumer is HabiroCohomologyFoundations HQ.6. HR.6 is a late return edge, after HabiroCohomologyFoundations HQ.3–HQ.5. The big Witt material of the HR.1 part uses `HR.4/truncated-big-witt-vectors`, which is explained under Dependencies.

## HR.1 — Relative bases and local Frobenius

*Coverage in `HabiroRings.json`: partial, 6 nodes.* 6 packet nodes at this stage. lambda-rings-with-commuting-adams-operations: torsion-free Λ-rings with ψ^1 = id, ψ^(mn) = ψ^m ∘ ψ^n and the Frobenius congruence ψ^p(x) ≡ x^p mod p (corrected from 'ψ^p ≡ id'), Λ-maps and the category, δ_p for PR.0, perfect Λ-rings, ℤ, ℚ and the toric examples. the-colimit-perfection (new). perfectly-covered: the three equivalent descriptions of Wagner 1.22(e) and q-Witt Remark 2.47, proved from footnote (2.3), with the toric example and the non-example ℤ[x,y]/(xy) toric. relative-frobenius-of-an-etale-algebra (new; the Stacks 0EBS input 2.7 cites). the-etale-frobenius-lift: existence, uniqueness, linearised Frobenius an isomorphism, naturality, base change, iterates, the ℤ[2^(1/3), 1/6] non-example of a global lift. morphisms-of-pairs is now the definition of the category of pairs (A, R), with Λ-compatibility on the base; its former register content ('every later naturality statement is for this category', 'a map not respecting the Adams operations induces nothing') is this note and the non-example test EtalePair.not_hom_of_non_lambda. The naming rule (Λ-ring is the arithmetic λ-ring, not an Iwasawa algebra) is a convention recorded here, not a test. Remaining: Wilkerson comparison of the torsion-free Adams form with the big-Witt coalgebra form, and big Witt vectors (gap). Free Λ-rings and their perfect covering (gap). Gap: 'Λ-rings as big-Witt coalgebras versus the torsion-free Adams form, and big Witt vectors'. Gap: 'Free Λ-rings: construction and perfect covering'.

*Coverage in `HabiroRings--HR.1.json`: planned, 17 nodes.* All HR.1 targets have nodes or explicit imports. Both local mathematical gaps are supplied at target granularity. No new mathematical gap is left in this supplement; the inherited completion stage request prevents closed coverage. The generic δ dictionary now has an exact PR.0 node. Exactly three new planets plus three retained parent planets. Remaining: Resolve the inherited DerivedDeRhamCohomology:DD.1 completion interface for the imported p-complete criterion and étale Frobenius lift. Assemble the six parent HR.1 nodes with these seventeen new nodes, replace exactly the two parent HR.1 gap records, and retain the parent’s unrelated gaps.

The layer has 23 nodes: the first packet's six, which plan the stage text, and the HR.1 part's seventeen, which fill the two gaps the first packet left. The HR.1 part supplies both: the comparison of the two forms of a Λ-ring and the free Λ-rings with their perfect covering. Of the first packet's HR.1 remaining items, only the DD.1 completion interface is still open, and it is a stage request, not a gap.

- **Λ-rings and perfect covering.**
  - A Λ-ring in torsion-free Adams form carries ψ^m with ψ^1 = id, ψ^{mn} = ψ^m ∘ ψ^n and ψ^p(x) ≡ x^p mod p. Torsion-freeness makes δ_p(x) = (ψ^p(x) − x^p)/p a p-derivation, so a Λ-ring is a δ-ring at every prime, in the sense of PrismaticCohomology PR.0. ℤ, ℚ and the toric rings ℤ[x_i] with ψ^m = expand m are the standing examples.
  - The colimit perfection A_∞ along the ψ^m is initial among Λ-maps to perfect Λ-rings. Perfect covering has three equivalent descriptions (a faithfully flat Λ-map to a perfect Λ-ring, faithful flatness of every ψ^m, faithful flatness of A → A_∞), and it fails for ℤ[x, y]/(xy) with the toric structure.
- **The local Frobenius.**
  - An étale pair (A, R) is a perfectly covered Λ-ring with an étale algebra; morphisms are Λ-maps on the base and ring maps on the algebra. The Λ-compatibility of the completed maps with the Frobenius lifts is a theorem, not a condition.
  - In characteristic p, the relative Frobenius of an étale algebra is an isomorphism (Stacks 0EBS, which Wagner 2.7 invokes and neither library has); the packet proves it from Mathlib's scheme-level results.
  - ψ^p extends uniquely to a Frobenius lift φ_p of R̂_p, by Mathlib's formally étale lifting along p-adically complete rings, and its linearisation (R̂_p ⊗_{A,ψ^p} A)^∧_p → R̂_p is an isomorphism. It is natural in pairs, compatible with base change and with prime-power iterates. R itself need not have a Frobenius lift: ℤ[∛2, 1/6] has none at 5. This is the gluing datum of HR.4.
- **Big Witt coalgebras** (the HR.1 part, after Hesselholt and Borger).
  - Dwork's criterion characterises the ghost sequences of big Witt vectors over a torsion-free ring with Frobenius lifts φ_p by the congruences y_n ≡ φ_p(y_{n/p}) mod p^{v_p(n)}. It gives the universal Frobenius polynomials f_{m,n}, the Witt-ring congruence F_p(a) ≡ a^p mod pW(A), and the comultiplication Δ : W(A) → W(W(A)) with gh_n ∘ Δ = F_n, making W a comonad.
  - A Λ-coalgebra is a coalgebra s : A → W(A) for this comonad, defined for all rings, with Adams operations gh_n ∘ s. On torsion-free rings the Witt section s_ψ of Adams data inverts this, which is Wilkerson's comparison; it is not an equivalence on rings with torsion. W(A) with Δ is the cofree Λ-ring.
  - Witt addition becomes multiplication of the generating series ∏(1 − a_d t^d), which defines the exterior operations λ^n; the review corrected the sign of λ^3 = c_3 − c_1c_2 and recorded the source's two misprints (E13, E14).
- **Free Λ-rings.** L(I) = ℤ[c_{i,n}] with the coaction from the universal points is the free Λ-coalgebra on I. Over ℤ_(p), ψ^p makes L(I) a free module on the monomials with exponents below p, and after inverting p a polynomial algebra; so every ψ^m is faithfully flat and free Λ-rings are perfectly covered, as Wagner 1.22(e) asserts without proof.

Two points of order. The HR.1 part's Witt nodes use `HR.4/truncated-big-witt-vectors` at the full truncation set, the interim carrier of big Witt vectors; the node graph stays acyclic because that HR.4 node uses only the Λ-ring definition (see Dependencies). And the first packet's nodes were written before the HR.1 part: `HR.1/lambda-rings-with-commuting-adams-operations` still calls the Wilkerson comparison a gap and cites the stage PR.0, and `HR.1/perfectly-covered` still marks free Λ-rings as a gap. The Assembly notes after those nodes say what now supplies them.

### Torsion-free Λ-rings: Adams operations with the Frobenius congruence ψ^p(x) ≡ x^p

`HR.1/lambda-rings-with-commuting-adams-operations` · definition · planet “Λ-rings and Adams operations” · first packet

A Λ-ring, in the torsion-free form the stage text asks for, is a commutative ring A that is torsion free as an abelian group together with ring endomorphisms ψ^m : A → A for every integer m ≥ 1 (the Adams operations) such that ψ^1 = id, ψ^(mn) = ψ^m ∘ ψ^n for all m, n ≥ 1 (so the ψ^m commute), and, for every prime p and every x ∈ A, ψ^p(x) ≡ x^p modulo pA (the Frobenius congruence; NOT ψ^p(x) ≡ x). A morphism of Λ-rings is a ring map commuting with every ψ^m; this is the category of Λ-rings. Since A is torsion free, δ_p(x) := (ψ^p(x) − x^p)/p is well defined and is a p-derivation, so A is a δ-ring at every prime with Frobenius ψ^p (the δ-ring interface of PrismaticCohomology PR.0). A Λ-ring is perfect when every ψ^p (equivalently every ψ^m) is bijective. Standing examples: ℤ and ℚ with every ψ^m the identity (ℚ is perfect); the polynomial ring ℤ[x_i | i ∈ I] with the toric structure ψ^m(x_i) = x_i^m, i.e. ψ^m = expand m, which is the source's toric Λ-structure 'λ^n(x_i) = 0 for all n > 1'. In the sources a Λ-ring is a coalgebra for the big Witt vectors, with structure map s : A → W(A) and ψ^m(x) = Σ_{d|m} d·δ_d(x)^{m/d} = gh_m(s(x)) (q-Witt 2.31); for torsion-free A the ψ^m determine s, and that comparison is recorded as a gap. 'Λ-ring' means the arithmetic λ-ring, not an Iwasawa algebra.

**Hypotheses.**

- A is commutative and torsion free (nx = 0 with n ≥ 1 forces x = 0). This is the stage text's standing hypothesis; every perfectly covered Λ-ring of the source is p-torsion free for every p (Wagner 2.7), so the restriction loses nothing for this roadmap.
- The Frobenius congruence is ψ^p(x) − x^p ∈ pA. The packet's former form 'ψ^p is the identity modulo p' is false for the toric structure (ψ^p(x) − x = x^p − x ∉ pℤ[x]).
- Commutation ψ^m ∘ ψ^n = ψ^n ∘ ψ^m follows from ψ^(mn) = ψ^m ∘ ψ^n and is not a separate axiom.
- Free Λ-rings ℤ{x_i} are not constructed here: their construction needs symmetric functions and the Wilkerson comparison (gaps).

**Construction.**

1. Define the structure (ψ^m)_{m ≥ 1} with ψ^1 = id, ψ^(mn) = ψ^m ∘ ψ^n and the Frobenius congruence at every prime; derive commutation from mn = nm.
2. Define morphisms as ring maps commuting with every ψ^m, with identities and composition: the category of Λ-rings.
3. Construct δ_p(x) = (ψ^p(x) − x^p)/p using torsion freeness; the δ-ring identities for δ_p follow from ψ^p being a ring map (the PR.0 correspondence between Frobenius lifts and δ-structures on p-torsion-free rings).
4. Construct the trivial structures on ℤ (Fermat: n^p ≡ n mod p) and on ℚ (pℚ = ℚ), and the toric structure on MvPolynomial I ℤ with ψ^m = expand m: expand (mn) = expand m ∘ expand n, and expand p f ≡ f^p modulo p because f ↦ f^p is additive modulo p and fixes integer coefficients modulo p.
5. Define perfectness as bijectivity of every ψ^p.

**API.**

- `LambdaRing` (structure): A torsion-free commutative ring with ring endomorphisms ψ^m (m ≥ 1) such that ψ^1 = id, ψ^(mn) = ψ^m ∘ ψ^n and ψ^p(x) − x^p ∈ p·A for every prime p.
- `LambdaRing.adams` (projection): The Adams operation ψ^m as a ring endomorphism.
- `LambdaRing.adams_one` (simp): ψ^1 = id.
- `LambdaRing.adams_mul` (relation): ψ^(mn) = ψ^m ∘ ψ^n.
- `LambdaRing.adams_comm` (relation): ψ^m ∘ ψ^n = ψ^n ∘ ψ^m, derived from adams_mul.
- `LambdaRing.adams_prime_sub_pow_mem` (relation): For p prime and x ∈ A, ψ^p(x) − x^p ∈ p·A (the Frobenius congruence; replaces the former frobCongruence).
- `LambdaRing.Hom` (structure): Ring maps f with f ∘ ψ^m = ψ^m ∘ f for all m, with Hom.id and Hom.comp; the category LambdaRingCat.
- `LambdaRing.delta` (data): δ_p(x) = (ψ^p(x) − x^p)/p, well defined by torsion freeness.
- `LambdaRing.toDeltaRing` (compatibility): δ_p is a p-derivation, so A is a δ-ring at p with Frobenius ψ^p in the sense of PrismaticCohomology PR.0, and Λ-maps are δ-maps.
- `LambdaRing.IsPerfect` (data): Every ψ^p is bijective (equivalently every ψ^m).
- `LambdaRing.trivialInt` (example): ℤ (and ℚ) with ψ^m = id; ℚ is perfect.
- `LambdaRing.toric` (example): MvPolynomial I ℤ with ψ^m = MvPolynomial.expand m, so ψ^m(x_i) = x_i^m.
- `LambdaRing.toBigWitt` (compatibility): The structure map s : A → W(A) to the big Witt vectors with gh_m ∘ s = ψ^m (q-Witt 2.31); needs big Witt vectors and the Wilkerson comparison (gap).

**Unit tests.**

- `LambdaRing.toric_adams_computation` (computation): In ℤ[x] with the toric structure, ψ^2(x^2 + 3x) = x^4 + 3x^2 and ψ^2(ψ^3(x)) = ψ^3(ψ^2(x)) = ψ^6(x) = x^6.
- `LambdaRing.toric_congruence` (non-example): In toric ℤ[x], ψ^p(x) − x^p = 0 ∈ pℤ[x], whereas ψ^p(x) − x = x^p − x ∉ pℤ[x] (its coefficient of x is −1): a definition with the congruence 'ψ^p ≡ id mod p' would exclude the toric example.
- `LambdaRing.not_trivial_on_polynomials` (non-example): The identity operations on ℤ[x] are not a Λ-structure: ψ^2(x) − x^2 = x − x^2 ∉ 2ℤ[x]. A definition omitting the congruence would accept it.
- `LambdaRing.int_delta` (degenerate): ℤ with ψ^m = id is a Λ-ring (n^p ≡ n mod p) and δ_2(3) = (3 − 9)/2 = −3.
- `LambdaRing.rat_isPerfect` (degenerate): ℚ with ψ^m = id is a perfect Λ-ring; the congruence is vacuous because pℚ = ℚ.
- `LambdaRing.toric_toDeltaRing` (compatibility): For toric ℤ[x], δ_p(x) = (x^p − x^p)/p = 0, so the PR.0 δ-structure is the one with Frobenius x ↦ x^p.

**Acceptance.**

- ℤ with ψ^m = id and toric ℤ[x] with ψ^m(x) = x^m are Λ-rings; ℤ[x] with ψ^m = id is not.
- ψ^6 = ψ^2 ∘ ψ^3 = ψ^3 ∘ ψ^2 on toric ℤ[x] (both send x to x^6).
- The δ_p of a Λ-ring is a δ-structure in the sense of PR.0 whose Frobenius is ψ^p.
- The name is the arithmetic notion; no Iwasawa algebra is meant (a naming convention, recorded in the coverage note, not a test).

**Used by.**

- HR.1, perfectly-covered and the-colimit-perfection: Faithful flatness and perfection are conditions on the ψ^m.
- HR.1, the-etale-frobenius-lift: ψ^p and the Frobenius congruence give the Frobenius lift on completions of étale algebras.
- HR.4: The q-Witt rings relative to A use s : A → W(A) and the ψ^m (q-Witt 2.31, 2.45).
- HR.5: The coefficients of the equaliser are twisted by the ψ^m.
- HabiroCohomologyFoundations HQ.4/q-v-systems-of-differential-graded-algebras: Imports the Λ-ring base.

**Depends on.** stages: `PrismaticCohomology:PR.0`; libraries: `mathlib:IsAddTorsionFree`, `mathlib:MvPolynomial.expand`, `mathlib:Polynomial.expand`, `mathlib:Polynomial.expand_mul`.

**Sources.**

- `Wagner.qWitt.2024`, q-Witt, 2.31 The trivial map (PDF p.26): “The cofree $\Lambda$-ring under $A$ is the big Witt ring $\IW(A)$, hence we get a section $s\colon A\rightarrow \IW(A)$ of $\gh_1$.” — TeX source, literal. The source's Λ-rings are coalgebras for the big Witt vectors; this roadmap uses the equivalent torsion-free Adams-operation form (comparison: gap).
- `Wagner.qWitt.2024`, q-Witt, 2.31 The trivial map (PDF p.26), displayed formula: “\psi^m(x)\coloneqq \sum_{d\mid m}d\delta_d(x)^{m/d}=\gh_m\bigl(s(x)\bigr)” — TeX source, literal. For m = p this reads ψ^p(x) = x^p + p·δ_p(x), which is the Frobenius congruence ψ^p(x) ≡ x^p mod p.
- `Wagner.qWitt.2024`, q-Witt, 2.31 The trivial map (PDF p.26): “is the \emph{$m$\textsuperscript{th} Adams operation} $\psi^m\colon A\rightarrow A$ of the $\Lambda$-ring $A$. Clearly $\psi^m$ is a ring morphism.” — TeX source, literal: the Adams operations are ring endomorphisms.
- `Wagner.qWitt.2024`, q-Witt, proof of Proposition 2.36 (PDF p.28): “For all primes $p$, $A_{(p)}$ is a $\delta$-ring with injective Frobenius $\psi^p\colon A_{(p)}\rightarrow A_{(p)}$” — TeX source, literal: the Λ-structure gives a δ-ring at each prime with Frobenius ψ^p, the PR.0 interface.
- `Wagner.qHodgeHabiro.2025`, 1.22(e) Perfectly covered Λ-rings, in 1.22 Notation and conventions, §1.4 (PDF p.12): “and for any polynomial ring $\IZ\left[x_i\ \middle|\ i\in I\right]$ equipped with the \emph{toric $\Lambda$-structure} in which $\lambda^n(x_i)=0$ for all $n>1$.” — TeX source, literal. The toric structure; in Adams-operation form ψ^m(x_i) = x_i^m (as q-Witt, proof of Lemma 2.46, PDF p.32, uses it).
- `Wagner.qWitt.2024`, q-Witt, proof of Lemma 2.46 (PDF p.32): “To prove the polynomial ring case, equip $A[\{T_i\}_{i\in I}]$ with a $\Lambda$-$A$-algebra structure via $\psi^p(T_i)\coloneqq T_i^p$.” — TeX source, literal: the toric structure in Adams-operation form.

**Assembly note.** This node predates the HR.1 part. The comparison it records as a gap, between the Adams form and the big Witt coalgebra form, is now planned there: `HR.1/lambda-coalgebra`, `HR.1/adams-to-witt-section`, `HR.1/adams-witt-section-laws` and `HR.1/wilkerson-comparison`, over the carrier of `HR.4/truncated-big-witt-vectors`. The API item `LambdaRing.toBigWitt` is the HR.1 part's `Adams.toWitt` and the restriction to the full truncation set of `BigWittVector.lambdaSection` (`HR.4/truncated-big-witt-vectors`): three names for one map, which the Lean file defines once. REV-HabiroRings--HR.1 asks that the stage prerequisite `PrismaticCohomology:PR.0` become the exact node `PrismaticCohomology:PR.0/torsionfree-frobenius-equivalence`, which the HR.1 part already cites.

### The colimit perfection of a Λ-ring

`HR.1/the-colimit-perfection` · construction · first packet · added by REV-HabiroRings

For a Λ-ring A, the colimit perfection A_∞ is the colimit of the diagram on ℕ ordered by divisibility that sends m to A and d | m to ψ^(m/d) : A → A (equivalently the sequential colimit of A along ψ^2, ψ^3, ψ^4, …), with the Adams operations induced by the ψ^m of A. It is a perfect Λ-ring, the map A → A_∞ from the copy at m = 1 is a Λ-map, and it is initial among Λ-maps from A to perfect Λ-rings: for f : A → B with B perfect, the unique extension sends the class of x in the copy at m to (ψ_B^m)^(-1)(f(x)).

**Hypotheses.**

- A is a Λ-ring (torsion-free form); a filtered colimit of torsion-free rings is torsion free and the Frobenius congruence passes to the colimit.

**Construction.**

1. Form the colimit in commutative rings; the transition maps are ring maps and commute with every ψ^n, so the ψ^n pass to the colimit and satisfy the Λ-ring axioms.
2. ψ^p on A_∞ is bijective: its inverse sends the class of x at stage m to the class of x at stage pm.
3. Universal property: the maps (ψ_B^m)^(-1) ∘ f are compatible with the transition maps because f commutes with the ψ^n, and uniqueness holds on each stage.

**API.**

- `LambdaRing.colimPerfection` (data): The colimit perfection A_∞ with its Λ-structure.
- `LambdaRing.colimPerfection.of` (projection): The Λ-map A → A_∞ from the stage m = 1.
- `LambdaRing.colimPerfection.isPerfect` (instance): A_∞ is perfect.
- `LambdaRing.colimPerfection.lift` (universal-property): For f : A → B a Λ-map to a perfect Λ-ring, the unique Λ-map A_∞ → B with lift ∘ of = f.
- `LambdaRing.colimPerfection.map` (functoriality): A Λ-map A → A' induces A_∞ → A'_∞, with map_id and map_comp.

**Unit tests.**

- `LambdaRing.colimPerfection_toric` (computation): For toric ℤ[x], A_∞ ≅ ℤ[x^a | a ∈ ℚ_{≥0}] (the monoid algebra of ℚ_{≥0}) with ψ^m(x^a) = x^(ma); the class of x at stage m is x^(1/m).
- `LambdaRing.colimPerfection_of_isPerfect` (degenerate): For ℤ, ℚ or any perfect Λ-ring, of : A → A_∞ is an isomorphism.
- `LambdaRing.colimPerfection_lift_apply` (characterisation): For the toric map ℤ[x] → B = ℤ[x^a | a ∈ ℚ_{≥0}], the lift sends the class of x^k at stage m to x^(k/m).

**Acceptance.**

- For a perfect A the map A → A_∞ is an isomorphism.
- A → A_∞ is functorial for Λ-maps.

**Used by.**

- HR.1, perfectly-covered: The third equivalent description of perfect covering is faithful flatness of A → A_∞.
- Wagner, proof after Remark 3.28 (PDF p.37): Commutativity is checked after faithfully flat base change to the colimit perfection.

**Depends on.** this roadmap: `HR.1/lambda-rings-with-commuting-adams-operations`.

**Sources.**

- `Wagner.qWitt.2024`, q-Witt, Remark 2.47 (PDF p.32): “In general, if $A$ is a $\Lambda$-ring for which the map $A\rightarrow A_\infty$ into its colimit perfection is faithfully flat” — TeX source, literal: the colimit perfection is the object of the third description of perfect covering; the source uses it without spelling out the construction.

### Perfectly covered Λ-rings, in three equivalent descriptions

`HR.1/perfectly-covered` · definition · planet “Perfectly covered Λ-rings” · first packet

A Λ-ring A is perfectly covered when there is a faithfully flat Λ-map A → A_∞ into a perfect Λ-ring (Wagner 1.22(e)). The following are equivalent: (i) some faithfully flat Λ-map from A into a perfect Λ-ring exists; (ii) every Adams operation ψ^m : A → A is faithfully flat, i.e. A is faithfully flat as a module over itself through ψ^m; (iii) the canonical map A → A_∞ into the colimit perfection is faithfully flat (the q-Witt paper's definition, Remark 2.47). Examples: ℤ; every perfect Λ-ring; the toric polynomial rings ℤ[x_i | i ∈ I]; the source also asserts it for free Λ-rings (gap). The property is not automatic: ℤ[x,y]/(xy) with ψ^m(x) = x^m, ψ^m(y) = y^m is a torsion-free Λ-ring that is not perfectly covered. With the torsion-free definition of the previous node the source's consequence 'A is p-torsion free' is built in; what later layers use is that A, its étale algebras R and their twists R ⊗_{A,ψ^m} A are p-torsion free, so their derived p-completions are the classical ones (the 'static' remark of 2.7).

**Hypotheses.**

- Faithful flatness is Mathlib's Module.FaithfullyFlat, for A regarded as a module over itself through ψ^m.
- The condition is not automatic; no statement of this roadmap is made for a Λ-ring that is not perfectly covered.
- The source states the free-Λ-ring example without proof; it is a recorded gap, not a claim of this node.

**Construction.**

1. (i) ⇒ (ii): for a faithfully flat Λ-map A → A_∞ into a perfect Λ-ring, (N ⊗_{A,ψ^m} A) ⊗_A A_∞ ≅ N ⊗_{A,ψ^m} A_∞ ≅ N ⊗_A A_∞, the last because ψ^m is an automorphism of A_∞ compatible with A → A_∞; so exactness and faithfulness of N ↦ N ⊗_{A,ψ^m} A can be checked after the faithfully flat base change (q-Witt, footnote (2.3) to Remark 2.47).
2. (ii) ⇒ (iii): A_∞ is a filtered colimit of copies of A along the ψ^m, and a filtered colimit of faithfully flat A-algebras is faithfully flat.
3. (iii) ⇒ (i): A_∞ is perfect (the-colimit-perfection).
4. Examples: a perfect Λ-ring is covered by the identity; for toric ℤ[x_i], ℤ[x_i] is free over ψ^m(ℤ[x_i]) = ℤ[x_i^m] with basis the monomials ∏ x_i^(a_i), 0 ≤ a_i < m (Module.Free.of_basis), hence faithfully flat.
5. Non-example: in A = ℤ[x,y]/(xy) with the toric structure let M be A through ψ^p. Flatness would give Ann_M(x) = Ann_A(x)·M; but Ann_A(x) = yA, Ann_M(x) = {m : x^p m = 0} = yA and Ann_A(x)·M = ψ^p(y)A = y^pA, and y ∉ y^pA.
6. Torsion: A is torsion free by definition; étale (hence flat) A-algebras and their base changes along ψ^m are torsion free, so their derived and classical p-completions agree (DD.1's bounded-torsion criterion).

**API.**

- `LambdaRing.IsPerfectlyCovered` (data): There is a faithfully flat Λ-map from A into a perfect Λ-ring.
- `LambdaRing.isPerfectlyCovered_iff_faithfullyFlat_adams` (characterisation): (i) ⇔ (ii): every ψ^m is faithfully flat.
- `LambdaRing.isPerfectlyCovered_iff_faithfullyFlat_colimPerfection` (characterisation): (i) ⇔ (iii): A → A_∞ is faithfully flat.
- `LambdaRing.IsPerfect.isPerfectlyCovered` (example): A perfect Λ-ring is perfectly covered.
- `LambdaRing.isPerfectlyCovered_int` (example): ℤ is perfectly covered.
- `LambdaRing.isPerfectlyCovered_toric` (example): Toric ℤ[x_i | i ∈ I] is perfectly covered.
- `LambdaRing.not_isPerfectlyCovered_toric_xy` (example): ℤ[x,y]/(xy) with the toric structure is not perfectly covered.
- `LambdaRing.IsPerfectlyCovered.adicCompletion_static` (compatibility): For R flat over A, the derived p-completion of R ⊗_{A,ψ^m} A is the classical AdicCompletion (DD.1).

**Unit tests.**

- `LambdaRing.isPerfectlyCovered_int` (degenerate): ℤ is perfectly covered by the identity ℤ → ℤ, a perfect Λ-ring.
- `LambdaRing.toric_free_over_adams` (computation): ℤ[x] is free over ψ^2(ℤ[x]) = ℤ[x^2] with basis {1, x}; for example x^3 + 5x^2 + 1 = x·x^2 + (5x^2 + 1)·1 with x^2, 5x^2 + 1 ∈ ℤ[x^2].
- `LambdaRing.toric_colimPerfection_free` (characterisation): For toric ℤ[x], A → A_∞ = ℤ[x^a | a ∈ ℚ_{≥0}] is free with basis {x^a : a ∈ ℚ, 0 ≤ a < 1}, in agreement with (ii) ⇔ (iii).
- `LambdaRing.not_isPerfectlyCovered_toric_xy` (non-example): A = ℤ[x,y]/(xy) with ψ^m(x) = x^m, ψ^m(y) = y^m is a torsion-free Λ-ring (a Λ-quotient of toric ℤ[x,y]) whose ψ^p is not flat: y lies in the x-annihilator of A through ψ^p but not in y^pA. A definition that took perfect covering to be automatic, or only required injectivity of the ψ^m, would accept it (every ψ^m is injective here).

**Acceptance.**

- ℤ, every perfect Λ-ring and the toric polynomial rings are perfectly covered.
- The three descriptions agree on the toric example.
- ℤ[x,y]/(xy) with the toric structure is a Λ-ring that is not perfectly covered.
- p-completions of A and of étale A-algebras are static.

**Used by.**

- HR.1, the-etale-frobenius-lift: The source fixes a perfectly covered base (2.7).
- HR.3 and HR.4: Descent and the q-Witt comparison (Theorem 2.9) assume it; q-Witt Remark 2.47 deduces the q-Witt properties relative to A by faithfully flat descent along A → A_∞.
- HR.5: The relative Habiro ring is defined over such a base.
- HabiroCohomologyFoundations HQ.1, HQ.2, HQ.5: Import the perfectly covered base.

**Depends on.** this roadmap: `HR.1/lambda-rings-with-commuting-adams-operations`, `HR.1/the-colimit-perfection`; stages: `DerivedDeRhamCohomology:DD.1`; libraries: `mathlib:Module.FaithfullyFlat`, `mathlib:Module.Flat`, `mathlib:Module.Free.of_basis`, `mathlib:MvPolynomial.expand`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, 1.22(e) Perfectly covered Λ-rings, §1.4 (PDF p.12): “We call a $\Lambda$-ring \emph{perfectly} covered if there exists a faithfully flat $\Lambda$-morphism $A\rightarrow A_\infty$ into a perfect $\Lambda$-ring. Equivalently, the Adams operations $\psi^m\colon A\rightarrow A$ are all faithfully flat (see e.g.\ \cite[Remark~\chref{2.47}]{qWitt}).” — TeX source (the live 1.22(e), not the commented-out §1.1 draft the packet quoted), literal: descriptions (i) and (ii).
- `Wagner.qHodgeHabiro.2025`, 1.22(e), §1.4 (PDF p.12): “This condition is satisfied in many examples of interest; for example, it holds for $\IZ$, for any free $\Lambda$-ring $\IZ\left\{x_i\ \middle|\ i\in I\right\}$,” — TeX source, literal: 'many', not 'all', examples; the free-Λ-ring claim has no proof in the source (gap).
- `Wagner.qWitt.2024`, q-Witt, Remark 2.47 (PDF p.32): “$\Lambda$-rings with the property that $A\rightarrow A_\infty$ is faithfully flat will be called \emph{perfectly covered}.” — TeX source, literal: description (iii), with A_∞ the colimit perfection.
- `Wagner.qWitt.2024`, q-Witt, footnote (2.3) to Remark 2.47 (PDF p.32): “In fact, if \emph{any} faithfully flat morphism of $\Lambda$-rings $A\rightarrow A_\infty$ into a perfect $\Lambda$-ring exists, then the Adams operations $\psi^m\colon A\rightarrow A$ are faithfully flat (and so the map from $A$ into its colimit perfection is faithfully flat as well).” — TeX source, literal: the proof of (i) ⇒ (ii) ⇒ (iii).
- `Wagner.qHodgeHabiro.2025`, 2.7 Relative Habiro rings, §2.2 (PDF pp.15–16): “We also remark that $A$ being perfectly covered implies that $A$ is $p$-torsion free (because this is true for the perfect $\Lambda$-ring $A_\infty$), and so all $p$-completions above are static.” — TeX source, literal: the torsion and staticity consequence.

**Assembly note.** The free Λ-rings that this node lists as a gap are planned by the HR.1 part: `HR.1/free-lambda-ring`, `HR.1/free-lambda-universal-property`, `HR.1/free-adams-local-presentations` and `HR.1/free-lambda-perfect-cover`, which proves every ψ^m on L(I) faithfully flat and so L(I) perfectly covered. It uses this node, so this node cannot cite it; the example is an application, not an input.

### The category of pairs (A, R): étale algebras over perfectly covered Λ-rings

`HR.1/morphisms-of-pairs` · definition · first packet

An étale pair (A, R) is a perfectly covered Λ-ring A together with an étale A-algebra R. A morphism (A, R) → (A', R') is a pair (f, g) of a Λ-ring map f : A → A' and a ring map g : R → R' with g ∘ (A → R) = (A' → R') ∘ f; identities and composition are componentwise. The Λ-compatibility is a condition on f only: R carries no Adams operations, and compatibility of the completed maps ĝ_p with the Frobenius lifts is a theorem (frobLift_naturality of the-etale-frobenius-lift), not an extra condition. Base change along a Λ-map A → A' with A' perfectly covered sends (A, R) to (A', R ⊗_A A').

**Hypotheses.**

- f is a Λ-map (commutes with every ψ^m); g is any ring map over f.
- R and R' are étale over A and A'.

**Construction.**

1. Define objects and morphisms; identity and associativity hold componentwise.
2. Define the forgetful functors to Λ-rings (A, R) ↦ A and to ring maps (A, R) ↦ (A → R).
3. Define base change (A, R) ↦ (A', R ⊗_A A') along a Λ-map A → A' with A' perfectly covered; R ⊗_A A' is étale over A' (Algebra.Etale.baseChange) and the canonical maps form a morphism of pairs.

**API.**

- `EtalePair` (structure): A perfectly covered Λ-ring A with an étale A-algebra R.
- `EtalePair.Hom` (structure): A Λ-map f on bases and a ring map g on algebras with g ∘ algebraMap = algebraMap ∘ f.
- `EtalePair.instCategory` (instance): The category structure, with Hom.id and Hom.comp componentwise.
- `EtalePair.Hom.base` (projection): The Λ-map on bases.
- `EtalePair.Hom.alg` (projection): The ring map on algebras.
- `EtalePair.forget` (functoriality): The forgetful functor to Λ-rings.
- `EtalePair.baseChange` (functoriality): Base change (A, R) ↦ (A', R ⊗_A A') along a Λ-map to a perfectly covered A'.

**Unit tests.**

- `EtalePair.not_hom_of_non_lambda` (non-example): On toric ℤ[x], the ring automorphism f(x) = x + 1 is not a Λ-map: f(ψ^2(x)) = (x + 1)^2 = x^2 + 2x + 1 but ψ^2(f(x)) = x^2 + 1. So (f, f) is not a morphism of pairs (ℤ[x], ℤ[x]) → (ℤ[x], ℤ[x]), although it is a ring map over f.
- `EtalePair.hom_self` (degenerate): Morphisms (A, A) → (A', A') are exactly the Λ-maps A → A' (g = f is forced).
- `EtalePair.conj_frobenius` (characterisation): Complex conjugation g on R = ℤ[i][1/2] gives a morphism (ℤ, R) → (ℤ, R); its 3-adic completion commutes with φ_3 (both are conjugation on ℤ_3[i]) without this being imposed.
- `EtalePair.baseChange_toric` (compatibility): (ℤ, ℤ[i][1/2]) → (ℤ[x], ℤ[x][i][1/2]) along the Λ-map ℤ → toric ℤ[x] is a morphism of pairs, and it is the base change of the first pair.

**Acceptance.**

- A ring map that is not a Λ-map on the base gives no morphism of pairs.
- The pairs (A, A) and Λ-maps between the bases form a full subcategory equivalent to perfectly covered Λ-rings.
- The naturality statements of the later layers are stated for these morphisms (coverage note).

**Used by.**

- HR.1, the-etale-frobenius-lift: frobLift_naturality is stated for these morphisms.
- HR.4, HR.5 and HR.6: Naturality of the q-Witt comparison, of the relative Habiro ring and of the degree-zero identification (stage texts: 'functoriality in pairs (A,R)') is for this category.

**Depends on.** this roadmap: `HR.1/lambda-rings-with-commuting-adams-operations`, `HR.1/perfectly-covered`; libraries: `mathlib:Algebra.Etale`, `mathlib:Algebra.Etale.baseChange`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, §2, opening paragraph (PDF p.13): “Fix a perfectly covered $\Lambda$-ring $A$. The goal of this section is to construct a \emph{relative Habiro ring} $\Hh_{R/A}$ for any étale algebra $R$ over $A$, and to relate this construction to the theory of $q$-Witt vectors.” — TeX source, literal: the objects of the roadmap are pairs (A, R) with R étale over a perfectly covered A. The category of pairs itself is the stage text's requirement ('Morphisms of pairs (A,R) include their Λ-compatibility'); the source does not define it.
- `Wagner.qHodgeHabiro.2025`, Theorem A.1, final paragraph (PDF p.69): “Moreover, if $A\rightarrow A'$ is a map of $\Lambda$-rings such that $A'$ is also $p$-torsion free for all primes~$p$, there's a canonical base change equivalence” — TeX source, literal: the source's functoriality in the base is along maps of Λ-rings.

### The relative Frobenius of an étale algebra in characteristic p is an isomorphism

`HR.1/relative-frobenius-of-an-etale-algebra` · lemma · first packet · added by REV-HabiroRings

Let p be a prime, A an 𝔽_p-algebra and B an étale A-algebra. Then the relative Frobenius F_{B/A} : B ⊗_{A,Frob_A} A → B, b ⊗ a ↦ b^p·a, is an isomorphism of A-algebras. (Wagner 2.7 invokes this as [Stacks, Tag 0EBS] when it checks the linearised Frobenius modulo p; it is in neither pinned library.)

**Hypotheses.**

- B is étale (flat, finitely presented, unramified) over A; the statement fails for smooth non-étale B.

**Proof.**

1. B ⊗_{A,Frob} A is étale over A (Algebra.Etale.baseChange) and B is étale over A, so F_{B/A} is an étale map between étale A-algebras (Algebra.Etale.of_restrictScalars).
2. F_{B/A} is a universal homeomorphism: composed with b ↦ b ⊗ 1 in either order it gives the absolute Frobenius of B, respectively of B ⊗_{A,Frob} A, and absolute Frobenii are the identity on spectra after any base change; in particular F_{B/A} is surjective on spectra and universally injective.
3. Being étale, F_{B/A} has an open-immersion diagonal (Algebra.FormallyUnramified.isOpenImmersion_SpecMap_lmul); being universally injective, its diagonal is surjective (AlgebraicGeometry.universallyInjective_eq_diagonal); so the diagonal is an isomorphism and Spec F_{B/A} is a monomorphism.
4. A flat, quasi-compact, surjective monomorphism of schemes is an isomorphism (AlgebraicGeometry.Flat.isIso_of_surjective_of_mono); hence F_{B/A} is an isomorphism.

**Acceptance.**

- Degenerate: for B = A, F_{A/A} is the identity under A ⊗_{A,Frob} A ≅ A, a ⊗ b ↦ a^p b.
- Computation: for A = 𝔽_3 and B = 𝔽_9 = 𝔽_3[i], Frob_A is the identity, and F_{B/A} is b ↦ b^3, the automorphism i ↦ −i.
- Non-example: for the smooth, non-étale B = 𝔽_p[t], F_{B/A} is t ↦ t^p, whose image 𝔽_p[t^p] misses t.

**Depends on.** libraries: `mathlib:Algebra.Etale`, `mathlib:Algebra.Etale.baseChange`, `mathlib:Algebra.Etale.of_restrictScalars`, `mathlib:frobenius`, `mathlib:Algebra.FormallyUnramified.isOpenImmersion_SpecMap_lmul`, `mathlib:AlgebraicGeometry.universallyInjective_eq_diagonal`, `mathlib:AlgebraicGeometry.Flat.isIso_of_surjective_of_mono`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, 2.7 Relative Habiro rings, §2.2 (PDF p.15): “the linearised Frobenius. It is an equivalence as indicated. Indeed, this can be checked modulo $p$, where it becomes classical; see \cite[\stackstag{0EBS}]{Stacks}.” — TeX source, literal: modulo p the linearised Frobenius is this relative Frobenius; the source only cites Stacks 0EBS, so the lemma is planned here.

### The Frobenius lift on the p-completion of an étale algebra, and the linearised Frobenius

`HR.1/the-etale-frobenius-lift` · construction · planet “The linearised Frobenius” · first packet

Let A be a perfectly covered Λ-ring, R an étale A-algebra and p a prime, and let R̂_p be the p-adic completion. The p-th Adams operation ψ^p of A extends uniquely to a Frobenius lift φ_p : R̂_p → R̂_p, that is, the unique ring endomorphism with φ_p ∘ ι = ι ∘ ψ^p on A (ι : A → R̂_p) and φ_p(x) ≡ x^p mod pR̂_p. The linearised Frobenius φ_{p/A} : (R̂_p ⊗_{A,ψ^p} A)^∧_p → R̂_p, x ⊗ a ↦ φ_p(x)·ι(a), is an isomorphism. All rings involved are p-torsion free, so these classical completions are the derived ones. The construction is natural for morphisms of pairs, compatible with base change along Λ-maps A → A' (φ'_p on (R ⊗_A A')^∧_p is the completed tensor product of φ_p and ψ'^p, and φ_{p/A'} is the completed base change of φ_{p/A}), and φ_p^k is the unique lift of ψ^(p^k), whose linearisation (R̂_p ⊗_{A,ψ^(p^k)} A)^∧_p → R̂_p is the composite of the Frobenius twists of φ_{p/A}, hence also an isomorphism. The completed tensor products are never replaced by uncompleted ones. R itself need not have a ring endomorphism lifting Frobenius at p.

**Hypotheses.**

- A is perfectly covered (the source's standing hypothesis in §2.2); the proof uses only that A is p-torsion free and ψ^p is a Frobenius lift.
- R is étale over A; completions are p-adic.
- Uniqueness is part of the statement and is what gives naturality, base change and iterates.

**Construction.**

1. Regard R̂_p as an A-algebra through A --ψ^p→ A → R̂_p. Then R → R̂_p/p = R/p, x ↦ x^p, is an A-algebra map for this structure because ψ^p(a) ≡ a^p mod p.
2. R is formally smooth over A and R̂_p is p-adically complete (AdicCompletion.isAdicComplete, the ideal (p) being finitely generated), so this map lifts to an A-algebra map R → R̂_p (Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete); the lift is unique because R is formally unramified and ⋂_n p^n R̂_p = 0 (Algebra.FormallyUnramified.ext_of_iInf).
3. Extend to R̂_p by the universal property of the completion (IsAdicComplete.liftRingHom); uniqueness on R̂_p follows from uniqueness on R.
4. The linearised Frobenius is a map of p-adically complete, p-torsion-free rings (R ⊗_{A,ψ^p} A is flat over A); modulo p it is the relative Frobenius of the étale A/p-algebra R/p, an isomorphism by relative-frobenius-of-an-etale-algebra; a map of complete separated p-torsion-free modules that is bijective modulo p is bijective (successive approximation).
5. Naturality, base change and iterates: in each case both sides are ring maps out of R̂_p (or its twist) over the same map on A that agree modulo p, so they coincide by the uniqueness step; iterates of isomorphisms are isomorphisms.
6. Record the non-example of a global lift (test no_global_frobenius).

**API.**

- `frobLift` (data): The Frobenius lift φ_p : R̂_p → R̂_p.
- `frobLift_comp_algebraMap` (simp): φ_p ∘ ι = ι ∘ ψ^p on A.
- `frobLift_sub_pow_mem` (relation): φ_p(x) − x^p ∈ p·R̂_p.
- `frobLift_unique` (extensionality): A ring endomorphism of R̂_p restricting to ψ^p on A and congruent to x ↦ x^p modulo p equals φ_p.
- `frobLift_toDeltaRing` (compatibility): R̂_p is a δ-ring (PrismaticCohomology PR.0) with Frobenius φ_p, and Â_p → R̂_p is a δ-map.
- `linearisedFrob` (data): φ_{p/A} : (R̂_p ⊗_{A,ψ^p} A)^∧_p → R̂_p.
- `linearisedFrob_bijective` (characterisation): φ_{p/A} is an isomorphism (replaces linearisedFrob_equiv).
- `frobLift_naturality` (functoriality): For a morphism of pairs (f, g), ĝ_p ∘ φ_p = φ'_p ∘ ĝ_p.
- `linearisedFrob_baseChange` (compatibility): For A → A' a Λ-map and R' = R ⊗_A A', φ_{p/A'} is the completed base change of φ_{p/A}.
- `frobLift_iterate` (relation): φ_p^k is the unique lift of ψ^(p^k), and its linearisation is an isomorphism (replaces linearisedFrob_iterate).
- `frobLift_self` (example): For R = A, φ_p is the p-completion of ψ^p on Â_p.

**Unit tests.**

- `frobLift_gaussian_inert` (computation): A = ℤ, R = ℤ[i][1/2] (étale over ℤ), p = 3: R̂_3 = ℤ_3[i] and φ_3(i) = −i, because φ_3(i)^2 = −1 and φ_3(i) ≡ i^3 = −i mod 3 while i ≢ −i mod 3.
- `frobLift_gaussian_split` (computation): Same R, p = 5: x^2 + 1 ≡ (x + 2)(x − 2) mod 5, R̂_5 ≅ ℤ_5 × ℤ_5 and φ_5 = id (it fixes the idempotents, since φ_5(e) ≡ e^5 = e mod 5, and ℤ_5 has no other endomorphism).
- `frobLift_self` (degenerate): R = A: φ_p = ψ^p on Â_p and the linearised Frobenius is the identity; for toric A = ℤ[x], φ_p(x) = x^p on ℤ[x]^∧_p.
- `no_global_frobenius` (non-example): A = ℤ, R = ℤ[2^(1/3), 1/6] (étale: 3x^2 is a unit where x^3 = 2). Every ring endomorphism of R is the identity (ℚ(2^(1/3)) has no nontrivial automorphism), and the identity is not a Frobenius lift at 5: x^3 − 2 ≡ (x + 2)(x^2 − 2x − 1) mod 5 with irreducible quadratic factor, so R/5R ≅ 𝔽_5 × 𝔽_25, where x ↦ x^5 is not the identity. Yet φ_5 exists on R̂_5 ≅ ℤ_5 × W(𝔽_25).

**Acceptance.**

- φ_p exists, is unique, and restricts to ψ^p on A.
- φ_{p/A} is an isomorphism.
- φ_p is natural for morphisms of pairs and compatible with base change; φ_p^k linearises to an isomorphism.
- There need not be a global Frobenius endomorphism of R (test no_global_frobenius).

**Used by.**

- HR.3/HR.4 (Wagner 2.7, Theorem 2.9): The prime-edge gluing maps h_d of H_{R/A,m} are induced by φ_{p/A}.
- HR.5 (Wagner Lemma 2.12): The second arrow of the equaliser is the relative Frobenius followed by re-expansion.
- HabiroCohomologyFoundations HQ.3/HQ.4: The twisted q-de Rham complexes are glued along the p-adic Frobenii.

**Depends on.** this roadmap: `HR.1/perfectly-covered`, `HR.1/morphisms-of-pairs`, `HR.1/relative-frobenius-of-an-etale-algebra`; stages: `PrismaticCohomology:PR.0`, `DerivedDeRhamCohomology:DD.1`; libraries: `mathlib:Algebra.Etale`, `mathlib:AdicCompletion`, `mathlib:AdicCompletion.isAdicComplete`, `mathlib:Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`, `mathlib:Algebra.FormallyUnramified.ext_of_iInf`, `mathlib:IsAdicComplete.liftRingHom`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, 2.7 Relative Habiro rings, §2.2 (PDF p.15): “Let $R$ be an étale $A$-algebra. For all primes $p$, the $p$\textsuperscript{th} Adams operation $\psi^p\colon A\rightarrow A$ can be uniquely extended to a Frobenius lift $\phi_p\colon \widehat{R}_p\rightarrow \widehat{R}_p$.” — TeX source, literal: existence and uniqueness of φ_p.
- `Wagner.qHodgeHabiro.2025`, 2.7, displayed map (PDF p.15): “\phi_{p/A}\colon \bigl(\widehat{R}_p\otimes_{A,\psi^p}A\bigr)_p^\complete\overset{\simeq}{\longrightarrow}\widehat{R}_p” — TeX source, literal: the linearised Frobenius with the completed tensor product.
- `Wagner.qHodgeHabiro.2025`, 2.7 (PDF p.15): “the linearised Frobenius. It is an equivalence as indicated. Indeed, this can be checked modulo $p$, where it becomes classical; see \cite[\stackstag{0EBS}]{Stacks}.” — TeX source, literal: the proof strategy, completed by relative-frobenius-of-an-etale-algebra.
- `Wagner.qHodgeHabiro.2025`, Remark 2.8 (PDF p.16): “Thus, there's no reason to expect that $\Hh_{R/A,  m}\simeq R[q]_{(q^m-1)}^\complete$, unless $R$ itself (rather than only its $p$-completions) admits Frobenius lifts for all prime factors $p\mid m$.” — TeX source, literal: the Frobenius lifts live on the p-completions; R itself need not have them.

### Dwork’s ghost-image criterion

`HR.1/dwork-ghost-image` · theorem · HR.1 packet

Let A be a torsion-free commutative ring and let φ_p be a ring endomorphism lifting x ↦ xᵖ modulo p for each prime p. A sequence y_n indexed by positive integers is the ghost sequence of a unique a ∈ W(A) if and only if y_n − φ_p(y_(n/p)) belongs to p^(v_p(n))A for every prime p dividing n. The φ_p need not commute for this criterion.

**Hypotheses.**

- A torsion-free
- one Frobenius lift at each prime.

**Proof.**

1. Use the integer power congruence: u ≡ v mod p implies u^(p^r) ≡ v^(p^r) mod p^(r+1), by binomial expansion and induction.
2. For ghost sequences, separate divisors of n according to their p-adic valuation, as Hesselholt Lemma 1.1 does, to obtain the stated p^(v_p(n)) congruence.
3. Conversely induct on n. With coordinates a_d for proper divisors fixed, set N_n = y_n − Σ_(d|n,d<n) d a_d^(n/d). The congruences imply divisibility by every p^(v_p(n)), hence by n (coprime integer factors and Bézout). Choose a_n with n a_n = N_n; torsion-freeness proves uniqueness.
4. No division in A or inversion of n is part of the definition: existence of the divisible numerator is proved first.

**Acceptance.**

- For A = ℤ and identity φ_p, ghosts (y_1,y_2)=(1,3) force (a_1,a_2)=(1,1).
- (1,2) cannot be the first two ghosts over ℤ. Modulo-p congruence alone at n=p² is insufficient.

**Depends on.** this roadmap: `HR.4/truncated-big-witt-vectors`; libraries: `mathlib:IsAddTorsionFree`.

**Library.** proposed module `TauCeti/RingTheory/Lambda/BigWitt`, namespace `HabiroHR1`.

**Sources.**

- `H`, Lemma 1.1, pp.6–7: “the following (i)–(ii) are equivalent.” — Exactly the integral ghost-image condition; the infinite truncation set is permitted.

### Universal Frobenius polynomials

`HR.1/universal-frobenius-polynomials` · theorem · HR.1 packet

For C = ℤ[c_n | n ≥ 1] there are universal polynomials f_(m,n) giving the nth coordinate of F_m on W. They involve only c_j with j ≤ mn, are homogeneous of weight mn for wt(c_j)=j, and satisfy Σ_(d|n) d f_(m,d)^(n/d) = Σ_(e|mn) e c_e^(mn/e). For prime p, f_(p,n)=p c_(pn)+P_(p,n) with P involving only j<pn, and f_(p,n) ≡ c_nᵖ mod p. These are coordinate congruences, distinct from the Witt-ring congruence F_p(a)≡aᵖ mod pW(A).

**Hypotheses.**

- m,n positive; p prime; arbitrary specialization ring A.

**Proof.**

1. Use the imported finite-divisor Frobenius W_(divisors(mn))→W_(divisors(n)) to define the nth full Frobenius coordinate, and Hesselholt Lemma 1.4 on the universal torsion-free polynomial ring. Compatibility with restriction assembles these coordinates into F_m on W(A); Dwork’s criterion supplies integral universal polynomials.
2. Induct through the ghost equation: the new variable c_(mn) occurs with coefficient mn and the new unknown f_(m,n) with coefficient n. Cancellation gives coefficient m; every other variable has smaller index.
3. The same recursion, retaining integer grading, proves weight mn. Hesselholt Lemma 1.8 proves f_(p,n)≡c_nᵖ mod p by strengthening the numerator congruence before cancelling n.

**Acceptance.**

- f_(2,1)=c_1²+2c_2; f_(2,2)=2c_4−2c_1²c_2−c_2².
- All formulas specialize to rings with torsion; ghost uniqueness is used only over the universal polynomial ring.

**Depends on.** this roadmap: `HR.4/truncated-big-witt-vectors`, `HR.1/dwork-ghost-image`; libraries: `mathlib:MvPolynomial`.

**Library.** proposed module `TauCeti/RingTheory/Lambda/BigWitt`, namespace `HabiroHR1`.

**Sources.**

- `H`, Lemma 1.4, pp.8–9; Lemma 1.8, p.11: “called the nth Frobenius” — Universal polynomial construction; weight and triangular coefficient are derived from the displayed ghost equations. The prime coordinate congruence is Lemma 1.8; the separate Witt-ring congruence has its own prerequisite node.

### The Witt-ring Frobenius congruence

`HR.1/witt-ring-frobenius-congruence` · theorem · HR.1 packet · added by REV-HabiroRings--HR.1

For any commutative ring A, any prime p and any a∈W(A), F_p(a)−aᵖ belongs to pW(A), with multiplication and powers taken in the Witt ring. This is stronger than the coordinate congruence f_(p,n)≡c_nᵖ mod p and supplies the Frobenius lifts on W(C) used in the comonad construction.

**Hypotheses.**

- A arbitrary, including rings with torsion; p prime.

**Proof.**

1. Work first over C=ℤ[c_n] and its universal Witt vector a. Each ghost component of z=F_p(a)−aᵖ is divisible by p in C; define y_n=gh_n(z)/p using integer torsion-freeness.
2. For primes ℓ≠p, the Dwork congruence for y follows from that for z because p is invertible modulo ℓ^vℓ(n). For ℓ=p, expand the ghost sums: the terms indexed by e|pn but e∤n have v_p(e)=v_p(n)+1. The remaining difference of pth powers gains one p-adic power from the elementary power congruence used in Dwork’s criterion.
3. Thus y satisfies Dwork’s criterion with φ_ℓ(c_n)=c_n^ℓ. Obtain b∈W(C) with gh_n(b)=y_n. Ghost injectivity gives z=pb in W(C).
4. Specialize the universal polynomial coordinates of b along C→A. Naturality gives F_p(a)−aᵖ=pb over every A; no ghost cancellation over a ring with torsion is used.

**Acceptance.**

- Divisibility is in the Witt ring, not in the pointwise coordinate ring.
- The theorem applies to A=ℤ/p²ℤ as well as to torsion-free polynomial rings.

**Depends on.** this roadmap: `HR.4/truncated-big-witt-vectors`, `HR.1/dwork-ghost-image`, `HR.1/universal-frobenius-polynomials`; libraries: `mathlib:MvPolynomial`, `mathlib:IsAddTorsionFree`.

**Library.** proposed module `TauCeti/RingTheory/Lambda/BigWitt`, namespace `HabiroHR1`.

**Sources.**

- `H`, Lemma 1.18, p.16: “Let A be an arbitrary ring.” — The full lemma and its Dwork proof establish Witt-ring divisibility for arbitrary A; this is not inferred from Lemma 1.8’s coordinate congruence.

### The big Witt comultiplication

`HR.1/big-witt-comonad` · construction · planet “Big Witt comonad” · HR.1 packet

On the imported full big Witt functor W, construct the natural ring homomorphism Δ_A:W(A)→W(W(A)), characterized universally by outer gh_n(Δ_A(a))=F_n(a). Together with ε_A=gh_1 it satisfies both counit identities and coassociativity, hence is a comonad on commutative rings. The characterization by ghosts alone is asserted as uniqueness for torsion-free A; for arbitrary A, Δ is the specialization of these universal integral polynomials.

**Hypotheses.**

- A any commutative ring; outer ghost takes values in W(A).

**Construction.**

1. Over C=ℤ[c_n], W(C) is torsion-free: the imported injective ghost embeds it into C^ℕ, using Hesselholt Lemma 1.9.
2. Apply Dwork to the sequence (F_n(a)) in W(C). The lifts F_p exist by the separate Witt-ring congruence of Lemma 1.18, and F_n=F_p F_(n/p) makes the required differences zero.
3. Construct Δ on the universal point. Every coordinate is a polynomial in finitely many c_n. Specialize to every A; ring-homomorphism and naturality identities descend from independent universal points.
4. Prove counits and coassociativity by double/triple ghosts over universal torsion-free polynomial rings, then specialize. Double ghosts give gh_m gh_n Δ(a)=gh_(mn)(a).

**API.**

- `BigWitt.comul` (constructor): The ring homomorphism Δ_A for arbitrary A.
- `BigWitt.comul_ghost` (characterisation): Outer gh_n ∘ Δ_A = F_n.
- `BigWitt.comul_natural` (functoriality): W(W(f)) ∘ Δ_A = Δ_B ∘ W(f).
- `BigWitt.comul_counit_left` (relation): gh_1 ∘ Δ_A = id_(W(A)).
- `BigWitt.comul_counit_right` (relation): W(gh_1) ∘ Δ_A = id_(W(A)).
- `BigWitt.comul_assoc` (relation): Δ_(W(A)) ∘ Δ_A = W(Δ_A) ∘ Δ_A.
- `BigWitt.comul_unique` (universal-property): For torsion-free A, any ring map g:W(A)→W(W(A)) with gh_n∘g=F_n for every n equals Δ_A. No pointwise uniqueness by ghosts is asserted for arbitrary A.
- `BigWitt.comul_teichmuller` (compatibility): Δ_A([a])=[[a]] for any commutative A.

**Unit tests.**

- `BigWitt.comul_teichmuller_test` (compatibility): Δ_A([a])=[[a]] for every a.
- `BigWitt.comul_zero_test` (degenerate): Δ_A(0)=0, even for A=ℤ/4ℤ.
- `BigWitt.comul_ghost_six_test` (computation): gh_2(gh_3(Δ_ℤ(a)))=gh_6(a).

**Acceptance.**

- Δ sends a Teichmüller element [a] to [[a]].
- Counit is gh_1, not the entire ghost sequence.

**Used by.**

- Hesselholt Definition 1.21 and Proposition 1.19: Coassociativity defines Λ-coalgebras and their canonical cofree structures.
- Wagner §2.31; HabiroRings HR.4 relative-q-witt-rings: Provides the canonical structure map whose coordinates are the δ_d used in relative formulas.

**Depends on.** this roadmap: `HR.4/truncated-big-witt-vectors`, `HR.1/dwork-ghost-image`, `HR.1/universal-frobenius-polynomials`, `HR.1/witt-ring-frobenius-congruence`.

**Library.** proposed module `TauCeti/RingTheory/Lambda/BigWitt`, namespace `HabiroHR1`.

**Sources.**

- `H`, Proposition 1.19, pp.17–18: “There exists a unique natural ring homomorphism” — The comultiplication and its identities are exactly Proposition 1.19; torsion does not give pointwise ghost uniqueness.

### The Witt comonad identities

`HR.1/big-witt-comonad-laws` · theorem · HR.1 packet

The natural integral Δ satisfies outer gh_n∘Δ=F_n, both counit identities gh_1∘Δ=id and W(gh_1)∘Δ=id, and coassociativity Δ_(W(A))∘Δ=W(Δ)∘Δ. All identities hold on arbitrary commutative rings and are natural in ring maps.

**Hypotheses.**

- A arbitrary commutative ring.

**Proof.**

1. The outer ghost identity is the defining Dwork recursion over the universal point.
2. Prove the two counits and coassociativity by double and triple ghosts over torsion-free universal polynomial rings; the common double ghost is gh_(mn), and the common triple ghost is gh_(mnk).
3. Descend the integral coordinate polynomial identities to arbitrary A. This single simultaneous theorem promotes the comultiplication API identities used by the coalgebra and free constructions.

**Acceptance.**

- Every identity remains valid for A=ℤ/4ℤ; no ghost injectivity on that ring is asserted.

**Depends on.** this roadmap: `HR.1/big-witt-comonad`, `HR.4/truncated-big-witt-vectors`.

**Library.** proposed module `TauCeti/RingTheory/Lambda/BigWitt`, namespace `HabiroHR1`.

**Sources.**

- `H`, Proposition 1.19, pp.17–18: “In addition, the following diagrams” — The source proves these comonad identities together.

### Λ-rings as big Witt coalgebras

`HR.1/lambda-coalgebra` · definition · HR.1 packet

A Λ-coalgebra on a commutative ring A is a ring homomorphism s:A→W(A) with ε_A s=id_A and Δ_A s=W(s)s. A morphism f:(A,s)→(B,t) is a ring homomorphism with W(f)s=tf. Its Adams endomorphism is ψ^n=gh_n s. This notion is defined for all commutative rings; the parent’s Adams description is compared only on torsion-free rings.

**Hypotheses.**

- No torsion-freeness assumption in the coalgebra definition.

**Construction.**

1. Use the imported functor and the comonad node for the two literal equalities of ring homomorphisms.
2. Define morphisms by the displayed commuting square; identity/composition follow functor laws. Define Adams operations by ghost composition, without choosing division.
3. Expose coordinate projections and a coalgebra extensionality theorem: equality of structure maps, equivalently equality of every Witt coordinate, determines the structure. Ghosts alone need torsion-freeness.

**API.**

- `LambdaCoalgebra.adams` (data): ψ^n=gh_n∘s as a ring endomorphism.
- `LambdaCoalgebra.ext` (extensionality): Two coalgebras on A with equal structure maps are equal.
- `LambdaCoalgebra.Hom.id` (constructor): Identity is a coalgebra morphism.
- `LambdaCoalgebra.Hom.comp` (functoriality): Composition of coalgebra morphisms is a coalgebra morphism.
- `LambdaCoalgebra.Hom.adams` (compatibility): A coalgebra morphism commutes with every Adams operation.
- `LambdaCoalgebra.coaction` (projection): The ring map s:A→W(A), with the literal counit and coassociativity equalities as structure fields.
- `LambdaCoalgebra.coord` (projection): coord s n a is the nth Witt coordinate of s(a); it is not generally a ring homomorphism.
- `LambdaCoalgebra.ext_coords` (extensionality): Equality of coord s n a and coord t n a for every a and every positive n gives s=t, without a torsion-free hypothesis.
- `LambdaCoalgebra.Hom.ext` (extensionality): Two coalgebra morphisms with equal underlying ring homomorphisms are equal.
- `LambdaCoalgebra.Hom.comp_toRingHom` (simp): The underlying ring map of g.comp f is g.toRingHom.comp f.toRingHom; identity has underlying RingHom.id.

**Unit tests.**

- `LambdaCoalgebra.adams_one_test` (degenerate): For every coalgebra, ψ¹=id_A.
- `LambdaCoalgebra.adams_two_coord_test` (computation): ψ²(a)=s(a)_1²+2s(a)_2.
- `LambdaCoalgebra.hom_adams_test` (compatibility): Every coalgebra morphism commutes with ψ⁶.

**Acceptance.**

- On W(A) the coaction is Δ_A.
- Equality of Adams operations is not claimed to detect coalgebras on rings with torsion.

**Used by.**

- Wagner §2.31: Makes the source’s structure map and δ_d available without restricting coefficients artificially.
- Borger §1.17: Separates arbitrary-ring Λ-structures from the torsion-free Frobenius-lift description.

**Depends on.** this roadmap: `HR.1/big-witt-comonad`, `HR.1/big-witt-comonad-laws`, `HR.4/truncated-big-witt-vectors`.

**Library.** proposed module `TauCeti/RingTheory/Lambda/BigWitt`, namespace `HabiroHR1`.

**Sources.**

- `H`, Definition 1.21 and Definition 1.23, pp.18–19: “that makes the following diagrams commute.” — Exact coalgebra convention; the symbol s avoids confusing the coaction with exterior λⁿ.

### Adams laws of a Witt coalgebra

`HR.1/coalgebra-adams-laws` · theorem · HR.1 packet

For every Λ-coalgebra s on A, ψ¹=id, ψ^(mn)=ψ^m∘ψ^n, and ψ^p(a)−aᵖ∈pA for each prime p. A coalgebra morphism commutes with them. These laws do not make the converse unique for rings with torsion.

**Hypotheses.**

- A arbitrary commutative ring; m,n positive; p prime.

**Proof.**

1. Apply double ghosts to Δs=W(s)s to get the multiplicative-index law. Apply the counit for index 1.
2. Apply gh_1 to F_p(s(a))−s(a)ᵖ∈pW(A); use the outer ghost equation and coalgebra equation to identify gh_1F_p(s(a)) with ψ^p(a).
3. For morphisms compose the coalgebra square with gh_n and use naturality.

**Acceptance.**

- On the cofree W(A), ψ^n=F_n.
- For the integer binomial structure, all ψ^n are identity.

**Depends on.** this roadmap: `HR.1/lambda-coalgebra`, `HR.1/big-witt-comonad-laws`, `HR.1/universal-frobenius-polynomials`, `HR.1/witt-ring-frobenius-congruence`.

**Library.** proposed module `TauCeti/RingTheory/Lambda/BigWitt`, namespace `HabiroHR1`.

**Sources.**

- `H`, Lemma 1.24, p.19: “The associated Adams operations satisfy” — Composition and Frobenius-lift laws are the source’s Adams operations lemma.

### The Witt section of torsion-free Adams data

`HR.1/adams-to-witt-section` · construction · HR.1 packet

For torsion-free A with the parent’s commuting Adams operations, construct the unique ring homomorphism s_ψ:A→W(A) with gh_n(s_ψ(a))=ψ^n(a). Coordinates c_n(a) are uniquely characterized by n c_n(a)=ψ^n(a)−Σ_(d|n,d<n)d c_d(a)^(n/d). In particular c_1(a)=a and c_p(a)=(ψ^p(a)−aᵖ)/p. This is an integral construction, natural for Adams-compatible ring maps.

**Hypotheses.**

- A torsion-free; ψ as in the accepted parent; m,n positive.

**Construction.**

1. For n divisible by p, ψ^n(a)=ψ^p(ψ^(n/p)(a)); Dwork’s differences are zero. Apply its unique-image criterion to the sequence ψ^n(a).
2. Additivity and multiplicativity of s follow by comparing ghosts, since all ψ^n are ring maps and the ghost map is injective on torsion-free A.
3. The divisor recursion gives coordinates, including the one-prime δ formula. Naturality follows from coordinatewise W(f) and equality of ghosts in the torsion-free target.
4. The coaction equation is the separate Wilkerson comparison node; do not assume any section of gh_1 is automatically a coalgebra.

**API.**

- `Adams.toWitt` (constructor): The integral ring homomorphism s_ψ.
- `Adams.toWitt_ghost` (characterisation): gh_n∘s_ψ=ψ^n.
- `Adams.toWitt_coord_one` (simp): c_1(a)=a.
- `Adams.toWitt_unique` (universal-property): Any ring map with all these ghosts equals s_ψ.
- `Adams.toWitt_natural` (functoriality): For an Adams morphism f into torsion-free B, W(f)s_A=s_Bf.
- `Adams.toWitt_coord_recursion` (characterisation): n c_n(a)=ψ^n(a)−Σ_(d|n,d<n)d c_d(a)^(n/d), so coordinates are integral and unique on torsion-free A.

**Unit tests.**

- `Adams.toWitt_integer_two_test` (computation): For identity Adams on ℤ, s(2)_2=−1 and s(2)_3=−2.
- `Adams.toWitt_zero_test` (degenerate): s_ψ(0)=0.
- `Adams.toWitt_prime_delta_test` (compatibility): p s_ψ(a)_p=ψ^p(a)−aᵖ; c_p is the PR.0 p-derivation on torsion-free rings.

**Acceptance.**

- For ℤ with identity Adams, the first coordinates of s(2) are c_1=2,c_2=−1,c_3=−2.
- For toric ℤ[x], s(x)=[x].

**Used by.**

- HabiroRings:HR.4/relative-q-witt-rings: The c_d(a), Wagner’s δ_d(a), supply the relative relation with Adams ghosts.
- Wagner §2.31: Recovers the cofree-section coordinates of a Λ-ring from the parent’s convention.

**Depends on.** this roadmap: `HR.1/lambda-rings-with-commuting-adams-operations`, `HR.1/dwork-ghost-image`, `HR.4/truncated-big-witt-vectors`; other roadmaps: `PrismaticCohomology:PR.0/torsionfree-frobenius-equivalence`; libraries: `mathlib:IsAddTorsionFree`.

**Library.** proposed module `TauCeti/RingTheory/Lambda/BigWitt`, namespace `HabiroHR1`.

**Sources.**

- `B`, §1.6–1.9 and §1.17, pp.8–10,12–13: “commuting family of Frobenius” — Torsion-free equivalence; the explicit integral recursive proof is Dwork’s lemma as read in H.
- `W`, §2.31, p.26: “The cofree Λ-ring under A is the big Witt ring W(A)” — Identifies exactly the section and ghost formula needed by HR.4.

**Assembly note.** s_ψ is the map the first packet names `LambdaRing.toBigWitt` (`HR.1/lambda-rings-with-commuting-adams-operations`) and `BigWittVector.lambdaSection` at the full truncation set (`HR.4/truncated-big-witt-vectors`). `HR.4/the-lambda-ring-comparison-maps` uses it as "the section s of HR.4/truncated-big-witt-vectors"; this node is its construction.

### Ghosts and naturality of the Adams section

`HR.1/adams-witt-section-laws` · theorem · HR.1 packet

For torsion-free Adams rings A,B, the reconstructed section satisfies gh_n∘s_ψ=ψ^n. It is the unique ring map with these ghosts, and W(f)s_A=s_Bf for every Adams-compatible ring map f:A→B.

**Hypotheses.**

- A,B torsion-free.

**Proof.**

1. Apply Dwork’s defining image condition to each reconstructed section.
2. Ghost injectivity proves uniqueness of the ring map and naturality in a torsion-free target. This promotes the section API identities consumed by Wilkerson comparison.

**Acceptance.**

- For the integer structure the ghosts of s(2) are all 2.

**Depends on.** this roadmap: `HR.1/adams-to-witt-section`, `HR.1/dwork-ghost-image`, `HR.4/truncated-big-witt-vectors`.

**Library.** proposed module `TauCeti/RingTheory/Lambda/BigWitt`, namespace `HabiroHR1`.

**Sources.**

- `W`, §2.31, p.26: “is the mth Adams operation” — The Adams ghost formula; existence and uniqueness are proved with the Dwork source above.

### Wilkerson’s torsion-free comparison

`HR.1/wilkerson-comparison` · theorem · planet “Wilkerson’s theorem” · HR.1 packet

For a torsion-free commutative ring A, Λ-coalgebra structures are in natural bijection with the parent’s Adams structures. The forward map is ψ^n=gh_n s; the inverse is s_ψ from Dwork. Ring homomorphisms between torsion-free objects are coalgebra morphisms if and only if they commute with all Adams operations. Thus the comparison is an equivalence on the torsion-free subcategories, not on all commutative rings.

**Hypotheses.**

- A,B torsion-free.

**Proof.**

1. Adams laws are supplied by the coalgebra-adams-laws node. For the converse, prove Δs_ψ=W(s_ψ)s_ψ using outer ghosts in W(A).
2. For outer n, compare ghosts m in A: both sides equal ψ^(mn)(a) by commuting operations and gh_m s_ψ=ψ^m. The inner ghost is injective; then the outer ghost is injective because W(A) is torsion-free.
3. Apply uniqueness of the Witt section for inverse identities and morphism reflection. These equalities also prove naturality of the structure bijection.
4. Import the existing PR.0 torsion-free Frobenius/delta dictionary for the prime-coordinate interpretation; never identify c_p with exterior λ^p.

**Acceptance.**

- Applied to ℤ it returns the binomial Λ-structure.
- Applied to the free ring below it recovers its constructed coaction.

**Depends on.** this roadmap: `HR.1/coalgebra-adams-laws`, `HR.1/adams-witt-section-laws`, `HR.1/lambda-rings-with-commuting-adams-operations`, `HR.4/truncated-big-witt-vectors`; other roadmaps: `PrismaticCohomology:PR.0/torsionfree-frobenius-equivalence`.

**Library.** proposed module `TauCeti/RingTheory/Lambda/BigWitt`, namespace `HabiroHR1`.

**Sources.**

- `B`, §1.17, pp.12–13: “a λ-ring in the sense of Grothendieck’s Riemann–Roch theory” — Borger states the torsion-free/flat identification; the proof route spells it out through Dwork and double ghost injectivity.
- `H`, Lemma 1.24, p.19 and Proposition 1.19, p.17: “if A is a ring flat over Z” — Matches the torsion-free converse, with no torsionful extrapolation.

### The cofree Λ-ring adjunction

`HR.1/big-witt-cofree-adjunction` · theorem · HR.1 packet

For any commutative ring A, (W(A),Δ_A) is the cofree Λ-ring. For every Λ-coalgebra (B,s_B), ring maps f:B→A correspond bijectively to coalgebra maps f♯:B→W(A), with f♯=W(f)s_B and inverse gh_1∘f♯. This is natural in both variables. In particular W(gh_m)Δ_A=F_m for every positive m.

**Hypotheses.**

- A,B arbitrary, including rings with torsion.

**Proof.**

1. Use naturality and coassociativity of Δ to prove W(f)s_B is a coalgebra map.
2. The two counits prove the bijections inverse without ghost injectivity at B or A.
3. For the last formula, compare double ghosts mn over the universal torsion-free polynomial ring and specialize to arbitrary rings. This is a natural polynomial identity, not an argument using ghosts on torsionful A.

**Acceptance.**

- For f=id_A from a Λ-ring A, the transpose is its own coaction s_A.
- For B=W(A), transpose of gh_1 is id_(W(A)).

**Depends on.** this roadmap: `HR.1/big-witt-comonad-laws`, `HR.1/lambda-coalgebra`.

**Library.** proposed module `TauCeti/RingTheory/Lambda/BigWitt`, namespace `HabiroHR1`.

**Sources.**

- `H`, §2, p.24 (cofree adjunction); Proposition 1.19: “It admits the right adjoint functor” — The right adjoint is W with its comultiplication; gives the all-ring universal property used to construct free Λ-rings.

### Witt addition and generating series

`HR.1/witt-product-addition` · theorem · HR.1 packet · added by REV-HabiroRings--HR.1

For a∈W(A) put P_N(a,t)=∏_(1≤d≤N)(1−a_d t^d). For arbitrary commutative A, a,b∈W(A), and 0≤k≤N, coeff_k P_N(a+b,t)=coeff_k(P_N(a,t)P_N(b,t)). These finite coefficients are natural under ring maps and independent of N once N≥k. Thus the inverse Witt generating series takes Witt addition to ordinary multiplication of power series; substituting −t gives the exterior sum relation.

**Hypotheses.**

- A arbitrary; N,k natural with k≤N; addition a+b is Witt addition.

**Proof.**

1. Work with two universal Witt vectors over the torsion-free ring C=ℤ[a_d,b_d]. The coefficient of t^n in −tP′/P is Σ_(d|n)d a_d^(n/d)=gh_n(a), for n≤N, by expanding the finite factors and their geometric inverses.
2. Ghosts are additive for Witt addition. The logarithmic derivatives of P_N(a+b) and P_N(a)P_N(b) therefore agree through degree N. Their constant terms are 1; recursively cancel n in C to deduce equality of their coefficients through degree N.
3. Each coefficient uses finitely many universal coordinates. Specialize C→A to obtain the identity with no torsion-freeness assumption on A. Coefficients of factors with d>k cannot affect degree k, proving truncation independence; coefficientwise application of a ring map proves naturality.
4. The coefficient expansion uses distinct indices with i_1+⋯+i_r=k, not i_1+2i_2+⋯+ri_r=k. The latter is a misprint in the source’s bijectivity proof, recorded separately as HabiroRings/E13.

**Acceptance.**

- For k=2, coeff_2 P_2(a)=−a_2 and (a+b)_2=a_2+b_2−a_1b_1.
- The identity is valid over ℤ/4ℤ and never treats Witt addition as pointwise coordinate addition.

**Depends on.** this roadmap: `HR.4/truncated-big-witt-vectors`; libraries: `mathlib:MvPolynomial`, `mathlib:IsAddTorsionFree`, `mathlib:PowerSeries`, `mathlib:PowerSeries.coeff`.

**Library.** proposed module `TauCeti/RingTheory/Lambda/BigWitt`, namespace `HabiroHR1`.

**Sources.**

- `H`, Proposition 1.14 and its proof, pp.14–15 (published p.150): “the horizontal maps are isomorphisms.” — This is the finite coefficient form of the natural additive-to-multiplicative Witt series isomorphism. Only its addition identity, not a new infinite-product construction, is needed here.

### Exterior operations from Witt coordinates

`HR.1/exterior-operations` · construction · HR.1 packet

For a Λ-coalgebra (A,s), define λ^n(a) as the coefficient of t^n in γ(s(a))(-t)⁻¹, where γ(c)=∏_(d≥1)(1−c_d t^d)⁻¹. Equivalently use the finite coefficient of ∏_(1≤d≤n)(1−c_d(a)(−t)^d); λ⁰(a)=1. This is the special arithmetic exterior λ convention. The c_d themselves are Witt coordinates, not exterior operations.

**Hypotheses.**

- n natural; A any commutative ring.

**Construction.**

1. The witt-product-addition node gives the coefficientwise generating-series identity and truncation independence. Coefficient n needs only d≤n, so define it by the finite product.
2. Substitute −t and invert γ, giving the finite product formula with signs fixed.
3. Use that s is a ring map and the witt-product-addition identity for the sum relation. Expanding (1+c_1t)(1−c_2t²)(1+c_3t³) gives λ²=−c_2 and λ³=c_3−c_1c_2; the mixed cubic term has a minus sign.
4. Do not replan the general symmetric-function ring: the Witt-coordinate polynomial ring of the free construction below already represents the same functor.

**API.**

- `LambdaCoalgebra.exterior` (constructor): The operation λⁿ at every natural index.
- `LambdaCoalgebra.exterior_zero` (simp): λ⁰(a)=1.
- `LambdaCoalgebra.exterior_one` (simp): λ¹(a)=a.
- `LambdaCoalgebra.exterior_add` (relation): λⁿ(a+b)=Σ_(i=0)^n λⁱ(a)λ^(n−i)(b).
- `LambdaCoalgebra.exterior_natural` (functoriality): A coalgebra morphism preserves all λⁿ.
- `LambdaCoalgebra.exterior_two` (relation): λ²(a)=−s(a)_2 for every commutative A, fixing the exterior/Witt sign convention.
- `LambdaCoalgebra.exterior_three` (relation): λ³(a)=s(a)_3−s(a)_1s(a)_2.
- `LambdaCoalgebra.exterior_zero_element` (simp): λⁿ(0)=0 whenever n>0.

**Unit tests.**

- `LambdaCoalgebra.exterior_integer_two_test` (computation): In the integer binomial Λ-ring, λ²(2)=1 and λ³(2)=0.
- `LambdaCoalgebra.exterior_zero_element_test` (degenerate): λⁿ(0)=0 for n>0.
- `LambdaCoalgebra.exterior_witt_sign_test` (non-example): λ²(a)=−s(a)_2; for a=2 in ℤ these values are 1 and −1 and are unequal.

**Acceptance.**

- λ²(a)=−c_2(a), λ³(a)=c_3(a)−c_1(a)c_2(a).
- On ℤ, λⁿ(k)=binomial(k,n) with integer-valued generalized binomial coefficients.

**Used by.**

- Parent HR.1 free example and Wagner §1.22(e): Pins the exterior-generator convention λⁿ(x)=0, n>1, for toric examples.
- Borger §1.18: Compares the free-ring generator description with classical symmetric functions via triangular exterior coordinates.

**Depends on.** this roadmap: `HR.1/lambda-coalgebra`, `HR.4/truncated-big-witt-vectors`, `HR.1/witt-product-addition`, `HR.1/wilkerson-comparison`; libraries: `mathlib:PowerSeries`, `mathlib:PowerSeries.coeff`.

**Library.** proposed module `TauCeti/RingTheory/Lambda/BigWitt`, namespace `HabiroHR1`.

**Sources.**

- `H`, Remark 1.22, p.18, and Proposition 1.14, p.14: “the nth exterior operation associated with” — The source distinguishes the traditional exterior λ operations from the Witt components of the structure map.

### The free Λ-ring in Witt coordinates

`HR.1/free-lambda-ring` · construction · planet “Free Λ-ring” · HR.1 packet

For a type/set I define L(I)=ℤ[c_(i,n) | i∈I,n≥1], with generator x_i=c_(i,1). Let u_i∈W(L(I)) have coordinates c_(i,n). Define the ring map s_L by s_L(c_(i,n))=(Δ(u_i))_n (outer nth Witt coordinate, a Witt vector in L(I)). It is a Λ-coalgebra. Adams acts by ψ^m(c_(i,n))=(F_m(u_i))_n=f_(m,n) in the ith block. The universal property is stated separately.

**Hypotheses.**

- I arbitrary, possibly empty/infinite.

**Construction.**

1. Use baseline MvPolynomial and eval₂Hom into W(L(I)) to define s_L from the displayed generator values.
2. Use W(gh_1)Δ=id for the counit on each polynomial generator. Coassociativity on each generator follows from the coassociativity identity for Δ and coordinate naturality; use polynomial ring extensionality.
3. The cofree adjunction supplies W(gh_m)Δ=F_m, which proves the displayed Adams formula on each c_(i,n).
4. The additive group is torsion-free by coefficientwise integer cancellation. The alternative exterior coordinates are triangular with leading sign (−1)^(n+1)c_(i,n), so they also freely generate the same polynomial ring.

**API.**

- `FreeLambdaRing.coord` (data): c_(i,n) is the polynomial variable X(i,n).
- `FreeLambdaRing.gen` (constructor): x_i=c_(i,1).
- `FreeLambdaRing.coaction` (structure): The map s_L on polynomial generators above satisfies both coalgebra axioms.
- `FreeLambdaRing.adams_coord` (simp): ψ^m(c_(i,n))=f_(m,n) in the ith block.
- `FreeLambdaRing.reindex` (functoriality): A map I→J induces the coalgebra map c_(i,n)↦c_(r(i),n), respecting identity and composition.
- `FreeLambdaRing.coaction_gen` (simp): s_L(x_i)=u_i, so s_L(x_i)_n=c_(i,n); these coordinates detect a free Λ-morphism from its values on x_i.
- `FreeLambdaRing.lift` (constructor): For an arbitrary-ring coalgebra (A,s) and g:I→A, the coalgebra morphism sending c_(i,n) to s(g(i))_n.
- `FreeLambdaRing.lift_gen` (simp): lift s g sends x_i to g(i).
- `FreeLambdaRing.lift_unique` (extensionality): A coalgebra morphism with the prescribed values g(i) on every x_i equals lift s g, even when A has torsion.
- `FreeLambdaRing.universalProperty` (universal-property): The natural equivalence (I→A) ≃ Hom_Λ(L(I),A), given by lift and restriction to x_i; proved in free-lambda-universal-property.

**Unit tests.**

- `FreeLambdaRing.adams_two_generator_test` (computation): ψ²(x_i)=x_i²+2c_(i,2).
- `FreeLambdaRing.empty_adams_test` (degenerate): L(∅)≃ℤ with identity Adams operations.
- `FreeLambdaRing.exterior_newton_three_test` (compatibility): For the coalgebra’s actual exterior operations e_n=λⁿ(x_i), ψ³(x_i)=x_i³−3x_i e_2+3e_3. The exterior API identifies e_2=−c_(i,2), e_3=c_(i,3)−x_i c_(i,2).
- `FreeLambdaRing.not_toric_test` (non-example): In L({*}), ψ²(x)≠x² because 2c_2≠0.

**Acceptance.**

- For one generator, ψ²(x)=x²+2c_2 and ψ³(x)=x³+3c_3.
- The free Λ-ring is not the toric polynomial ring on the same generator.

**Used by.**

- Wagner §1.22(e), p.12: Supplies the free Λ-ring example of a perfectly covered base.
- Wagner q-Witt §2.33, p.27: Supplies the free all-prime Λ-ring used to prove preservation of torsion-freeness for the partial-Λ left adjoint.

**Depends on.** this roadmap: `HR.1/big-witt-comonad-laws`, `HR.1/lambda-coalgebra`, `HR.1/big-witt-cofree-adjunction`, `HR.1/universal-frobenius-polynomials`, `HR.1/exterior-operations`; libraries: `mathlib:MvPolynomial`, `mathlib:MvPolynomial.eval₂Hom`.

**Library.** proposed module `TauCeti/RingTheory/Lambda/BigWitt`, namespace `HabiroHR1`.

**Sources.**

- `B`, §1.18, p.13: “has a left adjoint denoted” — Free adjoint and representer. The explicit Witt-coordinate coaction is obtained from Hesselholt’s comonad and gives arbitrary generator sets by independent blocks.
- `W`, §2.33, p.27: “for free Λ-rings (possibly in infinitely many generators)” — Confirms polynomial torsion-free freeness is the input to the source’s partial-Λ adjunction.

### The free Λ-ring universal property

`HR.1/free-lambda-universal-property` · theorem · HR.1 packet

For every Λ-coalgebra A, coalgebra maps L(I)→A correspond bijectively to functions I→A. For g:I→A, lift(g) is polynomial evaluation c_(i,n)↦s_A(g(i))_n, sends x_i to g(i), and is the unique coalgebra map doing so. It is natural under maps of I and coalgebra morphisms of A. On torsion-free A this is exactly the parent’s Adams-compatible free adjunction via Wilkerson.

**Hypotheses.**

- A any commutative ring with a coalgebra; no torsion-free restriction for the primary adjunction.

**Proof.**

1. Construct lift(g) using eval₂Hom and the integer ring map. The counit gives lift(g)(x_i)=g(i).
2. On each polynomial variable the coalgebra condition is precisely Δs_A=W(s_A)s_A, after specializing the Δ-polynomials from u_i to s_A(g(i)).
3. If f is a coalgebra map and f(x_i)=g(i), apply coordinates to W(f)s_L(x_i)=s_A(g(i)); the counit of Δ gives s_L(x_i)=u_i, hence f(c_(i,n))=s_A(g(i))_n. Polynomial extensionality gives uniqueness.
4. Evaluation and uniqueness prove naturality, identity and composition of reindexing. Apply Wilkerson for the torsion-free Adams formulation.

**Acceptance.**

- The unique lift x↦2 to the integer Λ-ring sends c_2↦−1 and c_3↦−2.
- Reindexing by identity is identity; an empty generator type gives the unique map from ℤ.

**Depends on.** this roadmap: `HR.1/free-lambda-ring`, `HR.1/wilkerson-comparison`; libraries: `mathlib:MvPolynomial.eval₂Hom`, `mathlib:MvPolynomial.eval₂Hom_X'`.

**Library.** proposed module `TauCeti/RingTheory/Lambda/BigWitt`, namespace `HabiroHR1`.

**Sources.**

- `B`, §1.18, p.13: “has a left adjoint denoted” — Exact free adjunction. The coordinate proof also explains why toric ℤ[x] cannot replace L({*}).

### Local presentations of free Adams operations

`HR.1/free-adams-local-presentations` · theorem · HR.1 packet

Fix a prime p. Give L(I) the module/algebra structure over itself through ψ^p. Over ℤ_(p), this module is free with basis the finitely supported monomials ∏c_(i,n)^r_(i,n) with 0≤r_(i,n)<p. After inverting p it is a polynomial algebra over the source, with additional variables c_(i,j) for p∤j. Both presentations carry the source map ψ^p, rather than the ordinary polynomial scalar action. They are valid for arbitrary I.

**Hypotheses.**

- p prime; arbitrary I; coefficient localization commutes with ψ because ψ fixes integers.

**Proof.**

1. For finite I, grade L(I) by wt(c_(i,n))=n. The multiplication map from the direct sum of source copies, with source weight multiplied by p and shifted by each candidate basis monomial, preserves weight.
2. In each weight this is a square finite integer matrix: unique exponent division a=pq+r gives equality of ranks. The universal Frobenius-polynomial congruence makes its reduction mod p the monomial permutation matrix. Its determinant is a unit in ℤ_(p), so every finite weight map is an isomorphism. Combining weights yields the first basis, containing 1.
3. Over ℤ[1/p], use f_(p,n)=p c_(i,pn)+P with all indices smaller than pn. Recursively solve for every c_(i,pn) in terms of the image variables ψ^p(c_(i,n)) and the additional c_(i,j), p∤j. Reverse substitution gives a polynomial-ring isomorphism, not just generation.
4. For arbitrary I, every polynomial and relation uses finitely many generator blocks. The finite-I presentation is compatible with inclusions; adjoining blocks adds independent restricted monomials/polynomial variables. The filtered union gives the asserted basis and isomorphism without any infinite determinant.

**Acceptance.**

- For p=2 and a single block, the p-local basis includes 1,c_1,c_2,c_1c_2; coefficient exponents are at most one.
- Away 2 the formula c_2=(ψ²(c_1)−c_1²)/2 starts the recursion, with c_1 an additional odd-index variable.
- Do not apply a finite-type Jacobian criterion to the infinite polynomial ring.

**Depends on.** this roadmap: `HR.1/free-lambda-ring`, `HR.1/universal-frobenius-polynomials`; libraries: `mathlib:MvPolynomial`, `mathlib:Module.Free.of_basis`, `mathlib:Matrix.isUnit_iff_isUnit_det`.

**Library.** proposed module `TauCeti/RingTheory/Lambda/BigWitt`, namespace `HabiroHR1`.

**Sources.**

- `Q`, §1.22(e), p.12: “satisfied in many examples of interest” — The source asserts the resulting perfect covering, but supplies no flatness proof. The two presentations here are the derived proof route using Hesselholt’s integral coordinate polynomials, not a quotation of a missing source proof.
- `H`, Lemmas 1.4 and 1.8, pp.8–11: “the Frobenius endomorphism” — The triangular ghost recursion and coordinatewise prime congruence are the precise inputs to the two presentations.

### Free Λ-rings are perfectly covered

`HR.1/free-lambda-perfect-cover` · theorem · HR.1 packet

For every I and every positive m, ψ^m:L(I)→L(I) is faithfully flat. Consequently L(I) is perfectly covered in the parent’s sense, and its canonical map to the colimit perfection L(I)_∞ is faithfully flat and a Λ-map into a perfect Λ-ring.

**Hypotheses.**

- I arbitrary; m positive; faithfulness means the full module or ring-map predicate from Mathlib.

**Proof.**

1. For m=p prime, the two local presentations make ψ^p faithfully flat after base localization at ℤ_(p) and ℤ[1/p]: a nonempty free basis in the first case, and a polynomial ring containing the constant basis vector in the second.
2. At each maximal ideal M of the source L(I), the contraction to ℤ is (p), a different prime ideal, or (0). Choose ℤ_(p) in the first case and ℤ[1/p] otherwise. Further base localization makes the target, with its ψ^p scalar action, free over the localized source L(I)_M with a nonempty basis, so its residue fibre is nonzero.
3. Use Module.flat_iff_of_isLocalization to pass from flatness over L(I)_M to flatness over L(I) of the localized twisted module. These are precisely the hypotheses of Module.flat_of_localized_maximal. The nonzero residue fibres give M·target≠target for every maximal M, as required by Module.FaithfullyFlat. This is local descent with the twisted scalar action, not descent from integer torsion-freeness alone.
4. Factor m into primes, use Adams composition and RingHom.FaithfullyFlat.stableUnderComposition; m=1 is identity. Apply the imported perfectly-covered equivalence and colimit perfection to conclude the covering statement.

**Acceptance.**

- L(∅)=ℤ has identity Adams and is already perfect.
- For one generator ψ² is faithfully flat but not surjective; hence free does not mean perfect.

**Depends on.** this roadmap: `HR.1/free-adams-local-presentations`, `HR.1/coalgebra-adams-laws`, `HR.1/perfectly-covered`, `HR.1/the-colimit-perfection`; libraries: `mathlib:Module.FaithfullyFlat`, `mathlib:Module.flat_of_localized_maximal`, `mathlib:RingHom.FaithfullyFlat`, `mathlib:RingHom.FaithfullyFlat.stableUnderComposition`, `mathlib:RingHom.FaithfullyFlat.iff_flat_and_comap_surjective`, `mathlib:Module.flat_iff_of_isLocalization`.

**Library.** proposed module `TauCeti/RingTheory/Lambda/BigWitt`, namespace `HabiroHR1`.

**Sources.**

- `Q`, §1.22(e), p.12: “for any free Λ-ring” — Exactly the asserted example; the preceding new theorem supplies the omitted proof.
- `W`, Remark 2.47 and footnote (2.3), p.32: “faithfully flat” — Supplies the parent equivalence between all Adams maps faithfully flat and the canonical colimit perfect cover.

## HR.2 — Habiro-complete modules and derived detection

*Coverage in `HabiroRings.json`: partial, 9 nodes.* 9 packet nodes at this stage. Nine nodes from Appendix B, read in full (PDF pp.77–80). habiro-complete-modules (B.1, derived form over A[q^{±1}]); the-two-term-resolution (B.2 proof, with the corrected first arrow); completeness-via-the-factorial-tower (B.2 (a)⇔(b)⇔(c), left adjoint, idempotence, the unit for A = ℤ is HC.1's ring); completeness-on-homotopy-groups (B.2 (a)⇔(d)); the-derived-nakayama-lemma (B.3 with B.5, joint conservativity); the-detection-results (B.4: vanishing, degree bounds, staticity — the input to Theorem 2.9's staticity); the-monoidal-structure (completed tensor product, unit, spectral comparison on Eilenberg–MacLane objects); habiro-complete-solid-spectra (B.6–B.7) and the-solid-comparison-is-bounded-below (B.8, now the source's lemma). The former node text's non-claims — no unrestricted unbounded preservation, no identification of the two completions on all inputs, no naive solid modules over every coefficient ring — are recorded here and as hypotheses of B.8, not as a node. Derived limits keep their lim¹ terms throughout. Remaining: Solid light condensed spectra for B.6–B.8 (gap). Spectral module categories over S[q^{±1}] for the spectral comparison (gap). Decide the HR.2:solid substage (restructure). Gap: 'Solid light condensed spectra have no supplier'. Gap: 'Spectral module categories for the spectral Habiro completion'.

*Coverage in `HabiroRings--HR.2.json`: planned, 5 nodes.* Remaining: Assign and establish G-solid’s generic spectral supplier with the exact written-source/proof contract. Land the existing H.5/E5/DD.1/HC.1/QM.0 supplier interfaces; resolve G-signatures with genuine higher types. Promote the proposed HR.2:solid substage atomically; no data or campaign edits are made here.

The layer has nine nodes in this display: the first packet's seven nodes on Appendix B.1–B.5 and the completed tensor product, and the HR.2 part's two spherical nodes. The first packet's two solid nodes and the HR.2 part's three solid calculations form HR.2:solid, the next section. The HR.2 part is `planned`; it imports the first packet's nine nodes by id and leaves two gaps, G-solid and G-signatures, with ten supplier requests.

- **Habiro-complete objects.**
  - Rr = ℤ[q^{±1}, (q^m − 1)^{−1}] inverts every cyclotomic polynomial. M ∈ D(A[q^{±1}]) is Habiro-complete when RHom(Rr, M) = 0, and M^∧_H = lim_m M^∧_{(q^m − 1)}. Completion is not inverting the q^m − 1: the complete objects are the right orthogonal of the idempotent algebra Rr.
  - Rr has a two-term free resolution, so RHom(Rr, −) has amplitude [0, 1]. The source prints the first arrow with (q; q)_i where 1 − q^i is meant (E8).
  - Completeness is completeness along the factorial tower, M ≃ lim_n M/(q; q)_n ≃ lim_m M^∧_{(q^m − 1)}, and completion is the idempotent left adjoint of the inclusion; for A = ℤ the completion of ℤ[q^{±1}] is the classical Habiro ring of HabiroCyclotomicCompletions HC.1. Completeness is also detected on homotopy groups (B.2(d)).
- **Detection.** Derived Nakayama (B.3, with B.5): the derived reductions modulo the Φ_m(q) are jointly conservative on complete objects, and for static complete modules the underived reductions suffice. Corollary B.4 detects vanishing of each homotopy group, degree bounds and staticity from the cyclotomic reductions. This is the input to the staticity in Theorem 2.9; HR.4 uses it instead of any exactness of completion.
- **The completed tensor product.** M ⊗̂ N = (M ⊗^L N)^∧_H with unit A[q^{±1}]^∧_H makes the complete objects symmetric monoidal and completion symmetric monoidal, by Lurie's Higher Algebra 2.2.1.9, since the kernel of completion is a ⊗-ideal. The HR.2 part records one clarification for the spectral comparison in this node: it is symmetric monoidal only for the HZ[q^{±1}]-relative tensor product; restriction to S[q^{±1}]-modules commutes with completion but is only lax monoidal, and the spherical unit S_H and the static classical Habiro ring are different objects.
- **The spherical versions** (the HR.2 part). Over the spherical group ring S[q^{±1}], the cyclotomic localization T is the telescope along the 1 − q^i, an idempotent E∞-algebra with π_0 T = Rr; it is not the Eilenberg–Mac Lane spectrum of Rr. The spectral Habiro completion L_H M = RHom(fib(S[q^{±1}] → T), M) reflects onto the T-orthogonal modules, with the factorial and divisor-limit descriptions, the Ext sequence on homotopy groups, Nakayama and degree detection, and the unit S_H = L_H S[q^{±1}]. These need StableHomotopyKTheory H.5's spectra and smash products and EnhancedDerivedSheaves E5's module categories, which the part requests; their Lean signatures wait for those carriers (G-signatures).

Derived limits keep their lim¹ terms throughout, and every derived-limit correction to an ordinary completion is planned here: RS-10 makes HR.2 the single owner of the derived Habiro completion, and HabiroCyclotomicCompletions HC.5 compares its ordinary module completion with it.

### Habiro-complete objects and Habiro-completion

`HR.2/habiro-complete-modules` · definition · planet “Habiro-completion” · first packet

Let Rr := ℤ[q^{±1}, {(q^m − 1)^{-1}}_{m ≥ 1}] be the localisation of the Laurent ring inverting every q^m − 1 (equivalently every cyclotomic polynomial Φ_d(q), since q^m − 1 = ∏_{d|m} Φ_d(q)). For a commutative ring A, an object M of the derived ∞-category D(A[q^{±1}]) is Habiro-complete when RHom_{ℤ[q^{±1}]}(Rr, M) ≃ 0 (a condition on the underlying ℤ[q^{±1}]-module); D̂_H(A[q^{±1}]) ⊆ D(A[q^{±1}]) is the full subcategory of Habiro-complete objects, a stable subcategory closed under limits. The Habiro completion is M^∧_H := lim_{m ≥ 1} M^∧_{(q^m − 1)}, the limit over ℕ ordered by divisibility of the derived (q^m − 1)-adic completions, with its canonical map M → M^∧_H. Since q·q^{m−1} = q^m ≡ 1 modulo q^m − 1, completing A[q] or A[q^{±1}] gives the same object, so q is a unit in A[q]^∧_H. Completion is the opposite of inverting the q^m − 1: Rr itself has Habiro completion 0. This is Wagner B.1 in the derived category, which B.1 itself records (D̂(H) ⊆ D(ℤ[q^{±1}])); B.1 states the definition for S[q^{±1}]-module spectra, and the spectral form is the comparison in the-monoidal-structure. That completion is left adjoint to the inclusion, idempotent, and computed by the factorial tower is completeness-via-the-factorial-tower (B.2). The same formula defines M^∧_H for M in D(A[q]): q is a unit modulo q^m − 1, so each M^∧_{(q^m−1)} is an A[q^{±1}]-module, and M^∧_H ≃ (M ⊗_{A[q]} A[q^{±1}])^∧_H, because the cofibre of M → M[1/q] is q-power torsion, on which q^m − 1 acts invertibly. This is the sense in which A[q]^∧_H and the relative Habiro rings over A[q] are Habiro-complete.

**Hypotheses.**

- A is any commutative ring; the stage text asks for the theory over A[q, q^{-1}], and completeness is a property of the underlying ℤ[q^{±1}]-module.
- Rr is an idempotent (localisation) algebra over ℤ[q^{±1}]: Rr ⊗^L Rr ≃ Rr.
- Derived (q^m − 1)-completion is DerivedDeRhamCohomology DD.1's derived completion at a principal ideal.

**Construction.**

1. Define Rr as the localisation of LaurentPolynomial ℤ at the submonoid generated by the q^m − 1, and identify it with the localisation at all Φ_d(q) via prod_cyclotomic_eq_X_pow_sub_one.
2. Define Habiro-completeness by RHom(Rr, −) ≃ 0; closure under limits, fibres and shifts is immediate from exactness of RHom.
3. Define M^∧_H = lim_m M^∧_{(q^m − 1)} over the divisibility poset, using DD.1's (q^m − 1)-completion and the transition maps (q^d − 1) | (q^m − 1).
4. Show that a derived (q^m − 1)-complete object is Habiro-complete (q^m − 1 acts invertibly on Rr), so M^∧_H is a limit of Habiro-complete objects and is Habiro-complete.
5. Show q·q^{m−1} ≡ 1 modulo q^m − 1, so A[q]^∧_{(q^m−1)} ≃ A[q^{±1}]^∧_{(q^m−1)} and q is a unit after completion.

**API.**

- `habiroLocalisation` (data): Rr, with IsLocalization for the submonoid of LaurentPolynomial ℤ generated by the q^m − 1.
- `habiroLocalisation_eq_cyclotomic` (characterisation): Rr is also the localisation at all Φ_d(q), d ≥ 1.
- `IsHabiroComplete` (data): RHom_{ℤ[q^{±1}]}(Rr, M) ≃ 0.
- `habiroCompletion` (data): M^∧_H = lim_{m ≥ 1} M^∧_{(q^m−1)} over the divisibility poset.
- `habiroCompletion.unit` (projection): The canonical map M → M^∧_H.
- `IsHabiroComplete.of_adicComplete` (relation): A derived (q^m − 1)-complete object is Habiro-complete.
- `isHabiroComplete_habiroCompletion` (characterisation): M^∧_H is Habiro-complete.
- `IsHabiroComplete.limit` (structure): Habiro-complete objects are closed under limits, fibres and shifts.
- `isHabiroComplete_iff_restrictScalars` (compatibility): Completeness over A[q^{±1}] is completeness of the underlying ℤ[q^{±1}]-module.
- `habiroCompletion_polynomial_eq_laurent` (relation): A[q]^∧_H ≃ A[q^{±1}]^∧_H; in particular q is a unit in A[q]^∧_H (replaces q_invertible).

**Unit tests.**

- `habiroCompletion_localisation_eq_zero` (non-example): Rr^∧_H ≃ 0, since q^m − 1 is a unit on Rr and so Rr/(q^m − 1) ≃ 0 for every m; and Rr is not Habiro-complete (RHom(Rr, Rr) contains the identity). A definition that confused completion with inverting the q^m − 1 would return Rr.
- `isHabiroComplete_powerSeries` (characterisation): ℤ[[q − 1]] = ℤ[q]^∧_{(q−1)} is Habiro-complete: it is derived (q − 1)-complete and q − 1 acts invertibly on Rr.
- `habiroCompletion_ne_powerSeries` (non-example): ℤ[q^{±1}]^∧_H is not ℤ[[q − 1]]: modulo Φ_2(q) = q + 1, ℤ[[q − 1]]/(q + 1) ≅ ℤ[[t]]/(t + 2) ≅ ℤ_2 (t = q − 1), whereas ℤ[q^{±1}]^∧_H/(q + 1) ≅ ℤ (by the factorial-tower description: on π_0 the tower is constantly ℤ[q]/(q + 1) = ℤ, and on π_1 its transition maps are multiplication by 1 − (−1)^{n+1} ∈ {0, 2}, so its limit and lim^1 vanish).
- `habiroCompletion_q_inverse` (computation): q·(1 + q − q^2) − 1 = −(q;q)_2 = −(1 − q)(1 − q^2), so q is invertible in ℤ[q]/((q;q)_2), a stage of the completion, with inverse 1 + q − q^2.
- `not_isHabiroComplete_laurent` (non-example): ℤ[q^{±1}] is not Habiro-complete: the element Σ_{n ≥ 0} (q;q)_n of lim_N ℤ[q]/(q;q)_N is not the image of a Laurent polynomial f, since otherwise q^s f − q^s Σ_{k<N}(q;q)_k, of degree below N(N+1)/2 = deg (q;q)_N for N large, would be divisible by (q;q)_N and hence zero for all large N, forcing (q;q)_N = 0.

**Acceptance.**

- Rr^∧_H ≃ 0: completing is not adjoining inverses of the q^m − 1.
- ℤ[[q − 1]] is Habiro-complete but is not the Habiro completion of ℤ[q^{±1}].
- q is invertible in A[q]^∧_H.

**Used by.**

- HR.4 (Wagner Theorem 2.9): The staticity proof applies the detection results to the Habiro-complete ring H_{R/A}.
- HR.5: The relative Habiro ring is Habiro-complete; the equaliser comparison is checked in D̂_H.
- HR.6: The exported module interfaces are of these objects.
- HabiroCohomologyFoundations HQ.3 (Wagner Theorem 3.11(a)): The q-Hodge complex functor factors through D̂_H(A[q]).
- HabiroCyclotomicCompletions HC.5/ordinary-versus-derived-completion: Compares the ordinary completion M[q]^ℕ with this derived completion.

**Depends on.** stages: `DerivedDeRhamCohomology:DD.1`, `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E1`; libraries: `mathlib:IsLocalization`, `mathlib:LaurentPolynomial`, `mathlib:Polynomial.cyclotomic`, `mathlib:Polynomial.prod_cyclotomic_eq_X_pow_sub_one`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Appendix B, opening paragraph (PDF p.77): “In this appendix we'll study the \emph{Habiro completion functor} $(-)_\Hh^\complete\coloneqq\limit_{m\in\IN}(-)_{(q^m-1)}^\complete$ and show that it behaves for all practical purposes like completion at a finitely generated ideal.” — TeX source, literal: the completion functor. 'Behaves like completion at a finitely generated ideal' is the source's summary of B.2–B.5, not a statement of this node.
- `Wagner.qHodgeHabiro.2025`, B.1 Habiro-complete spectra (PDF p.77): “let us denote the localisation $\IZ\left[q^{\pm 1},\{(q^m-1)^{-1}\}_{m\in\IN}\right]$ by $\Rr$ and let $\IS_\Rr\coloneqq \IS\left[q^{\pm 1},\{(q^m-1)^{-1}\}_{m\in\IN}\right]$ be its obvious spherical lift.” — TeX source, literal: the localisation Rr.
- `Wagner.qHodgeHabiro.2025`, B.1 (PDF p.77): “That is, $\Mod_{\IS_\Hh}(\Sp)_\Hh^\complete$ consists of those $M\in \Mod_{\IS[q^{\pm 1}]}(\Sp)$ such that $\Hom_{\IS[q^{\pm 1}]}(\IS_\Rr,M)\simeq 0$.” — TeX source, literal: completeness by killing the idempotent S_Rr (spectral form).
- `Wagner.qHodgeHabiro.2025`, B.1 (PDF p.77): “Note that $q$ is already a unit in $\IS_\Hh$, so it doesn't matter whether we complete $\IS[q]$ or $\IS[q^{\pm 1}]$.” — TeX source, literal: q is a unit after completion.
- `Wagner.qHodgeHabiro.2025`, B.1 (PDF p.77): “We also let $\widehat{\Dd}(\Hh)\subseteq \Dd(\IZ[q^{\pm 1}])$ denote the full sub-$\infty$-category of Habiro-complete objects and denote its completed tensor product by $-\clotimes_\Hh-$.” — TeX source, literal: the derived-category version this node states.
- `Wagner.qHodgeHabiro.2025`, Theorem 3.11(a) (PDF p.25): “Let $\widehat{\Dd}_\Hh(A[q])\subseteq \Dd(A[q])$ denote the full sub-$\infty$-category of Habiro-complete objects \embrace{in the sense of \cref{par:HabiroComplete}}.” — TeX source, literal: the source uses the notion over A[q] for the base Λ-ring A, which is why the node is stated over A[q^{±1}].

### The two-term free resolution of the localisation Rr

`HR.2/the-two-term-resolution` · lemma · first packet · added by REV-HabiroRings

Rr has a two-term resolution by free ℤ[q^{±1}]-modules 0 → ⊕_{i ≥ 0} ℤ[q^{±1}] → ⊕_{i ≥ 0} ℤ[q^{±1}] → Rr → 0, where the second arrow sends (a_i) to Σ_{i ≥ 0} a_i/(q;q)_i and the first sends (a_i) to (a_i − (1 − q^i)·a_{i−1})_{i ≥ 0}, with a_{−1} := 0. (The source prints the first arrow as a_i − (q;q)_i·a_{i−1}, which does not compose to zero with its second arrow; see sourceIssues.) Consequently, for every ℤ[q^{±1}]-module N, RHom_{ℤ[q^{±1}]}(Rr, N) has cohomology only in degrees 0 and 1, namely Hom(Rr, N) and Ext^1(Rr, N).

**Hypotheses.**

- (q;q)_i = ∏_{j=1}^{i} (1 − q^j), with (q;q)_0 = 1.

**Proof.**

1. Rr is the sequential colimit of ℤ[q^{±1}] along multiplication by 1 − q^{i+1} from the i-th to the (i+1)-st copy, the i-th copy mapping to Rr by a ↦ a/(q;q)_i; this colimit is Rr because every denominator ∏ (q^{m_j} − 1) divides some (q;q)_N (HC.1/cofinality-of-the-factorial-products).
2. The displayed sequence is the telescope presentation of that sequential colimit: the first arrow is injective (unitriangular), the composite vanishes because (1 − q^i)/(q;q)_i = 1/(q;q)_{i−1}, and exactness in the middle and at Rr are the standard telescope argument.
3. Apply RHom(−, N) to the free resolution.

**Acceptance.**

- With the corrected arrow, e_1 ↦ e_1 − (1 − q^2)e_2 ↦ 1/(1 − q) − (1 − q^2)/((1 − q)(1 − q^2)) = 0; with the printed arrow e_1 ↦ e_1 − (q;q)_2·e_2 ↦ 1/(1 − q) − 1 = q/(1 − q) ≠ 0 (checked symbolically for e_0, …, e_3).
- RHom(Rr, ℤ[q]/(q − 1)) ≃ 0, since q − 1 acts by 0 on the target and invertibly on Rr.
- Hom(Rr, Rr) ≠ 0 (it contains the identity).

**Depends on.** this roadmap: `HR.2/habiro-complete-modules`; other roadmaps: `HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products`, `HabiroCyclotomicCompletions:HC.1/the-factorial-polynomials`; stages: `EnhancedDerivedSheaves:E1`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, B.2, proof (PDF p.78): “Now $\Rr$ has a two-term resolution by free $\IZ[q^{\pm 1}]$-modules.” — TeX source, literal.
- `Wagner.qHodgeHabiro.2025`, B.2, proof (PDF p.78): “where the first arrow sends $(a_i)_{i\geqslant 0}\mapsto (a_i-(q;q)_ia_{i-1})_{i\geqslant 0}$ (with $a_{-1}\coloneqq 0$) and the second arrow sends $(a_i)_{i\geqslant 0}\mapsto\sum_{i\geqslant 0}a_i/(q;q)_i$.” — TeX source, literal; the first arrow is corrected to a_i − (1 − q^i)a_{i−1} (sourceIssues).
- `Wagner.qHodgeHabiro.2025`, B.2, proof (PDF p.77): “\fib\bigl(\IS[q^{\pm 1}]\rightarrow \IS_\Rr\bigr)\simeq \Sigma^{-1}\colimit\left(\IS[q^{\pm 1}]/(q;q)_1\xrightarrow{(1-q^2)}\IS[q^{\pm 1}]/(q;q)_2\xrightarrow{(1-q^3)}\dotsb\right)” — TeX source, literal: the transition maps are multiplication by 1 − q^{n+1}, which is the correction.

### Habiro-completeness is completeness along the factorial tower; completion is the left adjoint

`HR.2/completeness-via-the-factorial-tower` · theorem · first packet · added by REV-HabiroRings

For M ∈ D(A[q^{±1}]) the following are equivalent (Wagner B.2 (a) ⇔ (b) ⇔ (c)): M is Habiro-complete; RHom(Rr, M) ≃ 0; the canonical map M → lim_{n ≥ 1} M/(q;q)_n ≃ lim_{m ≥ 1} M^∧_{(q^m − 1)} is an equivalence, with derived quotients and derived limits. Consequently M ↦ M^∧_H is left adjoint to the inclusion D̂_H(A[q^{±1}]) ⊆ D(A[q^{±1}]), with unit the canonical map, it is idempotent, and its kernel is exactly the Rr-modules. For A = ℤ, ℤ[q^{±1}]^∧_H is static and is the classical Habiro ring lim_N ℤ[q]/((q;q)_N) of HabiroCyclotomicCompletions HC.1.

**Hypotheses.**

- Derived quotients M/(q;q)_n and derived limits throughout; the Milnor lim^1 terms are kept and vanish only under a Mittag-Leffler hypothesis (for example a surjective tower of static objects).
- The source states B.2 for S[q^{±1}]-module spectra; this node is its restriction to D(A[q^{±1}]), where RHom_{S[q^{±1}]}(S_Rr, M) ≃ RHom_{ℤ[q^{±1}]}(Rr, M). The spectral statement is the-monoidal-structure's comparison.

**Proof.**

1. (a) ⇔ (b) is the definition.
2. fib(ℤ[q^{±1}] → Rr) ≃ Σ^{-1} colim_n ℤ[q^{±1}]/(q;q)_n along multiplication by 1 − q^{n+1} (telescope of the-two-term-resolution); hence RHom(fib, M) ≃ lim_n M/(q;q)_n, and (b) says M ≃ RHom(fib, M), which is (c).
3. lim_n M/(q;q)_n ≃ lim_m M^∧_{(q^m − 1)}: the principal ideals ((q;q)_n) and ((q^m − 1)^k) are mutually cofinal under divisibility ((1 − q^m)^k divides (q;q)_{mk}, and (q;q)_n divides (1 − q^{n!})^n; HC.1/cofinality-of-the-factorial-products), and M^∧_{(q^m − 1)} = lim_k M/(q^m − 1)^k (DD.1).
4. Adjunction: M^∧_H is complete (habiro-complete-modules), and the fibre of M → M^∧_H is RHom(Rr, M), an Rr-module, which has no nonzero maps to a complete object; so maps M → N with N complete factor uniquely through M^∧_H. Idempotence and the description of the kernel follow.
5. For M = ℤ[q^{±1}] each ℤ[q]/((q;q)_n) is static and the tower is surjective, so lim^1 = 0 and the limit is the ring lim_n ℤ[q]/((q;q)_n) (HC.1/the-cyclotomic-completion with S = ℕ_{>0}, R = ℤ).

**Acceptance.**

- ℤ[q^{±1}]^∧_H ≅ lim_n ℤ[q]/((q;q)_n) as rings, with no lim^1 correction.
- (M^∧_H)^∧_H ≃ M^∧_H, and Rr-modules have completion 0.
- (1 − q^2)^2 divides (q;q)_4 and (q;q)_3 divides (1 − q^6)^3 (checked symbolically, with the analogous small cases).

**Depends on.** this roadmap: `HR.2/habiro-complete-modules`, `HR.2/the-two-term-resolution`; other roadmaps: `HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products`, `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`; stages: `DerivedDeRhamCohomology:DD.1`, `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E3`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, B.2 Lemma (c) (PDF p.77): “M\longrightarrow \limit_{n\geqslant 1}M/(q;q)_n\simeq \limit_{m\in\IN}M_{(q^m-1)}^\complete” — TeX source, literal: condition (c).
- `Wagner.qHodgeHabiro.2025`, B.2 Lemma (c) (PDF p.77): “is an equivalence. Here $(a;q)_n\coloneqq (1-a)(1-aq)\dotsm(1-aq^{n-1})$ denotes the $q$-Pochhammer symbol, as usual.” — TeX source, literal.
- `Wagner.qHodgeHabiro.2025`, B.1 (PDF p.77): “It'll be apparent from \cref{lem:HabiroComplete} below that the inclusion $\Mod_{\IS_\Hh}(\Sp)_\Hh^\complete\subseteq \Mod_{\IS[q^{\pm 1}]}(\Sp)$ has a left adjoint” — TeX source, literal: the adjunction is a consequence of B.2.

### The Habiro-completed tensor product and its unit

`HR.2/the-monoidal-structure` · construction · first packet

D̂_H(A[q^{±1}]) carries the symmetric monoidal structure M ⊗̂^L_H N := (M ⊗^L_{A[q^{±1}]} N)^∧_H with unit A[q^{±1}]^∧_H (for A = ℤ the classical Habiro ring lim_N ℤ[q]/((q;q)_N) of HabiroCyclotomicCompletions HC.1, not ℤ[q^{±1}]), and Habiro completion D(A[q^{±1}]) → D̂_H(A[q^{±1}]) is symmetric monoidal. The completion is a localisation whose kernel, the Rr-modules, is a ⊗-ideal; so L(x ⊗ y) → L(L(x) ⊗ y) is an equivalence (Wagner 2.1(c)) and [L-HA, Proposition 2.2.1.9] gives the structure. The complete objects are the right orthogonal of the idempotent algebra Rr (the source's 'killing the idempotent'); completion is not the smashing localisation Rr ⊗ −, which inverts the q^m − 1. The spectral version, Mod_{S[q^{±1}]}(Sp)^∧_H with −⊗̂_{S_H}− and unit the spherical Habiro ring S_H, agrees with this one on Eilenberg–MacLane objects: for M ∈ D(ℤ[q^{±1}]), RHom_{S[q^{±1}]}(S_Rr, M) ≃ RHom_{ℤ[q^{±1}]}(Rr, M) because S_Rr ⊗_{S[q^{±1}]} ℤ[q^{±1}] ≃ Rr, so completeness and completion commute with the forgetful functor; this comparison is proved here, not assumed, and its spectral inputs are a recorded gap.

**Hypotheses.**

- The localisation is of the idempotent-killing (complete) kind; its left adjoint is not smashing.
- The unit is the completion of the Laurent ring, not the Laurent ring.
- The spectral comparison is only for objects coming from D(ℤ[q^{±1}]); the spectral module categories are not constructed here (gap).

**Construction.**

1. The fibre of M → M^∧_H is RHom(Rr, M), an Rr-module (completeness-via-the-factorial-tower); Rr-modules are killed by completion, and Rr ⊗ N is an Rr-module for every N.
2. Deduce L(x ⊗ y) ≃ L(L(x) ⊗ y) (Wagner 2.1(c)) and apply [L-HA, Proposition 2.2.1.9] (EnhancedDerivedSheaves E5:abstract) to D(A[q^{±1}]) with its derived tensor product (E1): D̂_H inherits a symmetric monoidal structure and completion is symmetric monoidal.
3. Unit: L(A[q^{±1}]) = A[q^{±1}]^∧_H; for A = ℤ it is lim_N ℤ[q]/((q;q)_N) by completeness-via-the-factorial-tower.
4. Base change along A → A' is compatible with ⊗̂ because completion commutes with the forgetful functor to ℤ[q^{±1}]-modules.
5. Spectral comparison: S_Rr ⊗_{S[q^{±1}]} ℤ[q^{±1}] ≃ Rr gives RHom_{S[q^{±1}]}(S_Rr, M) ≃ RHom_{ℤ[q^{±1}]}(Rr, M) for M ∈ D(ℤ[q^{±1}]); hence the spectral and derived completions and completed tensor products agree there (needs the spectral inputs of the gap).

**API.**

- `habiroTensor` (data): M ⊗̂^L_H N = (M ⊗^L N)^∧_H on D̂_H(A[q^{±1}]).
- `habiroTensor_unit` (characterisation): The unit is A[q^{±1}]^∧_H; for A = ℤ it is the classical Habiro ring.
- `habiroComplete.symmetricMonoidal` (structure): The symmetric monoidal ∞-category structure on D̂_H (replaces habiroTensor_symmetric).
- `habiroCompletion_monoidal` (compatibility): Completion D(A[q^{±1}]) → D̂_H is symmetric monoidal.
- `habiroCompletion_tensor` (relation): (M ⊗^L N)^∧_H ≃ M^∧_H ⊗̂ N^∧_H.
- `habiroCompletion_eq_zero_iff` (characterisation): M^∧_H ≃ 0 iff M is an Rr-module.
- `habiroTensor_baseChange` (functoriality): Base change along A → A' is symmetric monoidal for ⊗̂.
- `habiroComplete_spectral_comparison` (compatibility): For M ∈ D(ℤ[q^{±1}]), RHom_{S[q^{±1}]}(S_Rr, M) ≃ RHom_{ℤ[q^{±1}]}(Rr, M), so spectral and derived Habiro completion and completed tensor products agree on such objects (replaces spectral_comparison).

**Unit tests.**

- `habiroTensor_unit_int` (computation): For A = ℤ the unit is lim_N ℤ[q]/((q;q)_N), in which q is a unit (q·(1 + q − q^2) ≡ 1 mod (q;q)_2 at the second stage); it is not ℤ[q^{±1}] (not_isHabiroComplete_laurent).
- `habiroTensor_torsion` (computation): ℤ[q]/(q^2 − 1) ⊗̂^L_H ℤ[q]/(q^3 − 1) ≃ ℤ ⊕ Σℤ: π_0 = ℤ[q]/(q^2 − 1, q^3 − 1) = ℤ[q]/(q − 1) and π_1 = ker(q − 1 on ℤ[q]/(q^2 − 1)) = ℤ·(1 + q); both are killed by q^2 − 1, so no completion correction occurs, but the derived Tor_1 must be kept. An underived definition would lose π_1.
- `ordinary_tensor_not_complete` (non-example): H ⊗^L_{ℤ[q^{±1}]} H is not Habiro-complete for the Habiro ring H: its completion is H (both sides are ℤ[q]/((q;q)_n) modulo (q;q)_n), but the multiplication H ⊗ H → H on π_0 is not injective, since x ⊗ 1 − 1 ⊗ x ≠ 0 for any x ∈ H outside ℚ(q) (H is an uncountable domain, HabiroCyclotomicCompletions HC.4).
- `habiroCompletion_ne_smashing` (non-example): Rr ⊗ ℤ[[q − 1]] ≠ 0 (it contains ℤ((q − 1)), where q − 1 is inverted) although ℤ[[q − 1]] is complete, while (Rr ⊗ ℤ[[q − 1]])^∧_H ≃ 0: the smashing localisation Rr ⊗ − and Habiro completion are complementary.
- `habiroTensor_unit_law` (degenerate): For complete M, A[q^{±1}]^∧_H ⊗̂ M ≃ M, and 0 ⊗̂ M ≃ 0.

**Acceptance.**

- The unit is the completed Laurent ring.
- Completion is symmetric monoidal: (M ⊗^L N)^∧_H ≃ M^∧_H ⊗̂ N^∧_H.
- The spectral comparison on Eilenberg–MacLane objects is proved, not assumed.

**Used by.**

- HR.5: The base-change statements are about this tensor product.
- HR.6: The exported perfect complexes and invertible modules are for this structure.
- HabiroCohomologyFoundations HQ.3/the-habiro-hodge-complex (Wagner Theorem 3.11(a)): The q-Hodge complex functor is symmetric monoidal into D̂_H(A[q]).
- HabiroNumberFields:HB.7: The modules there are compared with invertible objects here.

**Depends on.** this roadmap: `HR.2/habiro-complete-modules`, `HR.2/completeness-via-the-factorial-tower`; stages: `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E1`, `StableHomotopyKTheory:H.6`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, B.1 (PDF p.77): “We let $-\cotimes_{\IS_\Hh}-$ denote the Habiro-completed tensor product in $\Mod_{\IS_\Hh}(\Sp)_\Hh^\complete$.” — TeX source, literal: the completed tensor product (spectral form; B.1 then names −⊗̂^L_H− on D̂(H)).
- `Wagner.qHodgeHabiro.2025`, B.1 (PDF p.77): “Then $\IS_\Rr$ is an idempotent algebra over $\IS[q^{\pm 1}]$ and we define the \emph{$\infty$-category of Habiro-complete spectra}” — TeX source, literal: the complete objects are defined by killing an idempotent algebra.
- `Wagner.qHodgeHabiro.2025`, 2.1 Setup, condition (c) (PDF p.13): “For all $x,y\in \Dd$ and all $Z\in\Ii$, the canonical morphism $L_Z(x\otimes y)\rightarrow L_Z(L_Z(x)\otimes y)$ is an equivalence in $\Dd$.” — TeX source, literal: the monoidality condition the source uses for such localisations.
- `Wagner.qHodgeHabiro.2025`, 2.1 Setup (PDF p.13): “By \cref{enum:DZSymmetricMonoidal} and \cite[Proposition~\chref{2.2.1.9}]{HA}, for all $Z\in \Ii$, the inclusion of the full sub-$\infty$-operad $\Dd_Z^\otimes\subseteq \Dd^\otimes$ spanned by $\Dd_Z$ admits a symmetric monoidal left adjoint” — TeX source, literal: the Lurie input.

**Assembly note.** The HR.2 part records one clarification of this node (`assemblyClarifications`): the comparison with Eilenberg–Mac Lane objects is symmetric monoidal only for the HZ[q^{±1}]-relative tensor product. Restriction to S[q^{±1}]-modules commutes with completion but is only lax monoidal, and the spherical unit S_H and the static classical Habiro ring are different objects.

### Habiro-completeness is detected on homotopy modules

`HR.2/completeness-on-homotopy-groups` · theorem · first packet · added by REV-HabiroRings

An object M ∈ D(A[q^{±1}]) is Habiro-complete if and only if every homotopy module π_n(M), n ∈ ℤ, is Habiro-complete (Wagner B.2 (a) ⇔ (d)). More precisely there are short exact sequences 0 → Ext^1_{ℤ[q^{±1}]}(Rr, π_{n+1}(M)) → π_n RHom(Rr, M) → Hom_{ℤ[q^{±1}]}(Rr, π_n(M)) → 0 for all n.

**Hypotheses.**

- The source states B.2 for S[q^{±1}]-module spectra; this node is the derived-category case, see completeness-via-the-factorial-tower.

**Proof.**

1. Filter RHom(Rr, M) by RHom(Rr, τ_{≥k}M). The filtration is complete because lim_k τ_{≥k}M ≃ 0 commutes with RHom(Rr, −), and exhaustive because Rr is connective while τ_{≤k−1}M becomes more and more coconnective as k → −∞.
2. Its graded pieces are Σ^k RHom(Rr, π_k M), which live in two adjacent degrees by the-two-term-resolution.
3. Hence the associated spectral sequence degenerates into the displayed short exact sequences, and RHom(Rr, M) ≃ 0 if and only if RHom(Rr, π_n M) ≃ 0 for every n.

**Acceptance.**

- ⊕_{n ≥ 1} Σ^n ℤ[q]/(q^n − 1) is Habiro-complete (each homotopy module is (q^n − 1)-torsion and the sum is also the product), although it is an infinite direct sum.
- ℤ[[q − 1]] ⊕ Σ Rr is not Habiro-complete, because π_1 = Rr is not.

**Depends on.** this roadmap: `HR.2/habiro-complete-modules`, `HR.2/the-two-term-resolution`; stages: `EnhancedDerivedSheaves:E1`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, B.2 Lemma (d) (PDF p.77): “All homotopy groups $\pi_n(M)$, $n\in\IZ$, are Habiro-complete.” — TeX source, literal: condition (d).
- `Wagner.qHodgeHabiro.2025`, B.2, proof (PDF p.78): “Therefore, $\Hom_{\IS[q^{\pm 1}]}(\IS_\Rr,M)$ vanishes if and only if $\RHom_{\IZ[q^{\pm 1}]}(\Rr,\pi_n(M))$ vanishes for all $n\in\IZ$, which proves that $M$ is Habiro-complete if and only if each $\pi_n(M)$ is.” — TeX source, literal: the conclusion, after the short exact sequences.

### The derived Nakayama lemma for Habiro-complete objects, and joint conservativity

`HR.2/the-derived-nakayama-lemma` · lemma · first packet · added by REV-HabiroRings

Let M ∈ D̂_H(A[q^{±1}]). If M/Φ_m(q) ≃ 0 (derived quotient) for every m ≥ 1, then M ≃ 0. If M is static (an ordinary ℤ[q^{±1}]-module) and Habiro-complete, it suffices that the underived quotients M/Φ_m(q)M vanish for every m. The same holds with {Φ_m(q)}_m replaced by {q^m − 1}_m, by {(q;q)_n}_n, or by any set of polynomials in which every Φ_m(q) occurs as a factor at least once (Remark B.5). Hence the derived reductions modulo the Φ_m(q), m ≥ 1, are jointly conservative on Habiro-complete objects.

**Hypotheses.**

- Completeness is essential, and conservativity is joint over all m, not at a single m.
- The source states B.3 for Habiro-complete spectra; this is the derived-category case.

**Proof.**

1. If M/Φ_m ≃ 0 then M^∧_{Φ_m} ≃ 0 by derived Nakayama for a principal ideal (DD.1's conservativity of reduction on derived complete objects); since q^m − 1 = ∏_{d|m} Φ_d(q), M/(q^m − 1) is an iterated extension of the M/Φ_d and vanishes, so M^∧_{(q^m−1)} ≃ 0; then M ≃ lim_m M^∧_{(q^m−1)} ≃ 0 by completeness-via-the-factorial-tower.
2. Static case: if every Φ_m acts surjectively on M, so does every (q;q)_n; if M ≠ 0, the underived limit of the surjective tower M ← M ← ⋯ with transition maps (q;q)_1, (q;q)_2, … is nonzero, it is π_0 of RHom(Rr, M), so M is not complete.
3. Conservativity: a map of complete objects has complete cofibre; apply the first statement to it.
4. Remark B.5: each listed set generates the same completions, so the same proof applies.

**Acceptance.**

- Completeness is needed: Rr ≠ 0 but Rr/Φ_m(q) ≃ 0 for every m.
- Joint, not single: M = ℤ[1/2] with q acting by −1 is Habiro-complete (it is killed by Φ_2(q) = q + 1) and nonzero, yet M/Φ_1(q) = cofib(−2 on ℤ[1/2]) ≃ 0.
- ℚ(q) has surjective multiplication by every Φ_m(q) and is not Habiro-complete.

**Depends on.** this roadmap: `HR.2/completeness-via-the-factorial-tower`, `HR.2/habiro-complete-modules`; stages: `DerivedDeRhamCohomology:DD.1`; libraries: `mathlib:Polynomial.prod_cyclotomic_eq_X_pow_sub_one`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, B.3 Lemma (PDF p.78): “Let $M$ be a Habiro-complete spectrum. If $M/\Phi_m(q)\simeq 0$ for all $m\in\IN$, then $M\simeq 0$. If $M$ is an ordinary $\IZ[q^{\pm 1}]$-module, the same conclusion is already true if the quotients are taken in the underived sense.” — TeX source, literal.
- `Wagner.qHodgeHabiro.2025`, B.3, proof (PDF p.78): “By the usual derived Nayama lemma, if $M/\Phi_m(q)\simeq 0$, then $M_{\Phi_m(q)}^\complete\simeq 0$, hence $M_{(q^m-1)}^\complete\simeq 0$.” — TeX source, literal ('Nayama' is the source's misprint for Nakayama).
- `Wagner.qHodgeHabiro.2025`, B.5 Remark (PDF p.79): “we could equally well replace $\{\Phi_m(q)\}_{m\in\IN}$ by $\{(q^m-1)\}_{m\in\IN}$, or $\{(q;q)_n\}_{n\geqslant 1}$, or any set of polynomials in which each $\Phi_m(q)$ occurs as a factor at least once.” — TeX source, literal: the variants.

### Detection of vanishing homotopy, degree bounds and staticity by cyclotomic reductions

`HR.2/the-detection-results` · theorem · first packet

Let M ∈ D̂_H(A[q^{±1}]) and n ∈ ℤ. If π_n(M/Φ_m(q)) = 0 for every m ≥ 1, then π_n(M) = 0 (Wagner Corollary B.4; by Remark B.5 the Φ_m(q) may be replaced by the q^m − 1 or the (q;q)_n). Consequently, if every derived reduction M/Φ_m(q) has homotopy concentrated in degrees [a, b], so does M; in particular a Habiro-complete object all of whose derived cyclotomic reductions are static is static. This is the detection result through which Wagner proves that H_{R/A} is static (end of the proof of Theorem 2.9), and which HR.4 must use instead of any exactness of completion.

**Hypotheses.**

- M is Habiro-complete; without completeness the conclusion fails.
- The hypothesis is on the derived reductions M/Φ_m(q).
- The source states B.4 for Habiro-complete spectra; this is the derived-category case.

**Proof.**

1. From the long exact sequence of multiplication by Φ_m(q), the underived quotient π_n(M)/Φ_m(q) injects into π_n(M/Φ_m(q)), so it vanishes for every m.
2. π_n(M) is Habiro-complete by completeness-on-homotopy-groups, so the static case of the-derived-nakayama-lemma gives π_n(M) = 0.
3. Degree bounds and staticity: apply this in each degree outside the range.

**Acceptance.**

- Wagner's use: H_{R/A}/Φ_m(q) static for all m implies that H_{R/A} is static.
- Completeness is needed: ΣRr has every derived reduction 0, hence static, but is not static.
- The converse fails: M = ℤ[q]/(q − 1) = ℤ is complete and static, but M/Φ_1(q) ≃ ℤ ⊕ Σℤ is not static.
- No derived inverse limit is replaced by an ordinary one without proof: the proof passes through RHom(Rr, −) and the derived factorial tower.

**Depends on.** this roadmap: `HR.2/the-derived-nakayama-lemma`, `HR.2/completeness-on-homotopy-groups`, `HR.2/habiro-complete-modules`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, B.4 Corollary (PDF p.78): “Let $M$ be a Habiro-complete spectrum and fix $n\in\IZ$. If $\pi_n(M/\Phi_m(q))\cong 0$ for all $m\in\IN$, then already $\pi_n(M)\cong 0$.” — TeX source, literal.
- `Wagner.qHodgeHabiro.2025`, Theorem 2.9, end of proof (PDF p.17): “To conclude the same for $\Hh_{R/A}$, we've seen above that $\Hh_{R/A}/\Phi_m(q)$ is static for all $m\in\IN$. Then \cref{cor:HabiroCompleteDerivedNakayama} can be applied.” — TeX source, literal: the staticity argument HR.4 consumes (\cref{cor:HabiroCompleteDerivedNakayama} is B.4).

### Spherical cyclotomic localization

`HR.2/spherical-rational-localization` · construction · planet “Spherical cyclotomic localization” · HR.2 packet

Put R = S[Z] = S[q±1], the commutative spherical group ring, and P_n = ∏_{i=1}^n(1−q^i), with P_0=1. Construct the E∞ R-algebra T = R[(q^m−1)^{-1} : m≥1] as the sequential telescope R --(1−q)→ R --(1−q²)→ R --(1−q³)→ … on underlying modules, with coherent localization multiplication. T is idempotent: T⊗_R T ≃ T. Its π_0 is the ordinary localization Rr = ℤ[q±1,{(q^m−1)^{-1}}_{m≥1}]. This is a spherical localization, not the Eilenberg–Mac Lane spectrum of Rr.

**Hypotheses.**

- Sp has its closed presentable stable symmetric monoidal structure and integer-indexed homotopy groups.
- Generic E∞ algebras, modules, localizations and relative tensor products are supplied by E5:abstract; the present packet specifies only this arithmetic instance.

**Construction.**

1. Import generic spectral localization; the factors 1−q^m commute and generate the same multiplicative set as the P_n. The countable telescope gives the underlying localization module.
2. Obtain multiplication and its coherence from the generic universal property, not from an arbitrarily chosen equivalence of underlying spectra. The unit T→T⊗_R T is an equivalence by localization.
3. Homotopy groups commute with filtered colimits, so π_kT is π_kR localized at these factors; in particular π_0T=Rr.
4. Use the localization cofiber sequence to identify fib(R→T) with Σ^{-1}colim_n R/P_n, whose transition R/P_n→R/P_{n+1} is multiplication by 1−q^{n+1}.

**API.**

- `SphericalCyclotomicLocalization` (constructor): The commutative R-algebra T with its unit R→T.
- `SphericalCyclotomicLocalization.map` (universal-property): For a commutative R-algebra B in which every q^m−1, m≥1, is invertible, the space of R-algebra maps T→B is contractible; otherwise it is empty.
- `SphericalCyclotomicLocalization.invert` (simp): Multiplication by q^m−1 on T is an equivalence for every m≥1.
- `SphericalCyclotomicLocalization.idempotent` (characterisation): The multiplication T⊗_R T→T is an equivalence of commutative R-algebras.
- `SphericalCyclotomicLocalization.fibre` (equivalence): fib(R→T) ≃ Σ^{-1}colim_{n≥1}R/P_n with transition multiplication by 1−q^{n+1}.
- `SphericalCyclotomicLocalization.pi` (compatibility): π_kT ≅ π_kR[{(q^m−1)^{-1}}_{m≥1}], naturally as ℤ[q±1]-modules.

**Unit tests.**

- `SphericalCyclotomicLocalization.pi_zero` (compatibility): π_0T ≅ Rr as ℤ[q±1]-algebras.
- `SphericalCyclotomicLocalization.first_transition` (computation): The first transition R/P_1→R/P_2 is induced by 1−q², so P_2=P_1(1−q²).
- `SphericalCyclotomicLocalization.cyclotomic_tensor_zero` (degenerate): T⊗_R(R/(q^m−1)) ≃ 0 for every positive m.

**Acceptance.**

- Both telescope transition and cofiber transition use the next factor, not the whole P_{n+1}.
- All m in the localization are strictly positive: including m=0 would invert zero.

**Used by.**

- Wagner B.1–B.2: The right orthogonal to T defines spectral Habiro completeness.
- HabiroRings:HR.2/habiro-complete-modules: The HZ base change identifies T with the ordinary localized ring, supplying the spectral-to-algebraic boundary.

**Depends on.** other roadmaps: `EnhancedDerivedSheaves:E5:abstract/algebra-objects`, `EnhancedDerivedSheaves:E5:abstract/module-objects`, `HabiroCyclotomicCompletions:HC.1/the-factorial-polynomials`; stages: `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheory:H.5:S-delooping`, `EnhancedDerivedSheaves:E5:abstract`.

**Library.** proposed module `TauCeti/Arithmetic/Habiro/Spectra`, namespace `TauCeti.Habiro`.

**Sources.**

- `Wagner.HR2.v2`, Appendix B.1 and proof of B.2, printed/PDF p.77: “its obvious spherical lift” — Defines the localization and its idempotence; the proof gives the fibre telescope.

### Spectral Habiro completion

`HR.2/spectral-habiro-completion` · construction · planet “Spherical Habiro ring” · HR.2 packet

For M∈Mod_R(Sp), define L_H M = RHom_R(fib(R→T),M). The unit M→L_H M is a reflection onto the full subcategory C_H where RHom_R(T,M)=0. There are natural equivalences L_H M ≃ lim_{n≥1}cofib(P_n:M→M) ≃ lim_{m≥1}M^∧_{(q^m−1)}, where the second limit uses divisibility in m and principal derived completions. Put SH=L_H R. The kernel is the T-local module category; it is a tensor ideal. Hence C_H has tensor L_H(M⊗_RN), unit SH and coherent symmetric monoidal structure. Completeness is equivalent to Habiro completeness of every π_kM as a ℤ[q±1]-module. Derived cyclotomic reductions jointly detect zero and each homotopy degree on C_H. These are spectral extensions of the accepted algebraic nodes, not a second theory of derived completion.

**Hypotheses.**

- R,T,P_n are the preceding arithmetic localization.
- All quotients are homotopy cofibres, all limits derived; no boundedness is imposed on the completeness or Nakayama assertions.
- The spectral t-structure is left and right complete; the source convergence argument is used with the two-term localization resolution.

**Construction.**

1. Use the fibre telescope and duality of the perfect principal cofiber R/P_n to identify RHom of the fibre with lim M/P_n. Import the polynomial cofinality and the generic principal derived-completion interface, rather than rebuilding them.
2. Apply RHom_R(−,M) to fib(R→T)→R→T. Its first term RHom_R(T,M) is T-local, while RHom_R(T,L_HM)=0; the triangle therefore proves reflection, idempotence and the kernel statement.
3. The T-local kernel is a tensor ideal, since T is an idempotent localization. Apply HA 2.2.1.9 through E5:abstract to obtain the coherent completed tensor. The inclusion is lax monoidal; completeness is not the assertion SH⊗_RSH≃SH in ordinary spectra.
4. Base change T along R→HZ[q±1] gives H(Rr). For Eilenberg–Mac Lane modules use HA 7.1.2.13 through E5:spectra-comparison. Import the accepted corrected two-term resolution of Rr. The Postnikov filtration of RHom_R(T,M) has graded pieces Σ^kRHom_{ℤ[q±1]}(Rr,π_kM), of amplitude [k−1,k]; the complete/exhaustive filtration and this uniform two-degree bound give the natural short exact sequence in the API. Do not infer unbounded convergence merely from a displayed spectral sequence.
5. Use the accepted algebraic Nakayama and homotopy criterion on π_kM. The cofiber long exact sequence injects the underived quotient π_kM/Φ_m into π_k(M/Φ_m). Thus the vanishing of all degree-k reductions implies π_kM=0; equivalently vanishing of all reductions implies M=0. B.5 permits q^m−1 or P_n instead.

**API.**

- `SpectralHabiroCompletion` (constructor): M↦L_HM with a natural unit η_M:M→L_HM and SH=L_HR.
- `SpectralHabiroCompletion.factorial` (equivalence): L_HM ≃ lim_{n≥1}M/P_n, with transition induced by P_n | P_{n+1}.
- `SpectralHabiroCompletion.adjunction` (universal-property): For complete N, Map_R(L_HM,N)→Map_R(M,N) is an equivalence.
- `SpectralHabiroCompletion.idempotent` (simp): η_{L_HM} and L_H(η_M) are equivalences, agreeing under the reflection coherence.
- `SpectralHabiroCompletion.tensor` (structure): The tensor on C_H is L_H(M⊗_RN); its unit is SH, with associativity, unit and symmetry inherited via monoidal localization.
- `SpectralHabiroCompletion.homotopy_exact` (characterisation): 0→Ext¹_{ℤ[q±1]}(Rr,π_{k+1}M)→π_kRHom_R(T,M)→Hom_{ℤ[q±1]}(Rr,π_kM)→0, naturally in M and k∈Z.
- `SpectralHabiroCompletion.complete_iff_pi` (characterisation): M is complete iff each π_kM is complete in the accepted algebraic sense.
- `SpectralHabiroCompletion.nakayama` (characterisation): If M is complete and M/Φ_m=0 for every positive m, then M=0.
- `SpectralHabiroCompletion.detect_degree` (characterisation): For complete M and k∈Z, π_k(M/Φ_m)=0 for all positive m implies π_kM=0.
- `SpectralHabiroCompletion.restrict_HZ` (compatibility): Under Mod_{HZ[q±1]}≃D(ℤ[q±1]), restriction along R→HZ[q±1] commutes with L_H. The tensor comparison uses the HZ[q±1]-relative tensor followed by completion; restriction to R-modules is only lax monoidal.
- `SpectralHabiroCompletion.map` (functoriality): For an R-linear map u:M→N, L_H(u):L_HM→L_HN is the induced map between the reflections.
- `SpectralHabiroCompletion.map_id` (simp): L_H(id_M)=id_{L_HM}, with the canonical functor coherence.
- `SpectralHabiroCompletion.map_comp` (functoriality): L_H(v∘u)=L_H(v)∘L_H(u), coherently for composable R-linear maps.
- `SpectralHabiroCompletion.unit_naturality` (compatibility): L_H(u)∘η_M=η_N∘u for every R-linear u:M→N.

**Unit tests.**

- `SpectralHabiroCompletion.zero` (degenerate): L_H0≃0.
- `SpectralHabiroCompletion.local_zero` (non-example): L_HT≃0 although π_0T=Rr≠0; localization and completion are different functors.
- `SpectralHabiroCompletion.cyclotomic_fixed` (characterisation): η_{R/(q−1)} is an equivalence; its homotopy groups are complete because 1−q acts by zero.
- `SpectralHabiroCompletion.integral_unit` (compatibility): L_H(HZ[q±1]) ≃ H(H), where H is HC.1’s classical integral Habiro ring. Surjective transition maps and finite-free polynomial quotients eliminate higher derived limits in this case.

**Acceptance.**

- Classical Habiro completion is recovered only on the stated algebraic/static objects, not by deleting derived inverse limits.
- The Ext term uses π_{k+1}M, not π_{k−1}M.
- If every reduction has homotopy supported in the same interval [a,b], then M does too; the interval must be common to all reductions.

**Used by.**

- Wagner B.7 and B.8: Completes the discrete condensed embedding and identifies its unit.
- HabiroRings HR.3–HR.5; HabiroCohomologyFoundations HQ.3–HQ.5: Their algebraic completion and detection stay on the accepted HR.2 algebraic imports; solid foundations are not prerequisites of this path.

**Depends on.** this roadmap: `HR.2/spherical-rational-localization`, `HR.2/the-two-term-resolution`, `HR.2/completeness-via-the-factorial-tower`, `HR.2/completeness-on-homotopy-groups`, `HR.2/the-derived-nakayama-lemma`, `HR.2/the-detection-results`; other roadmaps: `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`, `EnhancedDerivedSheaves:E5:spectra-comparison/late-realisation`, `HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products`; stages: `StableHomotopyKTheory:H.6`, `EnhancedDerivedSheaves:E3`, `DerivedDeRhamCohomology:DD.1`, `EnhancedDerivedSheaves:E5:abstract`.

**Library.** proposed module `TauCeti/Arithmetic/Habiro/Spectra`, namespace `TauCeti.Habiro`.

**Sources.**

- `Wagner.HR2.v2`, B.1–B.5, printed/PDF pp.77–79: “All homotopy groups” — B.2 gives the reflection and homotopy criterion, B.3–B.5 give detection.
- `Lurie.HA.2017`, Proposition 2.2.1.9, printed p.197: “compatible with the O-monoidal structure” — The generic localization input is imported, with tensor-ideal hypothesis verified here.
- `Lurie.HA.2017`, Theorem 7.1.2.13, printed p.1212: “a canonical equivalence of symmetric monoidal” — Only HZ-relative module categories are symmetric monoidally identified with derived categories.

## HR.2:solid — Solid Habiro-complete spectra (proposed sub-layer)

*A proposed sub-layer of HR.2.* Its coverage is HR.2's above. The first packet proposes moving Wagner's B.6–B.8 off the HR.2 critical path into a sub-layer HabiroRings:HR.2:solid, requiring HR.2, VS2 and a supplier of solid spectra; the HR.2 part keeps the proposal and adds its three solid nodes to it (see Structural proposals). The five nodes are displayed here, with their ids unchanged.

- **Habiro-complete solid spectra (B.6–B.7).** In modules over S[q^{±1}] in light solid spectra, Habiro-completeness and completion are defined as in B.1, and the condensed Habiro completion of a discrete spectrum embeds the Habiro-complete spectra fully faithfully, toSolid : Mod_{S_H}(Sp)^∧_H → Mod_{S_H}(Sp■).
- **Lemma B.8.** The solid tensor product preserves bounded-below Habiro-complete objects, so toSolid is symmetric monoidal on bounded-below objects. Nothing is asserted for unbounded objects or for naive solid modules over an arbitrary coefficient ring.
- **The HR.2 part's proof of B.8.** S_H, read as the condensed factorial limit, is solid-idempotent, and the products ∏_ℕ S_H generate. The completed countable free modules C_I = L_H(⊕_n ∏_{I_n} S_H) are colimits over proper profiles f → ∞ of ∏_n ∏_{I_n} J_{f(n)}, J_r = fib(S_H → S_H/P_r). The tensor product of two such is the completed family on the product blocks, by the Gaussian divisibility P_aP_b | P_{a+b} (QSeriesPartitions QM.0) and a lower-envelope profile argument. With the supplier's bounded-below resolution this gives B.8.
- **What is conditional.** All five nodes rest on light solid spectra, which no atlas stage supplies (gap G-solid; VS2 supplies solid abelian groups only). In particular a countable product of condensed complete units is not identified with the condensed completion of an ordinary spectral product without a separate comparison, and the B.7 comparison is used for finite blocks only. RS-10 assigns light solid spectra to the draft roadmap SolidAnalyticRings SA.1 (see Boundaries).

No node of HR.3–HR.7 uses this sub-layer. Its only consumer is HabiroCohomologyFoundations `HQ.6/what-may-not-be-inferred-from-the-analytic-side`, which cites `HR.2/the-solid-comparison-is-bounded-below`.

### Habiro-complete solid condensed spectra and the embedding of Habiro-complete spectra

`HR.2/habiro-complete-solid-spectra` · construction · first packet · added by REV-HabiroRings

Inside Mod_{S[q^{±1}]}(Sp■), for Sp■ the solid light condensed spectra (Wagner B.6), define Habiro-complete objects and Habiro completion as in B.1, with the internal Hom from S_Rr. For an ordinary Habiro-complete spectrum M, let toSolid(M) be the condensed Habiro completion of the discrete condensed spectrum M̲. This defines a fully faithful functor Mod_{S_H}(Sp)^∧_H → Mod_{S_H}(Sp■) (Wagner B.7).

**Hypotheses.**

- The solid formalism of B.6 (light condensed spectra, solidification, solid tensor product) is imported, not constructed here; no supplier stage owns solid spectra yet (gap).
- The source calls full faithfulness 'straightforward' (the unit is still an equivalence); it is a proof obligation of this node.

**Construction.**

1. Define Habiro-completeness in Mod_{S[q^{±1}]}(Sp■) by vanishing of the internal Hom from S_Rr, and completion as lim_n (−)/(q;q)_n.
2. Define toSolid(M) = (M̲)^∧_H.
3. Full faithfulness: evaluation at the point commutes with the countable limit lim_n (−)/(q;q)_n and (M̲/(q;q)_n)(∗) ≃ M/(q;q)_n, so toSolid(M)(∗) ≃ M^∧_H ≃ M for complete M, and the unit of the adjunction is an equivalence.

**API.**

- `IsHabiroCompleteSolid` (data): Habiro-completeness in Mod_{S[q^{±1}]}(Sp■).
- `habiroCompletionSolid` (data): Condensed Habiro completion lim_n (−)/(q;q)_n in Mod_{S[q^{±1}]}(Sp■).
- `toSolid` (data): The functor M ↦ (M̲)^∧_H.
- `toSolid_fullyFaithful` (characterisation): toSolid is fully faithful.
- `toSolid_eval_point` (compatibility): toSolid(M)(∗) ≃ M for Habiro-complete M.

**Unit tests.**

- `toSolid_unit` (computation): toSolid(S_H) = S_H ≃ lim_n S[q^{±1}]/(q;q)_n, each stage a finite direct sum of copies of S (rank n(n+1)/2, the degree of (q;q)_n).
- `toSolid_torsion` (degenerate): For M killed by a power of some q^m − 1 (for example ℤ[q]/(q − 1) = ℤ), toSolid(M) is the discrete condensed spectrum M̲: no completion occurs.
- `toSolid_sum_ne_discrete` (non-example): The discrete condensed spectrum of ⊕_{n ∈ ℕ} S_H is not Habiro-complete in Sp■; toSolid applied to (⊕_n S_H)^∧_H is its condensed completion colim_{f → ∞} ∏_n (q;q)_{f(n)} S_H, not the discrete sum.

**Acceptance.**

- toSolid(M)(∗) ≃ M for complete M.

**Used by.**

- HR.2, the-solid-comparison-is-bounded-below (B.8): B.8 is the monoidality of this functor on bounded-below objects.
- HabiroCohomologyFoundations HQ.6: The only condensed input of the cohomology roadmap.

**Depends on.** this roadmap: `HR.2/habiro-complete-modules`, `HR.2/completeness-via-the-factorial-tower`; stages: `VStackSheavesAndLisseCategories:VS2`, `StableHomotopyKTheory:H.6`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, B.6 Solid condensed recollections (PDF p.79): “Let $\Cond(\Sp)$ denote the $\infty$-category of \emph{\embrace{light} condensed spectra}, that is, hypersheaves of spectra on the site of light profinite sets as defined by Clausen and Scholze \cite{AnalyticStacks}.” — TeX source, literal: the imported setting.
- `Wagner.qHodgeHabiro.2025`, B.7 Habiro-complete solid condensed spectra (PDF p.79): “To every ordinary Habiro-complete spectrum~$M$, we can associate a Habiro-complete solid condensed spectrum by taking the condensed Habiro-completion of the associated discrete condensed spectrum $\underline{M}$.” — TeX source, literal: the functor.
- `Wagner.qHodgeHabiro.2025`, B.7 (PDF p.79): “which is still fully faithful, since it's straightforward to check that the unit is still an equivalence.” — TeX source, literal: the full-faithfulness claim, a proof obligation here.

### Bounded-below Habiro-complete objects are closed under the solid tensor product (Lemma B.8)

`HR.2/the-solid-comparison-is-bounded-below` · theorem · first packet

The solidified tensor product −⊗■_{S_H}− preserves bounded below Habiro-complete objects of Mod_{S_H}(Sp■). In particular the fully faithful functor toSolid : Mod_{S_H}(Sp)^∧_H → Mod_{S_H}(Sp■) of habiro-complete-solid-spectra is symmetric monoidal, for the Habiro-completed tensor product on the source and the solid tensor product over S_H on the target, when restricted to bounded below objects (Wagner Lemma B.8). Nothing is asserted for unbounded objects or for naive solid modules over an arbitrary coefficient ring.

**Hypotheses.**

- M and N are bounded below and Habiro-complete.
- The solid formalism is imported (gap on solid spectra); VS2 supplies the qualified solid formalism for modules over rings.
- The source gives a proof sketch only, by analogy with the p-complete case.

**Proof.**

1. S_H is idempotent in Mod_{S[q^{±1}]}(Sp■): each stage of S_H ≃ lim_n S[q^{±1}]/(q;q)_n is a finite sum of copies of S, ∏_ℕ S ⊗■ ∏_ℕ S ≃ ∏_{ℕ×ℕ} S, so S_H ⊗■ S_H ≃ lim_m S[q_1, q_2]^∧_{(q_1^m − 1, q_2^m − 1)}, and ⊗■ over S[q^{±1}] identifies q_1 with q_2.
2. Likewise ∏_ℕ S ⊗■ S_H ≃ ∏_ℕ S_H, so Mod_{S_H}(Sp■) is compactly generated by shifts of ∏_ℕ S_H.
3. Habiro completion is a countable limit and commutes with ω_1-filtered colimits; reduce to M, N the completions of countable sums ⊕_n ∏_{I_n} S_H.
4. (⊕_n S_H)^∧_H ≃ colim_{f → ∞} ∏_n (q;q)_{f(n)} S_H; the divisibility (q;q)_a (q;q)_b | (q;q)_{a+b} (q-binomial coefficients are integral) and a reindexing of growth functions identify M ⊗■ N with the completion of the sum over ℕ × ℕ, which is Habiro-complete.
5. Symmetric monoidality of toSolid on bounded-below objects follows.

**Acceptance.**

- (q;q)_1·(q;q)_1 = (1 − q)^2 divides (q;q)_2 = (1 − q)(1 − q^2), with quotient 1 + q, the q-binomial coefficient [2 choose 1]_q.
- S_H ⊗■_{S[q^{±1}]} S_H ≃ S_H.
- Bounded below is a hypothesis: no statement is made for unbounded objects.

**Depends on.** this roadmap: `HR.2/habiro-complete-solid-spectra`, `HR.2/the-monoidal-structure`; stages: `VStackSheavesAndLisseCategories:VS2`, `StableHomotopyKTheory:H.6`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, B.8 Lemma (PDF p.79): “The solidified tensor product $-\soltimes_{\IS_\Hh}-$ preserves bounded below Habiro-complete objects.” — TeX source, literal.
- `Wagner.qHodgeHabiro.2025`, B.8 Lemma (PDF p.79): “In particular, the fully faithful functor $\Mod_{\IS_\Hh}(\Sp)_\Hh^\complete\rightarrow \Mod_{\IS_\Hh}(\Sp_\solid)$ from \cref{par:HabiroCompleteCondensed} is symmetric monoidal when restricted to bounded below objects.” — TeX source, literal.
- `Wagner.qHodgeHabiro.2025`, B.8, proof sketch (PDF p.79): “The proof is analogous to the proof that the solid tensor product preserves bounded below $p$-complete objects” — TeX source, literal: only a sketch, citing CS24 Lecture 6 and Bosco A.3.
- `Wagner.qHodgeHabiro.2025`, B.8, proof sketch (PDF p.80): “Observe that $(q;q)_{f(m)}(q;q)_{g(n)}$ divides $(q;q)_{f(m)+g(n)}$, because $q$-binomial coefficients are polynomials in $\IZ[q]$.” — TeX source, literal: the arithmetic input.

### Solid idempotence of the Habiro unit

`HR.2/solid-habiro-unit-idempotence` · theorem · planet “Solid Habiro unit” · HR.2 packet

In light solid spectra, regard SH as the condensed factorial limit lim_n R/P_n. Then multiplication SH⊗■_RSH→SH is an equivalence of commutative algebras. Moreover (∏_NS)⊗■SH≃∏_NSH, and shifts of ∏_NSH compactly generate Mod_SH(Sp■). The comparison identifies this SH with the image of the spherical complete unit under the accepted B.7 embedding.

**Hypotheses.**

- The proposed light-solid-spectra supplier has proved solidification, the countable product tensor formula and the associated tower and relative-base-change lemmas; these are recorded in gap G-solid.
- Each finite stage R/P_n is the module cofiber of P_n and is equivalent as an S-module to d_n=n(n+1)/2 spheres. Use the monic associate (−1)^nP_n for division; its constant term is a unit, so q is invertible in the quotient. The spectral basis comparison and split tower are proved from the HC.1 polynomial basis, not assumed from the word quotient.
- All generic light-solid input statements remain conditional on gap G-solid; this node does not claim a written proof of that unassigned supplier contract.

**Proof.**

1. Divide by the monic associate (−1)^nP_n to obtain the integral basis 1,q,…,q^(d_n−1). The corresponding map from d_n spheres to the module cofiber R/P_n is an equivalence on every homotopy group: monic division works with coefficients π_kS, since the leading coefficient is a unit. Polynomial representatives give S-linear sections of R/P_{n+1}→R/P_n. Obtain the countable-product model of SH from this split tower, retaining the R-action; the splittings themselves are only S-linear.
2. Invoke the supplier’s countable-product solid tensor formula and its compatibility with the split finite-free towers to compute SH⊗■SH by the double tower in independent q_1,q_2. This is an absolute solid tensor computation.
3. Invoke relative base change (derived identification q_1=q_2) and the same tower compatibility to get SH⊗■_RSH≃SH. A pointwise evaluation calculation alone does not justify exchanging relative tensor and the double limit; that supplier obligation remains in G-solid.
4. Apply the product formula to (∏_NS)⊗■SH. Import the generic compact generator Null■≃∏_NS and the module-category generator theorem; extension of scalars gives ∏_NSH.

**Acceptance.**

- P_1 quotient has rank 1, P_2 quotient rank 3; these are sums of spheres, not degree-zero abelian groups.
- Idempotence is asserted in the solid tensor category, not in ordinary Mod_R(Sp).
- The unit multiplication and generator equivalence retain their module actions.

**Depends on.** this roadmap: `HR.2/spectral-habiro-completion`, `HR.2/habiro-complete-solid-spectra`; other roadmaps: `EnhancedDerivedSheaves:E5:abstract/module-objects`, `HabiroCyclotomicCompletions:HC.1/the-factorial-polynomials`; stages: `EnhancedDerivedSheaves:E5:abstract`, `HabiroCyclotomicCompletions:HC.1`.

**Library.** proposed module `TauCeti/Arithmetic/Habiro/Solid`, namespace `TauCeti.Habiro`; Lean name `SolidHabiroUnit.idempotent`.

**Sources.**

- `Wagner.HR2.v2`, Proof of B.8, printed/PDF pp.79–80, first two paragraphs: “SH is idempotent” — The statement and finite-stage/countable-product proof sketch occur here.
- `Wagner.Thesis.2025`, §5.3, printed p.86 (PDF p.90), paragraph defining Null_R: “is a compact generator of” — Supplies the compact generator recollection; the supplier must still prove it.

### Completed countable free solid modules

`HR.2/completed-countable-free-solid-modules` · construction · planet “Completed countable free modules” · HR.2 packet

For a sequence of countable sets I_n, put F_I=⊕_{n∈N}∏_{i∈I_n}SH in Mod_SH(Sp■), and C_I=L_HF_I. Let W consist of f:N→N tending to infinity: for every k, f(n)≥k for all sufficiently large n. Give W reverse pointwise order: an arrow f→g means f(n)≥g(n) for all n. Define J_r=fib(SH→SH/P_r), equivalently the principal ideal with specified multiplication map P_r:SH→SH, and J_0=SH. Then C_I ≃ colim_{f∈W}∏_n∏_{i∈I_n}J_{f(n)}, with arrows the ideal inclusions. This is an equivalence of complete solid SH-modules, natural in SH-linear finite-support block maps as specified in the map API. The ideal notation denotes fibre objects and maps, not an untyped subset of a spectrum.

**Hypotheses.**

- All I_n are countable, including empty and finite sets.
- Use the light solid supplier’s product/tower and bounded-below realization inputs (G-solid); the integral topology and factorial polynomials remain owned by HC.1.
- All generic light-solid input statements remain conditional on gap G-solid; this node does not claim a written proof of that unassigned supplier contract.

**Construction.**

1. Identify F_I/P_r through the principal cofiber, finite-stage sphere bases and the countable product formula. Its tower completion describes families uniformly tending to zero in the block index, with the same weight bound for all i∈I_n.
2. For any such uniformly null family, choose a proper weight f with the family landing in ∏_{n,i}J_{f(n)}. Conversely every proper weight is uniformly null modulo each P_r. The supplier must justify this at the spectrum/hypersheaf level, including higher homotopy, not merely on degree-zero point sections.
3. The reverse order is filtered: min(f,g) is still proper and receives the ideal-inclusion arrows from f and g. Prove the colimit equivalence and naturality under finite-support block maps.
4. For singleton or finite blocks, compare C_I with the condensed completion of the discrete ordinary spectral coproduct using B.7 and preservation of finite products by the discrete functor. For genuinely infinite product blocks, keep C_I as a solid construction: B.7 alone does not identify ∏_i e(SH) with e(∏_i SH). Any such identification requires a separate comparison, since the discrete functor need not preserve countable products; it is not an input to the tensor calculation.

**API.**

- `CountableSolidHabiroFree` (constructor): For a countable block family I, construct C_I=L_H(⊕_n∏_{i∈I_n}SH).
- `CountableSolidHabiroFree.ideal` (data): J_r is fib(SH→SH/P_r), with transition J_s→J_r for r≤s induced by P_r | P_s.
- `CountableSolidHabiroFree.null_family` (equivalence): C_I ≃ colim_{f→∞}∏_{n,i∈I_n}J_{f(n)}, natural in finite-support block maps.
- `CountableSolidHabiroFree.inclusion` (constructor): The nth block map ∏_{i∈I_n}SH→C_I is the completed coproduct injection.
- `CountableSolidHabiroFree.ext` (extensionality): For complete Q, restriction to the block inclusions gives Map(C_I,Q)≃∏_n Map(∏_{i∈I_n}SH,Q).
- `CountableSolidHabiroFree.complete` (characterisation): RHom_R(T,C_I)=0, and C_I→lim_r C_I/P_r is an equivalence.
- `CountableSolidHabiroFree.transition` (functoriality): If f≥g pointwise, the profile transition is ∏J_{f(n)}→∏J_{g(n)}; min(f,g) gives a common target.
- `CountableSolidHabiroFree.map` (functoriality): For an SH-linear finite-support block map u:F_I→F_J, define C(u)=L_H(u):C_I→C_J. A finite-support block map means each input block map factors through a finite subcoproduct of output blocks.
- `CountableSolidHabiroFree.map_id` (simp): C(id_{F_I})=id_{C_I}.
- `CountableSolidHabiroFree.map_comp` (functoriality): C(v∘u)=C(v)∘C(u) for composable finite-support block maps, with the reflection coherence.
- `CountableSolidHabiroFree.inclusion_naturality` (compatibility): For such u, C(u)∘η_{F_I}∘ι_n=η_{F_J}∘u∘ι_n, where ι_n includes the nth input block.

**Unit tests.**

- `CountableSolidHabiroFree.empty` (degenerate): If every I_n is empty then C_I=0.
- `CountableSolidHabiroFree.one_block` (computation): If I_0 is a singleton and every other I_n is empty then C_I≃SH.
- `CountableSolidHabiroFree.constant_not_null` (non-example): For singleton blocks, the constant family (1,1,…) in ∏_NSH is not in the image of C_I→∏_NSH: modulo P_1=1−q (the same ideal as q−1) it is nonzero in infinitely many coordinates.
- `CountableSolidHabiroFree.decaying_family` (characterisation): For singleton blocks the maps P_n:SH→SH in the nth coordinate assemble to a map SH→C_I, since n↦n is a proper weight.

**Acceptance.**

- For singleton blocks the model is the null-sequence formula used on p.80 of B.8.
- The profile is independent of i within each block; separate unbounded weights per element would give a different formula.
- The colimit orientation is from larger weights/smaller ideals to smaller weights/larger ideals.

**Used by.**

- Wagner proof of B.8, p.80: This family is the countable free model on which solid tensor closure is calculated.
- HabiroRings:HR.2/the-solid-comparison-is-bounded-below: Compact generation, ω₁-filtered colimits and uniformly bounded-below resolutions reduce the target to these blocks.

**Depends on.** this roadmap: `HR.2/solid-habiro-unit-idempotence`, `HR.2/habiro-complete-solid-spectra`, `HR.2/spectral-habiro-completion`; other roadmaps: `HabiroCyclotomicCompletions:HC.1/topology-completeness-and-universal-property`; stages: `EnhancedDerivedSheaves:E5:abstract`.

**Library.** proposed module `TauCeti/Arithmetic/Habiro/Solid`, namespace `TauCeti.Habiro`.

**Sources.**

- `Wagner.HR2.v2`, Proof of B.8, printed/PDF p.80, completed sum formula: “the Habiro-completions of countable direct sums” — The construction includes countable product blocks, not just singleton summands.
- `Bosco.2023`, Lemma A.4 and its proof, printed/PDF p.93: “partially ordered by the relation of pointwise inequality” — The p-adic null-family analogue explains uniform decay and inclusion orientation; it does not prove the spectral statement.

### Countable solid Habiro tensor comparison

`HR.2/countable-solid-habiro-tensor` · theorem · HR.2 packet

For countable block families I,J, the canonical map C_I⊗■_SHC_J→L_H(F_I⊗■_SHF_J) is an equivalence; its target is the completed countable family indexed by (m,n) with blocks I_m×J_n. Thus this tensor is Habiro-complete. Combined with the supplier’s uniformly bounded-below resolution and ω₁-filtered-colimit compatibility, this discharges the accepted B.8 target for all bounded-below complete spectra: e(M)⊗■_SHe(N)≃e(L_H(M⊗_RN)), where e is the accepted B.7 embedding. There is no assertion for arbitrary unbounded objects.

**Hypotheses.**

- I_m,J_n are countable.
- For the final B.8 consequence, M,N have uniform integer lower homotopy bounds (which may differ).
- The generic solid supplier supplies the product tensor and bounded-below reduction; until G-solid is resolved the final consequence is conditional.
- All generic light-solid input statements remain conditional on gap G-solid; this node does not claim a written proof of that unassigned supplier contract.

**Proof.**

1. Apply null-family models, colimit preservation of solid tensor and the solid product formula. In singleton notation the tensor is colim_{f,g→∞}∏_{m,n}(P_{f(m)}P_{g(n)})SH. Keep the module structure and the countable blocks.
2. Import Gaussian-polynomial integrality from QM.0: P_aP_b divides P_{a+b} in ℤ[q]. For every radial proper h:N²→N, construct proper f,g with f(m)+g(n)≤h(m,n). One construction uses the increasing proper lower envelope a(k)=min{h(m,n):m+n≥k} and f(k)=g(k)=⌊a(k)/2⌋.
3. Check both cofinal containment directions: P_hSH⊆P_{f+g}SH⊆P_fP_gSH for that choice of f,g; for fixed f,g, P_fP_gSH⊆P_max(f,g)SH, and max(f(m),g(n)) is radial proper. Consequently the product-ideal colimit agrees with the colimit over all radial proper h, not merely a one-sided inclusion.
4. Identify the radial null-family colimit with the factorial completion of the double coproduct using a bijection N²≃N respecting finite subsets; proper means finite sublevel sets, so the model is enumeration independent.
5. For the full B.8 target, import the compact generator ∏_NSH, express arbitrary generator sums by ω₁-filtered unions of countable subsums, and use commutation of countable limits with ω₁-filtered colimits. Resolve connective objects by simplicial countable/product-block models and use a spectral-sequence/realization argument with a common lower bound to commute completion with these realizations. The generic supplier must prove these steps; Bosco A.3 is an algebraic p-adic template, not that proof. After shifting the two bounds, the comparison follows by colimit preservation of solid tensor.

**API.**

- `CountableSolidHabiroTensor.comparison` (equivalence): C_I⊗■_SHC_J ≃ L_H(F_I⊗■_SHF_J), naturally in countable block families.
- `CountableSolidHabiroTensor.factorial_mul_dvd` (compatibility): For a,b∈N, P_aP_b divides P_{a+b} in ℤ[q], obtained from QM.0’s Gaussian polynomial.
- `CountableSolidHabiroTensor.separable_weights` (other): If for each k there exists B such that m+n≥B implies h(m,n)≥k, there are f,g:N→N tending to infinity with f(m)+g(n)≤h(m,n) for every m,n.
- `CountableSolidHabiroTensor.radial_max` (other): If f,g tend to infinity, max(f(m),g(n)) tends to infinity as m+n→∞.
- `CountableSolidHabiroTensor.bounded_below` (compatibility): For bounded-below complete M,N, e(M)⊗■_SHe(N)≃e(L_H(M⊗_RN)); this is the accepted B.8 target, with G-solid’s resolution hypothesis discharged by its future supplier.

**Acceptance.**

- For one nonempty singleton block on each side, this is SH⊗■_SHSH≃SH.
- The polynomial instance a=b=1 is P_2=P_1²(1+q), testing the divisibility orientation.
- h(m,n)=m+n admits f(m)=m,g(n)=n. A constant h is not radial proper and is excluded.
- The proof needs both ideal containments and the bounded-below realization argument; a pointwise tensor identity is insufficient.

**Used by.**

- HabiroRings:HR.2/the-solid-comparison-is-bounded-below: Supplies the countable arithmetic calculation used to prove the accepted B.8 target; the target itself is not assumed as a prerequisite.

**Depends on.** this roadmap: `HR.2/completed-countable-free-solid-modules`, `HR.2/solid-habiro-unit-idempotence`, `HR.2/spectral-habiro-completion`, `HR.2/habiro-complete-solid-spectra`; other roadmaps: `QSeriesPartitionsAndMockModularForms:QM.0/q-binomial-coefficient`; stages: `EnhancedDerivedSheaves:E5:abstract`.

**Library.** proposed module `TauCeti/Arithmetic/Habiro/Solid`, namespace `TauCeti.Habiro`; Lean name `CountableSolidHabiroTensor.comparison`.

**Sources.**

- `Wagner.HR2.v2`, Proof of B.8, printed/PDF p.80, final three paragraphs: “because q-binomial coefficients” — Gives product divisibility, proper profiles and the completed double sum.
- `Bosco.2023`, Proposition A.3, printed/PDF pp.92–93: “bounded above complexes” — Documents the uniformly connective resolution argument only in the algebraic p-adic setting.

## HR.3 — Finite cyclotomic arithmetic descent

*Coverage in `HabiroRings.json`: partial, 5 nodes.* 5 packet nodes at this stage. Five nodes after review: the general descent principle (Setup 2.1 and Lemma 2.2); the cyclotomic intersection calculation (q-Witt Lemma 2.1 organised by the chains T_{d,p}, with the p-adic disjointness of different prime-to-p parts, the arithmetic imported from HabiroCyclotomicCompletions HC.4); the cyclotomic descent equivalence, which specialises the descent principle to the completion categories, proves joint conservativity by derived Nakayama and makes the two right-Kan-extension reductions, and carries the morphism-level universal property; Corollary 2.4; and the fracture pieces of Remark 2.5. The stage text's warning that the reduction of higher compatibility is not permission to glue arbitrary pairwise isomorphisms is carried by the corollary's hypotheses: the absence of coherence data is a theorem about the height-one poset P of one integer's divisors, and for covers whose higher intersections are non-empty and not all equal cocycle data remain necessary (content of the deleted node what-the-degeneration-does-not-license). Not planned: Remark 2.3's instance for all closed covers of Spec R, which needs q-Witt Lemma 2.4 (the cyclotomic cover needs only derived Nakayama), and Remark 2.6, the derived-commutative variant, which a consumer must request. External inputs not yet owned are recorded in the gap 'Higher-categorical inputs of the general descent principle'. Remaining: Gap: 'Higher-categorical inputs of the general descent principle'.

*Coverage in `HabiroRings--HR.3.json`: planned, 7 nodes.* All four stage targets are represented: finite index and intersections by the new index and the imported intersection node; actual coefficient-category contract by the new coherent diagram and finite-localization verification; right-Kan reduction and comparison equivalence by the imported morphism-level node; Corollary 2.4 and fracture pieces by the imported corollary/fracture nodes; explicit inverse and map-level universal property by reconstruction and prime-edge mapping spaces. The pass is complete at target level, with open supplier requests and recorded gaps, so this stage is planned, not closed. The parent packet’s five nodes are retained by reference and are not edited or copied. The two promoted finite-index lemmas now explicitly supply the mapping-space theorem’s combinatorial prerequisites. Remaining: Discharge the exact categorical and derived-completion requests by supplier nodes in E0/E3/E5 and DD.1, including the proposed ownership refinements. State the derived diagram, reconstruction and mapping-space signatures against those supplied enhanced carriers; no placeholder carriers are permitted.

The layer has twelve nodes: the first packet's five on Wagner §2.1, and the HR.3 part's seven, which make the categorical side of the descent explicit for the finite diagrams this roadmap needs. The HR.3 part is `planned`: it decomposes the first packet's gap 'Higher-categorical inputs of the general descent principle' into five exact supplier requests to EnhancedDerivedSheaves E0, E3, E5:abstract, E5:presentability and DerivedDeRhamCohomology DD.1, and records two gaps, the unwritten supplier refinements and the Lean signatures that wait for their carriers.

- **The arithmetic.** For the divisors T(m) of m and I_S = (Φ_d(q) : d ∈ S): V(q^m − 1) is the union of the V(Φ_d(q)); I_S is the unit ideal unless S lies in a chain T_{d,p} = {d, pd, …, p^{v_p(m)}d}; for S of two or more elements inside such a chain, I_S has the radical of (p, Φ_d(q)); and orders whose prime-to-p parts differ have empty p-adic intersections, (p, Φ_a(q), Φ_b(q)) = A[q]. The surviving intersections are not only the prime edges: for m = 4 the pair {1, 4} survives, since (q − 1, q² + 1) = (q − 1, 2). The cyclotomic congruences come from HabiroCyclotomicCompletions HC.4.
- **Wagner's general descent principle (Lemma 2.2).** For a poset site I and full subcategories D_Z of a presentable stable symmetric monoidal ∞-category, with left adjoints L_Z, nested along I and satisfying L_Z(x ⊗ y) ≃ L_Z(L_Z(x) ⊗ y), the D_Z form a functor I^op → CAlg(Pr^L_st). For a finite cover whose localisations are jointly conservative, D_Z and CAlg(D_Z) are the limits over the non-empty subsets of the cover, so D_(−) is a sheaf. HR.3 owns the principle; EnhancedDerivedSheaves supplies its ∞-categorical inputs.
- **The cyclotomic descent equivalence.** Completion gives D̂_{(q^m−1)}(A[q]) ≃ lim_{S∈P} D̂_S and the same for E∞-algebras, with mapping spaces computed as limits, where P consists of the singletons and the chains with at least two elements.
- **Corollary 2.4.** Derived Φ_d-complete E∞-algebras E_d with equivalences h_d : (E_{pd})^∧_p ≃ (E_d)^∧_p glue to a unique (q^m − 1)-complete algebra, with a contractible space of choices and no further coherence data. This is a theorem about the height-one poset P; for covers with non-empty higher intersections cocycle data stay necessary. Remark 2.5 gives its fracture pieces: inverting m splits it into the E_d, and its (p, q^m − 1)-completion is the product of the p-completed E_{p^i d} identified along the chains.
- **The finite index and the coherent diagram** (the HR.3 part). P(m) has height one: every strict comparison runs from a singleton to a maximal chain, so its nerve has no non-degenerate simplices of dimension two; each prime edge (p, d) is a unique consecutive pair of its chain. The coherent diagram F_{A,m} : N(Q(m)) → CAlg(Pr^L_st) has the complete categories D_S as values and completions as transitions. The finite localization contract verifies, for this diagram, the hypotheses of the descent principle: joint conservativity, the augmentation equivalence and the section comparisons, naturally. Right Kan extensions along P(m) ⊆ Q(m) are computed on the slices (S ↓ j), at an initial included vertex.
- **Reconstruction and mapping spaces** (the HR.3 part). The reconstruction functor takes a local section over P(m) to the finite homotopy limit of its components; with completion it is an inverse equivalence, and every solution space with prescribed local identifications is contractible. Mapping spaces between glued algebras are the homotopy equalisers of the vertex mapping spaces over the edges. For m = 6 the incidence graph has a cycle, but specified edge paths suffice and no extra equation around the cycle is needed; dropping the paths would lose naturality.

Remark 2.3's instance for all closed covers of Spec R and the derived-commutative variant of Remark 2.6 are not planned: no consumer needs them.

### The cyclotomic intersection calculation for the divisors of m

`HR.3/the-divisor-poset-and-its-intersections` · lemma · first packet

Let A be a commutative ring, m a positive integer, T = T(m) the set of positive divisors of m, and for a non-empty S ⊆ T let I_S = (Φ_d(q) : d ∈ S) ⊆ A[q]. For a divisor d of m and a prime p with p ∤ d put T_{d,p} = {d, pd, …, p^{v_p(m)} d} ⊆ T. Then: (a) V(q^m − 1) = ⋃_{d|m} V(Φ_d(q)) in Spec A[q]; (b) if S is contained in no T_{d,p}, then I_S = A[q]; equivalently, S contains two distinct elements whose ratio is not p^α for a prime p and an integer α ≠ 0 (for a singleton S = {d} the pair (d, d) would satisfy the condition, although {d} = T_{d,ℓ} for ℓ ∤ m); (c) if S ⊆ T_{d,p} and |S| ≥ 2, then I_S and (p, Φ_d(q)) have the same radical; (d) every singleton {d} equals T_{d,ℓ} for any prime ℓ ∤ m, and two distinct sets T_{d,p}, T_{d′,p′} with at least two elements are incomparable under inclusion; (e) if a and b are positive integers whose prime-to-p parts differ, then (p, Φ_a(q), Φ_b(q)) = A[q], that is, V(p, Φ_a(q)) ∩ V(p, Φ_b(q)) = ∅.

**Hypotheses.**

- A is an arbitrary commutative ring: every ideal statement is proved in ℤ[q] and base-changed to A[q].
- In (b) the ratio is tested in both directions and a non-integral ratio, such as 3/2, is not a prime power. The input q-Witt Lemma 2.1 is used only for α ≠ 0: for α = 0 its printed isomorphism with F_p[q]/Φ_{min{m,n}}(q) is wrong (source issue HabiroCyclotomicCompletions/E14).
- (e) is the stage text's 'different prime-to-p parts have empty p-adic intersections'; when the prime-to-p parts agree, V(p, Φ_a(q)) = V(p, Φ_b(q)) is non-empty.
- The surviving intersections are indexed by the non-empty subsets of the chains T_{d,p}, not by prime edges: for m = 4 the pair {1, 4} survives.

**Proof.**

1. (a) is q^m − 1 = ∏_{d|m} Φ_d(q) (Mathlib's Polynomial.prod_cyclotomic_eq_X_pow_sub_one).
2. (b) A set of divisors in which every pair has ratio p^α (α ≠ 0) lies in one chain T_{d,p}: if a, b differ by a power of p and b, c by a power of a prime ℓ ≠ p, then a, c do not differ by a prime power. So if S lies in no T_{d,p}, two of its elements have a non-prime-power ratio and generate the unit ideal by HabiroCyclotomicCompletions:HC.4/cyclotomic-comaximality-and-resultant.
3. (c) For p^i d and p^j d with i < j, HabiroCyclotomicCompletions:HC.4/cyclotomic-congruence-and-prime-ideal gives p ∈ (Φ_{p^i d}(q), Φ_{p^j d}(q)) and Φ_{p^k d}(q) ≡ Φ_d(q)^{e_k} modulo p with e_k ≥ 1; hence I_S ⊆ √(p, Φ_d(q)) and (p, Φ_d(q)) ⊆ √I_S.
4. (d) If ℓ ∤ m then v_ℓ(m) = 0 and T_{d,ℓ} = {d}. The least element of T_{d,p} is its p-free element d and any two of its elements determine p, so T_{d,p} ⊆ T_{d′,p′} with |T_{d,p}| ≥ 2 forces (d, p) = (d′, p′).
5. (e) Write a = p^i a′ and b = p^j b′ with p ∤ a′b′ and a′ ≠ b′. Modulo p, Φ_a ≡ Φ_{a′}^e and Φ_b ≡ Φ_{b′}^f with e, f ≥ 1 (HC.4 congruence node), so it suffices that (p, Φ_{a′}, Φ_{b′}) = (1). If a′/b′ is not a prime power, (Φ_{a′}, Φ_{b′}) = (1) by the HC.4 comaximality node; otherwise a′/b′ = ℓ^{±k} with ℓ ≠ p, ℓ ∈ (Φ_{a′}, Φ_{b′}) by the HC.4 congruence node, and (p, ℓ) = (1).

**Acceptance.**

- m = 6: the non-empty S with I_S ≠ (1) are the four singletons and {1, 2}, {3, 6} (p = 2), {1, 3}, {2, 6} (p = 3), 8 of the 15 non-empty subsets; {1, 6} and {2, 3} give the unit ideal, since Φ_6(q) − q·Φ_1(q) = 1 and Φ_3(q) − q·Φ_2(q) = 1.
- m = 4: all 7 non-empty subsets survive and lie in T_{1,2} = {1, 2, 4}; the pair {1, 4} survives although 4 is not a prime, with I_{{1,4}} = (q − 1, q^2 + 1) = (q − 1, 2).
- m = 12: the surviving pairs are {1,2}, {1,4}, {2,4}, {3,6}, {3,12}, {6,12}, {1,3}, {2,6}, {4,12}; the pairs {1,6}, {1,12}, {2,3}, {2,12}, {3,4}, {4,6} generate (1); 17 of the 63 non-empty subsets survive.
- (e): (2, Φ_1, Φ_3) = (1) because Φ_3(1) = 3; (2, Φ_3, Φ_6) = (2, Φ_3) ≠ (1) (same prime-to-2 part 3); (3, Φ_2, Φ_4) = (1) because Φ_4(−1) = 2.
- Computer check (Smith normal forms over ℤ, gcds over F_p): for 1 ≤ a < b ≤ 40, ℤ[q]/(Φ_a, Φ_b) ≅ (ℤ/p)^{φ(a)} when b/a = p^k with k ≥ 1 and is 0 otherwise; for p ≤ 7 and a, b ≤ 30, (p, Φ_a, Φ_b) = (1) exactly when the prime-to-p parts differ; for m ∈ {4, 6, 8, 12, 30, 36} the surviving subsets are exactly the non-empty subsets of the T_{d,p}.

**Used by.**

- HR.3, the cyclotomic descent equivalence: Parts (b)–(d) give the right-Kan-extension reductions to the poset P.
- HR.3, the fracture pieces: Part (e) splits the (p, q^m − 1)-complete category; parts (b)–(c) split it after inverting m.
- HabiroCyclotomicCompletions:HC.5: The same arithmetic underlies the Chinese remainder decomposition there; both import it from HC.4.

**Depends on.** other roadmaps: `HabiroCyclotomicCompletions:HC.4/cyclotomic-comaximality-and-resultant`, `HabiroCyclotomicCompletions:HC.4/cyclotomic-congruence-and-prime-ideal`; libraries: `mathlib:Polynomial.prod_cyclotomic_eq_X_pow_sub_one`, `mathlib:Polynomial.cyclotomic`, `mathlib:Nat.divisors`.

**Sources.**

- `Wagner.qWitt.2024`, Lemma 2.1, PDF p. 8: “Let m and n be positive integers and let R = Z[q]/(Φ_m(q), Φ_n(q)). Let d = gcd(m, n). If p is a prime factor of m/d or n/d, then p = 0 in R.” — The arithmetic input to (b) and (c), which HabiroCyclotomicCompletions HC.4 plans and this node imports.
- `Wagner.qWitt.2024`, Lemma 2.1, PDF p. 8: “In particular, the ring R vanishes unless m/n = p^α for some prime p and some α ∈Z. In the latter case, R ≅ F_p[q]/Φ_{min{m,n}}(q).” — (b) and, for α ≠ 0, (c); the case α = 0 of the second sentence is a known source issue.
- `Wagner.qHodgeHabiro.2025`, Proof of Corollary 2.4, PDF p. 14: “The idea is to apply descent for R = A[q] and the cover V (q^m −1) = ⋃_{d|m} V (Φ_d(q)). The simplifications come from the observation that many intersections are empty; see [Wag24, Lemma 2.1] for example.” — (a) and the role of the calculation in the descent.
- `Wagner.qHodgeHabiro.2025`, Proof of Corollary 2.4, PDF p. 15: “For every pair (d, p), where d | m is a divisor of m and p is a prime such that p ∤ d, we let T_{d,p} := {d, pd, . . . , p^{v_p(m)}d} ⊆ T(m)” — The chains T_{d,p} of the statement.
- `Wagner.qHodgeHabiro.2025`, Proof of Corollary 2.4, PDF p. 15: “note that this includes all subsets of the form {d}, where d is a divisor of m, as {d} = T_{d,ℓ} if ℓ is any prime not dividing m” — (d), first half.
- `Wagner.qHodgeHabiro.2025`, Remark 2.5, PDF p. 15: “observe that after p-completion the ℓ-adic gluings for ℓ ≠ p become vacuous, so the only gluing that happens is along (E_d)^∧_p ≃(E_{pd})^∧_p ≃· · · ≃(E_{p^αd})^∧_p for all d | n.” — (e), the p-adic disjointness the source uses without a separate statement.

### A general descent principle for localisations indexed by a poset site

`HR.3/the-general-descent-principle` · theorem · planet “A general descent principle” · first packet · added by REV-HabiroRings

Let I be a site whose underlying category is a partially ordered set and D a presentable stable symmetric monoidal ∞-category. For every Z in I let D_Z ⊆ D be a full stable sub-∞-category such that (a) the inclusion D_Z ⊆ D has a left adjoint L_Z; (b) if ℤ_1 → ℤ_2 in I then D_{ℤ_1} ⊆ D_{ℤ_2}, so that L_{ℤ_1} restricts to a left adjoint of D_{ℤ_1} ⊆ D_{ℤ_2}; (c) for all x, y in D the canonical map L_Z(x ⊗ y) → L_Z(L_Z(x) ⊗ y) is an equivalence. Then (i) Z ↦ D_Z, (ℤ_1 → ℤ_2) ↦ (L_{ℤ_1}: D_{ℤ_2} → D_{ℤ_1}) is a functor D_(−): I^op → CAlg(Pr^L_st), each D_Z carrying the symmetric monoidal structure for which L_Z is symmetric monoidal. (ii) For a finite covering family {Z_i → Z}, i = 1, …, r, such that the functors L_{Z_i}: D_Z → D_{Z_i} are jointly conservative, the restriction functor D_Z → lim_{S ∈ ⌟^r} D_{Z_S} is an equivalence, and so is CAlg(D_Z) → lim_{S ∈ ⌟^r} CAlg(D_{Z_S}); here ⌟^r is the poset of non-empty subsets S of {1, …, r} ordered by inclusion and Z_S is the meet of the Z_i, i ∈ S. (iii) Consequently, if every cover in I has a finite refinement and the localisations of every finite covering family are jointly conservative, D_(−) is a sheaf on I, and so is CAlg(D_(−)): I^op → Pr^L (Wagner, Lemma 2.2).

**Hypotheses.**

- The underlying category of I is a poset, so fibre products are meets and Z_i ×_Z Z_i = Z_i; this is what reduces the Čech nerve to the poset ⌟^r of non-empty subsets.
- Conditions (a)–(c) are hypotheses on the family (D_Z); condition (c) is what makes each L_Z symmetric monoidal on the full sub-∞-operad D_Z^⊗ (Lurie, Higher Algebra, Proposition 2.2.1.9).
- Part (ii) is for one finite cover whose localisations are jointly conservative on D_Z; nothing is claimed without joint conservativity. Part (iii) needs it for every finite covering family and finite refinements of all covers.
- The conclusion is an equivalence of ∞-categories, so it includes mapping spaces and is not a statement about equivalence classes of objects.

**Proof.**

1. Forgetting the monoidal structure, let D_I ⊆ I × D be the full sub-∞-category spanned fibrewise by the D_Z; by (b) the projection D_I → I is a cocartesian fibration, so straightening gives a functor I → Cat_∞ (EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening, over a poset: see the gap on higher-categorical inputs).
2. By (a) this functor takes values in Pr^R_st; the equivalence Pr^L_st ≃ (Pr^R_st)^op (Lurie, HTT Corollary 5.5.3.4) turns it into D_(−): I^op → Pr^L_st whose transition functors are the L_{ℤ_1} (EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations, EnhancedDerivedSheaves:E5:presentability/presentable-categories).
3. By (c) and HA Proposition 2.2.1.9 each inclusion D_Z^⊗ ⊆ D^⊗ of the full sub-∞-operad spanned by D_Z has a symmetric monoidal left adjoint recovering L_Z; repeating the first two steps with D^⊗ in place of D gives the lift to CAlg(Pr^L_st) (EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category).
4. (ii) For the finite cover, the Čech nerve has Z_i ×_Z Z_i = Z_i, so the cosimplicial limit is lim_{S ∈ ⌟^r} D_{Z_S}; limits in Pr^L_st are computed in Cat_∞ (EnhancedDerivedSheaves:E0/limits-colimits-and-slices).
5. Full faithfulness: Hom_{D_{Z_S}}(L_{Z_S}(x), L_{Z_S}(y)) ≃ Hom_D(x, L_{Z_S}(y)), so it suffices that y → lim_S L_{Z_S}(y) is an equivalence for y in D_Z; by joint conservativity this is checked after each L_{Z_i}. After L_{Z_i} every L_{Z_S}(y) → L_{Z_{S∪{i}}}(y) is an equivalence, so the cubical limit is L_{Z_i}(y) by the dual of HA Lemma 1.2.4.15, and L_{Z_i} preserves the finite limit because it is exact.
6. Essential surjectivity: for a compatible family (y_S) put y := lim_S y_S in D_Z and show L_{Z_S}(y) ≃ y_S by the same argument after each L_{Z_i}.
7. Pass to commutative algebras: CAlg(−) carries the limit of symmetric monoidal ∞-categories along symmetric monoidal functors to the limit of the CAlg's (EnhancedDerivedSheaves:E5:abstract/algebra-objects). Part (iii) follows because the sheaf condition may be checked on finite refinements.

**Acceptance.**

- For r = 2 the limit is the pullback D_{ℤ_1} ×_{D_{ℤ_1 ∧ ℤ_2}} D_{ℤ_2}; if D_{ℤ_1 ∧ ℤ_2} ≃ 0 it is the product D_{ℤ_1} × D_{ℤ_2} (used for the fracture pieces of this layer).
- Joint conservativity is used in both halves of the proof, full faithfulness and essential surjectivity.
- The statement is an equivalence of ∞-categories: mapping spaces in D_Z are limits of mapping spaces in the D_{Z_S}.

**Used by.**

- HR.3, the cyclotomic descent equivalence: Part (ii) for the cover V(q^m − 1) = ⋃ V(Φ_d(q)) of Spec A[q].
- HR.3, the fracture pieces: Part (ii) for covers with empty intersections gives product decompositions.
- Wagner §3.3 and HabiroCohomologyFoundations HQ.4: The same principle glues the twisted q-de Rham complexes.

**Depends on.** other roadmaps: `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`, `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E5:presentability/presentable-categories`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`, `EnhancedDerivedSheaves:E5:abstract/algebra-objects`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, 2.1 (Setup), PDF p. 13: “Let I be a site whose underlying category is a partially ordered set. Let D be a presentable stable symmetric monoidal ∞-category. Suppose that for every Z ∈ I we have a full stable sub-∞-category D_Z satisfying the following conditions:” — The setting and conditions (a)–(c) of the statement; the functor D_(−) and its symmetric monoidal lift are constructed in the same paragraph.
- `Wagner.qHodgeHabiro.2025`, Lemma 2.2, PDF p. 13: “In the situation of 2.1, assume that covers in I always have finite refinements and that for any finite covering family {Z_i → Z}_{i=1,...,r}, the functors L_{Z_i} : D_Z → D_{Z_i} are jointly conservative. Then D(−) : I^{op} → CAlg(Pr^L_{st}) is a sheaf on I.” — Part (iii); its proof sketch (p. 14) proves part (ii) for one finite cover, which is what Corollary 2.4 uses.

**Assembly note.** The gap 'Higher-categorical inputs of the general descent principle' is decomposed by the HR.3 part into five exact requests: finite-poset straightening, section limits and the cubical contraction (E0); coherent adjoints and dual Kan extensions along full inclusions (E3); monoidal localisation and the limits of algebra categories (E5:abstract); Pr^L/Pr^R reversal and finite limits of presentable categories (E5:presentability); and the Koszul-model derived completion (DD.1). They suffice for the finite diagrams of this roadmap. The principle for arbitrary poset sites still needs straightening in the site's size range and accessibility hypotheses, which the HR.3 part does not claim.

### The cyclotomic descent equivalence, with its morphism-level universal property

`HR.3/the-morphism-level-statement` · theorem · first packet

Let A be a commutative ring and m ≥ 1, with T, T_{d,p} and I_S as in the intersection calculation, and D̂_S := D̂_{I_S}(A[q]) the full sub-∞-category of derived I_S-complete objects of D(A[q]). Let P ⊆ ⌟^T be the sub-poset of non-empty subsets of T consisting of the singletons {d} (d | m) and the chains T_{d,p} with at least two elements, ordered by inclusion. Then completion induces equivalences of ∞-categories D̂_{(q^m−1)}(A[q]) ≃ lim_{S∈P} D̂_S and CAlg(D̂_{(q^m−1)}(A[q])) ≃ lim_{S∈P} CAlg(D̂_S), where D̂_{T_{d,p}} = D̂_{(p,Φ_d(q))}(A[q]). In particular, for E, E′ in CAlg(D̂_{(q^m−1)}(A[q])) the mapping space Map(E, E′) is the limit over S ∈ P of the mapping spaces Map(E^∧_{I_S}, E′^∧_{I_S}), and a map E → E′ is an equivalence if and only if every E^∧_{Φ_d(q)} → E′^∧_{Φ_d(q)} is one.

**Hypotheses.**

- A is any commutative ring; in the source it is the perfectly covered Λ-ring fixed at the start of §2, which the argument does not use.
- Derived completion is the generic one of DerivedDeRhamCohomology DD.1; D̂_I(A[q]) depends only on the radical of I, which is what identifies D̂_S with D̂_{(p,Φ_d(q))}(A[q]) for a chain.
- P has height one: singletons lie below chains and distinct chains are incomparable. This is the reason the limit involves no coherence data beyond one equivalence per inclusion {d} ⊆ T_{d,p}.

**Proof.**

1. Apply the general descent principle to D = D(A[q]) and the poset of closed subsets of Spec A[q] cut out by finitely generated ideals, with D_Z = D̂_I(A[q]) and L_Z = (−)^∧_I. Conditions (a)–(c) hold: completion is left adjoint to the inclusion, depends only on V(I), and (x ⊗ y)^∧_I ≃ (x^∧_I ⊗ y)^∧_I by the Koszul description (DD.1).
2. Joint conservativity for the cover V(q^m − 1) = ⋃_{d|m} V(Φ_d(q)): if M is (q^m − 1)-complete and every M^∧_{Φ_d(q)} ≃ 0, then every M/Φ_d(q) ≃ 0, hence M/(q^m − 1) ≃ 0 by the factorisation q^m − 1 = ∏ Φ_d(q) (iterated cofibre sequences), hence M ≃ 0 by derived Nakayama (DD.1).
3. Part (ii) of the general descent principle gives D̂_{(q^m−1)}(A[q]) ≃ lim_{S∈⌟^T} D̂_S, and the same for CAlg.
4. By part (b) of the intersection calculation, D̂_S ≃ 0 for S outside ⋃_{d,p} ⌟^{T_{d,p}}; every S′ ⊇ S is then outside as well, so the pointwise formula (EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion, in its dual form) shows that the functor S ↦ D̂_S is right Kan extended from ⋃_{d,p} ⌟^{T_{d,p}}.
5. By parts (c) and (d), for S ⊆ S′ in ⌟^{T_{d,p}} with |S| ≥ 2 both D̂_S and D̂_{S′} equal D̂_{(p,Φ_d(q))}(A[q]) and the transition is the identity; so the functor on ⋃ ⌟^{T_{d,p}} is right Kan extended from P, and the limit over ⌟^T equals the limit over P.
6. The mapping-space formula is the definition of mapping spaces in a limit of ∞-categories; the conservativity clause is the second step.

**Acceptance.**

- m = 6: P consists of {1}, {2}, {3}, {6}, {1,2}, {3,6}, {1,3}, {2,6}, a cycle 1 – {1,2} – 2 – {2,6} – 6 – {3,6} – 3 – {1,3} – 1 of length eight; an object of the limit is four local objects and four equivalences, with no condition around the cycle.
- m = p^α: P consists of the α + 1 singletons and T_{1,p}, and the limit is the wide pullback of the D̂_{Φ_{p^i}(q)}(A[q]) (0 ≤ i ≤ α) over D̂_{(p, q − 1)}(A[q]).
- m = 12: |P| = 11, the six singletons and the chains {1,2,4}, {3,6,12}, {1,3}, {2,6}, {4,12}.
- An object with the right cyclotomic completions is not by itself an object of the limit: the chain equivalences are data, and different choices give different glued objects (identity gluings give A[q]^∧_{(q^m−1)}, Frobenius gluings give the rings H_{R/A,m} of HR.4; Wagner Remark 2.8).

**Used by.**

- HR.3, Corollary 2.4: The corollary is the object-level reading of this equivalence.
- HR.4, the Habiro–q-Witt comparison: The map W → H_{R/A,m} is built from compatible maps to the E_d through the mapping-space clause.
- HR.4, the transitions: Maps into H_{R/A,d} are determined by their cyclotomic completions.

**Depends on.** this roadmap: `HR.3/the-general-descent-principle`, `HR.3/the-divisor-poset-and-its-intersections`; other roadmaps: `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`, `EnhancedDerivedSheaves:E5:abstract/algebra-objects`; stages: `DerivedDeRhamCohomology:DD.1`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Remark 2.3, PDF p. 14: “The functors L_Z := (−)^∧_I clearly satisfy the conditions from 2.1, and the condition from Lemma 2.2 is easily checked (see e.g. [Wag24, Lemma 2.4]). Hence the descent from Lemma 2.2 is applicable.” — The first two proof steps; for the principal ideals Φ_d(q) the joint conservativity follows from derived Nakayama, without q-Witt Lemma 2.4.
- `Wagner.qHodgeHabiro.2025`, Proof of Corollary 2.4, PDF p. 15: “By [Wag24, Lemma 2.1], we have D̂_S ≃ 0 if S ∉ ⋃_{d,p} ⌟^{T_{d,p}}.” — The first right-Kan-extension reduction.
- `Wagner.qHodgeHabiro.2025`, Proof of Corollary 2.4, PDF p. 15: “if S ⊆ S′ are elements of ⌟^{T_{d,p}} such that |S| ⩾ 2, then the same result tells us that the corresponding morphism S → S′ is sent to the identity, as both D̂_S and D̂_{S′} agree with the full sub-∞-category D̂_{(p,Φ_d(q))}(A[q]) ⊆ D(A[q]).” — The second reduction, to P.
- `Wagner.qHodgeHabiro.2025`, Proof of Corollary 2.4, PDF p. 15: “In total, this implies D̂_{(q^m−1)}(A[q]) ≃ lim_{S∈P} D̂_S and thus CAlg(D̂_{(q^m−1)}(A[q])) ≃ lim_{S∈P} CAlg(D̂_S). After unravelling of definitions, an object in the limit on the right-hand side is precisely given by the data (a) and (b).” — The equivalence of the statement, which the source proves on the way to Corollary 2.4.

**Assembly note.** The HR.3 part makes this node's categorical steps explicit for the finite index: `HR.3/coherent-completion-diagram` is the diagram of completed categories, `HR.3/finite-localisation-contract` verifies the hypotheses of the descent principle for it, `HR.3/reconstruction-functor` is the inverse equivalence, and `HR.3/prime-edge-mapping-spaces` computes its mapping spaces. The reconstruction functor and the mapping-space theorem use this node; the diagram and the contract precede it and are inputs to its proof, which the packet does not yet list among its prerequisites.

### Corollary 2.4: gluing cyclotomically complete algebras along prime edges

`HR.3/the-complete-descent-corollary` · theorem · planet “The cyclotomic descent corollary” · first packet

Let A be a commutative ring and m ≥ 1. Suppose given (a) for every divisor d of m a derived Φ_d(q)-complete E∞-A[q]-algebra E_d, and (b) for every divisor d of m and prime p with pd | m an equivalence of E∞-A[q]-algebras h_d: (E_{pd})^∧_p → (E_d)^∧_p. Then there is a (q^m − 1)-complete E∞-A[q]-algebra E with equivalences E_d ≃ E^∧_{Φ_d(q)} for all d | m under which each h_d becomes the identity of E^∧_{(Φ_d(q),Φ_{pd}(q))}; the space of such E with these identifications is contractible, and no further coherence data are required.

**Hypotheses.**

- A is any commutative ring (in the source the perfectly covered Λ-ring of §2, which is not used).
- The E_d are derived Φ_d(q)-complete; each h_d is an equivalence after p-completion. There is no datum for a prime not dividing m.
- 'Unique' is uniqueness up to a contractible space of choices: the space of solutions is a fibre of the cyclotomic descent equivalence.
- No relation among the h_d is imposed: loops in P, such as 1 – 2 – 6 – 3 – 1 for m = 6, carry no cocycle condition because P has height one. This is a theorem about the divisor poset of one integer with the cyclotomic closed sets and not a licence to glue arbitrary pairwise isomorphisms: for a cover whose triple intersections are non-empty and not all equal to the pairwise ones, cocycle data remain necessary.

**Proof.**

1. An object of lim_{S∈P} CAlg(D̂_S) consists of E_d in CAlg(D̂_{Φ_d(q)}) for each d | m, an object X_C of CAlg(D̂_{(p,Φ_d(q))}) for each chain C = T_{d,p} with |C| ≥ 2, and equivalences (E_{p^i d})^∧_{(p,Φ_d(q))} ≃ X_C for 0 ≤ i ≤ v_p(m); here (E_{p^i d})^∧_{(p,Φ_d(q))} = (E_{p^i d})^∧_p, because (p, Φ_{p^i d}(q)) and (p, Φ_d(q)) have the same radical (intersection calculation (c)).
2. Choosing X_C = (E_d)^∧_p (a contractible choice), these chain data are the v_p(m) successive equivalences (E_{p^{i+1} d})^∧_p ≃ (E_{p^i d})^∧_p; every pair (d′, p) with pd′ | m occurs exactly once as (p^i d, p) with p ∤ d, so they are exactly the data (b).
3. Apply the cyclotomic descent equivalence to obtain E with its identifications, and its uniqueness.

**Acceptance.**

- The cyclotomic completions of E are the E_d and its prime-edge comparisons are the h_d.
- m = 4: the data are E_1, E_2, E_4, h_1: (E_2)^∧_2 ≃ (E_1)^∧_2 and h_2: (E_4)^∧_2 ≃ (E_2)^∧_2; the surviving pair {1, 4} carries no separate datum, its gluing being h_1 ∘ h_2.
- m = 6: four algebras and four equivalences, h_1 and h_3 for p = 2, h_1 and h_2 for p = 3; m = 12: six algebras and seven equivalences.
- E_d = A[q]^∧_{Φ_d(q)} with every h_d the identity gives E ≃ A[q]^∧_{(q^m−1)} (Wagner Remark 2.8).

**Depends on.** this roadmap: `HR.3/the-morphism-level-statement`, `HR.3/the-divisor-poset-and-its-intersections`; other roadmaps: `EnhancedDerivedSheaves:E5:abstract/algebra-objects`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Paragraph before Corollary 2.4, PDF p. 14: “In the case that we’re actually interested in, the descent diagram simplifies considerably; in particular, no coherence data needs to be provided!” — The source's claim that no coherence data are needed, which this node proves for the poset P.
- `Wagner.qHodgeHabiro.2025`, Corollary 2.4, PDF p. 14: “(a) For all divisors d | m, a derived Φ_d(q)-complete E∞-A[q]-algebra E_d. (b) For all divisors pd | m, where p is a prime, an equivalence of E∞-A[q]-algebras h_d : (E_{pd})^∧_p ≃ → (E_d)^∧_p .” — The data (a) and (b), with the source's hypotheses.
- `Wagner.qHodgeHabiro.2025`, Corollary 2.4, PDF p. 14: “Then there exists a unique (q^m −1)-complete E∞-A[q]-algebra E together with equivalences E_d ≃ E^∧_{Φ_d(q)} for all d | m such that h_d becomes identified with the identity on E^∧_{(Φ_d(q),Φ_{pd}(q))}.” — The conclusion.

### The arithmetic fracture pieces of a glued algebra (Remark 2.5)

`HR.3/the-fracture-square-pieces` · theorem · first packet · added by REV-HabiroRings

Let A, m, (E_d, h_d) and E be as in Corollary 2.4, and write m = p^α n with p ∤ n. Then there are equivalences of E∞-A[q]-algebras E[1/m]^∧_{(q^m−1)} ≃ ∏_{d|m} E_d[1/m]^∧_{Φ_d(q)} and, for every 0 ≤ i ≤ α, E^∧_{(p,q^m−1)} ≃ ∏_{d|n} (E_{p^i d})^∧_p. Under the second, the factors for different i are identified through the chains (E_d)^∧_p ≃ (E_{pd})^∧_p ≃ ⋯ ≃ (E_{p^α d})^∧_p of the h's, and the ℓ-adic gluings for primes ℓ ≠ p play no role.

**Hypotheses.**

- E is the glued algebra of Corollary 2.4; E[1/m]^∧_{(q^m−1)} and E^∧_{(p,q^m−1)} (p | m) are the corners of the arithmetic fracture square of Wagner 1.22 for the (q^m − 1)-complete E.
- The second equivalence holds for each i separately; for p ∤ m it reads E^∧_{(p,q^m−1)} ≃ ∏_{d|m} (E_d)^∧_p.

**Proof.**

1. After inverting m, any two of the Φ_d(q), d | m, generate the unit ideal: their ideal is (1) or contains a prime factor of m (intersection calculation (b), (c)). So V(q^m − 1) ⊆ Spec A[1/m][q] is the disjoint union of the V(Φ_d(q)), and part (ii) of the general descent principle with empty intersections gives D̂_{(q^m−1)}(A[1/m][q]) ≃ ∏_{d|m} D̂_{Φ_d(q)}(A[1/m][q]); the component of E[1/m]^∧_{(q^m−1)} at d is (E^∧_{Φ_d(q)}[1/m])^∧_{Φ_d(q)} = E_d[1/m]^∧_{Φ_d(q)}.
2. Modulo p, q^m − 1 = (q^n − 1)^{p^α}, so V(p, q^m − 1) = ⋃_{d|n} V(p, Φ_d(q)), a disjoint union by part (e) of the intersection calculation; hence D̂_{(p,q^m−1)}(A[q]) ≃ ∏_{d|n} D̂_{(p,Φ_d(q))}(A[q]).
3. The component of E^∧_{(p,q^m−1)} at d | n is E^∧_{(p,Φ_d(q))} = (E^∧_{Φ_{p^i d}(q)})^∧_p = (E_{p^i d})^∧_p for every 0 ≤ i ≤ α, because (p, Φ_{p^i d}(q)) and (p, Φ_d(q)) have the same radical; the identifications for different i are the chain of h's (Corollary 2.4).

**Acceptance.**

- m = 2, p = 2 (α = 1, n = 1): E^∧_{(2,q^2−1)} ≃ (E_1)^∧_2 ≃ (E_2)^∧_2, one factor, the two descriptions identified by h_1.
- m = 6, p = 2 (n = 3): E^∧_{(2,q^6−1)} ≃ (E_1)^∧_2 × (E_3)^∧_2, and the 3-adic gluings h_1: (E_3)^∧_3 → (E_1)^∧_3 and h_2: (E_6)^∧_3 → (E_2)^∧_3 do not enter.
- m = 6: E[1/6]^∧_{(q^6−1)} ≃ ∏_{d|6} E_d[1/6]^∧_{Φ_d(q)}, four factors.

**Used by.**

- HR.5, the equaliser presentation: Its proof after ℓ-completion uses that the p-adic gluings for p ≠ ℓ vanish.
- HabiroCohomologyFoundations:HQ.4, the arithmetic fracture squares: HQ.4 applies HR.2–3's arithmetic fracture and descent to the Habiro coefficient ring.

**Depends on.** this roadmap: `HR.3/the-complete-descent-corollary`, `HR.3/the-divisor-poset-and-its-intersections`, `HR.3/the-general-descent-principle`; stages: `DerivedDeRhamCohomology:DD.1`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Remark 2.5, PDF p. 15: “If m = p^αn, where n is coprime to p, then E[1/m]^∧_{(q^m−1)} ≃ ∏_{d|m} E_d[1/m]^∧_{Φ_d(q)} and E^∧_{(p,q^m−1)} ≃ ∏_{d|n} (E_{p^id})^∧_p for any 0 ⩽ i ⩽ α .” — The statement (display checked on the rendered page).
- `Wagner.qHodgeHabiro.2025`, Remark 2.5, PDF p. 15: “observe that after p-completion the ℓ-adic gluings for ℓ ≠ p become vacuous, so the only gluing that happens is along (E_d)^∧_p ≃(E_{pd})^∧_p ≃· · · ≃(E_{p^αd})^∧_p for all d | n.” — The last sentence of the statement and the second proof step.

### The finite cyclotomic descent index

`HR.3/finite-descent-index` · definition · planet “Cyclotomic descent diagram” · HR.3 packet

For m > 0 put T(m) = Nat.divisors(m), Q(m) = the nonempty subsets of T(m), ordered by inclusion. For p prime dividing m and d dividing m with p not dividing d define C(m,d,p) = {d p^i : 0 ≤ i ≤ v_p(m)}. Let P(m) be the full subposet of Q(m) whose elements are the singletons {d} and these maximal chains. The chain construction for any other p is not used to enumerate P; the source’s singleton chains for primes outside m are represented directly by the singletons. The interface consists of P, its nerve, its inclusions into Q, its prime edges (p,d) with pd dividing m, with consecutive-chain factorization supplied by the separate prime-edge-factorisation lemma.

**Hypotheses.**

- m is positive; all vertices are nonempty finite subsets of positive divisors.
- An index vertex is an actual subset, so different presentations of the same chain do not produce extra vertices.
- The order is inclusion of subsets, not divisibility of their members.

**Construction.**

1. Enumerate T, the primes dividing m and the chains using the existing divisor, prime-factor and factorization APIs.
2. For each p-free divisor d, factorization of d p^i and the divisibility criterion show that all terms with i≤v_p(m) divide m. Positivity gives nonempty vertices. Use the inherited inclusion order and the existing ordinary-category nerve instance. The height-one and prime-edge factorization results are separate lemma nodes because the mapping-space theorem uses them as prerequisites.

**API.**

- `CyclotomicIndex.primeChain` (constructor): For m,d,p define the finset {d p^i : i ≤ v_p(m)}; for p prime dividing m and p-free d dividing m it is a vertex.
- `CyclotomicIndex.vertices` (data): The finset of vertices is the union of singleton divisors and maximal chains at prime factors of m.
- `CyclotomicIndex.mem_vertices` (characterisation): S is a vertex iff S is a singleton divisor or S=C(m,d,p) for p dividing m and p-free d dividing m.
- `CyclotomicIndex.vertex_subset` (projection): Every vertex is a subset of Nat.divisors(m).
- `CyclotomicIndex.vertex_nonempty` (projection): Every vertex is nonempty.
- `CyclotomicIndex.le_iff_subset` (characterisation): For S,U∈P(m), S≤U if and only if their underlying finite subsets satisfy S⊆U. Use the inherited subtype order on finite sets.
- `CyclotomicIndex.nerve_quasicategory` (compatibility): The nerve of P(m), using Mathlib’s preorder category, is a quasicategory.

**Unit tests.**

- `CyclotomicIndex.test_one` (degenerate): vertices(1) = {{1}}.
- `CyclotomicIndex.test_four` (computation): vertices(4) = {{1},{2},{4},{1,2,4}}.
- `CyclotomicIndex.test_six` (computation): vertices(6) = {{1},{2},{3},{6},{1,2},{3,6},{1,3},{2,6}}.
- `CyclotomicIndex.test_not_pair_four` (non-example): {1,4} is not a vertex of P(4), although it is a surviving intersection in Q(4).
- `CyclotomicIndex.test_incomparable_singletons` (non-example): For the vertices S={1} and U={2} of P(2), neither S≤U nor U≤S holds, although 1 divides 2. This distinguishes the required subset order from divisibility of singleton members.

**Acceptance.**

- P(1) has one vertex; P(4) has {1},{2},{4},{1,2,4}, not all seven nonempty subsets.
- P(6) has eight vertices and its incidence graph has a cycle; its nerve has no nondegenerate 2-simplices.
- The singleton vertices {1} and {2} of P(2) are incomparable; divisibility of their members is not an index morphism.

**Used by.**

- Wagner Corollary 2.4 and HR.4 finite relative Habiro rings: Indexes the coherent gluing limit without replacing it by an unstructured collection of local objects.
- HabiroRings:HR.3/prime-edge-mapping-spaces: Provides the singleton and chain vertices and their inclusion arrows; the separate height-one lemma supplies the morphism coherence reduction.

**Depends on.** this roadmap: `HR.3/the-divisor-poset-and-its-intersections`; libraries: `mathlib:Nat.divisors`, `mathlib:Nat.primeFactors`, `mathlib:Nat.factorization`, `mathlib:CategoryTheory.Nerve.quasicategory`, `mathlib:Nat.exists_eq_pow_mul_and_not_dvd`, `mathlib:Nat.factorization_mul`, `mathlib:Nat.Prime.factorization_pow`, `mathlib:Nat.factorization_eq_zero_of_not_dvd`, `mathlib:Nat.factorization_le_iff_dvd`.

**Library.** proposed module `TauCeti/RingTheory/Habiro/CyclotomicDescent/Index`, namespace `TauCeti.Habiro.CyclotomicIndex`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Proof of Corollary 2.4, p. 15, definition of P: “the sub-partially ordered set spanned by” — Defines the full subposet of maximal prime chains, including the singleton chains.

### The finite cyclotomic index has height one

`HR.3/finite-index-height-one` · lemma · HR.3 packet · added by REV-HabiroRings--HR.3

CyclotomicIndex.height_one: for m>0 and vertices S,U,V of P(m), if S⊆U⊆V, then S=U or U=V. Every strict comparison is from a singleton to a nontrivial maximal prime-power chain. Thus the nerve has no nondegenerate simplices of dimension at least two.

**Hypotheses.**

- Vertices are actual finite subsets, ordered by inclusion; prime chains are maximal and their p-free base divides m.

**Proof.**

1. The parent intersection node, part (d), shows that distinct nontrivial maximal prime-power chains are incomparable.
2. Distinct singletons are incomparable. A nontrivial chain cannot be a subset of a singleton. Therefore every strict arrow has singleton source and nontrivial-chain target, so two strict arrows cannot compose.

**Acceptance.**

- P(4) has one nontrivial chain and no composable strict arrows.
- P(6) has an incidence cycle but still no nondegenerate 2-simplex.

**Depends on.** this roadmap: `HR.3/finite-descent-index`, `HR.3/the-divisor-poset-and-its-intersections`.

**Library.** proposed module `TauCeti/RingTheory/Habiro/CyclotomicDescent/Index`, namespace `TauCeti.Habiro.CyclotomicIndex`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Proof of Corollary 2.4, p. 15, definition of P and maximal prime-power subsets: “the sub-partially ordered set spanned by” — A finite combinatorial consequence of the source index and the imported intersection classification, promoted from the index API because the mapping-space proof uses it.

### Unique consecutive-chain factorization of a prime edge

`HR.3/prime-edge-factorisation` · lemma · HR.3 packet · added by REV-HabiroRings--HR.3

CyclotomicIndex.primeEdge_factorisation: if m>0, p is prime and pd divides m, there are unique d₀,i with p not dividing d₀, d₀ dividing m, i<v_p(m), and d=d₀p^i. Thus (p,d) is the unique consecutive pair d₀p^i,d₀p^(i+1) on its maximal p-power chain in P(m).

**Hypotheses.**

- p is prime and pd divides the positive m; hence d and d₀ are positive.

**Proof.**

1. For a prime edge (p,d), positivity of m and pd dividing m imply d≠0. Use Nat.exists_eq_pow_mul_and_not_dvd to write d=d₀p^i with p not dividing d₀. Nat.factorization_eq_zero_of_not_dvd, Nat.factorization_mul and Nat.Prime.factorization_pow show i=v_p(d), proving uniqueness of i and then d₀ by cancellation. Nat.factorization_le_iff_dvd applied to pd dividing m gives i<v_p(m), and applied to d₀p^j for j≤v_p(m) proves containment of the whole chain.
2. The consecutive pair determines its prime by the ratio of its positive terms. Combined with the unique p-free base and exponent, this identifies the prime-edge data with consecutive comparisons on the maximal chains.

**Acceptance.**

- At m=4, the 2-edges at d=1,2 give exponents 0,1 on the same chain.
- At m=6, the four prime edges lie respectively in the four two-element chains.

**Depends on.** this roadmap: `HR.3/finite-descent-index`; libraries: `mathlib:Nat.exists_eq_pow_mul_and_not_dvd`, `mathlib:Nat.factorization_mul`, `mathlib:Nat.Prime.factorization_pow`, `mathlib:Nat.factorization_eq_zero_of_not_dvd`, `mathlib:Nat.factorization_le_iff_dvd`.

**Library.** proposed module `TauCeti/RingTheory/Habiro/CyclotomicDescent/Index`, namespace `TauCeti.Habiro.CyclotomicIndex`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Corollary 2.4 and its proof, pp. 14–15, comparisons h_(p,d) and the prime-power index: “After unravelling of definitions” — Arithmetic justification of the source passage from maximal-chain sections to consecutive prime-edge comparisons, using the pinned factorization API; not a separately named theorem in the paper.

### The coherent diagram of cyclotomic completion categories

`HR.3/coherent-completion-diagram` · construction · HR.3 packet

For a commutative ring A and m > 0, let B=A[q], I_S=(Φ_d(q):d∈S) and D_S=D̂_{I_S}(B), with tensor (M⊗_B^L N)^∧_{I_S} and unit B^∧_{I_S}. Construct the coherent functor F_{A,m}: N(Q(m)) → CAlg(Pr^L_st) whose value is D_S and whose arrow S⊆U is L_{I_U}|D_S. Its restriction to P(m) is the cyclotomic diagram. For singleton {d} it is D̂_{Φ_d}(B); for C(m,d,p) it is D̂_{(p,Φ_d)}(B). The category of compatible commutative algebras is lim_{S∈P(m)} CAlg(D_S), with algebra objects and all transformations formed in the supplied enhanced model.

**Hypotheses.**

- A is any commutative ring; neither torsion-freeness nor a Λ-structure is used.
- Every I_S is finitely generated; completion is the Koszul-model reflective localization of DD.1.
- The diagram records adjunction units and composition coherence, not just equality on equivalence classes.

**Construction.**

1. Use DD.1 to give each D_S an accessible reflective localization, exactness, invariance under radical and the equivalence L_I(M⊗N)≃L_I(L_I(M)⊗N).
2. For S⊆U, inclusions of complete subcategories are right adjoints; apply requested poset straightening and the Pr^R/Pr^L adjoint reversal to obtain the covariant completion diagram.
3. Apply requested compatible monoidal localization (HA 2.2.1.9) and its coherent restriction to the nested subcategories; this makes the transition functors symmetric monoidal for the completed tensors.
4. Use the parent ideal-intersection calculation to identify chain values; algebra sections are supplied by the requested operadic-limit statement.

**API.**

- `CyclotomicCompletionDiagram.obj` (data): F(S)=D̂_{I_S}(A[q]) with its completed monoidal structure.
- `CyclotomicCompletionDiagram.map` (functoriality): For S⊆U, F(S)→F(U) is derived I_U-completion restricted to D_S.
- `CyclotomicCompletionDiagram.map_id` (simp): The transition S⊆S is canonically equivalent to identity, using the localization counit.
- `CyclotomicCompletionDiagram.map_comp` (functoriality): For S⊆U⊆V the transition is coherently the composite, with unit, associativity and higher coherence supplied by the straightened fibration.
- `CyclotomicCompletionDiagram.unit` (data): The unit of D_S is (A[q])^∧_{I_S}.
- `CyclotomicCompletionDiagram.chain` (compatibility): At C(m,d,p) the category is D̂_{(p,Φ_d)}(A[q]); the map from {p^i d} is p-completion on Φ_{p^i d}-complete objects.
- `CyclotomicCompletionDiagram.algebraSections` (projection): Apply CAlg and take the coherent limit to obtain the infinity-category of compatible local algebras, including its mapping spaces.

**Unit tests.**

- `CyclotomicCompletionDiagram.test_one` (degenerate): At m=1 the diagram is the single category D̂_{q−1}(A[q]).
- `CyclotomicCompletionDiagram.test_four` (compatibility): At m=4 all subsets of size at least two in Q(4) give D̂_{(2,q−1)}; in P(4) this is the single chain vertex.
- `CyclotomicCompletionDiagram.test_six_empty` (non-example): At m=6 the full-cube value at {1,6} is the zero stable category; its CAlg category is terminal, whereas {1,2} has the (2,q−1)-complete value.

**Acceptance.**

- The tensor unit is the completed B, not B unless B already is I_S-complete.
- For S⊆U⊆V, transition composition is coherently equivalent to L_{I_V}|D_S; units induce the comparison.

**Used by.**

- HR.3 and HR.4; Wagner proof of Corollary 2.4: Carries the actual localization functors and all natural coherence needed by the finite descent theorem.

**Depends on.** this roadmap: `HR.3/finite-descent-index`, `HR.3/the-divisor-poset-and-its-intersections`; stages: `DerivedDeRhamCohomology:DD.1`, `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E3`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`; libraries: `mathlib:Polynomial.cyclotomic`.

**Library.** proposed module `TauCeti/RingTheory/Habiro/CyclotomicDescent/Diagram`, namespace `TauCeti.Habiro.CyclotomicCompletionDiagram`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Setup 2.1, p. 13, and Remark 2.3, p. 14: “a contravariant functor” — The poset of closed sets is ordered oppositely to Q(m); completion gives a covariant functor on Q(m).

### Verification of the finite cyclotomic localization contract

`HR.3/finite-localisation-contract` · lemma · HR.3 packet

For A commutative, m>0, B=A[q] and f=q^m−1, the comparison D̂_f(B) → lim_{S∈Q(m)} D_S satisfies the hypotheses of the parent finite-localization descent principle. More precisely: (i) the Φ_d-completions are jointly conservative on D̂_f(B); (ii) for M∈D̂_f(B), the augmentation M→lim_{S∈Q(m)} L_{I_S}M is an equivalence; (iii) for a coherent local section (M_S), put M=lim_Q M_S in D̂_f(B); each canonical comparison L_{I_S}M→M_S is an equivalence. These comparisons are natural on the enhanced diagram category, not just on individual objects.

**Hypotheses.**

- Limits are enhanced finite homotopy limits; derived quotients mean cofibre quotients.
- The algebra version uses the monoidal diagram and operadic-section limit request; the stable finite-limit argument is applied to underlying modules.

**Proof.**

1. The DD.1 completion-unit comparison on derived Koszul reductions gives N/Φ_d ≃ (L_{Φ_d}N)/Φ_d, so vanishing of all L_{Φ_d}N forces all N/Φ_d to vanish. Thus every multiplication-by-Φ_d map is an equivalence; their product f=∏ Φ_d is an equivalence, hence N/f=0. Derived Nakayama for the f-complete N then gives N=0. Apply this argument to fibres to detect equivalences. Nakayama alone on L_{Φ_d}N is not the reduction comparison.
2. For a fixed divisor a, DD.1 identifies L_{Φ_a}L_{I_S} with L_{I_{S∪{a}}}. The latter cube has equivalences along the a-direction, so the requested punctured-cube contraction identifies its limit with L_{Φ_a}M. Exactness lets L_{Φ_a} pass through the finite limit.
3. This proves (ii) after every jointly conservative completion. For (iii), all M_S are f-complete and this subcategory is closed under limits; apply the same finite cube argument to the section’s underlying coherent diagram and use its transition equivalences.
4. Apply the parent descent principle for the full category equivalence; the parent two right-Kan-extension reductions replace Q by P. For a discarded subset its slice is empty; for a surviving nonsingleton its slice in P is the unique maximal chain; for S already in P its slice has initial object S. These give the required pointwise limits.

**Acceptance.**

- The finite exactness exchange is used before invoking joint conservativity; no infinite-limit preservation by a left adjoint is assumed.
- The test m=4 keeps the overlap {1,4} until the right-Kan reduction identifies it with the same chain value as {1,2}.

**Depends on.** this roadmap: `HR.3/coherent-completion-diagram`, `HR.3/the-general-descent-principle`, `HR.3/the-divisor-poset-and-its-intersections`; stages: `DerivedDeRhamCohomology:DD.1`, `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E3`; libraries: `mathlib:Polynomial.prod_cyclotomic_eq_X_pow_sub_one`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Proof sketch of Lemma 2.2, p. 14; proof of Corollary 2.4, pp. 14–15: “the jointly conservative functors” — Uses the finite cubical argument after exact localization; the parent node supplies the general theorem.

### The finite cyclotomic reconstruction functor

`HR.3/reconstruction-functor` · construction · planet “Cyclotomic reconstruction” · HR.3 packet

For A commutative and m>0 construct R_{A,m}: lim_{S∈P(m)} CAlg(D_S) → CAlg(D̂_{q^m−1}(A[q])). Extend a local section to Q(m) using the parent right-Kan-extension equivalences; regard its components as E∞-A[q]-algebras via the lax monoidal inclusions into D(A[q]); then take their finite homotopy limit. On morphisms take the coherent limit of the local algebra morphisms. The completion functor C_{A,m}(E)=(E^∧_{I_S})_S and R_{A,m} are inverse equivalences, with natural unit and counit. Every solution space with specified local identifications and prime-edge comparisons is contractible.

**Hypotheses.**

- A local input is an object of the coherent limit, not an unglued tuple of algebras.
- The inclusion of a completed module category is a right adjoint with its canonical lax monoidal structure; its induced inclusion on algebras is used in forming the ambient limit.
- No replacement of finite homotopy limits by underived equalizers is made, and the result need not be static.

**Construction.**

1. Use the parent morphism-level statement and requested right-Kan-extension formula to extend from P to Q; empty intersections contribute the unique zero-algebra component, and nontrivial chain intersections use their chain component.
2. Use the requested algebra-limit theorem to form the finite ambient E∞ algebra limit; its underlying module is the module limit. All components are f-complete, so their limit is f-complete by DD.1.
3. The finite-localization contract identifies every completed reconstructed component with the input component. It also identifies E with R(C(E)). Units, counits and their triangle homotopies come from coherent cone universality.
4. Take limits of morphisms, giving the inverse on the full infinity-category. The parent Corollary 2.4 identifies a prime-edge family with a section and yields its contractible solution space.

**API.**

- `CyclotomicReconstruction.ofSection` (constructor): A coherent P(m)-section maps to its Q(m)-extended finite limit algebra, which is (q^m−1)-complete.
- `CyclotomicReconstruction.complete` (projection): Completion of the reconstruction at Φ_d is naturally equivalent to the singleton component E_d, respecting every prime edge.
- `CyclotomicReconstruction.map` (functoriality): A coherent map of local sections induces a map of reconstructed algebras.
- `CyclotomicReconstruction.map_id` (simp): Reconstruction carries the identity section map to the identity map.
- `CyclotomicReconstruction.map_comp` (functoriality): Reconstruction carries composition to composition, with coherent functor laws.
- `CyclotomicReconstruction.unit` (equivalence): E→R(C(E)) is the natural equivalence defined by completion units and the limiting cone.
- `CyclotomicReconstruction.counit` (equivalence): C(R(s))→s is the natural equivalence on local sections; together with the unit it satisfies the triangle homotopies.
- `CyclotomicReconstruction.solutionSpace` (universal-property): For each fixed prime-edge input s, the space of pairs (E,C(E)≃s) is contractible.

**Unit tests.**

- `CyclotomicReconstruction.test_one` (degenerate): At m=1, R(E_1)≃E_1 with the indicated completion counit.
- `CyclotomicReconstruction.test_prime` (characterisation): At m=p, prime, R is the specified homotopy pullback over the common p-completion, naturally on objects and morphisms.
- `CyclotomicReconstruction.test_unit` (compatibility): For E_d=(A[q])^∧_{Φ_d} with canonical common-completion identifications, R(E_d)≃(A[q])^∧_{q^m−1}, as complete E∞-A[q]-algebras.
- `CyclotomicReconstruction.test_four` (computation): At m=4 the comparison on the surviving {1,4} overlap is h_(2,1) composed with h_(2,2); it is not an independently supplied third comparison.

**Acceptance.**

- m=1: reconstruction is naturally equivalent to evaluation at {1}.
- m=p prime: reconstruction is the homotopy pullback E_1 ×_{(E_1)^∧_p} E_p, with E_p→(E_p)^∧_p→(E_1)^∧_p determined by the supplied equivalence.
- m=4: the comparison between E_4 and E_1 after 2-completion is the composite of the two successive comparisons.

**Used by.**

- HR.4 finite relative Habiro rings, Wagner 2.7–2.9: Instantiate with Frobenius-twisted étale local algebras and their actual p-completed Frobenius equivalences.
- HR.4 transitions and Wagner Remark 2.10: Reconstruct coherent local maps, and derive identity/composition of transition maps from functoriality.

**Depends on.** this roadmap: `HR.3/coherent-completion-diagram`, `HR.3/finite-localisation-contract`, `HR.3/the-morphism-level-statement`, `HR.3/the-complete-descent-corollary`; stages: `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E3`, `EnhancedDerivedSheaves:E5:abstract`, `DerivedDeRhamCohomology:DD.1`.

**Library.** proposed module `TauCeti/RingTheory/Habiro/CyclotomicDescent/Reconstruction`, namespace `TauCeti.Habiro.CyclotomicReconstruction`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Proof sketch of Lemma 2.2, p. 14, essential-surjectivity step; proof of Corollary 2.4, p. 15: “The same argument shows essential surjectivity.” — Makes the inverse in the proof explicit as a coherent finite limit, with the Q-to-P reduction and the contractible-choice conclusion.

### Mapping spaces of finite cyclotomic prime-edge data

`HR.3/prime-edge-mapping-spaces` · theorem · planet “Cyclotomic descent mapping spaces” · HR.3 packet

Let A be commutative, m>0, and E,F be (q^m−1)-complete E∞-A[q]-algebras with singleton components E_d,F_d and comparison equivalences h^E_{p,d}:E_{pd}^∧_p→E_d^∧_p and h^F_{p,d}:F_{pd}^∧_p→F_d^∧_p. Put V=∏_{d|m} Map(E_d,F_d) and W=∏_{p prime, pd|m} Map(E_{pd}^∧_p,F_d^∧_p), all mapping spaces over A[q]. Define u(f)_(p,d)=f_d^∧_p∘h^E_{p,d} and v(f)_(p,d)=h^F_{p,d}∘f_{pd}^∧_p. Then Map(E,F) is naturally equivalent to the homotopy equalizer V ×_{W×W} W^{Δ¹}, where V→W×W is (u,v) and W^{Δ¹}→W×W is endpoint evaluation. This is an equivalence of spaces, so it also describes higher homotopies between maps. A glued map is an equivalence precisely when all its singleton components are equivalences.

**Hypotheses.**

- E,F are specified through coherent completion identifications; comparisons are actual E∞-A[q]-algebra equivalences.
- The paths in W are part of the morphism datum. Replacing them by equality on π_0, or asking only that the local maps commute up to an unspecified homotopy, loses information.
- There is no additional relation around the m=6 graph cycle, since the indexing nerve has no nondegenerate 2-simplices; the morphism space nevertheless contains its edge homotopies.

**Proof.**

1. Use the parent morphism-level equivalence to compute Map(E,F) in the limit of CAlg(D_S). Requested coherent-section limits and mapping-space universality compute this as the space of local maps and paths making each incidence square commute.
2. For each chain C(m,d0,p), choose its common component at d0. The space of eliminating this component and its incidence maps is contractible; successive comparison equivalences identify the remaining conditions with the prime edges on that chain. The prime-edge-factorisation lemma gives the unique consecutive-chain identification.
3. By the finite-index-height-one lemma, there are no nonidentity composites imposing extra triangle constraints. The resulting map space is exactly the displayed homotopy equalizer, including all simplices, not just points.
4. Joint conservativity from the finite-localization contract detects equivalences on singleton components.

**Acceptance.**

- m=1 has W terminal and gives Map(E_1,F_1).
- m=p prime yields one path comparing the two completed local maps.
- m=6 has four local mapping spaces and four independent edge paths; requiring a fifth condition around its incidence cycle would contradict the section description.

**Depends on.** this roadmap: `HR.3/finite-descent-index`, `HR.3/finite-index-height-one`, `HR.3/prime-edge-factorisation`, `HR.3/reconstruction-functor`, `HR.3/the-morphism-level-statement`; stages: `EnhancedDerivedSheaves:E0`, `EnhancedDerivedSheaves:E5:abstract`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Proof of Corollary 2.4, p. 15, final limit and unravelling; Lemma 2.2, p. 14: “After unravelling of definitions” — The source identifies objects of this categorical limit with prime-edge input; the mapping-space statement follows by applying the same coherent-section description to transformations.

## HR.4 — Relative q-Witt rings and finite étale lifts

*Coverage in `HabiroRings.json`: partial, 12 nodes.* 12 packet nodes at this stage. Eleven nodes after review, from the companion paper (arXiv:2410.23078v5, 1.3 and §§2.1–2.6) and Wagner §2.2: truncated big Witt vectors; absolute q-Witt vectors with their universal property, ghost maps and ghost injectivity under p-torsion-freeness; the Λ-ring comparison maps s_m and c_m, with q-W_m(ℤ) ≅ ℤ[q]/(q^m − 1); relative q-Witt vectors with ghost maps, base change and the perfectly covered transfer; the theorem that Witt restriction maps do not extend (q-Witt 2.14, in the source's generality); étale base change and the ghost pushout; the construction of H_{R/A,m}; the Habiro–q-Witt comparison (Theorem 2.9 at finite level, with staticity by derived Nakayama); the Frobenius transitions (Remark 2.10) with their composition law and naturality; and the staticity of the limit (Theorem 2.9's last clause, by HR.2's Corollary B.4). The positive-degree q-de Rham–Witt complex is HQ.4's extension of these rings; HQ.4 imports them and HR.4 imports nothing from HQ.4. The naming rule — the transitions are Frobenius maps and no interface names a restriction operator on q-Witt vectors — is recorded in the hypotheses of the transition node. External inputs not yet owned are the gaps 'Unique completed deformations of étale algebras' and 'Big Witt vectors of étale maps'. q-Witt Proposition 2.15 with Corollaries 2.19 and 2.22 (Koszul exactness, injective Verschiebungen, inheritance of p-torsion-freeness) lies off the path to this layer's targets and is not planned; HabiroCohomologyFoundations:HQ.4/ghost-maps-and-what-they-do-not-define cites Corollary 2.22 through HR.4/relative-q-witt-rings, so either that citation is dropped or HR.4 adds the proposition (restructure note). Remaining: Gap: 'Λ-rings as big-Witt coalgebras versus the torsion-free Adams form, and big Witt vectors'. Gap: 'Unique completed deformations of étale algebras'. Gap: 'Big Witt vectors of étale maps'.

*Coverage in `HabiroRings--HR.4.json`: planned, 7 nodes.* All twelve parent HR.4 targets remain imports: absolute/relative q-Witt, F/V/ghost/no restriction, c_m, q-Witt étale/ghost pushouts and obstruction, finite H_{R/A,m}, Theorem 2.9, Frobenius transitions and global static inverse limit. Seven new support nodes make the missing object deformation and coherent comparison obligations explicit, with API and tests. The three parent HR.4 gaps are accounted for: Λ gap supplied by accepted HR.1; deformation gap planned here conditional on exact generic suppliers; big-Witt étale gap retained explicitly. This completed target-level pass is not closed. Remaining: Discharge the QW.0 ordinary big-Witt étale/Frobenius-pushout input and the DD.1/E1/E5 enhanced refinements, including the generic supplier gaps inherited from HR.3. Install the actual coefficient/enhanced carriers and type the two named enhanced signatures. On accepted RS-10 atomic installation, move existing degree-zero q-Witt nodes and consumers to QW.2–QW.4 and big-Witt/Λ interfaces to QW.0/QW.1; do not keep parallel implementations.

The layer has nineteen nodes: the first packet's twelve, from the q-Witt paper (§§2.1–2.6) and Wagner §2.2, and the HR.4 part's seven, which plan the unique completed deformations of étale algebras that the first packet recorded as a gap. The HR.4 part is `planned`; it keeps four supplier requests (QWittVectors QW.0, DerivedDeRhamCohomology DD.1, EnhancedDerivedSheaves E1 and E5:abstract) and two gaps.

- **Big Witt and q-Witt vectors** (interim owner; RS-10 moves them to QWittVectors QW.0–QW.4 when that roadmap is installed).
  - W_S(R) for every truncation set, with ghost maps, F, V, restriction and Teichmüller lifts, and the comparison with Mathlib's p-typical truncated Witt vectors for S = {1, p, …, p^n}.
  - q-W_m(R), the initial q-FV-system, explicitly W_m(R)[q]/I_m; its ghost maps are jointly injective when R is p-torsion free for the primes p | m (Lemma 2.23).
  - Restriction maps do not extend: a ℤ[q]-algebra map q-W_m(R) → q-W_d(R) compatible with Res_{m/d} would map R[ζ_m] to R[ζ_d], which is impossible for m = p^α and p·1_R ≠ 0 (q-Witt 2.14). There is no ring lim_{Res} q-W_m(R), and the transitions below are Frobenii.
  - For a Λ-ring A, the maps s_m : A[q]/(q^m − 1) → q-W_m(A) and c_m : q-W_m(A) → A[q]/(q^m − 1) give q-W_m(ℤ) ≅ ℤ[q]/(q^m − 1); the relative rings q-W_m(R/A) are the quotients of q-W_m(R) ⊗_{q-W_m(A), c_m} A[q]/(q^m − 1) of Lemma 2.41, with ghost maps, base change (Lemma 2.46) and the transfer of ghost injectivity to perfectly covered bases.
  - Étale base change: for R → R′ étale, q-W_m(R/A) → q-W_m(R′/A) is étale, with the Frobenius pushout of Proposition 2.48, and the relative ghost squares are pushouts (Corollary 2.51); so for R étale over A, q-W_m(R/A) is étale over A[q]/(q^m − 1) with Φ_d-reduction R ⊗_{A,ψ^d} A[q]/Φ_d(q). An isomorphism q-W_m(R) ≅ R[q]/(q^m − 1) would force a global Frobenius lift (Corollary 2.52).
- **The finite stages and Theorem 2.9.**
  - H_{R/A,m} glues the E_d = (R ⊗_{A,ψ^d} A)[q]^∧_{Φ_d(q)} along the linearised Frobenius by Corollary 2.4.
  - Theorem 2.9: H_{R/A,m} is the unique (q^m − 1)-complete étale lift of q-W_m(R/A), so H_{R/A,m}/(q^m − 1) ≅ q-W_m(R/A), and it is static. It needs R étale, which the source omits (E2), and its staticity argument works modulo q^m − 1, not modulo p (E3).
  - Remark 2.10: the transitions t_{m,d} compose, and modulo q^m − 1 they are the q-Witt Frobenii F_{m/d}, naturally in pairs.
  - The limit along the transitions is Habiro-complete and static, with Φ_m-completion E_m.
- **Marked étale deformations** (the HR.4 part, after Stacks 04D1 and 0ALI).
  - A marked étale deformation of an étale B/I-algebra D is an étale B-algebra with an identification of its reduction with D; it need not be module-finite. One exists for every ideal I, by lifting a relative-dimension-zero presentation and inverting its Jacobian.
  - Over a nilpotent ideal, reduction is bijective on maps, so marked lifts are unique up to unique marked isomorphism.
  - The I-adic completion W of a marked lift, for I finitely generated, is complete with marked reduction D, and maps out of it into I-adically complete algebras correspond to maps of reductions.
  - For a principal ideal (f) with f a non-zero-divisor, W is the unique derived f-complete E∞-lift: it is static and f-regular, and the space of marked equivalences to any derived f-complete lift is contractible. This is the uniqueness Theorem 2.9 uses.
  - The relative ghosts identify the completions of the lift W of q-W_m(R/A) with the E_d, and at each prime edge they carry W's overlap identifications to the linearised Frobenius; this gives a coherent HR.3 section and the equivalence W ≃ H_{R/A,m}. For m = 6 the four prime edges carry paths and no extra cycle equation.

For the staticity of the limit (`HR.4/the-limit-of-the-finite-stages-is-static`), REV-HabiroRings--HR.4 asks the assembly to use the HR.4 part's argument, which commutes only the reduction modulo Φ_d(q), a finite cofibre, with the limit, instead of the first packet's step that commutes derived completion with it. The first packet's proof of Theorem 2.9 (`HR.4/the-etale-lift`) still cites the deformation gap; the HR.4 part now plans that input. The Assembly notes after both nodes give the refined arguments. Proposition 2.15, Corollaries 2.19 and 2.22, Example 2.38 as a statement, the localisation formula for q-W_m(R[1/m]/A) and the p-local decomposition of q-Witt Lemma 4.36 are not planned here; HabiroCohomologyFoundations asks for some of them (see Requests), and RS-10 gives them to QWittVectors QW.2–QW.4.

### Truncated big Witt vectors W_S(R), with Frobenius, Verschiebung, restriction and Teichmüller lifts

`HR.4/truncated-big-witt-vectors` · definition · planet “Truncated big Witt vectors” · first packet · added by REV-HabiroRings

For a commutative ring R and a truncation set S (a set of positive integers closed under divisors), the S-truncated big Witt ring W_S(R) has underlying set R^S and the unique ring structure, functorial in R, for which every ghost map gh_n: W_S(R) → R, gh_n((x_i)_{i∈S}) = Σ_{d|n} d·x_d^{n/d} (n ∈ S), is a ring map. For S = T_m, the divisors of m, write W_m(R). For d | m there are a ring map F_{m/d}: W_m(R) → W_d(R) (Frobenius), an additive map V_{m/d}: W_d(R) → W_m(R) (Verschiebung, W_m(R)-linear for the module structure given by F_{m/d}), the restriction ring map Res_{m/d}: W_m(R) → W_d(R) (restriction of coordinates from T_m to T_d) and the multiplicative Teichmüller lift τ_m: R → W_m(R), satisfying F_{d/e}F_{m/d} = F_{m/e}, V_{m/d}V_{d/e} = V_{m/e}, F_nV_n = n, F_nV_k = V_kF_n for (k, n) = 1, gh_e ∘ F_n = gh_{ne}, gh_e ∘ V_n = n·gh_{e/n} if n | e and 0 otherwise, F_{m/d}τ_m(r) = τ_d(r)^{m/d} and x = Σ_{d|m} V_{m/d}τ_d(x_{m/d}). For m = p^n, W_{p^n}(R) is the ring of p-typical Witt vectors of length n + 1, with F_p, V_p and τ the p-typical ones. For a Λ-ring A (HR.1) there is a section s: A → W_S(A) of gh_1 with gh_n ∘ s = ψ^n (the cofree property).

**Hypotheses.**

- R is commutative and unital; the source allows non-unital rings, which this roadmap does not use.
- S is a truncation set; the roadmap uses S = T_m and, for the section s, the set of all positive integers (or of those whose prime factors divide m, q-Witt Remark 2.32).
- Res_{m/d} exists on W_m(R) but, by the obstruction theorem of this layer, it does not extend to q-Witt vectors.
- V_n F_n = n is false in general; only F_n V_n = n holds (test).

**Construction.**

1. Define addition and multiplication by the polynomials determined by the ghost maps, whose integrality is Dwork's lemma for truncation sets (Hesselholt 2015, §1); functoriality in R is by construction.
2. Construct F_{m/d}, V_{m/d}, Res_{m/d} and τ_m and prove the listed relations on ghost components for ℤ-torsion-free R, where the ghost map is injective, and for all R by functoriality (every ring is a quotient of a torsion-free one).
3. Compare W_{p^n}(R) with Mathlib's TruncatedWittVector p (n+1) R by x_{p^i} ↦ coefficient i, matching gh_{p^k} with WittVector.ghostComponent k and F_p, V_p, τ with WittVector.frobenius, WittVector.verschiebung and WittVector.teichmuller.
4. For a torsion-free Λ-ring A, s(x) is the Witt vector with ghost components (ψ^n(x))_{n∈S}; it exists by Dwork's criterion with the Frobenius lifts ψ^p, since ψ^{pn}(x) = ψ^p(ψ^n(x)) (the composition law of HR.1).

**API.**

- `BigWittVector` (data): BigWittVector S R, the S-truncated big Witt ring, a commutative ring whose underlying set is R^S.
- `BigWittVector.ghost` (data): gh_n: W_S(R) → R for n ∈ S, gh_n(x) = Σ_{d|n} d·x_d^{n/d}, a ring map.
- `BigWittVector.ghost_injective` (characterisation): If R is ℤ-torsion-free, x ↦ (gh_n(x))_{n∈S} is injective.
- `BigWittVector.frobenius` (data): F_{m/d}: W_m(R) → W_d(R) for d | m, a ring map with gh_e ∘ F_{m/d} = gh_{(m/d)e}.
- `BigWittVector.verschiebung` (data): V_{m/d}: W_d(R) → W_m(R) for d | m, additive, with gh_e ∘ V_n = n·gh_{e/n} if n | e and 0 otherwise.
- `BigWittVector.restrict` (data): Res_{m/d}: W_m(R) → W_d(R), restriction of coordinates to T_d, a ring map commuting with gh_e for e | d.
- `BigWittVector.teichmuller` (data): τ_m: R → W_m(R), multiplicative, with gh_e(τ_m(r)) = r^e.
- `BigWittVector.frobenius_comp` (relation): F_{d/e} ∘ F_{m/d} = F_{m/e} and V_{m/d} ∘ V_{d/e} = V_{m/e} for e | d | m.
- `BigWittVector.frobenius_verschiebung` (relation): F_n ∘ V_n = n, and F_n ∘ V_k = V_k ∘ F_n when (k, n) = 1.
- `BigWittVector.frobenius_teichmuller` (simp): F_{m/d}(τ_m(r)) = τ_d(r)^{m/d}.
- `BigWittVector.eq_sum_verschiebung_teichmuller` (characterisation): x = Σ_{d|m} V_{m/d}(τ_d(x_{m/d})) for x = (x_d)_{d|m}.
- `BigWittVector.restrict_verschiebung` (relation): Res_{m/d} ∘ V_n = V_n ∘ Res if n | d, and Res_{m/d} ∘ V_n = 0 if n ∤ d.
- `BigWittVector.map` (functoriality): A ring map R → R′ induces W_S(R) → W_S(R′) coordinatewise, commuting with gh, F, V, Res and τ; map_id and map_comp.
- `BigWittVector.equivTruncatedWittVector` (compatibility): For p prime and m = p^n, W_{p^n}(R) ≅ TruncatedWittVector p (n+1) R via x ↦ (x_{p^i})_{i≤n}, identifying gh_{p^k} with WittVector.ghostComponent k (k ≤ n) and F_p, V_p, τ with the p-typical operators.
- `BigWittVector.lambdaSection` (constructor): For a Λ-ring A (HR.1), s: A → W_S(A) with gh_n(s(x)) = ψ^n(x); for torsion-free A it exists by Dwork's criterion with the Frobenius lifts ψ^p.

**Unit tests.**

- `BigWittVector.ghost_two_int` (computation): For R = ℤ and m = 2, (gh_1, gh_2): W_2(ℤ) → ℤ × ℤ, (x_1, x_2) ↦ (x_1, x_1^2 + 2x_2), is injective with image {(a, b) : a ≡ b mod 2}.
- `BigWittVector.verschiebung_frobenius_ne` (non-example): In W_2(ℤ), V_2(F_2(1)) = V_2(1) has ghost vector (0, 2), while 2 has ghost vector (2, 2); so V_2 ∘ F_2 ≠ 2, although F_2 ∘ V_2 = 2.
- `BigWittVector.teichmuller_two` (computation): τ_2(2) = (2, 0) in W_2(ℤ) has ghost vector (2, 4), and every x = (x_1, x_2) in W_2(R) equals τ_2(x_1) + V_2(τ_1(x_2)).
- `BigWittVector.equivTruncatedWittVector_ghost` (compatibility): For p prime and n ≥ 0, under W_{p^n}(R) ≅ TruncatedWittVector p (n+1) R the ghost map gh_{p^k} (k ≤ n) is Mathlib's WittVector.ghostComponent k, the Witt polynomial Σ_{i≤k} p^i X_i^{p^{k−i}}.
- `BigWittVector.restrict_two` (computation): Res_2: W_2(R) → W_1(R) = R is (x_1, x_2) ↦ x_1 = gh_1(x), and Res_2(V_2(1)) = 0.
- `BigWittVector.one` (degenerate): W_1(R) = R with gh_1 the identity, and F_1, V_1 and Res_1 are identities.

**Acceptance.**

- The ghost formula, the relations and the p-typical comparison hold as stated.
- The operators F_{m/d}, V_{m/d} and Res_{m/d} are defined exactly for d | m.

**Used by.**

- HR.4, q-Witt vectors: q-W_m(R) is a quotient of W_m(R)[q].
- HR.4, the Λ-ring comparison maps: s, Res and the representation x = Σ V_d(s(x_{m/d})) define ε_m and c_m.
- HR.4, the restriction obstruction: Res_{m/d} and its commutation with the Verschiebungen.
- HabiroCohomologyFoundations:HQ.4 and CrystallineCohomology:CR.4: Truncation sets for the q-de Rham–Witt complexes; the p-typical comparison.

**Depends on.** this roadmap: `HR.1/lambda-rings-with-commuting-adams-operations`; libraries: `mathlib:WittVector`, `mathlib:TruncatedWittVector`, `mathlib:WittVector.ghostComponent`, `mathlib:WittVector.frobenius`, `mathlib:WittVector.verschiebung`, `mathlib:WittVector.teichmuller`, `mathlib:Nat.divisors`.

**Sources.**

- `Wagner.qWitt.2024`, 2.6, PDF p. 10: “Its ring structure is uniquely determined by the condition that for all n ∈ S the ghost map gh_n : W_S(R) → R given by gh_n((x_i)_{i∈S}) := Σ_{d|n} dx^{n/d}_d is a morphism of rings and functorial in R.” — The definition (display checked on the rendered page).
- `Wagner.qWitt.2024`, 2.6, PDF p. 10: “for every divisor d | m there are Frobenius and Verschiebung maps F_{m/d} : W_m(R) → W_d(R) and V_{m/d} : W_d(R) → W_d(R) such that F_{m/d} is a ring map and V_{m/d} is a map of abelian groups” — The operators; the printed target of V_{m/d} is a misprint for W_m(R) (source issue).
- `Wagner.qWitt.2024`, 2.6, PDF p. 10: “For all chains of divisors e | d | m we have F_{d/e} ◦F_{m/d} = F_{m/e} and V_{m/d} ◦V_{d/e} = V_{m/e} . Furthermore, if n ⩾1 is arbitrary and k is coprime to n, then F_n ◦V_n = n and F_n ◦V_k = V_k ◦F_n” — The relations.
- `Wagner.qWitt.2024`, Remark 2.7, PDF p. 11: “If m = p^n is a prime power, then W_{p^n}(R) ≅ W_{n+1}(R) equals the ring of truncated p-typical Witt vectors of length n+1. Furthermore, the Frobenii and Verschiebungen F_p and V_p coincide with their p-typical namesakes F and V , as does the Teichmüller lift.” — The comparison with Mathlib's p-typical Witt vectors.
- `Wagner.qWitt.2024`, 2.31, PDF p. 26: “The cofree Λ-ring under A is the big Witt ring W(A), hence we get a section s: A → W(A) of gh_1.” — The section s for a Λ-ring.

### The m-truncated big q-Witt vectors q-W_m(R)

`HR.4/q-witt-vectors` · definition · planet “q-Witt vectors” · first packet · added by REV-HabiroRings

For a commutative ring R, a q-FV-system of rings over R is a family (W_m)_{m≥1} of ℤ[q]-algebras with ℤ[q]-algebra maps W_m(R)[q]/(q^m − 1) → W_m and, for d | m, a ℤ[q]-algebra map F_{m/d}: W_m → W_d and a ℤ[q]-module map V_{m/d}: W_d → W_m, compatible with the Frobenii and Verschiebungen of W_•(R) and satisfying F_{m/d}V_{m/d} = m/d and V_{m/d}F_{m/d} = [m/d]_{q^d} = (q^m − 1)/(q^d − 1). The category of these systems has an initial object (q-W_m(R))_{m≥1}, the m-truncated big q-Witt vectors, explicitly q-W_m(R) ≅ W_m(R)[q]/I_m, where I_m is generated by (q^d − 1)·im V_{m/d} for d | m and by im([d/e]_{q^e}V_{m/d} − V_{m/e}F_{d/e}) for e | d | m; the same holds for every truncation set. The first ghost map gh_1: q-W_m(R) → R[ζ_m] := R[q]/Φ_m(q) is the quotient by the images of the V_p (p | m), and gh_{m/d} := gh_1 ∘ F_{m/d}: q-W_m(R) → R[ζ_d] is compatible with the classical gh_{m/d}; there is a Teichmüller lift τ_m: R → q-W_m(R). If R is p-torsion-free for every prime p | m, the ghost maps gh_{m/d} (d | m) are jointly injective.

**Hypotheses.**

- R is commutative and unital; the source allows non-unital R, needed only for its Corollary 2.29.
- The structure has no restriction maps: F_{m/d} and V_{m/d} are defined exactly for d | m, and the Witt restriction does not extend (the obstruction theorem of this layer).
- Joint injectivity of the ghost maps needs R to be p-torsion-free for every prime p | m; without it it fails (test).
- q-W_m(R) is not a q-deformation of W_m(R): modulo q − 1 the relation V_{m/d}F_{m/d} = m/d is imposed (q-Witt Remark 2.11).

**Construction.**

1. The ℤ[q]-linear extensions of V_{m/d} preserve the generators of I_m by construction; for the Frobenii it suffices that F_p(I_m) ⊆ I_{m/p} for primes p | m, checked on the two kinds of generators in the three cases of q-Witt Lemma 2.9's proof, using the relations of big Witt vectors and that [d/e]_{q^e} − [d_0/e_0]_{q^{e_0}} is divisible by q^{d/p} − 1 when p ∤ d/e.
2. Initiality follows from the definition of I_m; the proof works for every truncation set (Remark 2.12).
3. Ghost maps: q-W_m(R)/(im V_p : p | m) ≅ R[q]/([p]_{q^{m/p}} : p | m) ≅ R[q]/Φ_m(q), using W_m(R)/(im V_p) ≅ R and the ideal equality ([p]_{q^{m/p}} : p prime, p | m) = (Φ_m(q)) in ℤ[q] (q-Witt Lemma 2.2, proved from the comaximality of cyclotomic polynomials, HabiroCyclotomicCompletions:HC.4/cyclotomic-comaximality-and-resultant, and the unit-ideal Lemma 2.3).
4. Compatibility with the classical ghost maps and the Teichmüller lift: compose with W_m(R) → q-W_m(R).
5. Joint injectivity (q-Witt Lemma 2.23): write a non-zero x as Σ_{d|m} V_{m/d}(x_d) with each x_d zero or with gh_1(x_d) ≠ 0 (repeated use of the ghost quotient); for x_d ≠ 0 with m/d minimal, gh_{m/d}(x) = (m/d)·gh_1(x_d) ≠ 0 because R[ζ_d] is free over R and R is (m/d)-torsion-free.

**API.**

- `QWittVector` (data): q-W_m(R) := W_m(R)[q]/I_m, an algebra over ℤ[q]/(q^m − 1).
- `QFVSystem` (structure): q-FV-systems of rings over R (q-Witt Definition 2.8) and their morphisms.
- `QWittVector.ofWitt` (projection): The surjection W_m(R)[q]/(q^m − 1) → q-W_m(R).
- `QWittVector.frobenius` (data): F_{m/d}: q-W_m(R) → q-W_d(R), a ℤ[q]-algebra map, for d | m.
- `QWittVector.verschiebung` (data): V_{m/d}: q-W_d(R) → q-W_m(R), ℤ[q]-linear, for d | m.
- `QWittVector.frobenius_verschiebung` (relation): F_{m/d} ∘ V_{m/d} = m/d.
- `QWittVector.verschiebung_frobenius` (relation): V_{m/d} ∘ F_{m/d} = [m/d]_{q^d}.
- `QWittVector.frobenius_comp` (relation): F_{d/e} ∘ F_{m/d} = F_{m/e} and V_{m/d} ∘ V_{d/e} = V_{m/e}.
- `QWittVector.lift` (universal-property): For every q-FV-system (W_m) over R, the unique morphism of systems q-W_•(R) → W_•; lift ∘ ofWitt is the structure map, and uniqueness.
- `QWittVector.truncatedLift` (universal-property): Initiality among S-truncated q-FV-systems for every truncation set S (Remark 2.12).
- `QWittVector.ghost` (data): gh_{m/d}: q-W_m(R) → R[q]/Φ_d(q), gh_{m/d} = gh_1 ∘ F_{m/d}, and gh_{m/d} ∘ ofWitt is the classical gh_{m/d} followed by R → R[ζ_d].
- `QWittVector.ghost_one_eq_quotient` (characterisation): gh_1 identifies R[q]/Φ_m(q) with q-W_m(R)/(im V_p : p prime, p | m).
- `QWittVector.ghost_jointly_injective` (characterisation): If R is p-torsion-free for all primes p | m, (gh_{m/d})_{d|m} is injective (Lemma 2.23).
- `QWittVector.teichmuller` (data): τ_m: R → q-W_m(R), multiplicative, the image of the Witt Teichmüller lift.
- `QWittVector.map` (functoriality): Ring maps R → R′ induce q-W_m(R) → q-W_m(R′) compatible with F, V, gh and τ; map_id and map_comp.
- `Polynomial.span_geomSum_eq_span_cyclotomic` (other): q-Witt Lemma 2.2: in ℤ[q], the ideal generated by the [p]_{q^{m/p}} for the primes p | m is (Φ_m(q)).

**Unit tests.**

- `QWittVector.two_int` (computation): q-W_2(ℤ) ≅ ℤ[q]/(q^2 − 1), with 1 ↦ 1 and the class of V_2(1) ↦ 1 + q: the generator (1 + q)·1 − V_2F_2(1) of I_2 forces V_2(1) = 1 + q, and then (q − 1)V_2(1) = q^2 − 1 = 0.
- `QWittVector.frobenius_verschiebung_two` (computation): In q-W_2(ℤ) ≅ ℤ[q]/(q^2 − 1), F_2 is q ↦ 1 onto ℤ = q-W_1(ℤ), F_2(V_2(1)) = 2 and V_2(F_2(1)) = 1 + q = [2]_q.
- `QWittVector.teichmuller_two` (computation): τ_2(2) = 3 + q in q-W_2(ℤ) ≅ ℤ[q]/(q^2 − 1); its ghost values are 2 at q = −1 and 4 at q = 1.
- `QWittVector.not_naive_quotient` (non-example): q-W_2(ℤ) has ℤ-rank 2 while W_2(ℤ)[q]/(q^2 − 1) has rank 4: the generators of the second kind cannot be omitted.
- `QWittVector.not_q_deformation` (non-example): q-W_2(ℤ)/(q − 1) ≅ ℤ, whereas W_2(ℤ) has ℤ-rank 2.
- `QWittVector.ghost_not_injective_F2` (non-example): q-W_2(F_2) ≅ W_2(F_2) ≅ ℤ/4 with q acting as 1 (the generator (1 + q)x − V_2F_2(x) = (q − 1)x forces q = 1); both ghost maps are the reduction ℤ/4 → F_2 and kill 2, so without p-torsion-freeness the ghost maps are not jointly injective.
- `QWittVector.ofWitt_small` (compatibility): W_2(ℤ) → q-W_2(ℤ) is a ring isomorphism (1 ↦ 1, V_2(1) ↦ 1 + q), while W_4(ℤ) → q-W_4(ℤ) ≅ ℤ[q]/(q^4 − 1) is injective (q-Witt Proposition 2.28) but not surjective (ℤ-ranks 3 and 4).
- `QWittVector.one` (degenerate): q-W_1(R) ≅ R, with q acting as 1.

**Acceptance.**

- q-W_m(R) is the initial q-FV-system and has the explicit presentation.
- The ghost description holds under the p-torsion-freeness hypothesis and fails without it.

**Used by.**

- HR.4, relative q-Witt vectors: q-W_m(R/A) is a quotient of q-W_m(R) ⊗_{q-W_m(A)} A[q]/(q^m − 1).
- HR.4, the restriction obstruction: The ghost quotient R[ζ_m] carries the obstruction.
- HabiroCohomologyFoundations:HQ.4: The degree-zero input of the q-V- and q-FV-systems of differential graded algebras.

**Depends on.** this roadmap: `HR.4/truncated-big-witt-vectors`; other roadmaps: `HabiroCyclotomicCompletions:HC.4/cyclotomic-comaximality-and-resultant`; libraries: `mathlib:Polynomial.cyclotomic`, `mathlib:Polynomial.prod_cyclotomic_eq_X_pow_sub_one`.

**Sources.**

- `Wagner.qWitt.2024`, Definition 2.8, PDF p. 11: “(a) For all m ∈N, a Z[q]-algebra map W_m(R)[q]/(q^m −1) → W_m. (b) For all divisors d | m, a Z[q]-algebra morphism F_{m/d} : W_m → W_d and a Z[q]-module morphism V_{m/d} : W_d → W_m.” — The structure of a q-FV-system.
- `Wagner.qWitt.2024`, Definition 2.8, PDF p. 11: “These must be compatible with the usual Frobenii and Verschiebungen on ordinary Witt vectors (via the morphisms from (a)) and satisfy F_{m/d} ◦V_{m/d} = m/d and V_{m/d} ◦F_{m/d} = [m/d]_{q^d} .” — Its axioms.
- `Wagner.qWitt.2024`, Lemma 2.9, PDF p. 11: “q-W_m(R) ≅W_m(R)[q]/I_m , where I_m is the ideal generated by the following two kinds of generators: (a) (q^d −1) im V_{m/d} for all divisors d | m, and (b) im([d/e]_{q^e}V_{m/d} −V_{m/e}F_{d/e}) for all chains of divisors e | d | m.” — The initial object and its presentation.
- `Wagner.qWitt.2024`, 2.13, PDF p. 13: “gh_{m/d} : q-W_m(R) → R[ζ_d] as the composition of F_{m/d} : q-W_m(R) → q-W_d(R) with gh_1 : q-W_d(R) → R[ζ_d].” — The ghost maps.
- `Wagner.qWitt.2024`, Lemma 2.23, PDF p. 20: “If R is p-torsion-free for all prime factors p | m, then the ghost maps gh_{m/d} : q-W_m(R) → R[ζ_d] for d | m are jointly injective.” — The ghost description with its torsion hypothesis.
- `Wagner.qWitt.2024`, Remark 2.11, PDF p. 11: “Despite the name, q-W_m(R) is almost never a q-deformation of W_m(R). Indeed, we have V_{m/d} ◦F_{m/d} = m/d in the quotient q-W_m(R)/(q −1).” — The last hypothesis and a non-example.

### Restriction maps do not extend to q-Witt vectors

`HR.4/there-is-no-restriction-map` · theorem · first packet

Let R be a commutative ring, m ≥ 1 and d | m with d ≠ m. If r: q-W_m(R) → q-W_d(R) is a ℤ[q]-algebra map compatible with the restriction Res_{m/d}: W_m(R) → W_d(R) under the canonical maps W_m(R)[q] → q-W_m(R) and W_d(R)[q] → q-W_d(R), then r carries the ideal generated by the images of the Verschiebungen V_p (p | m) into the corresponding ideal of q-W_d(R) and induces an R[q]-algebra map R[ζ_m] = R[q]/Φ_m(q) → R[q]/Φ_d(q) = R[ζ_d]; in particular Φ_m(q) becomes 0 in R[q]/Φ_d(q). If m = p^α is a prime power and p·1_R ≠ 0, no such r exists. Consequently the q-W_m(R) do not form an inverse system along extensions of the restriction maps, and there is no ring q-W(R) := lim_{m,Res} q-W_m(R); the maps that do exist between the levels are the F_{m/d} and V_{m/d}.

**Hypotheses.**

- 'Compatible with Res_{m/d}' means compatible with the canonical maps from W_m(R)[q] and W_d(R)[q]; compatibility with the Verschiebungen is not assumed, it is forced.
- Non-existence is proved for m = p^α with p·1_R ≠ 0, the source's example; in characteristic p the argument gives no obstruction and none is claimed.
- Nothing is claimed about ℤ[q]-algebra maps that are not compatible with Res_{m/d}; the Frobenius transitions of this layer are such maps.

**Proof.**

1. By the presentation q-W_e(R) = W_e(R)[q]/I_e, the image of V_{m/e}: q-W_e(R) → q-W_m(R) is the ℤ[q]-span of the images of V_{m/e}(W_e(R)); since Res_{m/d} ∘ V_n = V_n ∘ Res if n | d and Res_{m/d} ∘ V_n = 0 if n ∤ d (HR.4/truncated-big-witt-vectors), r maps (im V_p : p | m) into (im V_p : p | d).
2. On the ghost quotients (HR.4/q-witt-vectors) r induces a ℤ[q]-algebra map R[q]/Φ_m(q) → R[q]/Φ_d(q), which is the identity on R because Res preserves the first Witt coordinate gh_1.
3. For m = p^α and d = p^β with β < α: q^{p^β} ≡ 1 modulo Φ_{p^β}(q) (Mathlib's Polynomial.cyclotomic.dvd_X_pow_sub_one), so Φ_{p^α}(q) = Σ_{i<p} q^{i·p^{α−1}} ≡ p (Mathlib's Polynomial.cyclotomic_prime_pow_eq_geom_sum); since R[q]/Φ_d(q) is free over R with 1 in a basis, p = 0 there only if p·1_R = 0.
4. An inverse limit along restrictions would need such maps for all divisors; it therefore does not exist.

**Acceptance.**

- m = 2, d = 1, R = ℤ: q-W_2(ℤ) ≅ ℤ[q]/(q^2 − 1) and q-W_1(ℤ) = ℤ; the only ℤ[q]-algebra map sends q ↦ 1 and hence V_2(1) = 1 + q ↦ 2, while Res_2(V_2(1)) = 0 in W_1(ℤ): no compatible map. Here Φ_2(q) = q + 1 ≡ 2 modulo q − 1.
- m = 9, d = 3: Φ_9(q) ≡ 3 modulo Φ_3(q) (computed), so Res_3 extends over no R with 3·1_R ≠ 0.
- Characteristic p: for R = F_2 and m = 2, q-W_2(F_2) ≅ ℤ/4 with q = 1, q-W_1(F_2) = F_2, and the reduction ℤ/4 → F_2 is a ℤ[q]-algebra map extending Res_2; so the hypothesis p·1_R ≠ 0 cannot be dropped.
- More generally (a computation beyond the source's example): the induced map R[ζ_m] → R[ζ_d] exists only if R = 0 or m/d is a power of a prime p with p·1_R = 0, because ℤ[q]/(Φ_m, Φ_d) = 0 unless m/d is a prime power (HabiroCyclotomicCompletions:HC.4/cyclotomic-comaximality-and-resultant) and Φ_m(q) is p times a unit modulo Φ_d(q) when m/d = p^k (for example Φ_6 ≡ −2q modulo Φ_3, Φ_12 ≡ 2(1 − q) modulo Φ_6, and Φ_6(1) = 1).

**Used by.**

- HabiroCohomologyFoundations:HQ.4: The q-V- and q-FV-systems are defined without restriction maps; HQ.4 imports this theorem.
- HR.4, the transitions: The transitions are named and identified as Frobenius maps, never as restrictions.

**Depends on.** this roadmap: `HR.4/q-witt-vectors`, `HR.4/truncated-big-witt-vectors`; libraries: `mathlib:Polynomial.cyclotomic_prime_pow_eq_geom_sum`, `mathlib:Polynomial.cyclotomic.dvd_X_pow_sub_one`.

**Sources.**

- `Wagner.qWitt.2024`, 1.3, PDF p. 3: “The only real exception is that the restriction maps for ordinary Witt vectors do not extend to maps Res_{m/d} : q-W_m(R) → q-W_d(R). In particular, we can’t define a big q-Witt ring q-W(R) := lim_{m∈N,Res} q-W_m(R).” — The statement and its consequence for the big ring; this is the '§1.3' the stage text cites.
- `Wagner.qWitt.2024`, 2.14, PDF p. 13: “Unfortunately, it turns out that the usual restriction maps Res_{m/d} : W_m(R) → W_d(R) do not extend to Z[q]-algebra morphisms between q-W_m(R) and q-W_d(R). Indeed, such a morphism would necessarily commute with the Verschiebungen and thus induce a Z[q]-algebra morphism” — The source's proof, first half.
- `Wagner.qWitt.2024`, 2.14, PDF p. 13: “R[ζ_m] = R[q]/Φ_m(q) → R[q]/Φ_d(q) = R[ζ_d] , which fails to exist even in very simple cases (e.g. m = p^α is a prime power, R is not a ring of characteristic p).” — The source's proof, second half, with the hypotheses of the non-existence clause.
- `Wagner.qWitt.2024`, 1.3, PDF p. 3: “But there seems to be at least some use in considering the limit lim_{m∈N, F} q-W_m(R) along the Frobenius maps” — The maps that do exist between the levels.

### The comparison maps s_m and c_m for q-Witt vectors of a Λ-ring

`HR.4/the-lambda-ring-comparison-maps` · construction · first packet · added by REV-HabiroRings

Let A be a Λ-ring with Adams operations ψ^m (HR.1). (i) The section s: A → W(A) of gh_1, composed with the restriction to W_m(A) and extended ℤ[q]-linearly, gives the trivial map s_m: A[q]/(q^m − 1) → q-W_m(A), whose composite with gh_{m/d} is the projection A[q]/(q^m − 1) → A[q]/Φ_d(q) followed by ψ^{m/d}. (ii) There are functorial maps of sets ε_m: W_m(A) → A with gh_m(x) = Σ_{d|m} d·ψ^{m/d}(ε_d Res_{m/d}(x)), and c_m(x) := Σ_{d|m} [d]_{q^{m/d}} ψ^{m/d}(ε_d Res_{m/d}(x)) is a ring map W_m(A) → A[q]/(q^m − 1), congruent to ψ^d ∘ gh_{m/d} modulo Φ_d(q). (iii) c_m extends uniquely to a functorial ring map c_m: q-W_m(A) → A[q]/(q^m − 1) carrying F_{m/d} to the projection A[q]/(q^m − 1) → A[q]/(q^d − 1) and V_{m/d} to multiplication by [m/d]_{q^d}, and c_m ∘ s_m is the ℤ[q]-linear extension of ψ^m. (iv) If all ψ^m are injective, c_m is an isomorphism onto Σ_{d|m} [d]_{q^{m/d}} ψ^{m/d}(A)[q]/(q^m − 1). (v) If A is perfect, s_m and c_m are isomorphisms; in particular q-W_m(ℤ) ≅ ℤ[q]/(q^m − 1).

**Hypotheses.**

- A is a Λ-ring in the sense of HR.1 (torsion-free, with commuting Adams operations). The source treats arbitrary Λ-rings, proving the uniqueness of ε_m only for ℤ-flat A and extending by reflexive coequalisers; the flat case is all this roadmap needs.
- (iv) needs injective Adams operations and (v) a perfect Λ-ring (all ψ^p bijective).
- For fixed m a Λ_m-structure would suffice (q-Witt Remark 2.32); this is not used.

**Construction.**

1. (i) Use the section s of HR.4/truncated-big-witt-vectors; gh_{m/d} ∘ s_m = ψ^{m/d} on ghost components because gh_n(s(x)) = ψ^n(x).
2. (ii) Every x in W_m(A) is uniquely Σ_{d|m} V_d(s_{m/d}(x_{m/d})) for torsion-free A (induction on m: x_m = gh_1(x), and gh_p(x) = ψ^p(x_m) + p·x_{m/p} determines x_{m/p}); put ε_m(x) := x_1 and compute gh_m.
3. (ii) For torsion-free A the map A[q]/(q^m − 1) → ∏_{d|m} A[q]/Φ_d(q) is injective, and [e]_{q^{m/e}} ≡ e or 0 modulo Φ_d(q) according as d | m/e or not; hence c_m ≡ ψ^d ∘ gh_{m/d} modulo Φ_d(q), a ring map.
4. (iii) Check the two squares for W_m(A) modulo each Φ_d(q); then (A[q]/(q^m − 1))_m with these F and V is a q-FV-system over A, and the universal property of q-W gives c_m; c_m ∘ s_m = ψ^m is checked modulo each Φ_d(q).
5. (iv) c_m is injective because its d-th component is ψ^d ∘ gh_{m/d}, ψ^d is injective and the ghost maps are jointly injective (A is torsion-free); its image contains c_m(V_d(s_{m/d}(a))) = [d]_{q^{m/d}} ψ^{m/d}(a).
6. (v) (iv) for c_m; for s_m use c_m ∘ s_m = ψ^m, which is bijective.

**API.**

- `QWittVector.trivialMap` (data): s_m: A[q]/(q^m − 1) → q-W_m(A).
- `QWittVector.ghost_trivialMap` (simp): gh_{m/d} ∘ s_m = ψ^{m/d} ∘ (A[q]/(q^m − 1) → A[q]/Φ_d(q)).
- `BigWittVector.epsilon` (data): ε_m: W_m(A) → A with gh_m(x) = Σ_{d|m} d·ψ^{m/d}(ε_d(Res_{m/d}(x))).
- `QWittVector.cyclicMap` (data): c_m: q-W_m(A) → A[q]/(q^m − 1), a ring map.
- `QWittVector.cyclicMap_ofWitt` (simp): c_m on the image of x ∈ W_m(A) is Σ_{d|m} [d]_{q^{m/d}} ψ^{m/d}(ε_d(Res_{m/d}(x))).
- `QWittVector.cyclicMap_mod_cyclotomic` (characterisation): c_m ≡ ψ^d ∘ gh_{m/d} modulo Φ_d(q) for d | m.
- `QWittVector.cyclicMap_frobenius` (compatibility): (A[q]/(q^m − 1) → A[q]/(q^d − 1)) ∘ c_m = c_d ∘ F_{m/d}.
- `QWittVector.cyclicMap_verschiebung` (compatibility): c_m ∘ V_{m/d} = [m/d]_{q^d} · c_d.
- `QWittVector.cyclicMap_trivialMap` (relation): c_m ∘ s_m = ψ^m, extended ℤ[q]-linearly.
- `QWittVector.cyclicMap_injective` (characterisation): If every ψ^m is injective, c_m is injective with image Σ_{d|m} [d]_{q^{m/d}} ψ^{m/d}(A)[q]/(q^m − 1).
- `QWittVector.cyclicMapEquivOfPerfect` (equivalence): For a perfect Λ-ring A, s_m and c_m are isomorphisms.
- `QWittVector.cyclicMap_natural` (functoriality): c_m and s_m are natural in maps of Λ-rings.

**Unit tests.**

- `QWittVector.cyclicMap_two_int` (computation): For A = ℤ (all ψ^n the identity), c_2(x) = gh_1(x) + (1 + q)·(gh_2(x) − gh_1(x))/2 on W_2(ℤ); for example c_2(V_2(1)) = 1 + q and c_2(τ_2(2)) = 3 + q.
- `QWittVector.cyclicMap_eval_two_int` (characterisation): For A = ℤ, c_2(x) at q = −1 is gh_1(x) and at q = 1 is gh_2(x), as c_m ≡ ψ^d ∘ gh_{m/d} modulo Φ_d(q) requires.
- `QWittVector.cyclicMap_trivialMap_toric` (computation): For A = ℤ[T] with ψ^p(T) = T^p, s_2(T) = τ_2(T) and c_2(s_2(T)) = T^2 = ψ^2(T).
- `QWittVector.cyclicMap_range_toric` (non-example): For A = ℤ[T] with ψ^p(T) = T^p, the image of c_2 is ℤ[T^2, q]/(q^2 − 1) + (1 + q)·ℤ[T, q]/(q^2 − 1), which does not contain T (its image under q ↦ −1 is ℤ[T^2]); so c_2 does not identify q-W_2(ℤ[T]) with ℤ[T][q]/(q^2 − 1).
- `QWittVector.cyclicMap_one` (degenerate): For m = 1, s_1 and c_1 are the identity of A.
- `QWittVector.cyclicMapEquivOfPerfect_int` (compatibility): q-W_m(ℤ) ≅ ℤ[q]/(q^m − 1) for all m; for m = 2 this agrees with the isomorphism of the q-Witt vector test, c_2(V_2(1)) = 1 + q.

**Acceptance.**

- c_m is compatible with F and V as stated, and c_m ∘ s_m = ψ^m.
- q-W_m(ℤ) ≅ ℤ[q]/(q^m − 1) for all m.

**Used by.**

- HR.4, relative q-Witt vectors: The tensor product q-W_m(R) ⊗_{q-W_m(A)} A[q]/(q^m − 1) is along c_m.
- HR.4, the transitions: Under c_m the Frobenius F_{m/d} of q-W_m(ℤ) is the canonical projection.

**Depends on.** this roadmap: `HR.4/q-witt-vectors`, `HR.4/truncated-big-witt-vectors`, `HR.1/lambda-rings-with-commuting-adams-operations`; libraries: `mathlib:Polynomial.cyclotomic`.

**Sources.**

- `Wagner.qWitt.2024`, 2.31, PDF p. 26: “We can now extend this section Z[q]-linearly to obtain a map s_m : A[q]/(q^m −1) → q-W_m(A) , whose composition with gh_1 is the canonical map A[q]/(q^m −1) → A[q]/Φ_m(q).” — (i).
- `Wagner.qWitt.2024`, Lemma 2.34, PDF p. 27: “For any Λ-ring A with Adams operations ψ^m : A → A, the map (of sets, a priori) c_m : W_m(A) → A[q]/(q^m −1) given by c_m(x) := Σ_{d|m} [d]_{q^{m/d}}ψ^{m/d}(ε_d Res_{m/d}(x)) is a morphism of rings.” — (ii) (display checked on the rendered page).
- `Wagner.qWitt.2024`, Corollary 2.35, PDF p. 28: “Let R be a Λ-ring. Then the ring morphism c_m : W_m(A) → A[q]/(q^m −1) from Lemma 2.34 extends uniquely to a functorial ring morphism c_m : q-W_m(A) → A[q]/(q^m −1)” — (iii); 'Let R be' is a misprint for 'Let A be' (source issue).
- `Wagner.qWitt.2024`, Corollary 2.37, PDF p. 29: “If A is a perfect Λ-ring (e.g. A = Z, A = Z_p, or A = A_{inf}(R) for some perfectoid ring R), then the comparison maps from 2.31 and Corollary 2.35 are both isomorphisms:” — (v).

**Assembly note.** The section s : A → W(A) used in (i) is constructed in the HR.1 part, `HR.1/adams-to-witt-section`, by Dwork's criterion; `BigWittVector.lambdaSection` of `HR.4/truncated-big-witt-vectors` is the same map. Citing the HR.1 node creates no cycle.

### Relative q-Witt vectors q-W_m(R/A)

`HR.4/relative-q-witt-rings` · definition · planet “Relative q-Witt vectors” · first packet

Let A be a Λ-ring (HR.1) and R an A-algebra. A q-FV-system of A-algebras over R is a family (W_m)_{m≥1} of A[q]-algebras with A[q]-algebra maps q-W_m(R) ⊗_{q-W_m(A), c_m} A[q]/(q^m − 1) → W_m and, for d | m, an A[q]-algebra map F_{m/d}: W_m → W_d and an A[q]-module map V_{m/d}: W_d → W_m, compatible with the Frobenii and Verschiebungen of q-Witt vectors and satisfying F_{m/d}V_{m/d} = m/d and V_{m/d}F_{m/d} = [m/d]_{q^d}. The category of these has an initial object (q-W_m(R/A))_m, the m-truncated big q-Witt vectors of R relative to A, explicitly q-W_m(R/A) ≅ (q-W_m(R) ⊗_{q-W_m(A)} A[q]/(q^m − 1))/U_m, where U_m is generated by V_{m/d}(xy) ⊗ 1 − V_{m/d}(x) ⊗ c_d(y) for d | m, x ∈ q-W_d(R), y ∈ q-W_d(A). It has relative ghost maps gh_{m/d}: q-W_m(R/A) → R ⊗_{A,ψ^d} A[q]/Φ_d(q), with gh_{m/d} = gh_{d/d} ∘ F_{m/d} and gh_{m/m} the quotient by the images of the V_{m/d}, d ≠ m; it is functorial in pairs (A, R) and satisfies q-W_m(R/A) ⊗_A A′ ≅ q-W_m(R ⊗_A A′/A′) for maps of Λ-rings A → A′. In particular q-W_m(A/A) ≅ A[q]/(q^m − 1), and q-W_m(R/ℤ) ≅ q-W_m(R). If A is perfectly covered and R is p-torsion-free for every prime p | m, the relative ghost maps are jointly injective.

**Hypotheses.**

- A is a Λ-ring in the sense of HR.1 and R is any A-algebra: neither perfect covering nor étaleness is needed for the definition.
- The tensor product is along c_m of HR.4/the-lambda-ring-comparison-maps; the structure has no restriction maps.
- The ghost injectivity needs A perfectly covered (it is transferred from the absolute Lemma 2.23 by base change to the perfection and faithfully flat descent, q-Witt Remark 2.47) and R p-torsion-free for all p | m. Injectivity of the relative Verschiebungen, which Remark 2.47 also asserts, rests on q-Witt Proposition 2.15 and is not claimed here.
- This layer owns only the degree-zero rings; the positive-degree q-de Rham–Witt complex is HabiroCohomologyFoundations HQ.4's extension of them, which imports this node.

**Construction.**

1. V_{m/d}(x) is (q^d − 1)-torsion, so V_{m/d}(x) ⊗ c_d(y) is well defined for any lift of c_d(y) to A[q]/(q^m − 1).
2. V_{m/d} descends because x ⊗ a ↦ V_{m/d}(x) ⊗ a kills U_d by construction of U_m.
3. F_p ⊗ (projection) maps U_m into U_{m/p}, in the two cases p | m/d and p ∤ m/d, using that c_d(y) maps to c_{d/p}(F_p(y)) (HR.4/the-lambda-ring-comparison-maps); initiality follows from the presentation.
4. Relative ghost maps: tensor the absolute gh_{m/d} with A[q]/(q^m − 1) → A[q]/Φ_d(q) and check that U_m maps to 0.
5. q-W_m(A/A): here U_m is generated by c_m(V_{m/d}(xy)) − c_m(V_{m/d}(x))·c_d(y) = [m/d]_{q^d}(c_d(xy) − c_d(x)c_d(y)) = 0, so q-W_m(A/A) = A[q]/(q^m − 1), with F_{m/d} the projection and V_{m/d} multiplication by [m/d]_{q^d}.
6. Functoriality in pairs by the universal property; base change (q-Witt Lemma 2.46) by reduction to polynomial A-algebras through reflexive coequalisers and the comparison c_{m/A} with the subring B_m for A[T_i] with ψ^p(T_i) = T_i^p.
7. For A perfectly covered with faithfully flat A → A_∞: q-W_m(R/A) ⊗_A A_∞ ≅ q-W_m(R ⊗_A A_∞/A_∞) ≅ q-W_m(R ⊗_A A_∞) (base change and Corollary 2.37); transfer the joint injectivity of the ghost maps (Lemma 2.23 for the p-torsion-free ring R ⊗_A A_∞, whose ghost maps correspond to the relative ones under a ⊗ b ↦ ψ^d(a)b) by faithfully flat descent.

**API.**

- `RelQWittVector` (data): q-W_m(R/A), an A[q]/(q^m − 1)-algebra.
- `RelQFVSystem` (structure): Relative q-FV-systems (q-Witt Definition 2.40) and their morphisms.
- `RelQWittVector.mk` (constructor): The surjection q-W_m(R) ⊗_{q-W_m(A), c_m} A[q]/(q^m − 1) → q-W_m(R/A).
- `RelQWittVector.frobenius` (data): F_{m/d}: q-W_m(R/A) → q-W_d(R/A), an A[q]-algebra map, for d | m.
- `RelQWittVector.verschiebung` (data): V_{m/d}: q-W_d(R/A) → q-W_m(R/A), A[q]-linear, for d | m.
- `RelQWittVector.frobenius_verschiebung` (relation): F_{m/d}V_{m/d} = m/d, V_{m/d}F_{m/d} = [m/d]_{q^d}, and the composition laws along chains of divisors.
- `RelQWittVector.lift` (universal-property): The unique morphism from q-W_•(R/A) to any relative q-FV-system over R, with its compatibility with mk.
- `RelQWittVector.ghost` (data): gh_{m/d}: q-W_m(R/A) → R ⊗_{A,ψ^d} A[q]/Φ_d(q), with gh_{m/d} = gh_{d/d} ∘ F_{m/d}.
- `RelQWittVector.ghost_top_eq_quotient` (characterisation): gh_{m/m} is the quotient of q-W_m(R/A) by the images of the V_{m/d}, d ≠ m.
- `RelQWittVector.map` (functoriality): A morphism of pairs (A, R) → (A′, R′) (a Λ-map A → A′ and a compatible R → R′) induces q-W_m(R/A) → q-W_m(R′/A′) compatible with F, V and gh; map_id and map_comp.
- `RelQWittVector.baseChangeEquiv` (equivalence): q-W_m(R/A) ⊗_A A′ ≅ q-W_m(R ⊗_A A′/A′) for a map of Λ-rings A → A′ (Lemma 2.46).
- `RelQWittVector.selfEquiv` (example): q-W_m(A/A) ≅ A[q]/(q^m − 1), with F_{m/d} the projection and V_{m/d} multiplication by [m/d]_{q^d}.
- `RelQWittVector.equivAbsolute` (compatibility): For A = ℤ, q-W_m(R/ℤ) ≅ q-W_m(R) (q-Witt Remark 2.47 with the perfect Λ-ring ℤ).
- `RelQWittVector.ghost_jointly_injective` (characterisation): For A perfectly covered and R p-torsion-free for all primes p | m, the relative ghost maps gh_{m/d} (d | m) are jointly injective.
- `RelQWittVector.cyclicMap` (data): For a Λ-A-algebra R, c_{m/A}: q-W_m(R/A) → R[q]/(q^m − 1) and s_{m/A}: R ⊗_{A,ψ^m} A[q]/(q^m − 1) → q-W_m(R/A), with c_{m/A} ∘ s_{m/A} the linearised Adams operation (2.45).
- `RelQWittVector.cyclicMapEquiv` (equivalence): For A perfectly covered and R relatively perfect over A (R carries a Λ-structure for which A → R is a Λ-map and the linearised Adams maps R ⊗_{A,ψ^m} A → R are bijective), s_{m/A} and c_{m/A} are isomorphisms (Remark 2.47).

**Unit tests.**

- `RelQWittVector.one` (degenerate): q-W_1(R/A) ≅ R.
- `RelQWittVector.selfEquiv_ops` (computation): q-W_m(A/A) ≅ A[q]/(q^m − 1), with F_{m/d} the projection onto A[q]/(q^d − 1) and V_{m/d} multiplication by [m/d]_{q^d}; hence F_{m/d}V_{m/d} = [m/d]_{q^d} mod (q^d − 1) = m/d.
- `RelQWittVector.equivAbsolute_two` (compatibility): For A = ℤ, q-W_2(ℤ/ℤ) ≅ ℤ[q]/(q^2 − 1) ≅ q-W_2(ℤ), and in general q-W_m(R/ℤ) ≅ q-W_m(R).
- `RelQWittVector.relative_ne_absolute_toric` (non-example): For A = R = ℤ[T] with ψ^p(T) = T^p, q-W_2(ℤ[T]/ℤ[T]) ≅ ℤ[T][q]/(q^2 − 1), whereas c_2 identifies the absolute q-W_2(ℤ[T]) with a subring not containing T: the relative and absolute rings differ.
- `RelQWittVector.ghost_toric` (characterisation): For A = R = ℤ[T], the relative ghost maps of q-W_2(A/A) = A[q]/(q^2 − 1) are the projections to A[q]/(q + 1) and A[q]/(q − 1) (after a ⊗ b ↦ ψ^d(a)b identifies A ⊗_{A,ψ^d} A with A), and they are jointly injective because A is 2-torsion-free.

**Acceptance.**

- The relative ring is initial and has the stated presentation, ghost maps and base change.
- q-W_m(A/A) ≅ A[q]/(q^m − 1) and q-W_m(R/ℤ) ≅ q-W_m(R).
- The ghost description holds under the torsion hypothesis for perfectly covered A.

**Used by.**

- HR.4, the Habiro–q-Witt comparison: H_{R/A,m}/(q^m − 1) ≃ q-W_m(R/A), and the relative ghost maps build the map to H_{R/A,m}.
- HR.4, the transitions: The induced maps on quotients are the F_{m/d}.
- HabiroCohomologyFoundations:HQ.4: The q-V-systems start from these rings; the ghost-map node imports their torsion-qualified injectivity.
- HR.7: The acceptance tests check the transition map against the Frobenius.

**Depends on.** this roadmap: `HR.4/q-witt-vectors`, `HR.4/the-lambda-ring-comparison-maps`, `HR.1/lambda-rings-with-commuting-adams-operations`, `HR.1/perfectly-covered`, `HR.1/morphisms-of-pairs`.

**Sources.**

- `Wagner.qWitt.2024`, Definition 2.40, PDF p. 30: “A q-FV -system of A-algebras over R is a system of A[q]-algebras (W_m)_{m∈N}, together with the following structure: (a) For all m ∈N, an A[q]-algebra map q-W_m(R) ⊗_{q-W_m(A)} A[q]/(q^m −1) → W_m. Here the tensor product is taken along the map c_m from Lemma 2.34.” — The structure of a relative q-FV-system.
- `Wagner.qWitt.2024`, Lemma 2.41, PDF p. 30: “Explicitly, q-W_m(R/A) is the quotient q-W_m(R/A) ≅ (q-W_m(R) ⊗_{q-W_m(A)} A[q]/(q^m −1))/U_m , where U_m is the ideal generated by V_{m/d}(xy) ⊗1 −V_{m/d}(x) ⊗c_d(y) for all divisors d | m, all x ∈q-W_d(R), and all y ∈q-W_d(A).” — The presentation of the initial object.
- `Wagner.qWitt.2024`, 2.44, PDF p. 31: “For all divisors d | m, we get a relative ghost map gh_{m/d} : q-W_m(R/A) → R ⊗_{A,ψ^d} A[q]/Φ_d(q) .” — The relative ghost maps.
- `Wagner.qWitt.2024`, Lemma 2.46, PDF p. 31: “If A → A′ is a morphism of Λ-rings and R is an A-algebra, then for all m ∈N the canonical map is an isomorphism q-W_m(R/A) ⊗_A A′ ≅ → q-W_m(R ⊗_A A′/A′) .” — Base change.
- `Wagner.qWitt.2024`, Remark 2.47, PDF p. 32: “For example, it will be true that the Verschiebungen V_{m/d} : q-W_d(R/A) → q-W_m(R/A) are injective, the analogue of Proposition 2.15 is true” — The perfectly covered transfer principle, which the remark derives from Lemma 2.46 and faithfully flat descent; this node uses it only for the ghost maps.

### q-Witt vectors of étale maps: étaleness and Frobenius base change (Proposition 2.48)

`HR.4/q-witt-vectors-of-etale-maps` · theorem · first packet · added by REV-HabiroRings

Let A be a Λ-ring, R → R′ an étale map of A-algebras and m ≥ 1. Then (a) the canonical map W_m(R′) ⊗_{W_m(R)} q-W_m(R/A) → q-W_m(R′/A) is an isomorphism; (b) q-W_m(R/A) → q-W_m(R′/A) is étale; (c) for d | m, the canonical map q-W_m(R′/A) ⊗_{q-W_m(R/A), F_{m/d}} q-W_d(R/A) → q-W_d(R′/A) is an isomorphism. In particular, if R is étale over A, then q-W_m(R/A) is étale over q-W_m(A/A) ≅ A[q]/(q^m − 1).

**Hypotheses.**

- A is a Λ-ring (HR.1) and R → R′ is étale; no perfect covering is needed.
- In (c) the tensor product is along F_{m/d}: q-W_m(R/A) → q-W_d(R/A); the source prints the target as q-W_{m/d}(R/A), a misprint (source issue).
- The corresponding facts for big Witt vectors — W_m(R) → W_m(R′) étale and W_m(R′) ⊗_{W_m(R),F_{m/d}} W_d(R) ≅ W_d(R′) — are inputs from van der Kallen, Borger and Langer–Zink, recorded as a gap.

**Proof.**

1. Absolute case A = ℤ: q-W_m(R) = coker(M ⊕ N → W_m(R)[q]) with M = ⊕_{d|m} W_d(R)[q] (components (q^d − 1)V_{m/d}) and N = ⊕_{e|d|m} W_d(R)[q] (components [d/e]_{q^e}V_{m/d} − V_{m/e}F_{d/e}), all W_m(R)[q]-linear through the Frobenii; the big-Witt Frobenius base change gives M′ ≅ W_m(R′) ⊗_{W_m(R)} M and N′ ≅ W_m(R′) ⊗_{W_m(R)} N, whence (a) for A = ℤ (q-Witt Lemma 2.50).
2. Relative case: q-W_m(R/A) = coker(K → q-W_m(R) ⊗_{q-W_m(A)} A[q]/(q^m − 1)) with K = ⊕_{d|m} q-W_d(R) ⊗_{ℤ[q]} q-W_m(A) ⊗_{ℤ[q]} A[q], and the absolute case gives K′ ≅ W_m(R′) ⊗_{W_m(R)} K; this is (a).
3. (b) and (c) follow from (a) and the big-Witt statements (étaleness of W_m(R) → W_m(R′), and the Frobenius pushout of q-Witt Remark 2.49).
4. The last sentence is the case R := A, R′ := R, with q-W_m(A/A) ≅ A[q]/(q^m − 1) (HR.4/relative-q-witt-rings).

**Acceptance.**

- A = ℤ, R = ℤ → R′ = ℤ[1/2], m = 2: q-W_2(ℤ[1/2]) ≅ q-W_2(ℤ)[1/2] ≅ ℤ[1/2][q]/(q^2 − 1) (q-Witt Corollary 2.20(a)), a localisation, hence étale, over q-W_2(ℤ) ≅ ℤ[q]/(q^2 − 1).
- For R = R′ = A, (c) reads A[q]/(q^m − 1) ⊗_{A[q]/(q^m−1)} A[q]/(q^d − 1) ≅ A[q]/(q^d − 1), the Frobenius of q-W_•(A/A) being the projection.

**Used by.**

- HR.4, the Habiro–q-Witt comparison: q-W_m(R/A) is étale over A[q]/(q^m − 1), so it has a unique completed lift.
- HR.4, the ghost pushout: (c) reduces the ghost pushout to d = m.

**Depends on.** this roadmap: `HR.4/relative-q-witt-rings`, `HR.4/q-witt-vectors`, `HR.4/truncated-big-witt-vectors`; libraries: `mathlib:Algebra.Etale`.

**Sources.**

- `Wagner.qWitt.2024`, Proposition 2.48, PDF p. 33: “Let A be a Λ-ring, let R → R′ be an étale morphism of A-algebras, and let m be a positive integer. Then q-W_m(R/A) → q-W_m(R′/A) is étale again.” — (b).
- `Wagner.qWitt.2024`, Proposition 2.48, PDF p. 33: “is an isomorphism, where the tensor product is taken with respect to the Frobenius map F_{m/d} : q-W_m(R/A) → q-W_{m/d}(R/A).” — (c); the printed target q-W_{m/d} is a misprint for q-W_d.
- `Wagner.qWitt.2024`, Lemma 2.50, PDF p. 33: “Let A be a Λ-ring, let R → R′ be an étale morphism of A-algebras, and let m be a positive integer. Then we get a canonical isomorphism W_m(R′) ⊗_{W_m(R)} q-W_m(R/A) ≅ → q-W_m(R′/A) .” — (a).
- `Wagner.qHodgeHabiro.2025`, Paragraph before Theorem 2.9, PDF p. 16: “recall from [Wag24, Proposition 2.48] that q-W_m(R/A) is an étale algebra over q-W_m(A/A) ≅ A[q]/(q^m −1).” — The last sentence, as the Habiro paper uses it.

**Assembly note.** The gap 'Big Witt vectors of étale maps' stays open: the HR.4 part turns it into a request to QWittVectors QW.0, the permanent owner of big Witt vectors under RS-10, for étaleness of W_m(R) → W_m(R′) and the Frobenius pushout without F-finiteness hypotheses. The HR.4 part also records two misprints in the passages this node uses, in Remark 2.49 and in the proof of Lemma 2.50 (E15, E16).

### Relative ghost maps are pushouts along étale maps (Corollary 2.51)

`HR.4/ghost-maps-and-etale-base-change` · theorem · first packet · added by REV-HabiroRings

Let A be a Λ-ring, R → R′ an étale map of A-algebras, m ≥ 1 and d | m. Then the square formed by q-W_m(R/A) → q-W_m(R′/A), the relative ghost maps gh_{m/d} and R ⊗_{A,ψ^d} A[ζ_d] → R′ ⊗_{A,ψ^d} A[ζ_d] is a pushout of rings, both underived and derived. In particular, for R étale over A, gh_{m/d} induces q-W_m(R/A) ⊗_{A[q]/(q^m−1)} A[q]/Φ_d(q) ≅ R ⊗_{A,ψ^d} A[q]/Φ_d(q).

**Hypotheses.**

- A is a Λ-ring and R → R′ is étale; A[ζ_d] denotes A[q]/Φ_d(q).
- The derived statement uses that q-W_m(R/A) → q-W_m(R′/A) is flat (étale).

**Proof.**

1. Since gh_{m/d} = gh_{d/d} ∘ F_{m/d}, part (c) of HR.4/q-witt-vectors-of-etale-maps reduces the claim to d = m.
2. gh_{m/m} is the projection of q-W_m(R/A) onto the cokernel of (V_{m/e})_{e|m, e≠m}: ⊕ q-W_e(R/A) → q-W_m(R/A), and likewise for R′; part (a)/(c) of the étale node gives M′ ≅ q-W_m(R′/A) ⊗_{q-W_m(R/A)} M for the sources M, so the cokernels are base changed.
3. Flatness of the étale map gives the derived pushout.
4. For the last sentence take R := A, R′ := R: q-W_m(A/A) = A[q]/(q^m − 1) and its gh_{m/d} is the projection to A ⊗_{A,ψ^d} A[q]/Φ_d(q) ≅ A[q]/Φ_d(q).

**Acceptance.**

- A = R = ℤ, m = 2: gh_{2/1} and gh_{2/2} are q ↦ 1 and q ↦ −1 on ℤ[q]/(q^2 − 1); for R′ = ℤ[1/2] both pushouts are ℤ[1/2].
- d = m: q-W_m(R/A)/(im V_{m/e} : e | m, e ≠ m) ≅ R ⊗_{A,ψ^m} A[q]/Φ_m(q).

**Used by.**

- HR.4, the Habiro–q-Witt comparison: Identifies the reductions modulo Φ_d(q) on both sides.
- HR.4, the transitions: Joint injectivity of the ghost maps on the étale ring q-W_d(R/A).

**Depends on.** this roadmap: `HR.4/q-witt-vectors-of-etale-maps`, `HR.4/relative-q-witt-rings`.

**Sources.**

- `Wagner.qWitt.2024`, Corollary 2.51, PDF p. 34: “If A is a Λ-ring, R → R′ is an étale map of A-algebras, and m is a positive integer, then” — The hypotheses; the square is a display.
- `Wagner.qWitt.2024`, Corollary 2.51, PDF p. 34: “is a pushout diagram of rings (both in the derived and in the underived sense) for all d | m.” — The conclusion.
- `Wagner.qHodgeHabiro.2025`, Proof of Theorem 2.9, PDF p. 17: “By [Wag24, Corollary 2.51] and 2.7, W/Φ_d(q) ≃R ⊗_{A,ψ^d} A[q]/Φ_d(q) ≃H_{R/A,m}/Φ_d .” — The last sentence, as the comparison theorem uses it.

**Assembly note.** The proof of Corollary 2.51 sums over all divisors d | m where it means the proper divisors; with d = m the Verschiebung V_1 is the identity and the cokernel would vanish (E17, recorded by the HR.4 part). The node's statement is unaffected.

### An isomorphism q-W_m(R) ≅ R[q]/(q^m − 1) forces a global Frobenius lift (q-Witt Corollary 2.52)

`HR.4/an-isomorphism-with-the-naive-quotient-forces-a-frobenius-lift` · lemma · first packet · added by REV-HabiroRings

Let p be a prime and R an étale ℤ-algebra such that R → R̂_p is injective (equivalently, p is invertible on no connected component of Spec R). If for some positive integer m divisible by p there is a ℤ[q]-algebra isomorphism q-W_m(R) ≅ R[q]/(q^m − 1), then the unique Frobenius lift φ_p of R̂_p restricts to an endomorphism of R. Moreover, the φ_p for the different primes p | m commute, and R carries a Λ_m-structure.

**Hypotheses.**

- R is an étale ℤ-algebra with R → R̂_p injective.
- m is a positive integer divisible by p; the isomorphism is only assumed to be ℤ[q]-linear.

**Proof.**

1. Reduce to m = p: q-W_m(ℤ) ≅ ℤ[q]/(q^m − 1) identifies F_{m/p} with the projection to ℤ[q]/(q^p − 1), and q-W_p(R) ≅ q-W_m(R)/(q^p − 1) (HR.4/q-witt-vectors-of-etale-maps), so an isomorphism at level m gives one at level p.
2. The ghost maps gh_1 and gh_p of q-W_p(ℤ) are the projections to ℤ[ζ_p] and ℤ; their pushouts along ℤ[q]/(q^p − 1) → R[q]/(q^p − 1) are R[ζ_p] and R, and are also the ghost maps of q-W_p(R) (HR.4/ghost-maps-and-etale-base-change). This gives automorphisms ψ_1 of R[ζ_p] and ψ_p of R compatible with the ghost maps, and one may assume ψ_p = id.
3. For x = (x_1, x_p) in Witt coordinates the two diagrams give ψ_1(x_1) ≡ x_1^p mod (ζ_p − 1): ψ_1 induces the Frobenius on R[ζ_p]/(ζ_p − 1) ≅ R/p.
4. Since R is étale over ℤ, this and ℤ[q]-linearity determine the map ψ_1 induces on R̂_p ⊗ ℤ[ζ_p], so it equals φ_p ⊗ id (HR.1/the-etale-frobenius-lift). Hence φ_p ⊗ id preserves R ⊗ ℤ[ζ_p], and, respecting the decomposition R̂_p ⊗ ℤ[ζ_p] ≅ ⊕_{i=0}^{p−2} ζ_p^i R̂_p, φ_p restricts to R.
5. For another prime ℓ | m, φ_ℓ induces an endomorphism of R̂_p, and φ_p ∘ φ_ℓ = φ_ℓ ∘ φ_p may be checked on R/p by p-complete étaleness, where every ring endomorphism commutes with the Frobenius.
6. On the components of Spec R where p is invertible take the identity; the commuting lifts for all p | m give the Λ_m-structure (HR.1/lambda-rings-with-commuting-adams-operations).

**Acceptance.**

- For R = ℤ[∛2][1/6] and p = 5 no Frobenius lift of R exists (HR.1/the-etale-frobenius-lift), so q-W_m(R) is not R[q]/(q^m − 1) for 5 | m: this is the input of HR.7/the-stage-is-not-the-naive-completion.
- For R = ℤ[1/N] the identity is a global Frobenius lift, and q-W_m(R) ≅ R[q]/(q^m − 1) holds.

**Depends on.** this roadmap: `HR.4/q-witt-vectors-of-etale-maps`, `HR.4/ghost-maps-and-etale-base-change`, `HR.4/q-witt-vectors`, `HR.1/the-etale-frobenius-lift`, `HR.1/lambda-rings-with-commuting-adams-operations`.

**Sources.**

- `Wagner.qWitt.2024`, Corollary 2.52, PDF p. 35 (arXiv:2410.23078v5): “Let p be a prime and let R be an étale Z-algebra such that R → R̂_p is injective (equivalently, p is not invertible on any connected component of Spec R). If a Z[q]-algebra isomorphism ψ: q-W_m(R) ≅ R[q]/(q^m −1) exists for some positive integer m divisible by p,” — The hypotheses.
- `Wagner.qWitt.2024`, Corollary 2.52, PDF p. 35 (arXiv:2410.23078v5): “then the unique Frobenius lift ϕp : R̂_p → R̂_p restricts to a morphism ϕp : R → R. Furthermore, the ϕp commute for different p and R can be equipped with a Λm-structure.” — The conclusion.

### The rings H_{R/A,m}, glued from Frobenius-twisted cyclotomic completions

`HR.4/the-finite-relative-habiro-rings` · construction · first packet · added by REV-HabiroRings

Let A be a perfectly covered Λ-ring and R an étale A-algebra, and for every prime p let ϕ_{p/A}: (R̂_p ⊗_{A,ψ^p} A)^∧_p → R̂_p be the linearised Frobenius of HR.1, an equivalence. For m ≥ 1 and d | m put E_d := (R ⊗_{A,ψ^d} A)[q]^∧_{Φ_d(q)}, and for pd | m with p prime let h_d: (E_{pd})^∧_p → (E_d)^∧_p be the A[q]-linear equivalence induced by ϕ_{p/A} (base-changed along ψ^d and completed at (p, Φ_d(q))). H_{R/A,m} is the (q^m − 1)-complete E∞-A[q]-algebra that Corollary 2.4 attaches to (E_d, h_d), together with its identifications (H_{R/A,m})^∧_{Φ_d(q)} ≃ E_d. For d | m, Corollary 2.4 gives a preferred equivalence H_{R/A,d} ≃ (H_{R/A,m})^∧_{(q^d−1)} and hence a transition map t_{m,d}: H_{R/A,m} → H_{R/A,d}.

**Hypotheses.**

- A is perfectly covered, so it is p-torsion-free for every p and all p-completions involved are static (Wagner 2.7).
- R is étale over A. No global Frobenius endomorphism of R is assumed: the gluing uses ϕ_{p/A} on R̂_p only.
- (E_{pd})^∧_p and (E_d)^∧_p are both (p, Φ_d(q))-complete, because (p, Φ_{pd}(q)) and (p, Φ_d(q)) have the same radical.

**Construction.**

1. E_d is the derived Φ_d(q)-completion of the discrete A[q]-algebra (R ⊗_{A,ψ^d} A)[q]; it is static, as Φ_d(q) is monic and hence a nonzerodivisor (DerivedDeRhamCohomology:DD.1).
2. Using R ⊗_{A,ψ^{pd}} A = (R ⊗_{A,ψ^p} A) ⊗_{A,ψ^d} A (the composition law of HR.1), (E_{pd})^∧_p = ((R̂_p ⊗_{A,ψ^p} A)^∧_p ⊗_{A,ψ^d} A)[q]^∧_{(p,Φ_d(q))} and (E_d)^∧_p = (R̂_p ⊗_{A,ψ^d} A)[q]^∧_{(p,Φ_d(q))}; put h_d := (ϕ_{p/A} ⊗_{A,ψ^d} A)[q]^∧, an equivalence because ϕ_{p/A} is.
3. Apply Corollary 2.4 (HR.3/the-complete-descent-corollary) to (E_d, h_d).
4. Transitions: for c | d the Φ_c(q)-completion of (H_{R/A,m})^∧_{(q^d−1)} is E_c with the same gluing maps, so the uniqueness in Corollary 2.4 gives H_{R/A,d} ≃ (H_{R/A,m})^∧_{(q^d−1)} and t_{m,d}.
5. Functoriality: a morphism of pairs (A, R) → (A′, R′) (HR.1/morphisms-of-pairs) induces E_d → E′_d compatible with the h_d by the naturality of ϕ_{p/A} (HR.1/the-etale-frobenius-lift), hence H_{R/A,m} → H_{R′/A′,m} by the cyclotomic descent equivalence (HR.3/the-morphism-level-statement).

**API.**

- `RelHabiroStage` (data): H_{R/A,m}, a (q^m − 1)-complete E∞-A[q]-algebra (an ordinary ring by the comparison theorem).
- `RelHabiroStage.localPiece` (data): E_d = (R ⊗_{A,ψ^d} A)[q]^∧_{Φ_d(q)} for d | m.
- `RelHabiroStage.gluing` (data): h_d: (E_{pd})^∧_p ≃ (E_d)^∧_p, induced by ϕ_{p/A}, for pd | m.
- `RelHabiroStage.completionEquiv` (characterisation): (H_{R/A,m})^∧_{Φ_d(q)} ≃ E_d, under which h_d is the identity of (H_{R/A,m})^∧_{(Φ_d(q),Φ_{pd}(q))}.
- `RelHabiroStage.transition` (data): t_{m,d}: H_{R/A,m} → H_{R/A,d} for d | m, from H_{R/A,d} ≃ (H_{R/A,m})^∧_{(q^d−1)}.
- `RelHabiroStage.map` (functoriality): H_{R/A,m} → H_{R′/A′,m} for a morphism of pairs, compatible with the completionEquiv; map_id and map_comp.
- `RelHabiroStage.equivOfIso` (functoriality): Isomorphic étale presentations (A, R) ≅ (A′, R′) give equivalent H_{R/A,m}.
- `RelHabiroStage.selfEquiv` (example): H_{A/A,m} ≃ A[q]^∧_{(q^m−1)}.

**Unit tests.**

- `RelHabiroStage.one` (degenerate): m = 1: there are no prime edges and H_{R/A,1} ≃ E_1 = R[q]^∧_{(q−1)}.
- `RelHabiroStage.int` (computation): A = R = ℤ: every ϕ_{p/ℤ} is the identity of ℤ_p, so all h_d are identities and H_{ℤ/ℤ,m} ≃ ℤ[q]^∧_{(q^m−1)} (identity gluings reconstruct ℤ[q]^∧_{(q^m−1)}, Remark 2.8).
- `RelHabiroStage.selfEquiv` (compatibility): For R = A (perfectly covered), a ⊗ b ↦ ψ^d(a)b identifies E_d with A[q]^∧_{Φ_d(q)} and h_d with the identity, so H_{A/A,m} ≃ A[q]^∧_{(q^m−1)}.
- `RelHabiroStage.localised` (computation): A = ℤ, R = ℤ[1/2], m = 2: (E_2)^∧_2 = 0, so there is no gluing, E_1 = ℤ[1/2][[q − 1]], E_2 = ℤ[1/2][[q + 1]] and H_{ℤ[1/2]/ℤ,2} ≃ ℤ[1/2][[q − 1]] × ℤ[1/2][[q + 1]] ≅ ℤ[1/2][q]^∧_{(q^2−1)}.

**Acceptance.**

- The Φ_d(q)-completions of H_{R/A,m} are the E_d, and its prime-edge comparisons are the Frobenius gluings h_d.
- The transition maps exist for all d | m.

**Used by.**

- HR.4, the Habiro–q-Witt comparison: Identifies this object with the unique étale lift of q-W_m(R/A).
- HR.4, the transitions and the limit: The t_{m,d} and their limit, which HR.5 names H_{R/A}.

**Depends on.** this roadmap: `HR.3/the-complete-descent-corollary`, `HR.3/the-morphism-level-statement`, `HR.1/the-etale-frobenius-lift`, `HR.1/perfectly-covered`, `HR.1/morphisms-of-pairs`; stages: `DerivedDeRhamCohomology:DD.1`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, 2.7, PDF p. 15: “the pth Adams operation ψ^p : A → A can be uniquely extended to a Frobenius lift ϕ_p : R̂_p → R̂_p. Let us denote by ϕ_{p/A} : (R̂_p ⊗_{A,ψ^p} A)^∧_p ≃ → R̂_p the linearised Frobenius. It is an equivalence as indicated.” — The gluing input from HR.1.
- `Wagner.qHodgeHabiro.2025`, 2.7, PDF p. 16: “For every d | m, let E_d := (R ⊗_{A,ψ^d} A)[q]^∧_{Φ_d(q)} and for every pd | m, where p is a prime, let the gluing equivalence h_d be the A[q]-linear map induced by ϕ_{p/A}.” — The local data and the gluing maps.
- `Wagner.qHodgeHabiro.2025`, 2.7, PDF p. 16: “For all d | m, Corollary 2.4 provides a preferred equivalence H_{R/A,d} ≃(H_{R/A,m})^∧_{(q^d−1)}. In particular, we get maps H_{R/A,m} → H_{R/A,d}.” — The transition maps.
- `Wagner.qHodgeHabiro.2025`, Remark 2.8, PDF p. 16: “Thus, there’s no reason to expect that H_{R/A,m} ≃R[q]^∧_{(q^m−1)}, unless R itself (rather than only its p-completions) admits Frobenius lifts for all prime factors p | m. In the case A = Z, a precise obstruction of this kind is shown in [Wag24, Corollary 2.52].” — The comparison with identity gluings used in the tests and in the comparison theorem's non-example.

### The Habiro–q-Witt comparison: H_{R/A,m} is the unique étale lift of q-W_m(R/A) (Theorem 2.9)

`HR.4/the-etale-lift` · theorem · planet “Habiro–q-Witt comparison” · first packet

Let A be a perfectly covered Λ-ring, R an étale A-algebra and m ≥ 1. Let W be the unique (q^m − 1)-complete E∞-algebra over A[q]^∧_{(q^m−1)} lifting the étale A[q]/(q^m − 1)-algebra q-W_m(R/A). Then there is a canonical equivalence W ≃ H_{R/A,m} of E∞-A[q]-algebras whose reduction modulo each Φ_d(q) (d | m) is the composite W/Φ_d(q) ≃ R ⊗_{A,ψ^d} A[q]/Φ_d(q) ≃ H_{R/A,m}/Φ_d(q) of the ghost identification and the construction; in particular H_{R/A,m}/(q^m − 1) ≃ q-W_m(R/A). Consequently H_{R/A,m} is static, an ordinary ring on which q^m − 1 is a nonzerodivisor. The equivalence is natural in morphisms of pairs (A, R), hence invariant under isomorphisms of étale presentations.

**Hypotheses.**

- R is étale over A. The printed statement says 'R an A-algebra', but H_{R/A,m} is only constructed for étale R (2.7) and q-W_m(R/A) is étale over A[q]/(q^m − 1) only for étale R; recorded as a source issue.
- A is perfectly covered, as the construction of H_{R/A,m} requires.
- 'Unique lift' is the uniqueness of (q^m − 1)-completely étale deformations; the deformation statement is a recorded gap.
- Staticity follows from derived Nakayama for the (q^m − 1)-complete H_{R/A,m} (DD.1), not from an exactness property of completion. The staticity of the limit over all m, the last clause of Theorem 2.9, is the separate node HR.4/the-limit-of-the-finite-stages-is-static, which uses HR.2's Corollary B.4.

**Proof.**

1. q-W_m(R/A) is étale over q-W_m(A/A) ≅ A[q]/(q^m − 1) (HR.4/q-witt-vectors-of-etale-maps); let W be its unique (q^m − 1)-completely étale lift (gap on completed deformations).
2. For pd | m and an F_p-algebra S one has gh_{m/d}(x) = gh_{m/pd}(x)^p on W_m(S), because gh_{pk}(x) = Σ_{e|pk} e·x_e^{pk/e} ≡ (Σ_{e|k} e·x_e^{k/e})^p modulo p; hence the relative ghost maps gh_{m/pd} and gh_{m/d} and their reductions modulo p form a commutative square whose bottom map is induced by the relative Frobenius R/p ⊗_{A/p,(−)^p} A/p → R/p.
3. Passing to unique deformations of étale algebras, W → E_{pd} and W → E_d lift gh_{m/pd} and gh_{m/d} (their targets modulo Φ_{pd}(q), Φ_d(q) are the ghost targets, HR.4/ghost-maps-and-etale-base-change) and the bottom map lifts to the map induced by ϕ_{p/A}; so the maps W → E_d are compatible with the h_d, and the cyclotomic descent equivalence (HR.3/the-morphism-level-statement) gives an E∞-A[q]-algebra map W → H_{R/A,m}.
4. Both sides are (q^m − 1)-complete, so by derived Nakayama and q^m − 1 = ∏ Φ_d(q) it suffices to check the map modulo each Φ_d(q); there it is the composite W/Φ_d(q) ≃ R ⊗_{A,ψ^d} A[q]/Φ_d(q) ≃ H_{R/A,m}/Φ_d(q), an equivalence.
5. Hence W ≃ H_{R/A,m}, and H_{R/A,m}/(q^m − 1) ≃ W/(q^m − 1) ≃ q-W_m(R/A).
6. Staticity: H_{R/A,m} is (q^m − 1)-complete and H_{R/A,m}/(q^m − 1) ≃ q-W_m(R/A) is static, so each H^i(H_{R/A,m}) with i ≠ 0 is derived complete with H^i/(q^m − 1) = 0 and vanishes (derived Nakayama, DD.1), and H^{−1}(H_{R/A,m}/^L(q^m − 1)) = 0 says q^m − 1 is a nonzerodivisor. (The source writes 'static modulo p'; see the source issue.)
7. Naturality: for a morphism of pairs the maps of the third step are natural (functoriality of q-W_m(−/−), of the relative ghost maps and of ϕ_{p/A}), and the descent equivalence is functorial; isomorphisms of étale presentations are a special case.

**Acceptance.**

- A = R = ℤ: H_{ℤ/ℤ,m} ≃ ℤ[q]^∧_{(q^m−1)} and H_{ℤ/ℤ,m}/(q^m − 1) ≅ ℤ[q]/(q^m − 1) ≅ q-W_m(ℤ) (q-Witt Corollary 2.37).
- A = ℤ, R = ℤ[1/2], m = 2: H ≃ ℤ[1/2][[q − 1]] × ℤ[1/2][[q + 1]] and H/(q^2 − 1) ≅ ℤ[1/2] × ℤ[1/2] ≅ q-W_2(ℤ[1/2]), the ghost maps being isomorphisms when m is invertible (q-Witt Example 2.38).
- Non-example: for R = ℤ[1/23][x]/(x^3 − x − 1), étale over ℤ, H_{R/ℤ,2} is not isomorphic to R[q]^∧_{(q^2−1)} as a ℤ[q]-algebra; otherwise reduction modulo q^2 − 1 would give q-W_2(R) ≅ R[q]/(q^2 − 1), and q-Witt Corollary 2.52 would make the Frobenius lift ϕ_2 of R̂_2 restrict to an endomorphism of R lifting the Frobenius of R/2 ≅ F_8, but the only ring endomorphism of R is the identity (the cubic field of discriminant −23 has no non-trivial automorphism).
- H_{R/A,m} is static and q^m − 1 is a nonzerodivisor on it.

**Depends on.** this roadmap: `HR.4/the-finite-relative-habiro-rings`, `HR.4/relative-q-witt-rings`, `HR.4/q-witt-vectors-of-etale-maps`, `HR.4/ghost-maps-and-etale-base-change`, `HR.3/the-morphism-level-statement`, `HR.1/the-etale-frobenius-lift`, `HR.1/morphisms-of-pairs`; stages: `DerivedDeRhamCohomology:DD.1`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Theorem 2.9, PDF p. 16: “Let A be a perfectly covered Λ-ring, R an A-algebra, and m ∈N. Then H_{R/A,m}/(q^m −1) ≃q-W_m(R/A) . In fact, H_{R/A,m} is the unique lift of the étale A[q]/(q^m −1)-algebra q-W_m(R/A) to a (q^m −1)-complete E∞-algebra over A[q]^∧_{(q^m−1)}.” — The statement at finite level; 'R an A-algebra' must read 'R an étale A-algebra' (source issue).
- `Wagner.qHodgeHabiro.2025`, Proof of Theorem 2.9, PDF p. 16: “If p is prime and pd | m, then the ghost maps for the usual Witt vectors W_m(A/p) and W_m(R/p) satisfy gh_{m/d}(x) = gh_{m/pd}(x)^p. It follows that the ghost maps for relative q-Witt vectors fit into a commutative diagram” — The second proof step.
- `Wagner.qHodgeHabiro.2025`, Proof of Theorem 2.9, PDF p. 17: “By construction of H_{R/A,m}, this yields an E∞-A[q]-algebra map W → H_{R/A,m}. As both sides are (q^m −1)-complete, whether this is an equivalence can be checked modulo Φ_d(q) for all d | m.” — The third and fourth proof steps.
- `Wagner.qHodgeHabiro.2025`, Proof of Theorem 2.9, PDF p. 17: “Since H_{R/A,m} is (q^m −1)-complete and becomes static modulo p, we see that H_{R/A,m} must be static as well. Therefore it is an ordinary ring.” — Staticity; 'modulo p' must read 'modulo q^m − 1' (source issue).

**Assembly note.** Step 1 cites the gap on completed deformations; the HR.4 part plans that input. `HR.4/complete-principal-deformation-universality` gives the unique derived (q^m − 1)-complete lift W of the étale A[q]/(q^m − 1)-algebra q-W_m(R/A), static and (q^m − 1)-regular, with a contractible space of marked comparisons; `HR.4/cyclotomic-ghost-lift-coherence` carries out steps 2–3, identifying W^∧_{Φ_d(q)} ≃ E_d by the relative ghosts and the overlaps with the linearised Frobenius, with a specified path at each prime edge, so that the HR.3 reconstruction gives W ≃ H_{R/A,m} naturally. For m = 6 the four prime edges 1 → 2, 1 → 3, 2 → 6 and 3 → 6 need their paths and no extra equation around the incidence cycle. These two nodes are inputs to this proof, and the packet should list them among its prerequisites; they remain conditional on the DD.1, E1 and E5:abstract refinements the HR.4 part requests.

### The transitions H_{R/A,m} → H_{R/A,d} deform the q-Witt Frobenius F_{m/d} (Remark 2.10)

`HR.4/the-transitions-are-frobenius` · theorem · first packet

Let A be a perfectly covered Λ-ring and R an étale A-algebra. The transition maps t_{m,d}: H_{R/A,m} → H_{R/A,d} (d | m) of HR.4/the-finite-relative-habiro-rings are maps of ordinary rings with t_{m,m} = id and t_{d,e} ∘ t_{m,d} = t_{m,e} for e | d | m, so they form a functor from the positive integers ordered by divisibility to rings; each t_{m,d} induces the identity on the E_c for c | d. Modulo q^m − 1 and q^d − 1, t_{m,d} induces, under the Habiro–q-Witt comparison at levels m and d, the q-Witt Frobenius F_{m/d}: q-W_m(R/A) → q-W_d(R/A). The whole system is natural in morphisms of pairs (A, R).

**Hypotheses.**

- The index relation is divisibility; the composition law is for chains e | d | m.
- The composition law uses that all H_{R/A,m} are ordinary rings (the comparison theorem), as in the source's footnote (2.1); no higher coherence is asserted.
- The identification on quotients is with the Frobenius F_{m/d} for the ratio m/d; the ghost maps used are jointly injective because q-W_d(R/A) is étale over A[q]/(q^d − 1) and A is torsion-free.
- These are Frobenius transitions and are named so: the absolute q-Witt vectors admit no extension of the Witt restriction maps (HR.4/there-is-no-restriction-map), and no interface of this roadmap names a restriction operator on q-Witt vectors.

**Proof.**

1. By construction t_{m,d} is the completion map followed by H_{R/A,d} ≃ (H_{R/A,m})^∧_{(q^d−1)}, and it induces the identity on each E_c, c | d.
2. Composition and identity: all rings are static, and H_{R/A,e} → ∏_{c|e} E_c is injective, since H_{R/A,e} is the limit over P of static rings whose chain terms are determined by the E_c; t_{d,e} ∘ t_{m,d} and t_{m,e} induce the identity on every E_c, c | e, hence agree.
3. On quotients, t_{m,d} induces a ring map q-W_m(R/A) → q-W_d(R/A) (comparison at levels m and d). For c | d, both gh_{d/c} ∘ (t_{m,d} mod (q^d − 1)) and gh_{d/c} ∘ F_{m/d} = gh_{m/c} are the reduction of the map q-W_m(R/A) → E_c/Φ_c(q) from the comparison proof.
4. The gh_{d/c} (c | d) are jointly injective on q-W_d(R/A): it is étale, hence flat, over A[q]/(q^d − 1); A[q]/(q^d − 1) → ∏_{c|d} A[q]/Φ_c(q) is injective for torsion-free A; and q-W_d(R/A)/Φ_c(q) ≅ R ⊗_{A,ψ^c} A[q]/Φ_c(q) via gh_{d/c} (HR.4/ghost-maps-and-etale-base-change). Hence the induced map is F_{m/d}.
5. Naturality in pairs from the naturality of the construction and of the comparison.

**Acceptance.**

- A = R = ℤ: t_{m,d} is the canonical map ℤ[q]^∧_{(q^m−1)} → ℤ[q]^∧_{(q^d−1)}, and on quotients the projection ℤ[q]/(q^m − 1) → ℤ[q]/(q^d − 1), which is F_{m/d} under c_m (q-Witt Corollary 2.35); for m = 2 and d = 1, F_2(V_2(1)) = F_2(1 + q) = 2.
- The induced map is not a restriction: for R = ℤ, m = 2, d = 1 no ring map compatible with Res_2 exists (HR.4/there-is-no-restriction-map), while t_{2,1} induces F_2.
- t_{2,1} ∘ t_{4,2} = t_{4,1}.

**Depends on.** this roadmap: `HR.4/the-etale-lift`, `HR.4/the-finite-relative-habiro-rings`, `HR.4/ghost-maps-and-etale-base-change`, `HR.4/relative-q-witt-rings`, `HR.3/the-complete-descent-corollary`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, 2.7, PDF p. 16: “For all d | m, Corollary 2.4 provides a preferred equivalence H_{R/A,d} ≃(H_{R/A,m})^∧_{(q^d−1)}. In particular, we get maps H_{R/A,m} → H_{R/A,d}.” — The transition maps.
- `Wagner.qHodgeHabiro.2025`, Footnote (2.1), PDF p. 16: “With a little more effort, this functoriality can be squeezed out of Corollary 2.4. Alternatively, we can take the limit over the sequential subdiagram {n!}_{n⩾1}, where the existence of maps is enough. Or we could use Theorem 2.9 to realise that we’re working with ordinary rings” — The composition law, proved here by the third route.
- `Wagner.qHodgeHabiro.2025`, Remark 2.10, PDF p. 17: “By tracing through the proof of Theorem 2.9 and checking on ghost coordinates, we see that the maps H_{R/A,m} → H_{R/A,d} from 2.7 deform the q-Witt vector Frobenii F_{m/d}: q-W_m(R/A) → q-W_d(R/A).” — The identification on quotients.

### The limit of the H_{R/A,m} along the transitions is an ordinary ring

`HR.4/the-limit-of-the-finite-stages-is-static` · theorem · first packet · added by REV-HabiroRings

Let A be a perfectly covered Λ-ring and R an étale A-algebra. The limit lim_m H_{R/A,m}, taken in D(A[q]) over the positive integers ordered by divisibility along the transitions t_{m,d}, is Habiro-complete, its Φ_m(q)-completion is E_m = (R ⊗_{A,ψ^m} A)[q]^∧_{Φ_m(q)} for every m, and it is static: an ordinary ring. (HR.5 names it the relative Habiro ring H_{R/A}.)

**Hypotheses.**

- The limit is the derived limit in D(A[q]); it is not replaced by an ordinary inverse limit.
- Habiro-completeness is in the sense of HR.2, and staticity is detected by HR.2's Corollary B.4, not by an exactness property of limits or completion.

**Proof.**

1. Each H_{R/A,m} is (q^m − 1)-complete, hence Habiro-complete, and Habiro-complete objects are closed under limits (HR.2/habiro-complete-modules).
2. Derived Φ_m(q)-completion commutes with limits (DD.1); for n divisible by m, (H_{R/A,n})^∧_{Φ_m(q)} ≃ E_m compatibly with the transitions, and such n are cofinal, so (lim H)^∧_{Φ_m(q)} ≃ E_m and (lim H)/Φ_m(q) ≃ (R ⊗_{A,ψ^m} A)[q]/Φ_m(q), which is static.
3. Corollary B.4 (HR.2/the-detection-results), applied for every n ≠ 0, gives π_n(lim H) = 0.

**Acceptance.**

- A = R = ℤ: the limit is lim_m ℤ[q]^∧_{(q^m−1)}, the Habiro ring, an ordinary ring.
- The limit may equally be taken over the cofinal factorial sequence (n!)_{n≥1} (footnote (2.1)); the comparison of the two limits is HR.5's.

**Used by.**

- HR.5, the relative Habiro ring: H_{R/A} is defined as this limit; its staticity is this node.

**Depends on.** this roadmap: `HR.4/the-transitions-are-frobenius`, `HR.4/the-finite-relative-habiro-rings`, `HR.2/the-detection-results`, `HR.2/habiro-complete-modules`; stages: `DerivedDeRhamCohomology:DD.1`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Theorem 2.9, PDF p. 16: “In particular, H_{R/A,m} is an ordinary ring for all m ∈N, and the same is true for the relative Habiro ring H_{R/A}.” — The last clause of Theorem 2.9.
- `Wagner.qHodgeHabiro.2025`, Proof of Theorem 2.9, PDF p. 17: “To conclude the same for H_{R/A}, we’ve seen above that H_{R/A}/Φ_m(q) is static for all m ∈N. Then Corollary B.4 can be applied.” — The proof.
- `Wagner.qHodgeHabiro.2025`, Corollary B.4, PDF p. 78: “Let M be a Habiro-complete spectrum and fix n ∈Z. If π_n(M/Φ_m(q)) ≅ 0 for all m ∈N, then already π_n(M) ≅ 0.” — The detection result used.

**Assembly note: the refined proof.** REV-HabiroRings--HR.4 asks the assembly to use the HR.4 part's argument in place of step 2, which commutes derived Φ_m(q)-completion with the limit. The refined argument needs no property of completion functors and no surjectivity of the transitions, only that a finite cofibre commutes with limits. Index the limit by the cofinal factorial sequence. Habiro-completeness is closed under limits. For fixed d, on the cofinal tail of m with d | m, the derived reduction modulo Φ_d(q) is constant, equal to (R ⊗_{A,ψ^d} A)[q]/Φ_d(q), compatibly with the transitions. Reduction of underlying modules modulo Φ_d(q) is a finite cofibre, and in a stable category it commutes with limits; so the reduction of the limit modulo every Φ_d(q) is static, and HR.2's detection result (`HR.2/the-detection-results`), applied in every non-zero degree, shows that the limit is static. The statement is unchanged.

### Marked étale algebra deformations

`HR.4/marked-etale-deformation` · definition · planet “Marked étale deformations” · HR.4 packet

For a commutative ring B, ideal I and étale B/I-algebra D, a marked étale deformation is an étale B-algebra E together with a B/I-algebra equivalence ε:(B/I)⊗_B E≅D. The carrier, its commutative-ring and B-algebra structures, its actual Algebra.Etale predicate and ε are data. A map E→E′ reduces to ε′∘((B/I)⊗g)∘ε⁻¹. A marked isomorphism has identity reduction when the target D is fixed. No module-finiteness, noetherianity or nilpotence is part of the definition.

**Hypotheses.**

- All rings and maps are unital; the zero ring is allowed.
- The source D has its given B/I-algebra structure. A proposed deformation can be typed without separately assuming D étale, but its marking and base-change theorem imply that property.
- Markings are remembered. For I not nilpotent, object lifts before completion need not be unique.

**Construction.**

1. Use the existing commutative-ring, algebra, étale and tensor-product types; package an algebra object and its reduction equivalence.
2. Define reduction of morphisms by scalar extension and conjugation by the markings. Tensor-product identity and composition give the functor laws.
3. The unit deformation has E=B; localization uses the existing étale localization theorem. For the split deformation use B[x]/(x²−x)≅B×B via evaluation at 0 and 1, with inverse (a,b)↦a+(b−a)x. Its one-variable Jacobian 2x−1 has square 1 in the quotient, so the existing dimension-zero submersive-presentation criterion gives étaleness, including the zero ring. Base change supplies its canonical product marking.

**API.**

- `EtaleDeformation.ofAlgebra` (constructor): Package an étale B-algebra E and ε:(B/I)⊗_B E≅D.
- `EtaleDeformation.carrier_etale` (instance): Every packaged carrier is Algebra.Etale over B, using the existing class.
- `EtaleDeformation.reduction_etale` (compatibility): D is étale over B/I by base change and the marking.
- `EtaleDeformation.transportMarking` (functoriality): For e:D≅D′, retain E and replace ε by e∘ε.
- `EtaleDeformation.reduceMap` (functoriality): A B-algebra map of carriers gives the specified conjugated B/I-algebra map between the marked targets.
- `EtaleDeformation.reduceMap_id` (simp): Reduction sends the identity to the identity.
- `EtaleDeformation.reduceMap_comp` (functoriality): Reduction sends h∘g to the composite of their reductions.
- `EtaleDeformation.unit` (constructor): The canonical deformation of B/I has carrier B and the tensor-unit marking.
- `EtaleDeformation.split` (constructor): The canonical deformation of (B/I)×(B/I) has carrier B×B and the product marking.
- `EtaleDeformation.localisation` (constructor): For a∈B, use E=B[1/a] and the identity marking of (B/I)⊗_B E; its reduced algebra is (B/I)[1/ā].

**Unit tests.**

- `EtaleDeformation.test_unit` (degenerate): The carrier of unit(I) is B as a B-algebra, including the zero-ring case.
- `EtaleDeformation.test_split_swap` (computation): The swap automorphism of the split lift reduces, through the canonical marking, to (x,y)↦(y,x). For a nonzero B/I this changes (1,0).
- `EtaleDeformation.test_localisation` (non-example): At B=ℤ,I=0,a=2 the localization deformation has carrier ℤ[1/2] as a ℤ-algebra and is not a finite ℤ-module. Requiring module-finiteness would reject this valid étale deformation.

**Acceptance.**

- The identity marking on B/I gives the unit deformation with carrier B.
- The transposition of the split deformation reduces to the transposition of (B/I)×(B/I), not the identity when B/I is nonzero.
- The deformation for ℤ[1/2] at I=0 is admitted although its carrier is not a finite ℤ-module.

**Used by.**

- Wagner q-Habiro Theorem 2.9, first sentence of proof: Records the chosen étale object lift of q-W_m(R/A), so comparisons must induce its prescribed reduction identification.
- HR.4 comparison naturality; HR.5 finite-stage Taylor identifications and HR.6 coefficient comparisons: Keeps track of which lift and marking are transported along a presentation isomorphism or coefficient map.

**Depends on.** libraries: `mathlib:Algebra.Etale`, `mathlib:Algebra.Etale.baseChange`, `mathlib:Algebra.Etale.of_isLocalizationAway`, `mathlib:Algebra.TensorProduct.map`, `mathlib:Algebra.TensorProduct.quotientTensorEquiv`, `mathlib:Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero`, `mathlib:Algebra.SubmersivePresentation.isStandardSmoothOfRelativeDimension`.

**Library.** proposed module `TauCeti/RingTheory/Habiro/EtaleDeformation`, namespace `TauCeti.Habiro.EtaleDeformation`.

**Sources.**

- `Stacks.0ALI`, Lemma 15.11.2, equivalence functor in the statement: “B ↦ B/IB” — Packages the fibre of reduction with its specified identification; the marking makes uniqueness a precise statement.

### Étale object lifting across a quotient

`HR.4/etale-quotient-lift` · theorem · HR.4 packet

For every commutative B, ideal I and étale B/I-algebra D, there exists a marked étale deformation (E,ε) of D over B. This is existence of an algebra object, not merely a lift of a map out of an already given formally étale source. No nilpotence assumption on I is required.

**Hypotheses.**

- Étale means the existing formal étaleness plus finite presentation.
- The lift E is an ordinary finitely presented B-algebra; it need not be finite as a B-module or uniquely determined away from the reduction locus.

**Proof.**

1. By the pinned relative-dimension-zero standard-smooth theorem, choose a finite presentation of D with equally many variables and equations and invertible Jacobian determinant.
2. Lift its polynomial equations to B and call their Jacobian determinant Δ. Adjoin an extra variable y and relation yΔ−1. The enlarged square Jacobian determinant is Δ² modulo the equations, hence is a unit. This supplies a dimension-zero submersive presentation and therefore an étale B-algebra E.
3. Reduction of E gives the original presentation with an inverse of the already invertible determinant; the inverse is unique, providing ε.

**Acceptance.**

- For I=0 choose E=D with its tensor-unit marking.
- For B=ℤ,I=(2),D=𝔽₂[x]/(x²+x+1), one lift is ℤ[x]/(x²+x+1)[1/3]; its discriminant −3 is invertible.
- For D=(B/I)[1/ā], lift a and take E=B[1/a]; no finite-module hypothesis is introduced.

**Depends on.** this roadmap: `HR.4/marked-etale-deformation`; libraries: `mathlib:Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero`, `mathlib:Algebra.SubmersivePresentation.isStandardSmoothOfRelativeDimension`.

**Library.** Lean name `TauCeti.Habiro.etale_quotient_lift`.

**Sources.**

- `Stacks.04D1`, Lemma 10.143.10, whole proof: “Just take some lifts” — The proof supplies algebra objects for arbitrary quotient ideals; the pinned Jacobian presentation theorem supplies its input.

### Nilpotent invariance with reduction markings

`HR.4/nilpotent-deformation-rigidity` · theorem · HR.4 packet

If I⊂B is nilpotent and L=(E,ε), M=(E′,ε′) are marked étale deformations of D,D′, then reduction Hom_B(E,E′)→Hom_{B/I}(D,D′) is bijective. Together with étale object lifting, reduction gives an equivalence of categories of étale algebras. For a fixed D there is a unique marked isomorphism between any two lifts; its composites and identities agree with the marked comparisons. The nilpotent specialization suffices for all B/(f^n) and overlap thickening levels here.

**Hypotheses.**

- I has a finite nilpotence exponent. The statement does not assert rigidity for arbitrary quotient ideals.
- All morphisms preserve the specified algebra structures; mark-preserving isomorphisms, rather than unmarked carrier equalities, express uniqueness.

**Proof.**

1. Translate a morphism D→D′ through the markings to E→E′/IE′. Apply the existing formally smooth nilpotent map-lifting theorem for existence. The ideal IE′ is nilpotent.
2. Apply the existing formally unramified uniqueness theorem to two lifts. Transport this bijection through quotient/tensor equivalences.
3. Lift an isomorphism and its inverse. Their composites reduce to identities and so equal identities by uniqueness. The object-lifting theorem supplies essential surjectivity.

**Acceptance.**

- At B=ℤ/4,I=(2), the unit deformation of 𝔽₂ has a unique marked self-map.
- For D=(B/I)², the swap of D lifts to a swap of E; it is not a second map with identity marking.
- Removing nilpotence breaks object rigidity: over B=ℤ[t], I=(t), E=B and E′=B[1/(1−t)] have the same reduced unit algebra but are not isomorphic before completion.

**Depends on.** this roadmap: `HR.4/marked-etale-deformation`, `HR.4/etale-quotient-lift`; libraries: `mathlib:Algebra.FormallySmooth.exists_lift`, `mathlib:Algebra.FormallyUnramified.lift_unique`, `mathlib:Algebra.TensorProduct.quotientTensorEquiv`.

**Library.** Lean name `TauCeti.Habiro.nilpotent_deformation_rigidity`.

**Sources.**

- `Stacks.0ALI`, Lemma 15.11.2, equivalence proof: “an equivalence” — Uses the nilpotent specialization, with pinned formal smoothness and formal unramifiedness replacing the source’s map-lifting and diagonal arguments.

### Completion of a marked étale deformation

`HR.4/completed-etale-deformation` · construction · planet “Completed étale deformations” · HR.4 packet

Let B be commutative, I⊂B finitely generated, D an étale B/I-algebra and L=(E,ε) a marked étale deformation. Set W=CompletedEtaleLift(I,L):=lim_n E/I^nE, using the existing ordinary AdicCompletion carrier. It is a commutative B-algebra, complete for IW, with its canonical map E→W and marking (B/I)⊗_B W≅D. For each n≥1, W/I^nW≅E/I^nE is étale over B/I^n. The morphism/comparison API is furnished by the following completed-deformation-map-equivalence lemma. No assertion that W is étale or flat over the completed base is included.

**Hypotheses.**

- I is finitely generated for ordinary completeness and the quotient-identification API; the compatible-family carrier itself is defined for any I.
- The completed ring is not a new completion theory. Derived compatibility requires the separate principal regular theorem and DD.1.
- Finite presentation of E as an algebra does not imply module-finiteness.

**Construction.**

1. Reuse AdicCompletion for IE⊂E and its compatible quotient families. The image of a finitely generated ideal is finitely generated.
2. Apply AdicCompletion.isAdicComplete. The kernel-of-evaluation-at-one theorem and eval_surjective identify W/IW with E/IE, followed by the given marking. For every n, apply AdicCompletion.pow_smul_top_eq_ker_eval to IE and eval_surjective at n: the extended (IE)^n equals the evaluation kernel, so W/I^nW≅E/I^nE. This uses the original completion directly, rather than changing its defining ideal to I^n.
3. Compose the tensor/quotient comparison with ε; the canonical completion map reduces to ε. Base change of the existing étale E gives étaleness at each nilpotent level.
4. Use the separate map-equivalence lemma to assemble functorial maps and unique marked comparisons; do not treat a selected quotient-object lift as canonical before completion.

**API.**

- `CompletedEtaleLift.instCommRing` (instance): The existing completion ring structure.
- `CompletedEtaleLift.instAlgebra` (instance): The B-algebra structure induced from E.
- `CompletedEtaleLift.of` (constructor): The B-algebra map E→W of the existing completion unit.
- `CompletedEtaleLift.complete` (characterisation): W is complete for the extended ideal IW, for I finitely generated.
- `CompletedEtaleLift.reductionEquiv` (equivalence): The marked B/I-algebra equivalence (B/I)⊗_B W≅D.
- `CompletedEtaleLift.reduction_of` (compatibility): Reducing E→W and then applying the completed marking equals ε.
- `CompletedEtaleLift.homEquiv` (universal-property): For every ordinary IW-complete B-algebra C, reduction identifies Hom_B(W,C) with Hom_{B/I}(D,(B/I)⊗_B C). This API item is promoted to completed-deformation-map-equivalence.
- `CompletedEtaleLift.map` (functoriality): Lift a B/I-algebra map g:D→D′ uniquely to W_L→W_M for any two selected object lifts.
- `CompletedEtaleLift.map_reduction` (simp): The completed map reduces to g under the two markings.
- `CompletedEtaleLift.map_id` (simp): The lift of the identity is the identity.
- `CompletedEtaleLift.map_comp` (functoriality): The lift of h∘g equals the composite of the lifted maps.
- `CompletedEtaleLift.equivOfMarking` (equivalence): For two object lifts of D, the unique map inducing identity on D is an algebra equivalence of their completions.
- `CompletedEtaleLift.equivOfMarking_reduction` (compatibility): The comparison intertwines the two markings.
- `CompletedEtaleLift.equivOfMarking_trans` (functoriality): The marked comparisons satisfy the transitivity law; inverse and identity follow from map_comp and map_id.

**Unit tests.**

- `CompletedEtaleLift.test_zero_ideal` (degenerate): At I=0, W≅D as a B-algebra, with the B-algebra structure on D obtained by restricting scalars from B/I.
- `CompletedEtaleLift.test_nilpotent` (characterisation): If I is nilpotent, the canonical completion map E→W is bijective, hence an algebra equivalence. Each quotient family is eventually constant; finite generation is not needed for this test.
- `CompletedEtaleLift.test_split_swap` (non-example): For B/I nonzero, the unique completed map lifting the reduced transposition of D=(B/I)² is not the identity, since its reduction moves (1,0).
- `CompletedEtaleLift.test_localisation_series` (computation): For B=ℤ[t], I=(t), L the étale localization at 2, W≅ℤ[1/2][[t]], intertwining the B-structure with polynomial evaluation at the power-series variable. Completion admits ∑_n t^n/2^n; replacing W by ℤ[[t]][1/2] would wrongly exclude it.

**Acceptance.**

- At I=0 the completed algebra is D through ε.
- If I is nilpotent, E→W is an algebra equivalence, even without finite generation for this particular test.
- The split deformation has W≅B̂_I×B̂_I; when B/I is nonzero, the map lifting the reduced transposition is not the identity.
- For B=ℤ[t], I=(t), E=B[1/2], the completion is ℤ[1/2][[t]]. Its coefficients need no common denominator bound: ∑_n t^n/2^n is an element.

**Used by.**

- Theorem 2.9, deformation W and its cyclotomic reductions: Supplies the actual ordinary algebra and its fixed marking before comparing with E_d and H_{R/A,m}.
- HR.4 transition and naturality statements; HR.5 Taylor comparisons: Supplies canonical maps on completed lifts and independence from the selected étale presentation.

**Depends on.** this roadmap: `HR.4/marked-etale-deformation`; libraries: `mathlib:AdicCompletion`, `mathlib:AdicCompletion.isAdicComplete`, `mathlib:AdicCompletion.eval_surjective`, `mathlib:AdicCompletion.ker_evalOneₐ_eq_map`, `mathlib:AdicCompletion.pow_smul_top_eq_ker_eval`, `mathlib:Algebra.TensorProduct.quotientTensorEquiv`, `mathlib:Algebra.Etale.baseChange`, `mathlib:MvPowerSeries.toAdicCompletionAlgEquiv`.

**Library.** proposed module `TauCeti/RingTheory/Habiro/EtaleDeformation`, namespace `TauCeti.Habiro.CompletedEtaleLift`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Theorem 2.9, pp.16–17, first proof paragraph: “Let, temporarily, W denote the unique lift” — Makes the ordinary completed lift in the proof explicit; its enhanced universal property is a separate target, not assumed by the definition.

### Maps from completed étale deformations

`HR.4/completed-deformation-map-equivalence` · lemma · HR.4 packet

For the finitely generated ideal I and W_L above, and every ordinary commutative B-algebra C complete for IC, reduction through the marking is a natural bijection Hom_B(W_L,C)≅Hom_{B/I}(D,(B/I)⊗_B C). In particular, a map D→D′ lifts uniquely between completed deformations; a reduced isomorphism lifts to an isomorphism, and the marked comparisons are independent of presentations and satisfy identity/composition/transitivity.

**Hypotheses.**

- Completeness is ordinary IsAdicComplete for the extended ideal IC. This theorem concerns ordinary algebra maps, not enhanced mapping spaces.
- No continuity assumption is added to the hom-set: every B-algebra map sends I^n to I^n and hence is I-adically continuous.

**Proof.**

1. Precompose a reduced map with E→D and identify the target quotient by the existing quotient/tensor comparison. Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete supplies an E→C lift.
2. The complete target is separated. Algebra.FormallyUnramified.ext_of_iInf makes that lift unique. Thus this step uses the existing adic map-lifting and rigidity declarations rather than planning a duplicate theorem.
3. At each power of I reduce the E→C map and extend over W/I^nW≅E/I^nE. These maps are compatible; AdicCompletion.liftAlgHom and ofAlgEquiv assemble a W→C map.
4. Every W→C map is determined by its quotient-level maps; uniqueness at each nilpotent level, or separatedness plus the dense completion unit, proves the claimed bijection. Reduced identities and composites lift uniquely; lift an inverse to obtain marked equivalences.

**Acceptance.**

- The hom-set for W=B̂_I and C complete is the singleton containing the structure map, matching Hom_{B/I}(B/I,C/IC).
- For split D=(B/I)², reduction distinguishes identity from transposition.
- For two lifts B and B[1/(1−t)] over B=ℤ[t], I=(t), the completed comparison is an isomorphism although the original lifts are not isomorphic.

**Depends on.** this roadmap: `HR.4/completed-etale-deformation`, `HR.4/nilpotent-deformation-rigidity`; libraries: `mathlib:Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`, `mathlib:Algebra.FormallyUnramified.ext_of_iInf`, `mathlib:AdicCompletion.liftAlgHom`, `mathlib:AdicCompletion.ofAlgEquiv`, `mathlib:Algebra.TensorProduct.quotientTensorEquiv`.

**Library.** Lean name `TauCeti.Habiro.CompletedEtaleLift.homEquiv`.

**Sources.**

- `Stacks.0ALI`, Lemma 15.11.2, full-faithfulness argument applied at each finite power: “an equivalence” — The nilpotent-level bijections, together with pinned complete-target existence and separated-target rigidity, prove the completed morphism statement.

### Unique complete principal étale deformation

`HR.4/complete-principal-deformation-universality` · theorem · HR.4 packet

Let B be a commutative ring, f∈B a nonzerodivisor, D an étale B/(f)-algebra, L an étale object lift and W=CompletedEtaleLift((f),L). Viewed as an E∞-B-algebra, W is derived f-complete and static, f is a nonzerodivisor on W, and its derived cofibre quotient W/^L f is D with the prescribed marking. For every derived f-complete E∞-B-algebra C and equivalence ε_C:C/^L f≃D, the space of equivalences W≃C whose reduction intertwines ε_C and ε_W is contractible. Consequently C is static and f-regular too. The B̂_(f)-algebra version follows by the complete-base action; it is the uniqueness needed in Theorem 2.9.

**Hypotheses.**

- The quotient C/^L f is the underlying-module derived cofibre, equipped with its derived algebra structure, not the ordinary quotient of π₀C.
- The comparison space is a homotopy fibre over the fixed reduced equivalence. Existence of some unmarked isomorphism does not express this statement.
- No noetherianity, no module-finiteness of D, and no flatness or étaleness of W over B̂_(f) are asserted.

**Proof.**

1. The chosen E is étale and hence flat over B, so f is regular on E. DD.1 identifies its derived completion with the ordinary quotient tower E/f^nE. That tower is static with surjective transition maps, so its homotopy limit W is static. Elementary compatible-quotient calculations show f is regular on W; W/fW≅D is then also a derived quotient.
2. For a proposed C, the successive-power cofibre triangles express C/^L f^n as extensions of n copies of C/^L f. Thus each is static; the maps on degree zero of this f-power tower are surjective. Derived completeness identifies C with their homotopy limit. The Milnor sequence, with vanishing lim¹, implies C is static. Its quotient long exact sequence then implies f is regular on π₀C.
3. DD.1 supplies ordinary/derived completion comparison for this regular principal situation, so the actual ring π₀C is ordinarily f-complete. Apply completed-deformation-map-equivalence to the prescribed reduced map and obtain W→π₀C. Its reduction is an equivalence, so principal derived Nakayama makes it an equivalence.
4. Use the fully faithful enhanced embedding of static commutative B-algebras: their mapping spaces are discrete. The reduced hom-set bijection leaves exactly one point in the marked comparison fibre, including all its higher homotopies. Extend the base action to B̂_(f) by its universal property.

**Acceptance.**

- For B=ℤ[t], f=t, D=ℤ[1/2], the universal deformation is ℤ[1/2][[t]], including unbounded coefficient denominators.
- For D=(B/(f))², the identity marking has a contractible comparison fibre; the reduced swap belongs to a different fibre.
- C=B/(f) with f acting by zero is generally excluded: although its ordinary quotient by f is itself, its derived quotient has π₁=B/(f), so it is not D concentrated in degree zero.
- Changing E to another étale object lift changes W by its unique marked equivalence, coherently under three choices.

**Depends on.** this roadmap: `HR.4/etale-quotient-lift`, `HR.4/completed-etale-deformation`, `HR.4/completed-deformation-map-equivalence`; stages: `DerivedDeRhamCohomology:DD.1`, `EnhancedDerivedSheaves:E1`, `EnhancedDerivedSheaves:E5:abstract`; libraries: `mathlib:Algebra.Smooth.flat`.

**Library.** Lean name `TauCeti.Habiro.complete_principal_deformation_universality`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Theorem 2.9, pp.16–17, unique completed deformation and staticity: “the unique lift” — Supplies the proof obligation suppressed by the word unique: object existence, staticity, derived reduction and contractible marked equivalences. The corrected theorem assumes R étale and staticity is detected modulo q^m−1.

### Coherent lifting of the relative ghost diagram

`HR.4/cyclotomic-ghost-lift-coherence` · lemma · HR.4 packet

Let A be a perfectly covered torsion-free Λ-ring, R an étale A-algebra, m≥1, B=A[q], f=q^m−1 and D=q-W_m(R/A). Choose its marked complete étale deformation W. Put T_d=R⊗_{A,ψ^d}A and E_d=(T_d[q])^∧_{Φ_d(q)} for every d|m. The relative ghosts canonically identify W^∧_{Φ_d(q)}≃E_d with reductions gh_{m/d}. For every prime edge pd|m these comparisons carry the overlap identifications for W to the linearized relative Frobenius overlap isomorphism (E_pd)^∧_p≃(E_d)^∧_p used by HR.3. The comparison includes a specified path for each edge and all coherences supplied by unique marked lifting. It yields a coherent HR.3 section, an equivalence W≃H_{R/A,m}, and natural comparisons on mapping spaces, not merely commuting squares of π₀ rings.

**Hypotheses.**

- Perfect covering is the HR.1 faithfully flat map A→A_∞; étaleness of R is essential. The q-Witt coefficient theory is imported from the parent, with QW.3/QW.4 permanent ownership.
- All completions and reductions here are derived. Their ordinary identifications are used only after the stated regularity/staticity comparisons.
- The Frobenius input is the HR.1 linearized map over ψ^p on p-completions, reducing to relative Frobenius on R/p. No global Frobenius lift on R is assumed.

**Proof.**

1. By QW.4, D is étale over B/(f), and its derived base change along the cyclotomic quotient is T_d[q]/Φ_d. Since f and Φ_d are monic, and T_d is flat over A, the principal regular deformation theorem identifies the Φ_d-completed W with E_d, respecting the relative ghost marking. Here T_d is étale over A by base change of R and is flat by Algebra.Smooth.flat; polynomial base change gives the étale B-algebras used at the finite overlap levels.
2. For pd|m, use the relative ghost/Frobenius square reduced modulo p, whose bottom map is relative Frobenius. Étaleness makes that relative Frobenius an isomorphism. The radicals of (p,Φ_d) and (p,Φ_pd) coincide by the imported cyclotomic arithmetic. HR.1 supplies its linearized p-complete lift.
3. Reduce the two maps on the overlap through powers of J=(p,Φ_d) (or its radical-equivalent presentation). Nilpotent étale rigidity makes the prescribed lifts unique at every finite level; DD.1 identifies the overlap completion with this tower in the regular two-generator situation. The static-algebra embedding makes the marked map fibre contractible, giving the canonical edge path and its higher coherence.
4. Apply the actual HR.3 coherent diagram and reconstruction, using its prime-edge mapping-space theorem. The local comparisons induce W→H and are equivalences at every cyclotomic vertex, hence the comparison is an equivalence by the finite localization contract. Naturality follows from equality in the marked fibres, retained as paths in the section mapping space.

**Acceptance.**

- For R=A, D=A[q]/(f) and W=B̂_(f); all local markings are the tensor-unit identifications.
- For m=1 the only vertex is d=1 and no edge path is needed: H_{R/A,1}≅R[[q−1]].
- For m=6 the four prime edges 1→2,1→3,2→6,3→6 each have a specified comparison path. The height-one HR.3 incidence diagram imposes no extra cycle equation.
- For d|m, the comparison satisfies gh_{m/c}=gh_{d/c}∘F_{m/d} for c|d, which is the imported transition theorem’s quotient test.

**Depends on.** this roadmap: `HR.4/complete-principal-deformation-universality`, `HR.4/completed-deformation-map-equivalence`, `HR.4/relative-q-witt-rings`, `HR.4/ghost-maps-and-etale-base-change`, `HR.1/perfectly-covered`, `HR.1/the-etale-frobenius-lift`, `HR.1/relative-frobenius-of-an-etale-algebra`, `HR.3/the-divisor-poset-and-its-intersections`, `HR.3/coherent-completion-diagram`, `HR.3/finite-localisation-contract`, `HR.3/reconstruction-functor`, `HR.3/prime-edge-mapping-spaces`, `HR.4/q-witt-vectors-of-etale-maps`, `HR.4/nilpotent-deformation-rigidity`; stages: `DerivedDeRhamCohomology:DD.1`, `EnhancedDerivedSheaves:E1`, `EnhancedDerivedSheaves:E5:abstract`; libraries: `mathlib:Algebra.Etale.baseChange`, `mathlib:Algebra.Smooth.flat`.

**Library.** Lean name `TauCeti.Habiro.cyclotomic_ghost_lift_coherence`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Theorem 2.9 full proof, pp.16–17, the two ghost diagrams: “After passing to unique deformations” — Expands the coherent-map step and verifies that the induced local maps are the relative ghosts, using the accepted HR.3 reconstruction rather than a new finite-limit construction.
- `Wagner.qWitt.2024`, Corollary 2.51, p.34, statement and proof: “pushout diagram” — Its pushout identifies W/Φ_d. Use the corrected proper-divisor cokernel in the proof (source issue E17).

## HR.5 — The relative Habiro ring and its Taylor presentation

*Coverage in `HabiroRings.json`: source_decomposed, 6 nodes.* 6 packet nodes at this stage. Seven nodes from 2.7–2.12 (PDF pp. 15–18). The relative Habiro ring (2.7 with footnote (2.1); staticity from Theorem 2.9 through Corollary B.4; completions, quotients, functoriality and the limit universal property). The untwisted cases, the positive side of Remark 2.8: R = A, toric bases and ℤ[1/N] give the ordinary cyclotomic completions. Base change along maps of bases with derived tensor product and completion, derived from Theorem 2.9 and q-Witt v5 Lemma 2.46 (the source has no base-change statement; the uncompleted formula fails already for Z → ℤ[x]). The compatible roots with the canonical map (no re-expansion) and the Frobenius map (relative Frobenius then re-expansion), change-of-choice invariance under Ẑ^× and the full cyclotomic coefficient algebra. The ℓ-adic and rational Taylor comparison lemma, which replaces the false p. 18 irreducibility line by separability and gives the componentwise form the stage text asks for. Lemma 2.12. The former repair node was a note and is deleted: its mathematics is the Taylor comparison lemma, its counterexample is HabiroRings:HR.7/phi-five-over-f-eleven, and the mistake is under sourceIssues. The source work of this stage is complete; HabiroRings:HR.5/completed-base-change still needs q-Witt v5 Lemma 2.46 as an HR.4 item (gap 'The companion q-Witt paper is obtained but HR.1 and HR.4 do not yet decompose it').

The layer has six nodes, all in the first packet, from Wagner 2.7–2.12 (PDF pp. 15–18); it is `source_decomposed` and has no follow-up packet.

- **The relative Habiro ring.** H_{R/A} = lim_m H_{R/A,m} over the positive integers ordered by divisibility (2.7 with footnote (2.1)), equivalently over the cofinal chain n!. It is static by Theorem 2.9 and Corollary B.4, Habiro-complete, with completions E_m and quotients q-W_m(R/A), functorial in pairs, with the universal property of the limit.
- **Roots and substitutions.** A compatible system of roots of unity (ζ_m) fixes the Taylor components. The coefficient algebra at m is the full (R ⊗_{A,ψ^m} A) ⊗_ℤ ℤ[ζ_m], never a quotient through one embedding. The canonical map is extension of coefficients in the same variable, with no re-expansion; the Frobenius map is the relative Frobenius followed by the p-adic re-expansion of HabiroCyclotomicCompletions HC.3, which converges because ζ_m − ζ_{pm} is topologically nilpotent. Changing the system by an element of Ẑ^× changes the components by the Galois action, and the equaliser is invariant.
- **The ℓ-adic Taylor comparison.** For ℓ ∤ m, ℤ_ℓ[q]^∧_{(ℓ,Φ_m(q))} ≅ ℤ_ℓ[ζ_m][[q − ζ_m]], componentwise over the Hensel factors of Φ_m modulo ℓ, and the same rationally. This replaces the proof line of Lemma 2.12 (p. 18) that claims Φ_m irreducible modulo every ℓ ∤ m, which is false (E5; Φ_5 splits over 𝔽_11, `HR.7/phi-five-over-f-eleven`): Φ_m is only separable modulo ℓ, 𝔽_ℓ[q]/Φ_m is finite étale, and the argument runs on each factor and reassembles by idempotents. The conclusion of Lemma 2.12 is unchanged.
- **Lemma 2.12.** H_{R/A} is the equaliser of can and φ/A from ∏_m (R ⊗_{A,ψ^m} A)[ζ_m][[q − ζ_m]] to the p-adic products, in E∞-A[q]-algebras or in ordinary rings, where it is a subring of the product. Mathlib's `RingHom.eqLocus` and `CommRingCat.equalizerForkIsLimit` supply the generic equaliser; the node instantiates it with can and φ/A. This is the presentation HabiroCohomologyFoundations HQ.3 and HQ.5 and HabiroNumberFields HB.6 use.
- **The untwisted cases.** When R carries Adams operations compatible with A's whose linearisations are isomorphisms — R = A, the toric and free Λ-rings, ℤ[1/N] — H_{R/A} is the ordinary cyclotomic completion R[q]^ℕ of HC.1. This is the positive side of Remark 2.8.
- **Completed base change.** Along a map of perfectly covered Λ-rings, H_{R/A} ⊗^L A′ becomes H_{R′/A′} after Habiro completion, and the completion is needed: for A = R = ℤ and A′ = ℤ[x] toric, H[x] is a proper subring of ℤ[x][q]^ℕ. The source states no base change; the node derives it from Theorem 2.9 and q-Witt Lemma 2.46.

The first packet's gap 'The companion q-Witt paper is obtained but HR.1 and HR.4 do not yet decompose it', which its HR.5 coverage note mentions, is no longer among its gaps: the review decomposed the companion paper into HR.4's nodes, and Lemma 2.46 is part of `HR.4/relative-q-witt-rings`.

### The relative Habiro ring H_{R/A} as the limit of the glued rings H_{R/A,m}

`HR.5/the-relative-habiro-ring` · construction · planet “Relative Habiro ring” · first packet

Let A be a perfectly covered Λ-ring and R an étale A-algebra. For m ≥ 1 let H_{R/A,m} be the finite relative Habiro rings of HR.4/the-finite-relative-habiro-rings (2.7), glued by Corollary 2.4 from E_d = (R ⊗_{A,ψ^d} A)[q]^∧_{Φ_d(q)} (d | m), with their transition maps H_{R/A,m} → H_{R/A,d}, which deform the q-Witt Frobenii F_{m/d} (Remark 2.10) and are not restriction maps. The RELATIVE HABIRO RING is the limit H_{R/A} := lim_{m ≥ 1} H_{R/A,m} over N ordered by divisibility ((2.1)); because every H_{R/A,m} is static (Theorem 2.9), this is a limit of ordinary rings, and it may equally be taken over the cofinal chain {n!}_{n≥1} (footnote (2.1)). H_{R/A} is static (Theorem 2.9, via Corollary B.4 applied to the static quotients H_{R/A}/Φ_m(q)) and Habiro-complete (B.1); its completions are (H_{R/A})^∧_{(q^m−1)} ≃ H_{R/A,m} and (H_{R/A})^∧_{Φ_d(q)} ≃ (R ⊗_{A,ψ^d} A)[q]^∧_{Φ_d(q)}, so (H_{R/A})^∧_{(q−1)} ≃ R[[q−1]], and H_{R/A}/(q^m−1) ≃ q-W_m(R/A). It is functorial for morphisms of pairs (A,R) → (A',R') (HR.1), and it has the universal property of the limit: a map from a Habiro-complete A[q]-algebra B to H_{R/A} is a compatible family of maps B → H_{R/A,m}. Base change along maps of bases is the separate node HR.5/completed-base-change; no uncompleted tensor-product formula belongs to this interface.

**Hypotheses.**

- A is a perfectly covered Λ-ring (1.22(e)) and R is an étale A-algebra; the source defines H_{R/A} only for étale R (2.7).
- The limit is along the transition maps of HR.4/the-transitions-are-frobenius over N ordered by divisibility; the chain {n!} is cofinal, so the two limits agree canonically.
- Staticity of the limit comes from the detection result Corollary B.4 (HR.2/the-detection-results) applied to the static quotients H_{R/A}/Φ_m(q), not from exactness of completion.

**Construction.**

1. Assemble the H_{R/A,m} and the transition maps of HR.4 into an inverse system over (N, |); by Theorem 2.9 its terms are ordinary rings, so functoriality is checked by hand as footnote (2.1) allows; define H_{R/A} as the limit.
2. Cofinality: every m divides some n!, so restricting to {n!} induces an isomorphism of limits.
3. Completions: completion commutes with limits and (H_{R/A,n})^∧_{(q^m−1)} ≃ H_{R/A,m} for m | n by Corollary 2.4 (HR.3/the-complete-descent-corollary), so (H_{R/A})^∧_{(q^m−1)} ≃ H_{R/A,m}; completing at Φ_d(q) gives E_d, and for d = 1, E_1 = R[q]^∧_{(q−1)} = R[[q−1]].
4. Habiro-completeness and staticity: HR.4/the-limit-of-the-finite-stages-is-static (the limit of Habiro-complete objects is Habiro-complete, and Corollary B.4 applies to the static quotients H_{R/A}/Φ_m(q)).
5. Quotients: H_{R/A}/(q^m−1) ≃ H_{R/A,m}/(q^m−1) ≃ q-W_m(R/A) by Theorem 2.9 (HR.4/the-etale-lift).
6. Functoriality: a morphism of pairs maps the data (E_d, h_d) compatibly (φ_{p/A} is natural by uniqueness of Frobenius lifts), hence gives maps H_{R/A,m} → H_{R'/A',m} by the morphism-level form of Corollary 2.4 (HR.3/the-morphism-level-statement), compatible with the transitions; pass to the limit.

**API.**

- `HabiroRings.relativeHabiro` (data): H_{R/A} = lim_m H_{R/A,m} for R étale over a perfectly covered Λ-ring A.
- `HabiroRings.relativeHabiro.proj` (projection): The maps π_m: H_{R/A} → H_{R/A,m}, compatible with the transition maps.
- `HabiroRings.relativeHabiro.ext` (extensionality): Two elements with the same projections π_m for all m are equal.
- `HabiroRings.relativeHabiro.lift` (universal-property): A compatible family of A[q]-algebra maps B → H_{R/A,m}, factors uniquely through H_{R/A}; π_m ∘ lift is the m-th map.
- `HabiroRings.relativeHabiro.factorialEquiv` (characterisation): The limit over the chain {n!} is canonically isomorphic to H_{R/A}.
- `HabiroRings.relativeHabiro.isStatic` (characterisation): H_{R/A} is static.
- `HabiroRings.relativeHabiro.isHabiroComplete` (characterisation): H_{R/A} is Habiro-complete in the sense of B.1.
- `HabiroRings.relativeHabiro.completionEquiv` (characterisation): (H_{R/A})^∧_{(q^m−1)} ≃ H_{R/A,m} for every m.
- `HabiroRings.relativeHabiro.cyclotomicCompletionEquiv` (characterisation): (H_{R/A})^∧_{Φ_d(q)} ≃ (R ⊗_{A,ψ^d} A)[q]^∧_{Φ_d(q)}; for d = 1 this is R[[q−1]].
- `HabiroRings.relativeHabiro.quotientEquiv` (compatibility): H_{R/A}/(q^m−1) ≃ q-W_m(R/A) (Theorem 2.9), under which the transition maps become the Frobenii F_{m/d} (Remark 2.10).
- `HabiroRings.relativeHabiro.map` (functoriality): The ring map H_{R/A} → H_{R'/A'} of a morphism of pairs, with map_id and map_comp.

**Unit tests.**

- `HabiroRings.relativeHabiro_zero` (degenerate): For R = 0, H_{0/A} = 0.
- `HabiroRings.relativeHabiro_self` (degenerate): For R = A, H_{A/A} ≅ A[q]^N = lim_m A[q]^∧_{(q^m−1)}; for A = ℤ this is Habiro's ring H (HabiroRings:HR.5/untwisted-relative-habiro-rings). A definition that completed q-adically or (q−1)-adically, or twisted E_d without the linearisation, fails.
- `HabiroRings.relativeHabiro_quotient_Phi4_gaussian` (computation): For A = ℤ and R = ℤ[i][1/2] (= O_F[1/disc F], F = Q(i)), H_{R/ℤ}/Φ_4(q) ≅ R[q]/(q²+1) ≅ R × R, because q² + 1 = (q − i)(q + i) and (q − i) − (q + i) = −2i is a unit; and H_{R/ℤ}/(q − 1) ≅ R. A definition adjoining ζ_4 through one embedding would give R instead of R × R.
- `HabiroRings.relativeHabiro_qMinusOne` (compatibility): (H_{R/A})^∧_{(q−1)} ≅ R[[q−1]], compatibly with the projection to H_{R/A,1}.
- `HabiroRings.relativeHabiro_quotient_qWitt` (compatibility): H_{R/A}/(q^m − 1) ≅ q-W_m(R/A); for A = R = ℤ this is ℤ[q]/(q^m − 1), by q-W_m(ℤ) ≅ ℤ[q]/(q^m − 1) (q-Witt v5 Corollary 2.37).
- `HabiroRings.relativeHabiro_not_localisation` (non-example): For A = R = ℤ, q − 1 is not a unit of H_{ℤ/ℤ}, since its image in (H_{ℤ/ℤ})^∧_{(q−1)} = ℤ[[q−1]] is not invertible; the construction completes and does not invert the q^m − 1.
- `HabiroRings.relativeHabiro_not_naive` (non-example): For R = ℤ[∛2][1/6], H_{R/ℤ,5} is not isomorphic to R[q]^∧_{(q^5−1)} as a ℤ[q]-algebra (HabiroRings:HR.7/the-stage-is-not-the-naive-completion).

**Acceptance.**

- H_{R/A} is an ordinary ring and is Habiro-complete.
- The limits over (N, |) and over {n!} agree.
- (H_{R/A})^∧_{(q^m−1)} ≃ H_{R/A,m}, (H_{R/A})^∧_{Φ_d(q)} ≃ (R ⊗_{A,ψ^d} A)[q]^∧_{Φ_d(q)} and H_{R/A}/(q^m−1) ≃ q-W_m(R/A).
- For R = A it is A[q]^N (HR.5/untwisted-relative-habiro-rings); in general it is not R[q]^N (HR.7/the-stage-is-not-the-naive-completion).

**Used by.**

- Wagner, Lemma 2.12 (HabiroRings:HR.5/the-equaliser-presentation): the ring presented as an equaliser; its Φ_d(q)-completions enter the rational step of the proof
- Wagner, Corollary 3.13 (HabiroRings:HR.6/the-degree-zero-identification): the target of the étale degree-zero identification
- Wagner, Example 3.12 (HabiroCohomologyFoundations:HQ.3/the-coordinate-model-and-the-etale-case): H_{S/A[x_1,…,x_n]} carries the scaling operators γ_i of the explicit Koszul model
- HabiroCohomologyFoundations:HQ.5/algebraic-habiro-cohomology-of-a-scheme: coefficients of algebraic Habiro cohomology in relative dimension zero
- HabiroRings:HR.5-number-field-comparison: for A = ℤ it is compared with Habiro's ring and with the GSWZ ring

**Depends on.** this roadmap: `HR.4/the-limit-of-the-finite-stages-is-static`, `HR.4/the-finite-relative-habiro-rings`, `HR.4/the-etale-lift`, `HR.4/the-transitions-are-frobenius`, `HR.3/the-complete-descent-corollary`, `HR.3/the-morphism-level-statement`, `HR.2/habiro-complete-modules`, `HR.2/the-detection-results`, `HR.1/morphisms-of-pairs`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, 2.7 (Relative Habiro rings), PDF p. 16: “For every d | m, let Ed := (R ⊗A,ψd A)[q]∧ Φd(q) and for every pd | m, where p is a prime, let the gluing equivalence hd be the A[q]-linear map induced by ϕp/A.” — The gluing data of H_{R/A,m}, literally.
- `Wagner.qHodgeHabiro.2025`, 2.7 with equation (2.1), PDF p. 16: “For all d | m, Corollary 2.4 provides a preferred equivalence HR/A,d ≃(HR/A,m)∧ (qd−1). In particular, we get maps HR/A,m ! HR/A,d. The Habiro ring of R relative to A is then defined as the limit(2.1) HR/A := lim m∈N HR/A,m .” — The transition maps and the definition of H_{R/A} as the limit.
- `Wagner.qHodgeHabiro.2025`, Footnote (2.1) to 2.7, PDF p. 16: “Alternatively, we can take the limit over the sequential subdiagram {n!}n⩾1, where the existence of maps is enough.” — The factorial subdiagram, which computes the same limit.
- `Wagner.qHodgeHabiro.2025`, Theorem 2.9, PDF p. 16: “In particular, HR/A,m is an ordinary ring for all m ∈N, and the same is true for the relative Habiro ring HR/A.” — Staticity of every stage and of the limit.
- `Wagner.qHodgeHabiro.2025`, Proof of Theorem 2.9, PDF p. 17: “To conclude the same for HR/A, we’ve seen above that HR/A/Φm(q) is static for all m ∈N. Then Corollary B.4 can be applied.” — The staticity of the limit via Corollary B.4.
- `Wagner.qHodgeHabiro.2025`, Proof of Lemma 2.12 (rationalised step), PDF p. 18: “By 2.7, the Φd(q)-completion of HR/A is (R ⊗A,ψd A)[q]∧ Φd(q)” — The Φ_d(q)-completion of H_{R/A}, used here as an API item.

### Compatible roots of unity and the canonical and Frobenius re-expansion maps

`HR.5/roots-choices-and-substitutions` · construction · first packet

Fix a COMPATIBLE SYSTEM of roots of unity (ζ_m)_{m ≥ 1} in ℂ: ζ_m is a primitive m-th root of unity, ζ_{mn} = ζ_mζ_n for coprime m, n, and ζ_{p^α} = (ζ_{p^{α+1}})^p (2.11); the standard choice is ζ_m := ∏_p e^{2πi/p^{v_p(m)}}. Let A be a perfectly covered Λ-ring and R an étale A-algebra. The coefficient algebra at m is the FULL tensor product (R ⊗_{A,ψ^m} A)[ζ_m] := (R ⊗_{A,ψ^m} A) ⊗_ℤ ℤ[ζ_m], never a quotient of it through one embedding of ζ_m. Put T_m := (R ⊗_{A,ψ^m} A)[ζ_m][[q − ζ_m]] and T_{p,m} := (R̂_p ⊗_{A,ψ^m} A)^∧_p[ζ_{pm}][[q − ζ_m]] for primes p. Since ζ_m/ζ_{pm} has p-power order, ζ_m − ζ_{pm} is topologically nilpotent in the p-complete coefficient ring of T_{p,m}. The CANONICAL MAP can_{p,m}: T_m → T_{p,m} is extension of coefficients, keeping the variable q − ζ_m. The FROBENIUS φ_{p,m}: T_{pm} → T_{p,m} applies φ_{p/A} ⊗ id to the coefficients, through R ⊗_{A,ψ^{pm}} A = (R ⊗_{A,ψ^p} A) ⊗_{A,ψ^m} A, and then re-expands a series in q − ζ_{pm} as a series in q − ζ_m by q − ζ_{pm} = (q − ζ_m) + (ζ_m − ζ_{pm}). The TAYLOR COMPONENT τ_m: (R ⊗_{A,ψ^m} A)[q]^∧_{Φ_m(q)} → T_m is q ↦ ζ_m + (q − ζ_m). Replacing the system by (ζ_m^a) for a ∈ Ẑ^× changes can, φ and τ by the coefficient automorphisms σ_a of the ℤ[ζ_k]; the compatible systems form a Ẑ^×-torsor.

**Hypotheses.**

- The system satisfies the two conditions of 2.11; the traditional e^{2πi/m} does not, and with it the re-expansion from order 6 to order 3 fails (e^{2πi/6} − e^{2πi/3} = 1 is a unit).
- The coefficient algebras are the full tensor products with ℤ[ζ_m] and ℤ[ζ_{pm}]; no p-adic root embedding is selected.
- Re-expansion is defined only after p-completion, by topological nilpotence of ζ_m − ζ_{pm} (HC.3), never as a formal substitution of a non-zero constant.

**Construction.**

1. Check the two conditions for ζ_m := ∏_p e^{2πi/p^{v_p(m)}}.
2. Topological nilpotence: (ζ_{pm} − ζ_m)^{p^e} ∈ p·ℤ[ζ_{pm}] because the ratio has p-power order (HabiroCyclotomicCompletions:HC.3/p-adic-closeness-of-roots).
3. Define can_{p,m} by extension of coefficients along (R ⊗_{A,ψ^m} A)[ζ_m] → (R̂_p ⊗_{A,ψ^m} A)^∧_p[ζ_{pm}].
4. Define φ_{p,m} as φ_{p/A} ⊗ id on coefficients (HabiroRings:HR.1/the-etale-frobenius-lift) followed by the re-expansion rex_{ζ_m − ζ_{pm}} of HabiroCyclotomicCompletions:HC.3/p-adic-re-expansion.
5. Define τ_m; it is continuous because Φ_m(q) maps into the ideal (q − ζ_m); for A = R = ℤ it is HC.3's Taylor map composed with the completion map (HabiroCyclotomicCompletions:HC.3/the-taylor-map).
6. Change of choice: a compatible system is a choice of generator of each ℤ_p(1), so the systems form a Ẑ^×-torsor; σ_a acts on the ℤ[ζ_k] tensor factor only, sends q − ζ_k to q − ζ_k^a, commutes with φ_{p/A} ⊗ id (which acts on the other factor) and sends the shift ζ_m − ζ_{pm} to ζ_m^a − ζ_{pm}^a, so it intertwines can, φ and τ for the two systems.

**API.**

- `HabiroRings.CompatibleRoots` (structure): A family (ζ_m)_{m ≥ 1} of primitive m-th roots of unity in ℂ with ζ_{mn} = ζ_mζ_n for coprime m, n and ζ_{p^α} = ζ_{p^{α+1}}^p.
- `HabiroRings.CompatibleRoots.standard` (constructor): ζ_m := ∏_p e^{2πi/p^{v_p(m)}}.
- `HabiroRings.coeffAlgebra` (data): (R ⊗_{A,ψ^m} A)[ζ_m] := (R ⊗_{A,ψ^m} A) ⊗_ℤ ℤ[ζ_m] ≅ (R ⊗_{A,ψ^m} A)[x]/Φ_m(x).
- `HabiroRings.taylorFactor` (data): T_m := coeffAlgebra_m[[q − ζ_m]] and T_{p,m} := (R̂_p ⊗_{A,ψ^m} A)^∧_p[ζ_{pm}][[q − ζ_m]].
- `HabiroRings.canonicalMap` (data): can_{p,m}: T_m → T_{p,m}, extension of coefficients with the variable kept.
- `HabiroRings.frobeniusMap` (data): φ_{p,m}: T_{pm} → T_{p,m}, φ_{p/A} ⊗ id on coefficients followed by rex_{ζ_m − ζ_{pm}}.
- `HabiroRings.taylorComponent` (projection): τ_m: (R ⊗_{A,ψ^m} A)[q]^∧_{Φ_m(q)} → T_m, q ↦ ζ_m + (q − ζ_m); its constant coefficient is evaluation at ζ_m.
- `HabiroRings.CompatibleRoots.sub_topologicallyNilpotent` (characterisation): ζ_m − ζ_{pm} is topologically nilpotent in the p-complete coefficient ring of T_{p,m}.
- `HabiroRings.frobeniusMap_int` (compatibility): For A = R = ℤ, φ_{p,m} is HC.3's rex_{ζ_m − ζ_{pm}} after extension of coefficients.
- `HabiroRings.CompatibleRoots.galoisEquiv` (equivalence): For two compatible systems of roots ζ and ζ′ the coefficient algebras T_m(ζ) and T_m(ζ′), and T_{p,m}, are the same embedding-free algebra (R ⊗_{A,ψ^m} A)[x]/Φ_m(x), and can, φ and τ agree for ζ and ζ′: they do not depend on the compatible system. (Ẑ^× is in neither library; the action of a ∈ Ẑ^× is the identity on this algebra.)

**Unit tests.**

- `HabiroRings.CompatibleRoots.standard_two_adic` (non-example): For the standard system ζ_6 = ζ_2ζ_3 = −ζ_3, so ζ_3 − ζ_6 = 2ζ_3 has positive 2-adic valuation, whereas e^{2πi/3} − e^{2πi/6} = −1 is a unit; with the traditional roots there is no 2-adic re-expansion from order 6 to order 3.
- `HabiroRings.taylorComponent_value_ne_expansion` (computation): In H_{ℤ/ℤ}, f = 1 − q³ and 0 have the same value 0 at ζ_3, but τ_3(f) = −3ζ_3²X − 3ζ_3X² − X³ ≠ 0 with X = q − ζ_3; the value at one root does not determine the Taylor expansion there.
- `HabiroRings.coeffAlgebra_gaussian` (non-example): For A = ℤ, R = ℤ[i][1/2] and m = 4, coeffAlgebra_4 = R ⊗_ℤ ℤ[i] ≅ R × R; e = (1⊗1 − i⊗i)/2 is an idempotent sent to 1 by the embedding ζ_4 ↦ i and to 0 by ζ_4 ↦ −i, so choosing one embedding loses a factor.
- `HabiroRings.frobeniusMap_int_example` (computation): For A = R = ℤ, p = 2, m = 1: φ_{2,1} sends q + 1 = q − ζ_2 ∈ ℤ[[q − ζ_2]] to (q − 1) + 2 ∈ ℤ_2[[q − 1]], and can_{2,1} is the inclusion ℤ[[q − 1]] ⊂ ℤ_2[[q − 1]].
- `HabiroRings.CompatibleRoots.galoisEquiv_neg_one` (characterisation): For a = −1, σ_{−1} ∘ can = can ∘ σ_{−1}, σ_{−1} ∘ φ = φ ∘ σ_{−1}, and σ_{−1} ∘ τ_m for (ζ) is τ_m for (ζ^{−1}).
- `HabiroRings.rex_needs_completion` (non-example): The re-expansion of Σ_k (q − 1)^k at ζ_3 would have constant coefficient Σ_k (ζ_3 − 1)^k, which has no meaning in the discrete ring ℤ[ζ_3] and converges in ℤ_3[ζ_3] because (1 − ζ_3)² = −3ζ_3.

**Acceptance.**

- can keeps the variable q − ζ_m; only the Frobenius re-expands.
- Changing the roots by a ∈ Ẑ^× changes can, φ and τ by σ_a, so the equaliser of Lemma 2.12 does not depend on the choice up to the unique isomorphism compatible with the maps from H_{R/A}.
- For A = R = ℤ, φ_{p,m} is the re-expansion ℤ[ζ_{pm}][[q − ζ_{pm}]] → ℤ_p[ζ_{pm}][[q − ζ_m]] of Remark 2.14.
- Re-expansion is not defined before p-completion.

**Used by.**

- Wagner, Lemma 2.12 (HabiroRings:HR.5/the-equaliser-presentation): the two arrows of the equaliser and the Taylor components
- Wagner, Remark 2.14 and Corollary 2.13 (HabiroRings:HR.5-number-field-comparison): the same compatible system as GSWZ's convention (7) and the same re-expansions
- Wagner, Example 3.12 (HabiroCohomologyFoundations:HQ.3/the-coordinate-model-and-the-etale-case): the operators γ_i are extended to each factor T_m
- HR.7 acceptance tests: the value at one root against the full Taylor expansion there

**Depends on.** this roadmap: `HR.1/the-etale-frobenius-lift`; other roadmaps: `HabiroCyclotomicCompletions:HC.3/p-adic-closeness-of-roots`, `HabiroCyclotomicCompletions:HC.3/p-adic-re-expansion`, `HabiroCyclotomicCompletions:HC.3/the-taylor-map`; libraries: `mathlib:IsPrimitiveRoot`, `mathlib:Polynomial.cyclotomic`, `mathlib:PowerSeries`, `mathlib:PadicInt`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, 2.11 (p-adic reexpansions around roots of unity), PDF p. 17: “In the following, we choose a system of roots of unity (ζm)m∈N in such a way that ζmn = ζmζn if (m, n) = 1” — The compatible system; the text layer drops the exponent in the second condition, which reads ζ_{p^α} = ζ_{p^{α+1}}^p in the TeX.
- `Wagner.qHodgeHabiro.2025`, 2.11, PDF p. 17: “they ensure vp(ζm −ζmp) > 0 whenever p is prime, so that after p-completion, any power series in (q −ζm) can be reexpanded as power series in (q −ζpm).” — Topological nilpotence of ζ_m − ζ_{pm} and the re-expansion after p-completion.
- `Wagner.qHodgeHabiro.2025`, 2.11, PDF p. 17: “where the map on the right is induced by the relative Frobenius ϕp/A from 2.7, followed by a reexpansion of power series as above. We’ll call the map on the left the canonical map and the map on the right the Frobenius.” — The two maps and their names; the canonical map is the left arrow of the zigzag, with no re-expansion.

### Taylor expansion identifies the (ℓ, Φ_m)-adic and the rational Φ_m-adic completions

`HR.5/the-ell-adic-taylor-comparison` · lemma · first packet · added by REV-HabiroRings

Let m ≥ 1. (a) For every prime ℓ ∤ m the map ℤ_ℓ[q]^∧_{(ℓ,Φ_m(q))} → ℤ_ℓ[ζ_m][[q − ζ_m]], q ↦ ζ_m + (q − ζ_m), where ℤ_ℓ[ζ_m] := ℤ_ℓ ⊗_ℤ ℤ[ζ_m] ≅ ℤ_ℓ[x]/Φ_m(x), is an isomorphism. Modulo (ℓ, Φ_m(q)) both sides are 𝔽_ℓ[q]/Φ_m(q), which is finite étale over 𝔽_ℓ because Φ_m is separable over 𝔽_ℓ; it is a product of φ(m)/f copies of 𝔽_{ℓ^f}, f the order of ℓ in (ℤ/m)^×, and it is a field only when ℓ generates (ℤ/m)^×. (b) Componentwise: if Φ_m ≡ g_1⋯g_r (mod ℓ) with distinct monic irreducible g_i and Φ_m = G_1⋯G_r is the Hensel lift over ℤ_ℓ, the isomorphism of (a) is the product over i of the isomorphisms ℤ_ℓ[q]^∧_{(ℓ,G_i(q))} ≅ (ℤ_ℓ[x]/G_i)[[q − x_i]] (x_i the class of x), under the idempotent decomposition ℤ_ℓ[ζ_m] ≅ ∏_i ℤ_ℓ[x]/G_i. (c) The map Q[q]^∧_{Φ_m(q)} → Q(ζ_m)[[q − ζ_m]] is an isomorphism.

**Hypotheses.**

- ℓ does not divide m in (a) and (b); irreducibility of Φ_m modulo ℓ is neither assumed nor true in general (Φ_5 over 𝔽_11; Φ_8 = q⁴ + 1 modulo every odd prime).
- ℤ_ℓ[ζ_m] is the full algebra ℤ_ℓ ⊗_ℤ ℤ[ζ_m], in general a product of unramified extensions of ℤ_ℓ, not one local field.
- In (c) the coefficients are rational, where Φ_m is irreducible.

**Proof.**

1. Separability: Φ_m divides q^m − 1 (mathlib:Polynomial.cyclotomic.dvd_X_pow_sub_one) and is separable over any field in which m ≠ 0 (mathlib:Polynomial.separable_cyclotomic).
2. Unit: differentiating q^m − 1 = Φ_m(q)g(q) at ζ_m gives mζ_m^{m−1} = Φ_m'(ζ_m)g(ζ_m), so Φ_m'(ζ_m) is a unit of ℤ_ℓ[ζ_m]; hence Φ_m(q) = (q − ζ_m)u(q) with u a unit of ℤ_ℓ[ζ_m][[q − ζ_m]], and the (ℓ, Φ_m(q))- and (ℓ, q − ζ_m)-adic topologies on the target coincide.
3. Both sides are ℓ-torsion free and complete for these topologies; modulo (ℓ, Φ_m(q)) the map is q ↦ ζ_m: 𝔽_ℓ[q]/Φ_m(q) → 𝔽_ℓ[ζ_m] = 𝔽_ℓ[x]/Φ_m(x), an isomorphism; conclude by completeness (the derived Nakayama argument of 1.22(d)).
4. The factors of 𝔽_ℓ[q]/Φ_m(q) correspond to the orbits of multiplication by ℓ on (ℤ/m)^×, each of size f.
5. (b): the g_i are pairwise coprime and lift by Hensel's lemma to pairwise comaximal G_i; apply the Chinese remainder theorem (mathlib:Ideal.quotientInfRingEquivPiQuotient) to ℤ_ℓ[x]/Φ_m and to the completions, and step 3 to each factor.
6. (c): the same argument over ℚ, using mathlib:Polynomial.cyclotomic.irreducible_rat.

**Acceptance.**

- Φ_5 over 𝔽_11: 𝔽_11[q]/Φ_5 ≅ 𝔽_11^4 and ℤ_11[q]^∧_{(11,Φ_5)} ≅ ∏_{i=1}^4 ℤ_11[[q − ω_i]] (HabiroRings:HR.7/phi-five-over-f-eleven).
- Φ_8 over F_3: q⁴ + 1 ≡ (q² + q + 2)(q² + 2q + 2), so F_3[q]/Φ_8 ≅ F_9 × F_9, and (a) and (b) hold there.
- This lemma replaces the p. 18 proof line of Lemma 2.12; the conclusion of Lemma 2.12 is unaffected.

**Depends on.** libraries: `mathlib:Polynomial.separable_cyclotomic`, `mathlib:Polynomial.cyclotomic.dvd_X_pow_sub_one`, `mathlib:Polynomial.cyclotomic.irreducible_rat`, `mathlib:Ideal.quotientInfRingEquivPiQuotient`, `mathlib:PadicInt`, `mathlib:IsAdicComplete`, `mathlib:PowerSeries`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Proof of Lemma 2.12 (ℓ-adic step), PDF p. 18: “So it will be enough to show that Zℓ[q]∧ (ℓ,Φm(q)) ! Zℓ[ζm]Jq −ζmK is an equivalence whenever (m, ℓ) = 1.” — Statement (a), to which the source reduces the ℓ-adic step.
- `Wagner.qHodgeHabiro.2025`, Proof of Lemma 2.12 (ℓ-adic step), PDF p. 18: “The left-hand side clearly becomes Fℓ[q]/Φm(q) ≃Fℓ(ζm) since the cyclotomic polynomial Φm(q) is irreducible in Fℓ[q] if (m, ℓ) = 1.” — The printed justification, false as stated (sourceIssues); (a) is proved here by separability instead.
- `Wagner.qHodgeHabiro.2025`, Proof of Lemma 2.12 (rationalised step), PDF p. 18: “Here we use that Q[q]∧ Φd(q) ! Q(ζm)Jq −ζmK is an equivalence. Indeed, this can be checked modulo Φm(q).” — Statement (c); the source prints ζ_m and Φ_m for ζ_d and Φ_d here.

### The equaliser presentation of H_{R/A} by compatible cyclotomic Taylor series (Lemma 2.12)

`HR.5/the-equaliser-presentation` · theorem · planet “Equaliser presentation of the relative Habiro ring” · first packet

Let A be a perfectly covered Λ-ring, R an étale A-algebra and (ζ_m) the compatible system of HabiroRings:HR.5/roots-choices-and-substitutions. The Taylor components τ_m, composed with the completions H_{R/A} → (R ⊗_{A,ψ^m} A)[q]^∧_{Φ_m(q)}, give a map H_{R/A} → ∏_{m ≥ 1} (R ⊗_{A,ψ^m} A)[ζ_m][[q − ζ_m]], and it identifies H_{R/A} with the EQUALISER of can, φ/A: ∏_m (R ⊗_{A,ψ^m} A)[ζ_m][[q − ζ_m]] ⇉ ∏_{p,m} (R̂_p ⊗_{A,ψ^m} A)^∧_p[ζ_{pm}][[q − ζ_m]] (p over all primes), whose (p,m)-component is can_{p,m} on the factor m, respectively φ_{p,m} on the factor pm (Lemma 2.12). The equaliser may be taken in E∞-A[q]-algebras or in ordinary A[q]-algebras; in ordinary rings it is the subring of the product on which the two ring maps agree. The canonical arrow is extension of coefficients in the variable q − ζ_m; the Frobenius arrow is the relative Frobenius on coefficients followed by re-expansion from q − ζ_{pm} to q − ζ_m.

**Hypotheses.**

- A is perfectly covered and R is étale over A; the roots are the compatible system of 2.11 and the coefficient algebras are the full tensor products with ℤ[ζ_m] and ℤ[ζ_{pm}].
- The arrows are exactly can and φ/A of 2.11: the canonical arrow does not re-expand, and φ/A is φ_{p/A} followed by re-expansion, not either alone.
- The comparison is checked after ℓ-completion for every prime ℓ and after rationalised Φ_d(q)-completion for every d; this suffices because both sides are Habiro-complete (B.1, Lemma B.3).

**Proof.**

1. By construction (Corollary 2.4 and 2.7), H_{R/A} is an equaliser of the same shape with the factors (R ⊗_{A,ψ^m} A)[q]^∧_{Φ_m(q)} in place of the power-series factors; the Taylor components give a map of underived equalisers, hence H_{R/A} → π_0(E) for the derived equaliser E, and since H_{R/A} is static and E is coconnective, a map H_{R/A} → E (HabiroRings:HR.3/the-complete-descent-corollary, HabiroRings:HR.5/the-relative-habiro-ring).
2. Both sides are Habiro-complete; by Lemma B.3 for the cofibre, together with the arithmetic fracture square, it suffices to check after (−)^∧_ℓ for all primes ℓ and after (− ⊗_ℤ ℚ)^∧_{Φ_d(q)} for all d (HabiroRings:HR.2/the-detection-results).
3. After ℓ-completion the factors with p ≠ ℓ vanish, the ℓ-adic Frobenii become equivalences, and the map becomes the product over (m, ℓ) = 1 of base changes of ℤ_ℓ[q]^∧_{(ℓ,Φ_m(q))} → ℤ_ℓ[ζ_m][[q − ζ_m]], an isomorphism by HabiroRings:HR.5/the-ell-adic-taylor-comparison (a). The printed justification of this step by irreducibility of Φ_m modulo ℓ is false and is replaced by that lemma (sourceIssues).
4. After rationalised Φ_d(q)-completion: (H_{R/A})^∧_{Φ_d(q)} = (R ⊗_{A,ψ^d} A)[q]^∧_{Φ_d(q)} and Q[q]^∧_{Φ_d(q)} ≅ Q(ζ_d)[[q − ζ_d]] (HabiroRings:HR.5/the-ell-adic-taylor-comparison (c)); only factors with m/d a prime power survive, and Ê_{Φ_d(q)} is the pullback of (R ⊗_{A,ψ^d} A)[ζ_d][[q − ζ_d]] and ∏_p (R̂_p ⊗_{A,ψ^{d_p}} A)^∧_p[ζ_{d_p}][[q − ζ_{d_p}]] over ∏_p (R̂_p ⊗_{A,ψ^{d_p}} A)^∧_p[ζ_d][[q − ζ_{d_p}]] along (φ_{p/A}^{v_p(d)})_p, where d = p^{v_p(d)}d_p; the bottom arrow is split injective because ℤ[ζ_{d_p}] → ℤ[ζ_d] is, and becomes an equivalence rationally, so (E ⊗ ℚ)^∧_{Φ_d(q)} ≃ ((R ⊗_{A,ψ^d} A) ⊗_ℤ Q(ζ_d))[[q − ζ_d]]. The source prints ζ_m, Φ_m and ψ^m for ζ_d, Φ_d and ψ^d in this step (sourceIssues).
5. In ordinary rings the equaliser is mathlib:RingHom.eqLocus of the two ring maps, with the universal property mathlib:CommRingCat.equalizerForkIsLimit; this is the generic equaliser that the HR.7 stage text mentions, instantiated with can and φ/A.

**Acceptance.**

- H_{R/A} ≅ eq(can, φ/A) as rings and as E∞-A[q]-algebras.
- For A = R = ℤ it is Remark 2.14 (HabiroRings:HR.5-number-field-comparison/the-classical-ring).
- The ℓ-adic step holds when Φ_m splits modulo ℓ (HabiroRings:HR.7/phi-five-over-f-eleven).
- An element is a family of Taylor series, one at each ζ_m, whose expansions agree p-adically after the Frobenius twist, which is the source's reading after Remark 2.14.

**Depends on.** this roadmap: `HR.5/the-relative-habiro-ring`, `HR.5/roots-choices-and-substitutions`, `HR.5/the-ell-adic-taylor-comparison`, `HR.3/the-complete-descent-corollary`, `HR.2/the-detection-results`, `HR.1/the-etale-frobenius-lift`; libraries: `mathlib:RingHom.eqLocus`, `mathlib:CommRingCat.equalizerForkIsLimit`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Lemma 2.12, PDF p. 18: “2.12. Lemma. — The ring HR/A agrees with following equaliser (which can be taken both in E∞-A[q]-algebras or in ordinary A[q]-algebras):” — The statement, including the two categories in which the equaliser may be taken.
- `Wagner.qHodgeHabiro.2025`, Lemma 2.12, PDF p. 18: “Here can and ϕ/A are the canonical maps and Frobenius maps described in 2.11.” — The two arrows are those of 2.11.
- `Wagner.qHodgeHabiro.2025`, Proof of Lemma 2.12, PDF p. 18: “By construction, HR/A can be written as a similar equaliser, with (R ⊗A,ψm A)[ζm]Jq −ζmK replaced by (R ⊗A,ψm A)[q]∧ Φm(q).” — The comparison map from the construction.
- `Wagner.qHodgeHabiro.2025`, Proof of Lemma 2.12, PDF p. 18: “Since both sides are Habiro-complete in the sense of B.1, whether this map is an equivalence can be checked after (−)∧ ℓfor all primes ℓand after (−⊗Z Q)∧ Φd(q) for all d ∈N.” — The two families of completions after which the map is checked.

### Relative Habiro rings without Frobenius twist: R = A, toric bases and ℤ[1/N]

`HR.5/untwisted-relative-habiro-rings` · theorem · first packet · added by REV-HabiroRings

Let A be a perfectly covered Λ-ring and R an étale A-algebra with ring endomorphisms ψ^m_R (m ≥ 1) extending the Adams operations of A, with ψ^1_R = id and ψ^{mn}_R = ψ^m_R ψ^n_R, each ψ^p_R congruent to the Frobenius modulo p, and each linearisation R ⊗_{A,ψ^m} A → R, r ⊗ a ↦ ψ^m_R(r)a, an isomorphism. Then H_{R/A,m} ≅ R[q]^∧_{(q^m−1)} for every m, compatibly with the transition maps (which become the completion maps), and H_{R/A} ≅ lim_m R[q]^∧_{(q^m−1)} = R[q]^N, the cyclotomic completion of HabiroCyclotomicCompletions HC.1. The hypotheses hold for R = A with ψ_R = ψ_A, for every perfectly covered A, in particular A = ℤ, the free Λ-rings and the toric Λ-rings ℤ[x_i | i ∈ I] with ψ^m(x_i) = x_i^m; and for A = ℤ and R = ℤ[1/N], N ≥ 1.

**Hypotheses.**

- R is étale over the perfectly covered Λ-ring A and carries global compatible Frobenius lifts ψ^m_R, the condition Remark 2.8 names; for general étale R no such family exists (HabiroRings:HR.7/the-stage-is-not-the-naive-completion).
- The linearisations R ⊗_{A,ψ^m} A → R are isomorphisms; this is automatic for R = A, and for A = ℤ all ψ^m are the identity.
- R[q]^N is HC.1's completion, identified with lim_m R[q]^∧_{(q^m−1)} by cofinality.

**Proof.**

1. By uniqueness of Frobenius lifts on the p-completion of an étale algebra (HabiroRings:HR.1/the-etale-frobenius-lift) the p-completion of ψ^p_R is φ_p; so the linearisations identify E_d = (R ⊗_{A,ψ^d} A)[q]^∧_{Φ_d(q)} with R[q]^∧_{Φ_d(q)}, and, writing R ⊗_{A,ψ^{pd}} A = (R ⊗_{A,ψ^p} A) ⊗_{A,ψ^d} A, each gluing map h_d becomes the identity of R[q]^∧_{(p,Φ_d(q))} (the ideals (p, Φ_{pd}(q)) and (p, Φ_d(q)) have the same radical).
2. R[q]^∧_{(q^m−1)} is the (q^m−1)-complete algebra with Φ_d(q)-completions R[q]^∧_{Φ_d(q)} and identity gluings (Remark 2.8), so by the uniqueness in Corollary 2.4 (HabiroRings:HR.3/the-complete-descent-corollary) it is H_{R/A,m}, and the preferred equivalences for d | m are the completion maps.
3. Pass to the limit and apply HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products.
4. Examples: for R = A the linearisation a ⊗ b ↦ ψ^m(a)b is an isomorphism A ⊗_{A,ψ^m} A ≅ A; toric and free Λ-rings are perfectly covered by 1.22(e); ℤ[1/N] is étale over ℤ (mathlib:Algebra.Etale.of_isLocalizationAway) and all ψ are the identity.

**Acceptance.**

- H_{ℤ/ℤ} ≅ H = lim_m ℤ[q]^∧_{(q^m−1)}, used by HabiroRings:HR.5-number-field-comparison/the-classical-ring.
- For the toric base A = ℤ[x], H_{A/A} ≅ ℤ[x][q]^N, which contains Σ_N x^N (q;q)_N.
- For R = ℤ[1/p], H_{R/ℤ} ≅ ℤ[1/p][q]^N, decomposed into factors by HabiroCyclotomicCompletions HC.5 (HabiroRings:HR.7/inverting-a-prime).

**Depends on.** this roadmap: `HR.5/the-relative-habiro-ring`, `HR.3/the-complete-descent-corollary`, `HR.1/the-etale-frobenius-lift`; other roadmaps: `HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products`; libraries: `mathlib:Algebra.Etale.of_isLocalizationAway`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Remark 2.8, PDF p. 16: “If we were to construct R[q]∧ (qm−1) using Corollary 2.4, we would take Ed := R[q]∧ Φd(q), together with the identity maps on R[q]∧ (p,Φd(q)) (instead of ϕp/A) as gluing equivalences.” — The description of R[q]^∧_{(q^m−1)} by Corollary 2.4 with identity gluings; this node is the positive case of the remark, which the source does not state as a theorem.
- `Wagner.qHodgeHabiro.2025`, Remark 2.8, PDF p. 16: “Thus, there’s no reason to expect that HR/A,m ≃R[q]∧ (qm−1), unless R itself (rather than only its p-completions) admits Frobenius lifts for all prime factors p | m.” — The source's condition: global Frobenius lifts on R itself.
- `Wagner.qHodgeHabiro.2025`, 1.22(e), PDF p. 12: “it holds for Z, for any free Λ-ring Z{xi | i ∈I}, and for any polynomial ring Z[xi | i ∈I] equipped with the toric Λ-structure in which λn(xi) = 0 for all n > 1.” — Z, free Λ-rings and toric polynomial rings are perfectly covered.

### Base change of relative Habiro rings along maps of bases, with completion

`HR.5/completed-base-change` · theorem · first packet · added by REV-HabiroRings

Let A → A' be a map of perfectly covered Λ-rings, R an étale A-algebra and R' := R ⊗_A A', étale over A'. The maps induced by the morphism of pairs (A,R) → (A',R') give equivalences (H_{R/A,m} ⊗^L_{A[q]} A'[q])^∧_{(q^m−1)} ≃ H_{R'/A',m} for every m and (H_{R/A} ⊗^L_{A[q]} A'[q])^∧_H ≃ H_{R'/A'}, (−)^∧_H being Habiro completion (Appendix B). The derived tensor product is the ordinary one when A' is flat over A, but the completion is always needed: for A = R = ℤ and A' = ℤ[x] with the toric Λ-structure, H ⊗_ℤ ℤ[x] = H[x] is a proper subring of H_{ℤ[x]/ℤ[x]} ≅ ℤ[x][q]^N.

**Hypotheses.**

- A → A' is a map of Λ-rings between perfectly covered Λ-rings and R' is exactly R ⊗_A A'; nothing is claimed for other morphisms of pairs.
- Tensor products are derived and followed by (q^m−1)-completion, respectively Habiro completion; no uncompleted formula is asserted.
- The source has no base-change theorem for H_{R/A}; this node derives one from Theorem 2.9 and q-Witt v5 Lemma 2.46, as the HR.5 stage text requires.

**Proof.**

1. Functoriality of HabiroRings:HR.5/the-relative-habiro-ring for the morphism of pairs (HabiroRings:HR.1/morphisms-of-pairs) gives A'[q]-linear maps from the completed base changes to H_{R'/A',m}.
2. Both sides are (q^m−1)-complete, so it suffices to check modulo q^m − 1 (1.22(d)).
3. Modulo q^m − 1 the left side is q-W_m(R/A) ⊗^L_A A' (Theorem 2.9, HabiroRings:HR.4/the-etale-lift, and A[q]/(q^m−1) ⊗_A A' = A'[q]/(q^m−1)); q-W_m(R/A) is étale over A[q]/(q^m−1), which is free over A, so the derived tensor product is the ordinary one, and q-Witt v5 Lemma 2.46 (HabiroRings:HR.4/relative-q-witt-rings; see the gaps) identifies it with q-W_m(R'/A') = H_{R'/A',m}/(q^m−1).
4. Pass to the limit over m, using (M)^∧_H = lim_m M^∧_{(q^m−1)} (HabiroRings:HR.2/habiro-complete-modules) and (H_{R/A} ⊗^L A'[q])^∧_{(q^m−1)} ≃ (H_{R/A,m} ⊗^L A'[q])^∧_{(q^m−1)}.
5. Non-example: H_{ℤ[x]/ℤ[x]} ≅ ℤ[x][q]^N (HabiroRings:HR.5/untwisted-relative-habiro-rings) contains Σ_N x^N (q;q)_N, whose x^N-coefficients (q;q)_N ∈ H are all non-zero, so it is not in H[x].

**Acceptance.**

- The base change holds with derived tensor product and completion, for R' = R ⊗_A A'.
- H ⊗_ℤ ℤ[x] is a proper subring of H_{ℤ[x]/ℤ[x]}.
- Reduced modulo q^m − 1 the statement is q-Witt v5 Lemma 2.46.

**Depends on.** this roadmap: `HR.5/the-relative-habiro-ring`, `HR.5/untwisted-relative-habiro-rings`, `HR.4/the-etale-lift`, `HR.4/relative-q-witt-rings`, `HR.1/morphisms-of-pairs`, `HR.2/habiro-complete-modules`.

**Sources.**

- `Wagner.qWitt.2024`, q-Witt v5, Lemma 2.46, PDF p. 31: “2.46. Lemma. — If A ! A′ is a morphism of Λ-rings and R is an A-algebra, then for all m ∈N the canonical map is an isomorphism q9Wm(R/A) ⊗A A′ ∼ = −! q9Wm(R ⊗A A′/A′) .” — Base change of q-Witt rings along maps of Λ-rings, which is the statement modulo q^m − 1.
- `Wagner.qHodgeHabiro.2025`, Theorem 2.9, PDF p. 16: “2.9. Theorem. — Let A be a perfectly covered Λ-ring, R an A-algebra, and m ∈N. Then HR/A,m/(qm −1) ≃q9Wm(R/A) .” — The quotient identification used to reduce to q-Witt rings (the printed 'R an A-algebra' means étale, see sourceIssues).

## HR.5-number-field-comparison — Number-field comparison

*Coverage in `HabiroRings.json`: source_decomposed, 3 nodes.* 3 packet nodes at this stage. Three nodes from Remark 2.14 and Corollary 2.13 (PDF p. 19). Habiro's ring as H_{ℤ/ℤ}, with the Taylor presentation and the projections identified with HC.3's Taylor maps; the étaleness of O_F[1/Δ] over ℤ, which Corollary 2.13 uses without comment; and Corollary 2.13 with its exact hypothesis Δ = disc F, the extension to Δ divisible by disc F (GSWZ's and HB.6's generality) marked as not printed, the two gluing conditions matched, compatibility with HB.6's classical comparison, and no constant-family R-algebra structure (stage text: 'Do not impose a naive R-algebra structure'). HB.6's ring is imported, not re-planned; the §1.4 divisibility by 6 belongs to the regulator and to HB.7, as the stage text says ('later regulator/K₃ modules retain their stronger excluded-prime hypotheses'). Of the stage's 'HC.1–4', HC.1 and HC.3 are inputs, HC.2 is not used and HC.4 is a consistency check.

The sub-stage has three nodes, all in the first packet, from Remark 2.14 and Corollary 2.13 (PDF p. 19); it is `source_decomposed`.

- **Habiro's ring.** H_{ℤ/ℤ} ≅ ℤ[q]^ℕ, the ring of HabiroCyclotomicCompletions HC.1, and the equaliser presentation specialises to Habiro's ring as the ring of compatible Taylor families, with the m-th projection HC.3's Taylor map at ζ_m. HC.1 and HC.3 are inputs; HC.2 is not used, and HC.4 serves as a consistency check.
- **The étaleness of O_F[1/Δ].** For disc F | Δ, O_F[1/Δ] is étale over ℤ: it is finitely presented, flat over the Dedekind domain ℤ because torsion free, and unramified at every prime by Mathlib's discriminant criterion. Corollary 2.13 uses this without comment. ℤ_(p) is not étale over ℤ.
- **Corollary 2.13.** For R = O_F[1/disc F], H_{R/ℤ} is the GSWZ ring H_R of HabiroNumberFields HB.6, as ℤ[q]-algebras compatibly with the Taylor projections: R ⊗_{ℤ,ψ^m} ℤ = R, φ_{p/ℤ} is HB.6's Frobenius lift, the compatible roots are GSWZ's convention, and the gluing conditions agree. The extension to every Δ divisible by disc F, which is GSWZ's and HB.6's generality, is marked as not printed. H_{R/ℤ} carries no R-algebra structure through constant families (see `HR.7/constant-families-do-not-glue`).

RS-10 keeps the two owners apart: HB.6 constructs the explicit ring and compares it with Habiro's ring for F = ℚ, and this sub-stage proves the identification of the two constructions without making HB.6 depend on it. The divisibility of Δ by 6 that the regulator needs belongs to HB.7 and to HR.6.

### Habiro's ring as H_{ℤ/ℤ} and its Taylor presentation (Remark 2.14)

`HR.5-number-field-comparison/the-classical-ring` · theorem · first packet

For A = R = ℤ: (a) H_{ℤ/ℤ} ≅ H := lim_m ℤ[q]^∧_{(q^m−1)} (§1.1), which is ℤ[q]^N of HabiroCyclotomicCompletions HC.1; (b) H is the equaliser of can, φ/ℤ: ∏_m ℤ[ζ_m][[q − ζ_m]] ⇉ ∏_{p,m} ℤ_p[ζ_{pm}][[q − ζ_m]], where φ/ℤ is the re-expansion ℤ[ζ_{pm}][[q − ζ_{pm}]] → ℤ_p[ζ_{pm}][[q − ζ_m]] (φ_{p/ℤ} is the identity) (Remark 2.14); (c) under (a), the m-th projection of the equaliser is HC.3's Taylor map σ_{ζ_m}: ℤ[q]^N → ℤ[ζ_m][[q − ζ_m]].

**Hypotheses.**

- A = R = ℤ with the trivial Λ-structure; the roots are the compatible system of 2.11.
- Habiro's ring is HabiroCyclotomicCompletions' object (HC.1); it is compared here and not constructed again.
- The comparison is of rings and matches the projections with HC.3's Taylor maps; HC.4's single-root injectivity is not an input.

**Proof.**

1. Apply HabiroRings:HR.5/untwisted-relative-habiro-rings with R = A = ℤ: H_{ℤ/ℤ} ≅ lim_m ℤ[q]^∧_{(q^m−1)} ≅ ℤ[q]^N (HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products).
2. Specialise HabiroRings:HR.5/the-equaliser-presentation: Z ⊗_{ℤ,ψ^m} Z = Z, Ẑ_p = ℤ_p and φ_{p/ℤ} = id, so φ/ℤ is pure re-expansion.
3. Both the composite ℤ[q]^N → ℤ[q]^∧_{Φ_m(q)} → ℤ[ζ_m][[q − ζ_m]] and HC.3's σ_{ζ_m} (HabiroCyclotomicCompletions:HC.3/the-taylor-map) are continuous ring maps extending q ↦ ζ_m + (q − ζ_m) on ℤ[q], so they agree.

**Acceptance.**

- Remark 2.14 holds for Habiro's ring with the source's arrows.
- The projections are HC.3's Taylor maps; with HC.4's rootwise injectivity a single projection is injective, a consistency check and not an input.
- The stage text's 'using HC.1–4': HC.1 and HC.3 are inputs, HC.2 is not used, HC.4 enters only through the check above.

**Depends on.** this roadmap: `HR.5/the-equaliser-presentation`, `HR.5/untwisted-relative-habiro-rings`; other roadmaps: `HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products`, `HabiroCyclotomicCompletions:HC.3/the-taylor-map`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Remark 2.14, PDF p. 19: “2.14. Remark. — In the special case where R = Z, we obtain the following presentation of the ordinary Habiro ring:” — The specialisation to R = Z.
- `Wagner.qHodgeHabiro.2025`, Remark 2.14, PDF p. 19: “Here ϕ/Z is just given by the reexpansion morphisms Z[ζpm]Jq −ζpmK ! Zp[ζpm]Jq −ζmK for all p and all m.” — The Frobenius arrow for R = Z is pure re-expansion.
- `Wagner.qHodgeHabiro.2025`, Question 1.1, PDF p. 3: “Is there a version of q-de Rham cohomology with coefficients not in the power series ring ZJq −1K, but in the Habiro ring H := lim m∈N Z[q]∧ (qm−1) ?” — The definition of H as the limit of the (q^m−1)-completions.

### O_F[1/Δ] is étale over ℤ when disc F divides Δ

`HR.5-number-field-comparison/the-inverted-discriminant-ring-is-etale` · lemma · first packet · added by REV-HabiroRings

Let F be a number field and Δ a non-zero integer divisible by disc F (it suffices that every prime dividing disc F divides Δ). Then R := O_F[1/Δ] is an étale ℤ-algebra.

**Hypotheses.**

- The condition on Δ excludes exactly the ramified primes, by Dedekind's discriminant theorem as Mathlib states it.
- Étale means formally étale and of finite presentation (mathlib:Algebra.Etale); ℤ_(p) is not étale over ℤ because it is not of finite presentation, so a localisation at a prime is not an input of H_{R/ℤ}.

**Proof.**

1. O_F is finite free over ℤ (mathlib:NumberField.RingOfIntegers) and R is its localisation away from Δ, so R is of finite presentation over ℤ; R is torsion free, hence flat over the Dedekind domain Z (mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot).
2. A prime of R lies over a prime p ∤ Δ, so p ∤ disc F (mathlib:NumberField.discr), so p is unramified in O_F (mathlib:NumberField.not_dvd_discr_iff_isUnramifiedIn) and R is unramified at that prime; hence R is formally unramified over ℤ (mathlib:Algebra.formallyUnramified_iff_forall).
3. Conclude with mathlib:Algebra.Etale.of_formallyUnramified_of_flat.

**Acceptance.**

- ℤ[i][1/2] (F = Q(i), disc −4) and ℤ[∛2][1/6] (F = ℚ(∛2), O_F = ℤ[∛2], disc −108 = −2²·3³) are étale over ℤ.
- Corollary 2.13 applies H_{R/ℤ}, defined in 2.7 only for étale R, to R = O_F[1/disc F]; this lemma is what makes that legitimate.

**Depends on.** libraries: `mathlib:NumberField.RingOfIntegers`, `mathlib:NumberField.discr`, `mathlib:NumberField.not_dvd_discr_iff_isUnramifiedIn`, `mathlib:Algebra.formallyUnramified_iff_forall`, `mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot`, `mathlib:Algebra.Etale.of_formallyUnramified_of_flat`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Corollary 2.13, PDF p. 19: “2.13. Corollary. — If F is a number field with discriminant ∆and R := OF [1/∆], then HR/Z agrees with the Habiro ring HR defined in [GSWZ24, Definition 1.1].” — The corollary uses H_{O_F[1/∆]/Z}, which needs O_F[1/∆] étale over Z; the source does not say why it is.
- `Wagner.qHodgeHabiro.2025`, 2.7, PDF p. 15: “2.7. Relative Habiro rings. — Let R be an étale A-algebra. For all primes p, the pth Adams operation ψp : A ! A can be uniquely extended to a Frobenius lift ϕp : bRp ! bRp.” — The construction is for étale A-algebras only.

### H_{R/ℤ} is the GSWZ Habiro ring of a number field (Corollary 2.13)

`HR.5-number-field-comparison/the-number-field-ring` · theorem · planet “Recovery of the Habiro ring of a number field” · first packet

Let F be a number field with discriminant Δ_F and R := O_F[1/Δ_F]. Then R is étale over ℤ (HabiroRings:HR.5-number-field-comparison/the-inverted-discriminant-ring-is-etale), so H_{R/ℤ} is defined (2.7 with A = ℤ, all ψ^m = id), and the equaliser presentation identifies H_{R/ℤ} with the Habiro ring H_R of GSWZ Definition 1.1, constructed in HabiroNumberFields HB.6, as ℤ[q]-algebras and compatibly with the Taylor projections to ∏_m R[ζ_m][[q − ζ_m]] (Corollary 2.13). The two gluing conditions agree because (i) R ⊗_{ℤ,ψ^m} Z = R and φ_{p/ℤ} is the unique Frobenius lift φ_p of R̂_p, which is HB.6's Frobenius; (ii) the compatible system of 2.11 is GSWZ's convention (7); (iii) the source's condition (the re-expansion of φ_p f_{pm} at ζ_m equals f_m) and GSWZ's (13) (the re-expansion of f_m at ζ_{pm} equals φ_p f_{pm}) are one equation read through the re-expansion isomorphism R̂_p[ζ_{pm}][[q − ζ_m]] ≅ R̂_p[ζ_{pm}][[q − ζ_{pm}]]; (iv) for p | Δ_F, R̂_p = 0 and both conditions are vacuous. The same proof applies verbatim to R = O_F[1/Δ] for every positive integer Δ divisible by Δ_F, the generality of GSWZ Definition 1.1 and of HB.6; this extension is not printed in the source and is used downstream where GSWZ's modules need 6Δ_F | Δ. For F = ℚ and Δ = 1 the composite with HabiroRings:HR.5-number-field-comparison/the-classical-ring is HB.6's identification of Habiro's ring with GSWZ's H_Z. No R-algebra structure on H_{R/ℤ} by constant families is asserted (HabiroRings:HR.7/constant-families-do-not-glue).

**Hypotheses.**

- F is a number field and the inverted integer is its discriminant, exactly as in Corollary 2.13; for the extension, any positive Δ divisible by disc F. Divisibility by 6 is NOT a hypothesis of the ring comparison: the §1.4 condition '∆ divisible by 6 disc F' belongs to GSWZ's regulator and to HB.7's modules.
- R = O_F[1/Δ] is étale over ℤ, which H_{R/ℤ} requires; A = ℤ with the trivial Λ-structure.
- HB.6's ring is imported with its Frobenius and gluing condition; the comparison is a theorem about both rings and is not an input to HB.6, which is constructed first.

**Proof.**

1. Specialise HabiroRings:HR.5/the-equaliser-presentation to A = ℤ and R = O_F[1/Δ].
2. Identify coefficients, Frobenius and roots as in (i), (ii), (iv), using uniqueness of Frobenius lifts on the étale ℤ_p-algebra R̂_p (HabiroRings:HR.1/the-etale-frobenius-lift) against HabiroNumberFields:HB.6/coefficient-rings-and-frobenius.
3. Match the gluing conditions as in (iii) with the re-expansion isomorphism and its cocycle law (HabiroCyclotomicCompletions:HC.3/p-adic-re-expansion), against HabiroNumberFields:HB.6/the-gluing-condition.
4. Both rings are subrings of ∏_m R[ζ_m][[q − ζ_m]] cut out by the same conditions, so the identification is a ring isomorphism commuting with the projections.
5. For F = ℚ, Δ = 1: all three identifications (this one, HabiroRings:HR.5-number-field-comparison/the-classical-ring and HabiroNumberFields:HB.6/ring-operations-and-the-classical-comparison) commute with the projections into ∏_m ℤ[ζ_m][[q − ζ_m]], so they are compatible.

**Acceptance.**

- H_{O_F[1/disc F]/ℤ} ≅ H_{O_F[1/disc F]} (GSWZ), with the gluing conditions matched, not only the underlying sets.
- The comparison holds for every Δ divisible by disc F by the same proof, marked as an extension of the printed statement.
- The comparison is compatible with Habiro's ring for F = ℚ.
- Neither construction is an input to the other.

**Depends on.** this roadmap: `HR.5/the-equaliser-presentation`, `HR.5/roots-choices-and-substitutions`, `HR.5-number-field-comparison/the-inverted-discriminant-ring-is-etale`, `HR.5-number-field-comparison/the-classical-ring`, `HR.1/the-etale-frobenius-lift`; other roadmaps: `HabiroNumberFields:HB.6/the-gluing-condition`, `HabiroNumberFields:HB.6/coefficient-rings-and-frobenius`, `HabiroNumberFields:HB.6/ring-operations-and-the-classical-comparison`, `HabiroCyclotomicCompletions:HC.3/p-adic-re-expansion`; stages: `HabiroNumberFields:HB.6`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Corollary 2.13, PDF p. 19: “2.13. Corollary. — If F is a number field with discriminant ∆and R := OF [1/∆], then HR/Z agrees with the Habiro ring HR defined in [GSWZ24, Definition 1.1].” — The statement with its exact hypothesis Δ = disc F; its proof is the one line 'This follows immediately from Lemma 2.12'.
- `Wagner.qHodgeHabiro.2025`, Paragraph 1.4, PDF p. 4: “1.4. The Habiro ring of a number field. — Let F be a number field and let ∆be divisible by 6 disc F.” — The stronger hypothesis 6·disc F | Δ is stated for GSWZ's ring together with its regulator; the ring comparison of Corollary 2.13 does not use it.

## HR.6 — Coefficient and cohomology interfaces

*Coverage in `HabiroRings.json`: partial, 5 nodes.* 5 packet nodes at this stage. Corollary 3.13 (PDF p. 27) with its proof from Theorem 3.11(b), Corollary 3.31, q-Witt v5 Proposition 3.31 and uniqueness of étale deformations, with multiplicativity, the cyclotomic specialisations, the q − 1 completion and naturality in pairs; completed scalar extension along morphisms of pairs, with perfect complexes and Picard groups (the exports); the K3-indexed line bundles of HB.7 transported along Corollary 2.13's isomorphism (6·disc F | Δ); the (q−1)-completion map with a ring-level kernel (R = ℤ[1/p]); and the vanishing of the regulator classes after (q−1)-completion (§1.4, asserted there; gap). Boundaries, formerly the register nodes the-module-interfaces and the-late-return-edge: no K3 group is constructed and no module is assumed free (HB.7's); a K3-indexed line module is not a cohomology class of a higher-dimensional scheme; the dependency on HabiroCohomologyFoundations is a late return edge, HR.1–HR.5 preceding HQ.3–HQ.5 and HR.6 consuming them; the crystalline, A_inf and prismatic comparisons enter through HQ.8 and their owners and are not imported here, so the HQ.8 and PR.0 prerequisites and the HQ.8 request are removed. Remaining: The regulator's vanishing after (q−1)-completion and a class with non-trivial image in Pic (gap). The HQ.1 packet's HR.6 prerequisites and its Corollary 3.13 clause (restructure 'The HabiroCohomologyFoundations HQ.1 packet makes HQ.3 and HQ.5 depend on HR.6'). Gap: 'The vanishing of the regulator classes after (q−1)-completion is asserted, not proved'.

*Coverage in `HabiroRings--HR.6.json`: planned, 3 nodes.* Every stage target is either one of the five retained parent nodes or a new refinement below. The historical HQ.1 cycle concern is resolved in the current accepted packets; no reverse edge is added. No nonzero Picard witness was established. Remaining: Resolve HB.7 G-global-descent and G-arithmetic-naturality, and add its integral order-one evaluation/multiplication API. The completion argument here is conditional on those supplied objects, not on an assumed global generator. Exhibit an actual F, Δ, ξ with [M_ξ]≠1, with a rigorous nonfreeness/detection argument. Ring noninjectivity and numerical knot comparisons do not establish this. Instantiate the omitted actual K₃/enhanced signatures when HB.7, HR.2, HR.4, HQ.3–5 and their existing generic suppliers land; discharge inherited enhanced deformation/completion supplier gaps.

The layer has eight nodes: the first packet's five, and the HR.6 part's three, which supply a proof route for the vanishing of the regulator after (q − 1)-completion. The HR.6 part is `planned`; it files one request with HabiroNumberFields HB.7 and records four gaps. HR.6 is a late return edge: HR.1–HR.5 precede HabiroCohomologyFoundations HQ.3–HQ.5, and HR.6 consumes their exports.

- **Corollary 3.13.** For an étale pair, the Habiro–Hodge complex of R with the (q − 1)-adic filtration is H_{R/A} as an E∞-A[q]-algebra: at each level the (q^m − 1)-completion is H_{R/A,m}, by the unique equivalence of étale deformations lifting the identification with q-W_m(R/A), compatibly in m. It is multiplicative, compatible with every cyclotomic specialisation and the (q − 1)-completion, and natural in pairs. HabiroCohomologyFoundations constructs the cohomology functor; this node identifies its coefficient object with the independently constructed ring. The proof uses Theorem 3.11(b), where the source cites 3.11(a) (E6).
- **Completed scalar extension.** Along a morphism of pairs, M ↦ (M ⊗^L_{H_{R/A}} H_{R′/A′})^∧_H is left adjoint to restriction, symmetric monoidal, agrees with ordinary base change on perfect complexes, and preserves invertible objects, which gives the Picard maps.
- **The transported regulator.** For Δ divisible by 6·disc F and R = O_F[1/Δ], HB.7's invertible modules H_{R,ξ}, ξ ∈ K₃(F), transported along κ : H_{R/ℤ} ≅ H_R, give a homomorphism K₃(F) → Pic(H_{R/ℤ}). No K₃ group is constructed, no module is asserted free, and a class in the image is not a cohomology class of a higher-dimensional scheme.
- **The (q − 1)-completion.** c : H_{R/A} → R[[q − 1]] is natural in pairs and injective for A = R = ℤ, but not in general: for R = ℤ[1/p] it kills the idempotents of all cyclotomic components not connected to q = 1. Ring non-injectivity is not a Picard statement.
- **The regulator after completion.** Wagner asserts (§1.4) that the regulator becomes trivial after (q − 1)-completion. The HR.6 part proves it: order-one evaluation f ↦ f_1(0) trivialises the fibre R ⊗_H M_ξ canonically, with no choice of root and with the normalisation that evaluation fixes; and an invertible module over R[[X]] whose fibre at X = 0 is free is free, by Nakayama, with no local hypothesis on R. Hence Pic(c) kills the image of K₃(F). The trivialisation over R[[X]] is not canonical: units 1 + X change it while fixing its fibre. The argument is conditional on HB.7's effective global descent and inverse tensor certificate (gap G-global-descent).
- **The field scalar square.** For F ⊆ E with a common Δ, scalar extension H_{R/ℤ} → H_{S/ℤ} carries ρ_F(ξ) to ρ_E(res ξ), compatibly with the fibres and the completions, conditional on HB.7's arithmetic naturality (gap G-arithmetic-naturality).

What stays open: no pre-completion regulator class is shown to be non-trivial in Pic(H_{R/ℤ}), so the loss of information is not yet exhibited by an example (gap G-nonzero-regulator); and the actual K₃ and enhanced carriers are not available to state the signatures in Lean (gap G-signatures-and-enhanced-inputs). The HR.6 part corrects the supplier of the derived-to-underived step in the first packet's Corollary 3.13 node; the Assembly note after that node gives the correction.

### Étale degree-zero identification: the Habiro–Hodge complex is H_{R/A} (Corollary 3.13)

`HR.6/the-degree-zero-identification` · comparison · first packet

Let A be a perfectly covered Λ-ring and R an étale A-algebra, with the (q−1)-adic filtration fil^n = (q−1)^n qdR_{R/A} on its derived q-de Rham complex (Example 3.12 for the empty framing). Then the Habiro–Hodge complex qHdg_{R/A} of Theorem 3.11(a) is equivalent to the relative Habiro ring H_{R/A} of 2.7 as an E∞-A[q]-algebra (Corollary 3.13). More precisely, for every m the (q^m−1)-completion (qHdg_{R/A})^∧_{(q^m−1)} is equivalent to H_{R/A,m} by the unique equivalence of étale deformations lifting qHdg_{R/A}/(q^m−1) ≃ q-W_m(R/A) ≃ H_{R/A}/(q^m−1); these equivalences are compatible in m, and their limit is the stated one. Consequently the identification is multiplicative, compatible with every cyclotomic specialisation (reduction modulo Φ_m(q) and q^m − 1), identifies at m = 1 the (q−1)-completion of qHdg_{R/A}, which is the q-Hodge complex of R, with H_{R/A,1} = R[[q−1]], and is natural in morphisms of pairs (A,R) → (A',R'). The Habiro–Hodge functor, its filtrations and its other comparisons are HabiroCohomologyFoundations'.

**Hypotheses.**

- A is a perfectly covered Λ-ring and R is étale over A (Corollary 3.13); smooth non-étale algebras are HabiroCohomologyFoundations'.
- The q-Hodge filtration is the (q−1)-adic one of Example 3.12 for the empty framing; that it is also the canonical filtration of Theorem 4.11 in relative dimension zero, so that the result computes algebraic Habiro cohomology of Spec R (1.16), is imported from HQ.5 (request).
- The (q−1)-adic filtration is multiplicative, so the Habiro–Hodge complex is an E∞-algebra by the multiplicative upgrade of 3.50–3.51; the equivalence is the unique one lifting the identifications modulo q^m − 1.

**Proof.**

1. The (q−1)-adic filtration on qdR_{R/A} is a q-Hodge filtration (Example 3.12 with no coordinates, checked against Definition 3.2: HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations); Theorem 3.11 (HabiroCohomologyFoundations:HQ.3/habiro-descent) gives qHdg_{R/A}, an E∞-algebra by HabiroCohomologyFoundations:HQ.3/multiplicative-upgrades.
2. For étale R, q-W_m dR^n_{R/A} ≃ Σ^{−n} q-W_mΩ^n_{R/A} (Corollary 3.31: HabiroCohomologyFoundations:HQ.4/hodge-against-nygaard) and q-W_mΩ^*_{R/A} is q-W_m(R/A) in degree 0 by étale base change from A (q-Witt v5 Proposition 3.31: HabiroCohomologyFoundations:HQ.4/etale-base-change-and-the-sheaf-property); Theorem 3.11(b) then gives qHdg_{R/A}/(q^m−1) ≃ q-W_m(R/A). The source cites Theorem 3.11(a) at this point; part (b) is the one that computes the quotient (sourceIssues).
3. q-W_m(R/A) ≃ H_{R/A}/(q^m−1) by Theorem 2.9 (HabiroRings:HR.4/the-etale-lift); (qHdg_{R/A})^∧_{(q^m−1)} and H_{R/A,m} are (q^m−1)-complete deformations of the étale A[q]/(q^m−1)-algebra q-W_m(R/A), hence uniquely equivalent (uniqueness of étale deformations; in the static case mathlib:Algebra.FormallyEtale.iff_comp_bijective along the square-zero steps), and uniqueness makes the equivalences compatible in m.
4. Take the limit over m; both sides are Habiro-complete (HabiroRings:HR.5/the-relative-habiro-ring), so qHdg_{R/A} ≃ H_{R/A}.
5. Multiplicativity, the cyclotomic specialisations, the case m = 1 and naturality in pairs all follow from the uniqueness in the previous two steps.

**Acceptance.**

- qHdg_{R/A} ≃ H_{R/A} as E∞-A[q]-algebras.
- (qHdg_{R/A})^∧_{(q^m−1)} ≃ H_{R/A,m} compatibly in m; for m = 1 both are R[[q−1]].
- The identification is natural in morphisms of pairs.
- For A = ℤ and R = O_F[1/disc F] it recovers the GSWZ ring through HabiroRings:HR.5-number-field-comparison/the-number-field-ring, as §1.4 announces.

**Depends on.** this roadmap: `HR.5/the-relative-habiro-ring`, `HR.4/the-etale-lift`; other roadmaps: `HabiroCohomologyFoundations:HQ.3/habiro-descent`, `HabiroCohomologyFoundations:HQ.3/q-hodge-filtrations`, `HabiroCohomologyFoundations:HQ.3/multiplicative-upgrades`, `HabiroCohomologyFoundations:HQ.4/hodge-against-nygaard`, `HabiroCohomologyFoundations:HQ.4/etale-base-change-and-the-sheaf-property`; stages: `HabiroCohomologyFoundations:HQ.5`; libraries: `mathlib:Algebra.FormallyEtale.iff_comp_bijective`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Corollary 3.13, PDF p. 27: “3.13. Corollary. — If R is étale over A, then q9HdgR/A is the relative Habiro ring HR/A constructed in 2.7.” — The statement.
- `Wagner.qHodgeHabiro.2025`, Paragraph before Corollary 3.13, PDF p. 27: “Example 3.12 covers in particular the case of étale A-algebras. In this special case, we recover a familiar construction.” — The étale case is Example 3.12 with no coordinates.
- `Wagner.qHodgeHabiro.2025`, Proof of Corollary 3.13, PDF p. 27: “If R is étale, then combining this observation with Theorem 3.11(a) and [Wag24, Proposition 3.31] shows q9HdgR/A/(qm −1) ≃q9Wm(R/A) ≃HR/A/(qm −1) .” — The identification modulo q^m − 1; the citation of Theorem 3.11(a) should be to 3.11(b).
- `Wagner.qHodgeHabiro.2025`, Proof of Corollary 3.13, PDF p. 27: “By uniqueness of deformations of étale extensions, these automatically lift to a unique equivalence of E∞-H-algebras (q9HdgR/A)∧ (qm−1) ≃HR/A,m; furthermore, uniqueness also ensures that these equivalences are compatible for varying m.” — Uniqueness of étale deformations gives the equivalences and their compatibility in m.
- `Wagner.qHodgeHabiro.2025`, Paragraph 1.4, PDF p. 4: “The construction of Habiro cohomology that we propose in this paper recovers HOF [1/∆] (Corollary 3.13).” — The number-field ring is recovered by this corollary.

**Assembly note.** REV-HabiroRings--HR.6 asks the assembly to carry its corrected supplier into this node. The step from derived to underived q-de Rham–Witt forms is Corollary 3.31, which is `HabiroCohomologyFoundations:HQ.4/derived-q-de-rham-witt-forms-of-smooth-algebras`; the cited `HQ.4/hodge-against-nygaard` is the Nygaard pullback lemma used inside that comparison, not the comparison. The uniqueness of étale deformations in the proof is `HR.4/complete-principal-deformation-universality`, which the HR.4 part plans, conditional on its supplier refinements. The proof uses Theorem 3.11(b) where the source cites 3.11(a) (E6).

### Completed scalar extension of Habiro-complete modules along morphisms of pairs

`HR.6/completed-scalar-extension` · construction · first packet · added by REV-HabiroRings

For a morphism of pairs f: (A,R) → (A',R') (HR.1) let f_*: H_{R/A} → H_{R'/A'} be the induced ring map (HabiroRings:HR.5/the-relative-habiro-ring), and let D̂_H(H_{R/A}) be the ∞-category of H_{R/A}-modules in D(A[q]) whose underlying object is Habiro-complete, with the completed tensor product ⊗̂^L of B.1. The COMPLETED SCALAR EXTENSION f^*: D̂_H(H_{R/A}) → D̂_H(H_{R'/A'}), M ↦ (M ⊗^L_{H_{R/A}} H_{R'/A'})^∧_H, is left adjoint to restriction of scalars, symmetric monoidal for ⊗̂^L, sends H_{R/A} to H_{R'/A'}, agrees with the uncompleted derived base change on perfect H_{R/A}-complexes (which are Habiro-complete), and preserves invertible objects; on invertible modules over the ordinary ring H_{R/A} it is the usual base change Pic(H_{R/A}) → Pic(H_{R'/A'}), compatibly with the fully faithful inclusion of Pic(H_{R/A}) into the invertible objects of D̂_H(H_{R/A}). These are the complete modules, derived scalar extension, perfect complexes and invertible-module comparisons that HR.6 exports to Habiro cohomology.

**Hypotheses.**

- Morphisms are morphisms of pairs: a Λ-map A → A' of perfectly covered Λ-rings and a compatible map R → R' of étale algebras.
- Modules are Habiro-complete; base change and tensor products are completed, except on perfect complexes, where completion changes nothing.
- Nothing is exported about non-perfect or non-invertible modules beyond the adjunction.

**Construction.**

1. Habiro-complete objects form a reflective stable subcategory (killing the idempotent of B.1), closed under limits, finite colimits and retracts, with localisation (−)^∧_H and the symmetric monoidal structure ⊗̂^L (HabiroRings:HR.2/habiro-complete-modules, HabiroRings:HR.2/the-monoidal-structure); H_{R/A} is a commutative algebra in it.
2. Define f^* as derived base change along f_* followed by (−)^∧_H; the adjunction and monoidality follow from those of base change and of the localisation.
3. H_{R/A} is complete, hence so is every perfect complex, and on perfect complexes f^* is derived base change.
4. An invertible H_{R/A}-module is finitely generated projective, hence complete, and its base change is invertible.
5. Functoriality: id^* ≃ id and (g ∘ f)^* ≃ g^* ∘ f^*.

**API.**

- `HabiroRings.completedScalarExtension` (data): f^*M = (M ⊗^L_{H_{R/A}} H_{R'/A'})^∧_H.
- `HabiroRings.completedScalarExtension.adjunction` (universal-property): f^* is left adjoint to restriction of scalars D̂_H(H_{R'/A'}) → D̂_H(H_{R/A}).
- `HabiroRings.completedScalarExtension.monoidal` (structure): f^*(M ⊗̂^L N) ≃ f^*M ⊗̂^L f^*N and f^*H_{R/A} ≃ H_{R'/A'}.
- `HabiroRings.completedScalarExtension.map_id` (functoriality): id^* ≃ id.
- `HabiroRings.completedScalarExtension.map_comp` (functoriality): (g ∘ f)^* ≃ g^* ∘ f^*.
- `HabiroRings.completedScalarExtension.perfect` (compatibility): On perfect complexes f^* ≃ − ⊗^L_{H_{R/A}} H_{R'/A'}, uncompleted.
- `HabiroRings.completedScalarExtension.quotient` (simp): f^*(H_{R/A}/(q^m − 1)) ≃ H_{R'/A'}/(q^m − 1).
- `HabiroRings.picMap` (data): Pic(H_{R/A}) → Pic(H_{R'/A'}), [L] ↦ [L ⊗_{H_{R/A}} H_{R'/A'}].
- `HabiroRings.picMap_eq` (compatibility): picMap agrees with f^* on invertible objects under the fully faithful inclusion of Pic(H_{R/A}) into the invertible objects of D̂_H(H_{R/A}).

**Unit tests.**

- `HabiroRings.completedScalarExtension_id` (degenerate): For f = id, f^* ≃ id and picMap = id.
- `HabiroRings.completedScalarExtension_quotient_example` (computation): For f: (Z, Z) → (Z, ℤ[1/2]), f^*(H_{ℤ/ℤ}/(q² − 1)) ≃ H_{ℤ[1/2]/ℤ}/(q² − 1) ≅ ℤ[1/2][q]/(q² − 1) ≅ ℤ[1/2] × ℤ[1/2], since (q − 1) − (q + 1) = −2 is a unit.
- `HabiroRings.directSum_not_habiroComplete` (non-example): ⊕_{n≥0} H_{ℤ/ℤ} is not Habiro-complete: Σ_n (q;q)_n e_n converges in its Habiro completion but has infinitely many non-zero coordinates; so f^* and colimits must be completed.
- `HabiroRings.completedScalarExtension_free` (compatibility): For M = H_{R/A}^n, f^*M ≃ H_{R'/A'}^n, without completion.
- `HabiroRings.completedScalarExtension_adjunction_unit` (characterisation): For Habiro-complete N over H_{R'/A'}, maps f^*H_{R/A} → N correspond to maps H_{R/A} → N of H_{R/A}-modules, i.e. to the underlying object of N.

**Acceptance.**

- f^*(H_{R/A}/(q^m − 1)) ≃ H_{R'/A'}/(q^m − 1) ≃ q-W_m(R'/A').
- ⊕_{n≥0} H_{ℤ/ℤ} is not Habiro-complete.
- On perfect complexes f^* is the ordinary derived base change.

**Used by.**

- HabiroCohomologyFoundations HQ.3–HQ.5: Habiro cohomology takes values in these module categories and is functorial along f^*
- HabiroRings:HR.6/the-transported-regulator: the Picard groups in which the K3-indexed modules are compared
- HabiroRings:HR.6/the-regulator-dies-after-q-minus-one-completion: base change of invertible modules along the (q−1)-completion

**Depends on.** this roadmap: `HR.5/the-relative-habiro-ring`, `HR.2/habiro-complete-modules`, `HR.2/the-monoidal-structure`, `HR.1/morphisms-of-pairs`, `HR.4/the-etale-lift`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, B.1, PDF p. 77: “We also let bD(H) ⊆D(Z[q±1]) denote the full sub-∞-category of Habiro-complete objects and denote its completed tensor product by −b⊗L H −.” — The category of Habiro-complete objects and its completed tensor product, in which f^* is formed; the source has no scalar-extension statement, and this node carries the HR.6 stage text's export list.

### The K3-indexed line bundles transported to H_{R/ℤ}

`HR.6/the-transported-regulator` · comparison · first packet · added by REV-HabiroRings

Let F be a number field, Δ a positive integer divisible by 6·disc F, R = O_F[1/Δ], and κ: H_{R/ℤ} ≅ H_R the isomorphism of HabiroRings:HR.5-number-field-comparison/the-number-field-ring (its clause for Δ divisible by disc F). For ξ ∈ K3(F), HB.7's invertible H_R-module H_{R,ξ} (GSWZ Definition 1.4) gives the invertible H_{R/ℤ}-module κ^*H_{R,ξ}, and ξ ↦ [κ^*H_{R,ξ}] is a group homomorphism K3(F) → Pic(H_{R/ℤ}), because H_{R,0} = H_R and H_{R,ξ} ⊗ H_{R,ξ'} ≅ H_{R,ξ+ξ'} (GSWZ Theorem 2, as HB.7 supplies it). Nothing else is claimed: no K3 group is constructed here, H_{R,ξ} is not asserted to be free, and a class in the image is not asserted to be a cohomology class of any higher-dimensional scheme.

**Hypotheses.**

- 6·disc F divides Δ, GSWZ's hypothesis for the modules (§1.4); the ring comparison alone needs only disc F | Δ.
- The modules and the homomorphism K3(F) → Pic(H_R) are HB.7's; this node transports them along κ and proves nothing else about them.
- κ is a ring isomorphism, so transport preserves invertibility and tensor products.

**Proof.**

1. Take κ from HabiroRings:HR.5-number-field-comparison/the-number-field-ring for this Δ.
2. Transport H_{R,ξ} (HabiroNumberFields:HB.7/the-global-module) along κ; invertibility and the multiplication isomorphisms (HabiroNumberFields:HB.7/operations-on-the-modules) transport, giving a homomorphism into Pic(H_{R/ℤ}) (HabiroRings:HR.6/completed-scalar-extension for the Picard groups).

**Acceptance.**

- K3(F) → Pic(H_{R/ℤ}) is a homomorphism with 0 ↦ [H_{R/ℤ}].
- No statement of freeness or of higher-dimensional meaning is made.

**Depends on.** this roadmap: `HR.5-number-field-comparison/the-number-field-ring`, `HR.6/completed-scalar-extension`; other roadmaps: `HabiroNumberFields:HB.7/the-global-module`, `HabiroNumberFields:HB.7/operations-on-the-modules`; stages: `HabiroNumberFields:HB.7`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Paragraph 1.4, PDF p. 4: “1.4. The Habiro ring of a number field. — Let F be a number field and let ∆be divisible by 6 disc F.” — The hypothesis 6·disc F | Δ under which the regulator is constructed.
- `Wagner.qHodgeHabiro.2025`, Paragraph 1.4, PDF p. 4 (TeX source): “Already in this special case, the Habiro stack exhibits non-trivial geometry in form of line bundles with interesting sections that come from the regulator $K_3(F)\rightarrow \Pic(\Hh_{\Oo_F[1/\Delta]})$.” — The regulator K3(F) → Pic(H_{O_F[1/∆]}) whose classes are transported.

### The (q−1)-completion map, and a ring-level kernel after inverting a prime

`HR.6/the-q-minus-one-completion-is-not-injective` · theorem · first packet · added by REV-HabiroRings

For A perfectly covered and R étale over A, the (q−1)-completion c: H_{R/A} → (H_{R/A})^∧_{(q−1)} ≅ R[[q−1]] is a ring map, natural in morphisms of pairs. It is injective for A = R = ℤ (a single Taylor expansion determines an element of Habiro's ring), but not in general: for A = ℤ and R = ℤ[1/p], H_{R/ℤ} ≅ ℤ[1/p][q]^N ≅ ∏_{a≥0} ℤ[1/p][q]^{S_a} with S_a = {n ∈ N : v_p(n) = a}, and c kills the non-zero idempotent of every factor with a ≥ 1. So the (q−1)-completion forgets all cyclotomic components not connected to q = 1.

**Hypotheses.**

- A is perfectly covered and R is étale over A; the identification (H_{R/A})^∧_{(q−1)} ≅ R[[q−1]] is HabiroRings:HR.5/the-relative-habiro-ring's.
- The example is R = ℤ[1/p]; its product decomposition is HabiroCyclotomicCompletions HC.5's, imported.
- This is the ring-level loss; the loss of K3-indexed classes is HabiroRings:HR.6/the-regulator-dies-after-q-minus-one-completion.

**Proof.**

1. c is the projection to H_{R/A,1} = R[q]^∧_{(q−1)} = R[[q−1]]; naturality is that of the projections.
2. For R = ℤ[1/p], identify H_{R/ℤ} with ℤ[1/p][q]^N (HabiroRings:HR.5/untwisted-relative-habiro-rings); c becomes restriction to the order set {1} ⊂ S_0.
3. By HabiroCyclotomicCompletions:HC.5/inverting-a-prime-and-the-rational-case, ℤ[1/p][q]^N is the product of the non-zero rings ℤ[1/p][q]^{S_a}; the idempotent of a factor with a ≥ 1 restricts to 0 on {1}.
4. For A = R = ℤ, c is the Taylor expansion at 1, injective by HabiroCyclotomicCompletions:HC.4/rootwise-taylor-injectivity.

**Acceptance.**

- The idempotent e_1 of the factor S_1 is non-zero in H_{ℤ[1/p]/ℤ} and c(e_1) = 0.
- c is injective for R = ℤ.

**Depends on.** this roadmap: `HR.5/the-relative-habiro-ring`, `HR.5/untwisted-relative-habiro-rings`; other roadmaps: `HabiroCyclotomicCompletions:HC.5/inverting-a-prime-and-the-rational-case`, `HabiroCyclotomicCompletions:HC.4/rootwise-taylor-injectivity`; stages: `HabiroCyclotomicCompletions:HC.5`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Paragraph 1.4, PDF p. 4: “This geometry would be completely invisible to any q-de Rham stack, as the regulator becomes trivial after (q −1)-completion!” — The source's remark that information disappears after (q−1)-completion, made there for the regulator; this node exhibits the completion map and a kernel at ring level.
- `Wagner.qHodgeHabiro.2025`, Proof of Lemma 2.12, PDF p. 18: “By 2.7, the Φd(q)-completion of HR/A is (R ⊗A,ψd A)[q]∧ Φd(q)” — The completions of H_{R/A}, of which the (q−1)-completion is the case d = 1.

### The regulator classes become trivial after (q−1)-completion

`HR.6/the-regulator-dies-after-q-minus-one-completion` · theorem · first packet · added by REV-HabiroRings

Let F, Δ (6·disc F | Δ) and R = O_F[1/Δ] be as in HabiroRings:HR.6/the-transported-regulator, and c: H_{R/ℤ} → R[[q−1]] the (q−1)-completion. For every ξ ∈ K3(F) the base change c^*(κ^*H_{R,ξ}) is free of rank one over R[[q−1]]; equivalently the composite K3(F) → Pic(H_{R/ℤ}) → Pic(R[[q−1]]) is zero. The regulator classes are therefore invisible to the (q−1)-complete, q-de Rham, theory: this is the loss of K3-indexed information after (q−1)-completion that the HR.6 stage text asks to exhibit by an actual completion map.

**Hypotheses.**

- 6·disc F divides Δ.
- The statement is Wagner's (§1.4, p. 4), asserted there without proof; its proof depends on HB.7's description of H_{R,ξ} at the order-1 factor (GSWZ Definition 1.4 with Theorem 1), recorded as a gap.
- That some ξ has non-trivial class in Pic(H_{R/ℤ}), which makes the loss actual, is not established in the sources read (GSWZ §1.5 says only that H_{R,ξ} 'is not necessarily free'); recorded in the same gap.

**Proof.**

1. c is the map of HabiroRings:HR.6/the-q-minus-one-completion-is-not-injective; base change of invertible modules along a ring map preserves invertibility.
2. Compute c^*(κ^*H_{R,ξ}) from the order-1 component of H_{R,ξ} (HabiroNumberFields:HB.7/the-global-module, HabiroNumberFields:HB.7/invertible-local-sections); this step is the gap.

**Acceptance.**

- The composite K3(F) → Pic(R[[q−1]]) is zero.
- The statement is recorded with the source's attribution and its gap.

**Depends on.** this roadmap: `HR.6/the-transported-regulator`, `HR.6/the-q-minus-one-completion-is-not-injective`; other roadmaps: `HabiroNumberFields:HB.7/the-global-module`, `HabiroNumberFields:HB.7/invertible-local-sections`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Paragraph 1.4, PDF p. 4: “This geometry would be completely invisible to any q-de Rham stack, as the regulator becomes trivial after (q −1)-completion!” — The statement, asserted without proof.
- `Wagner.qHodgeHabiro.2025`, Paragraph 1.4, PDF p. 4 (TeX source): “Already in this special case, the Habiro stack exhibits non-trivial geometry in form of line bundles with interesting sections that come from the regulator $K_3(F)\rightarrow \Pic(\Hh_{\Oo_F[1/\Delta]})$.” — The line bundles whose classes the (q−1)-completion kills.

**Assembly note.** The HR.6 part supplies the proof this node's gap asks for: `HR.6/followup-order-one-fibre` trivialises the fibre at q = 1 by order-one evaluation, and `HR.6/followup-completed-regulator-triviality` lifts the trivialisation by Nakayama over R[[X]]. Both are conditional on HabiroNumberFields HB.7's effective global descent and inverse tensor certificate (gap G-global-descent). The first packet's gap is therefore refined, not closed; the separate question of a non-trivial pre-completion class is the gap G-nonzero-regulator.

### Order-one fibre trivialization of a transported Habiro line

`HR.6/followup-order-one-fibre` · construction · planet “Order-one fibre trivialization” · HR.6 packet

Let F be a number field, Δ>0 with 6|disc F| dividing Δ, R=O_F[1/Δ], H=H_{R/ℤ}, κ:H≅H_R the Taylor-compatible ring comparison, M_ξ=κ*H_{R,ξ}, and v=constantCoeff∘c:H→R for c:H→R[[X]], X=q−1. Under HB.7 effective global descent and its tensor bijectivity, order-one evaluation gives e_ξ:R⊗_{H,v}M_ξ→R, e_ξ(r⊗f)=r f_1(0). Construct the unique R-linear equivalence t_ξ with underlying map e_ξ. The order-one Kummer torsor is canonically trivial, so the value lies in R without a root choice. This trivializes the fibre, not M_ξ over H. The typed ordinary prototype OrderOneFibre.trivialization accepts an actual invertible H-module M, its evaluation map e on R⊗_H M, and a preimage of 1; the HB.7 finite inverse-tensor certificate supplies that preimage in this application.

**Hypotheses.**

- HB.7 supplies actual additive modules and their invertibility, conditional on its G-global-descent and inherited corrected integral linear-jet contract (HabiroNumberFields/E24); it is not inferred from local rank one or the uncorrected printed Definition 1.3 alone.
- HB.7 supplies the semilinear constant evaluation and its compatibility with multiplication; this small additional API is requested from its sole owner.
- No R-algebra structure on H is assumed. The algebra H→R in the tensor product is v.

**Construction.**

1. Use GSWZ Definition 1.4 and Proposition 1.5(f) at m=1: ε_1 has a canonical trivial torsor and f_1(0) belongs to R. Addition and scalar multiplication of the actual sections give the v-semilinear evaluation; request this API from HB.7.
2. HB.7/followup-tensor-bijectivity yields finitely many f_i∈M_ξ and g_i∈M_{−ξ} with Σ f_i g_i=1. Evaluating constants yields Σ f_i(0) g_i(0)=1. Thus z=Σ g_i(0)⊗f_i belongs to the fibre and e_ξ(z)=1. No individual f_i is asserted to be a unit section.
3. Since e_ξ(r z)=r, e_ξ is surjective. Ordinary scalar extension preserves Module.Invertible. Apply Module.Invertible.bijective_of_surjective between this fibre and R, then promote e_ξ to a linear equivalence. Its underlying map determines it uniquely.
4. The inverse image t_ξ^{-1}(1) is independent of the inverse certificate. Tensor multiplication of fibres intertwines their evaluations and t_{ξ+η}; this follows by pure tensors and the supplied multiplication API.
5. The naturality API is the routine equality t′(u(x))=e′(u(x))=f(e(x))=f(t(x)) once HB.7 supplies u and evaluation compatibility. It introduces no additional arithmetic assertion or target-level lemma.

**API.**

- `OrderOneFibre.map_eq_eval` (characterisation): For every x in R⊗_H M, t(x)=e(x).
- `OrderOneFibre.inverse_one` (simp): e(t^{-1}(1))=1.
- `OrderOneFibre.coordinates` (universal-property): For every x in the fibre, e(x)·t^{-1}(1)=x.
- `OrderOneFibre.unique` (extensionality): Any R-linear equivalence with underlying evaluation e equals t.
- `OrderOneFibre.rescale` (compatibility): If evaluation is multiplied by a unit u of R, its normalized fibre equivalence is u times t.
- `OrderOneFibre.naturality` (functoriality): For a ring homomorphism f:R→S and an f-semilinear map u between the actual fibres, if e′(u(x))=f(e(x)) for every x, then t′(u(x))=f(t(x)). This preserves the normalization under HB.7 supported field pullback; it does not assert existence of u or arithmetic naturality.

**Unit tests.**

- `OrderOneFibreTests.identity` (degenerate): For H=R, M=R and e the Mathlib tensor-unit map, t(1⊗r)=r for every r. In the actual regulator application this is ξ=0.
- `OrderOneFibreTests.negativeUnit` (computation): For H=R=ℤ and e the negative tensor-unit map, t(1⊗3)=−3. A construction ignoring the evaluation normalization fails.
- `OrderOneFibreTests.inverseGenerator` (characterisation): For any fibre/e/preimage of 1 and any r, t(r·t^{-1}(1))=r. This is a statement about the base-changed fibre only.
- `OrderOneFibreTests.zeroEvaluation` (non-example): For H=R=M=ℤ, the zero evaluator on ℤ⊗_ℤ ℤ has no preimage of 1 and cannot be used to construct t.

**Acceptance.**

- Construct a preimage of 1 from a finite SUM of evaluated products; a global generator must not appear in the assumptions.
- At ξ=0, t_0 is the ordinary tensor-unit map after v.
- The map is normalized by actual evaluation, and all tensors use H→R rather than a supposed R→H.

**Used by.**

- HabiroRings:HR.6/followup-completed-regulator-triviality: The canonical trivial first fibre supplies a generator modulo X for the completed line.
- HabiroRings:HR.6/followup-regulator-scalar-square: Evaluation commutes with supported field pullback, so the fibre comparison is natural.
- HabiroRings:HR.7: Tests distinguish a trivial fibre from a free original line and check the normalization.

**Depends on.** this roadmap: `HR.6/the-transported-regulator`, `HR.6/the-q-minus-one-completion-is-not-injective`, `HR.5-number-field-comparison/the-number-field-ring`; other roadmaps: `HabiroNumberFields:HB.7/followup-effective-global-descent`, `HabiroNumberFields:HB.7/followup-tensor-bijectivity`; stages: `HabiroNumberFields:HB.7`; libraries: `mathlib:Module.Invertible`, `mathlib:Module.Invertible.bijective_of_surjective`, `mathlib:PowerSeries.constantCoeff`, `mathlib:TensorProduct.lid`.

**Library.** proposed module `TauCeti/AlgebraicGeometry/Habiro/CoefficientInterfaces`, namespace `TauCeti.HabiroCoefficients`; Lean name `TauCeti.HabiroCoefficients.OrderOneFibre.trivialization`.

**Sources.**

- `GSWZ.v2`, Definition 1.4, printed p.10; Proposition 1.5(f), printed p.11: “then fm(0)” — The m=1 specialization is the integral order-one evaluation. Its module/tensor interpretation is conditional on the explicitly imported HB.7 descent contract.
- `GSWZ.v2`, Theorem 2, (25), printed p.10; its proof in §3.3, printed p.43: “multiplication gives a canonical isomorphism” — Supplies the inverse tensor pairing as refined by the accepted HB.7 follow-up; the source proof alone does not establish effective global descent.

### Triviality of the completed K₃ regulator

`HR.6/followup-completed-regulator-triviality` · theorem · planet “Triviality of the completed regulator” · HR.6 packet

With F, Δ, R, H, M_ξ and c as above, and conditional on HB.7 effective global descent and inverse tensor pairing, P_ξ=R[[X]]⊗_{H,c}M_ξ is free of rank one. Equivalently, Pic(c)([M_ξ])=1 in the multiplicatively written Mathlib Picard group, so Pic(c)∘ρ is the trivial homomorphism. The ordinary-module core is stronger: for any commutative R and any invertible P over B=R[[X]], an isomorphism P/XP≅R (B-linear via constant coefficient) implies the existence of an isomorphism P≅B. The latter is not canonical; no choice of generator over H and no local-ring hypothesis on R is required.

**Hypotheses.**

- All algebra/module structures in P_ξ and the first fibre come from c and v. Ordinary and derived scalar extension agree here because M_ξ is finite projective.
- The order-one fibre is the actual quotient P_ξ/XP_ξ, identified using iterated base change; a Taylor expansion over F[[X]] is not substituted for this quotient.

**Proof.**

1. By existing base-change invertibility, P_ξ is invertible and finite over B. The identities ker(constantCoeff)=(X) and surjectivity of constantCoeff identify B/(X) with R via RingHom.quotientKerEquivOfSurjective. TensorProduct.quotTensorEquivQuotSMul and TensorProduct.AlgebraTensorModule.cancelBaseChange identify P_ξ/XP_ξ with R⊗_H M_ξ; apply followup-order-one-fibre.
2. Lift the fibre generator t_ξ^{-1}(1) to s∈P_ξ using Submodule.mkQ_surjective. The map a:B→P_ξ, b↦b s, is surjective modulo X.
3. For any y∈B, 1+yX has unit constant coefficient 1, hence is a unit by PowerSeries.isUnit_iff_constantCoeff. Ideal.mem_jacobson_iff gives X∈jacobson(0), hence (X)⊆jacobson(0). This works for the generally nonlocal Dedekind coefficient ring R.
4. Apply LinearMap.surjective_of_surjective_comp_mkQ to the finite target P_ξ and the ideal (X). Then a is surjective; since B and P_ξ are invertible, Module.Invertible.bijective_of_surjective makes a an isomorphism. Pic.mk_eq_one_iff translates this into the asserted Picard identity.
5. There is no new global-deformation or Picard theorem to plan: the proof is an application of existing ordinary Nakayama and invertible-module APIs. Trivializations over B form a B-unit torsor. Even after fixing the fibre trivialization, multiplying by 1+X gives another lift; raw f_1(X) need not be integral beyond its constant term.

**Acceptance.**

- Every class in the actual transported regulator image maps to the Picard identity; this alone does not produce a nonidentity class in that image.
- Use only integral constants, not an unproved integral Taylor expansion.
- The typed theorem accepts any R, including nonlocal R; multiplying a completed basis by 1+X shows the absence of a canonical full trivialization.
- The proof establishes freeness conditional on the named HB.7 contract, not a proof of that supplier contract.

**Depends on.** this roadmap: `HR.6/followup-order-one-fibre`, `HR.6/completed-scalar-extension`; other roadmaps: `HabiroNumberFields:HB.7/followup-picard-character`; libraries: `mathlib:Module.Invertible`, `mathlib:Module.Invertible.bijective_of_surjective`, `mathlib:Module.Invertible.free_iff_linearEquiv`, `mathlib:CommRing.Pic.mk`, `mathlib:CommRing.Pic.mk_eq_one_iff`, `mathlib:CommRing.Pic.mapRingHom`, `mathlib:PowerSeries.constantCoeff_surj`, `mathlib:PowerSeries.X_dvd_iff`, `mathlib:PowerSeries.isUnit_iff_constantCoeff`, `mathlib:Ideal.mem_jacobson_iff`, `mathlib:Submodule.mkQ_surjective`, `mathlib:LinearMap.toSpanSingleton`, `mathlib:LinearMap.surjective_of_surjective_comp_mkQ`, `mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange`, `mathlib:TensorProduct.quotTensorEquivQuotSMul`, `mathlib:RingHom.quotientKerEquivOfSurjective`.

**Library.** proposed module `TauCeti/AlgebraicGeometry/Habiro/CoefficientInterfaces`, namespace `TauCeti.HabiroCoefficients`; Lean name `TauCeti.HabiroCoefficients.completedRegulatorTriviality`; refines `HR.6/the-regulator-dies-after-q-minus-one-completion`.

**Sources.**

- `Wagner.v2`, §1.1, paragraph 1.4, printed p.4: “regulator becomes trivial” — The source asserts completion-triviality without its proof. The new proof route is the first-fibre argument and pinned ordinary Nakayama, conditional on HB.7.
- `GSWZ.v2`, Proposition 1.5(f), printed p.11; §3.3, printed p.45: “then fm(0)” — Integral order-one values supply the fibre map, which is the only coefficient integrality needed.

### Field scalar extension of the transported regulator

`HR.6/followup-regulator-scalar-square` · comparison · HR.6 packet

Let F→E be an embedding of number fields, choose one positive Δ divisible by both 6|disc F| and 6|disc E|, R=O_F[1/Δ], S=O_E[1/Δ], H=H_{R/ℤ}, H′=H_{S/ℤ}. HB.7/followup-scalar-equivalence, conditional on effective descent and arithmetic naturality, identifies H_S⊗_{H_R}H_{R,ξ}≅H_{S,res ξ}. Transport this actual module equivalence through κ_R and κ_S to obtain H′⊗_H M_ξ≅M_{res ξ}. Hence Pic(H→H′)(ρ_F(ξ))=ρ_E(res ξ). The Taylor-compatible κ square commutes, and order-one evaluation and c:H→R[[X]], c′:H′→S[[X]] commute with the coefficient map R→S (abstract roots and X fixed). Thus both the first-fibre maps and the completed Picard maps commute. Identity and successive embeddings give the usual tensor-unit and associator coherences. This is exactly the supported scalar comparison; it is not a trace, linear transfer of sections, or a comparison for an arbitrary coefficient change.

**Hypotheses.**

- The common Δ hypothesis ensures both actual coefficient rings and HB.7 lines are defined in the unramified p>3 range.
- Use the HB.7 restriction map on its imported K₃ group, not a reconstructed group.
- HB.7 arithmetic naturality and effective global descent are explicit outstanding supplier hypotheses.

**Proof.**

1. Use HR.5 functoriality and the Taylor-compatible κ_R, κ_S. Coefficient pullback fixes ζ_m and X; the two composites agree on every Taylor coordinate, so the comparison square of ring maps commutes.
2. Apply the actual scalar equivalence HB.7/followup-scalar-equivalence and ordinary iterated tensor-base-change equivalences to conjugate it by κ_R, κ_S. This produces an H′-linear equivalence of the actual lines.
3. Apply CommRing.Pic.mk_eq_mk_iff and Pic.mapRingHom composition. The typed ordinary prototype regulatorScalarSquare_of_ringSquare records precisely the formal Picard step; it does not establish arithmetic naturality.
4. Constant evaluation and every Taylor projection commute with coefficient pullback. Pure tensors therefore give the canonical first-fibre square; applying completed scalar extension gives the completed square. Identity/composition are inherited from HB.7 and the tensor associator, with the same chosen common localization.

**Acceptance.**

- The scalar tensor is over H_{R/ℤ}; an expression S⊗_R M_ξ is not used.
- Field embeddings preserve the abstract cyclotomic coordinate and induce the supported changed K₃ degree.
- The Picard square follows from an actual module equivalence; a class-only formal square cannot replace HB.7 descent.
- Identity and two successive field extensions commute before and after q−1 completion.

**Depends on.** this roadmap: `HR.6/the-transported-regulator`, `HR.6/completed-scalar-extension`, `HR.5/the-relative-habiro-ring`, `HR.5-number-field-comparison/the-number-field-ring`, `HR.6/followup-order-one-fibre`, `HR.6/followup-completed-regulator-triviality`; other roadmaps: `HabiroNumberFields:HB.7/followup-field-pullback`, `HabiroNumberFields:HB.7/followup-scalar-equivalence`, `HabiroNumberFields:HB.7/followup-picard-character`; libraries: `mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange`, `mathlib:TensorProduct.AlgebraTensorModule.distribBaseChange`, `mathlib:CommRing.Pic.mk_eq_mk_iff`, `mathlib:CommRing.Pic.mapRingHom_comp_mapRingHom`, `mathlib:CommRing.Pic.mapRingHom_id`.

**Library.** proposed module `TauCeti/AlgebraicGeometry/Habiro/CoefficientInterfaces`, namespace `TauCeti.HabiroCoefficients`; Lean name `TauCeti.HabiroCoefficients.regulatorScalarSquare`.

**Sources.**

- `GSWZ.v2`, Definition 1.1, (13), printed pp.6–7; Definition 1.4, printed pp.9–10: “gluing property” — Coordinate pullback of the ring/module formulas is the source motivation; scalar equivalence/naturality is the conditional imported HB.7 refinement, not a theorem stated by GSWZ.
- `Wagner.v2`, Corollary 2.13, printed p.19, and proof: “agrees with the Habiro ring” — The ring comparison is coordinatewise and so commutes with a supported coefficient pullback; the common-Δ extension is supplied by the parent node.

## HR.7 — Acceptance tests and executable boundary

*Coverage in `HabiroRings.json`: source_decomposed, 4 nodes.* 4 packet nodes at this stage. Four theorem nodes and unit tests realise the stage's tests; the two register nodes are deleted. A = R = ℤ: HabiroRings:HR.5-number-field-comparison/the-classical-ring and HabiroRings:HR.5/untwisted-relative-habiro-rings. A non-trivial finite étale arithmetic R: HabiroRings:HR.7/the-stage-is-not-the-naive-completion and HabiroRings:HR.7/constant-families-do-not-glue (R = ℤ[∛2][1/6]), with the unit test relativeHabiro_quotient_Phi4_gaussian (R = ℤ[i][1/2]). A toric Λ-base: HabiroRings:HR.5/untwisted-relative-habiro-rings (A = ℤ[x]) and the non-example of HabiroRings:HR.5/completed-base-change. Localisation at a prime: HabiroRings:HR.7/inverting-a-prime (R = ℤ[1/p]; ℤ_(p) is not étale). Φ₅ over 𝔽₁₁: HabiroRings:HR.7/phi-five-over-f-eleven. Same value at one root, different Taylor expansions: unit test taylorComponent_value_ne_expansion of HabiroRings:HR.5/roots-choices-and-substitutions. The zero-dimensional cohomology comparison: HabiroRings:HR.6/the-degree-zero-identification. Checks: the q-Witt transition is the Frobenius (HabiroRings:HR.4/the-transitions-are-frobenius and relativeHabiro.quotientEquiv); square diagrams commute (the gluing squares of Corollary 2.4 in HR.3–HR.4, and can, φ/A and the Taylor components with the change-of-choice isomorphisms); no ring action through incompatible constant families (HabiroRings:HR.7/constant-families-do-not-glue). Executable boundary: the generic equaliser universal property is already Mathlib's (RingHom.eqLocus, CommRingCat.equalizerForkIsLimit) and is not planned; Lemma 2.12's node instantiates it with can and φ/A. The suggested Lean file must be regenerated: it states placeholder theorems of type True, Prop-valued definitions with no content (IsPerfectlyCovered, IsHabiroComplete) and a LambdaRing structure with Unit fields, which §13 and the stage text ('No placeholder proposition or axiom stands for them') forbid. HabiroRings:HR.7/the-stage-is-not-the-naive-completion needs q-Witt v5 Corollary 2.52 as an HR.4 item (same gap).

The layer has four nodes, all theorems of the first packet; it is `source_decomposed`. The first packet realises the stage's tests as theorems and unit tests and removed its two register nodes:

- A = R = ℤ: `HR.5-number-field-comparison/the-classical-ring` and `HR.5/untwisted-relative-habiro-rings`.
- A non-trivial finite étale arithmetic R: `HR.7/constant-families-do-not-glue` and `HR.7/the-stage-is-not-the-naive-completion` for R = ℤ[∛2][1/6], and the unit test `relativeHabiro_quotient_Phi4_gaussian` for R = ℤ[i][1/2].
- A toric Λ-base: `HR.5/untwisted-relative-habiro-rings` for A = ℤ[x], and the non-example of `HR.5/completed-base-change`.
- Localisation at a prime: `HR.7/inverting-a-prime`, for R = ℤ[1/p]; ℤ_(p) is not étale.
- Φ_5 over 𝔽_11: `HR.7/phi-five-over-f-eleven`, four linear factors, not a field.
- Two elements with the same value at one root and different Taylor expansions there: the unit test `taylorComponent_value_ne_expansion` of `HR.5/roots-choices-and-substitutions`.
- The zero-dimensional cohomology comparison: `HR.6/the-degree-zero-identification`.
- The q-Witt transition is the Frobenius: `HR.4/the-transitions-are-frobenius`. The squares commute: the gluing squares of Corollary 2.4 in HR.3–HR.4, and can, φ/A and the Taylor components with the change-of-choice isomorphisms. No ring action through incompatible constant families: `HR.7/constant-families-do-not-glue`.
- The executable boundary: the generic equaliser universal property is Mathlib's, and Lemma 2.12's node instantiates it.

The four theorems are concrete. Φ_5 = (q − 3)(q − 4)(q − 5)(q − 9) over 𝔽_11, so 𝔽_11[q]/Φ_5 ≅ 𝔽_11^4 and ℤ_11[q]^∧_{(11,Φ_5)} is a product of four power-series rings: the counterexample to the p. 18 line and the instance of its repair. ℤ[1/p] makes H_{R/ℤ} a product of infinitely many non-zero factors, so not a domain. Over ℤ[∛2][1/6], a constant family r lies in the equaliser only if φ_p(r) = r for all p ∤ 6, which fails for ∛2 at p = 5, where R̂_5 ≅ ℤ_5 × ℤ_25 and φ_5 swaps the roots of the quadratic factor. For the same R and 5 | m, H_{R/ℤ,m} is not the naive completion R[q]^∧_{(q^m−1)}, since that would give a global Frobenius lift by q-Witt Corollary 2.52.

### Φ_5 splits over 𝔽_11: the counterexample to the p. 18 proof line, and its repair

`HR.7/phi-five-over-f-eleven` · theorem · first packet · added by REV-HabiroRings

Φ_5(q) = q⁴ + q³ + q² + q + 1 splits over 𝔽_11 as (q − 3)(q − 4)(q − 5)(q − 9), the four elements of order 5 in 𝔽_11^× (11 ≡ 1 mod 5). Hence 𝔽_11[q]/Φ_5(q) ≅ 𝔽_11^4 is finite étale over 𝔽_11 but not a field; ℤ_11 ⊗_ℤ ℤ[ζ_5] ≅ ℤ_11^4, ζ_5 ↦ (ω_1, …, ω_4), the primitive fifth roots of unity of ℤ_11 lifting 3, 4, 5, 9; and HabiroRings:HR.5/the-ell-adic-taylor-comparison gives ℤ_11[q]^∧_{(11,Φ_5(q))} ≅ ∏_{i=1}^4 ℤ_11[[q − ω_i]]. This refutes the claim of Lemma 2.12's proof (p. 18) that Φ_m is irreducible modulo every ℓ ∤ m, and is the instance of the repair the HR.5 stage text requires.

**Hypotheses.**

- ℓ = 11 and m = 5; every ℓ ≡ 1 mod m splits Φ_m completely, and Φ_8 is reducible modulo every odd prime.
- The splitting is of the full algebra ℤ_11 ⊗ ℤ[ζ_5], not of a chosen embedding.

**Proof.**

1. 3⁵ = 243 = 22·11 + 1 and 3 ≠ 1, so 3 has order 5 in 𝔽_11^×; its powers 3, 9, 5, 4 are the roots of Φ_5; multiplying out (q − 3)(q − 4)(q − 5)(q − 9) gives q⁴ + q³ + q² + q + 1 modulo 11.
2. The conjugate-residue homomorphism ℤ[ζ_5] → 𝔽_11^4 at α = 3 (tauceti:TauCeti.Cyclotomic.conjugateResiduesRingHom) is surjective (tauceti:TauCeti.Cyclotomic.conjugateResidues_lift) and is the reduction ℤ[ζ_5]/11 ≅ 𝔽_11^4.
3. Hensel-lift the four simple roots to ω_i ∈ ℤ_11 and apply the Chinese remainder theorem (mathlib:Ideal.quotientInfRingEquivPiQuotient).
4. Apply HabiroRings:HR.5/the-ell-adic-taylor-comparison (b).

**Acceptance.**

- Modulo 11⁴ the lifts are 2786, 7825, 1963, 2066 (of 3, 4, 5, 9), each a root of Φ_5 modulo 11⁴.
- The four idempotents of 𝔽_11[q]/Φ_5(q) are the Lagrange polynomials ∏_{j≠i}(q − r_j)/(r_i − r_j), r ∈ {3, 4, 5, 9}.

**Depends on.** this roadmap: `HR.5/the-ell-adic-taylor-comparison`; libraries: `mathlib:Polynomial.cyclotomic`, `mathlib:Ideal.quotientInfRingEquivPiQuotient`, `mathlib:PadicInt`, `tauceti:TauCeti.Cyclotomic.conjugateResiduesRingHom`, `tauceti:TauCeti.Cyclotomic.conjugateResidues_lift`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Proof of Lemma 2.12 (ℓ-adic step), PDF p. 18: “The left-hand side clearly becomes Fℓ[q]/Φm(q) ≃Fℓ(ζm) since the cyclotomic polynomial Φm(q) is irreducible in Fℓ[q] if (m, ℓ) = 1.” — The printed claim that this computation refutes.

### Inverting a prime: H_{ℤ[1/p]/ℤ} and its cyclotomic components

`HR.7/inverting-a-prime` · theorem · first packet · added by REV-HabiroRings

Let p be a prime and R = ℤ[1/p], étale over ℤ. Then H_{R/ℤ} ≅ ℤ[1/p][q]^N ≅ ∏_{a≥0} ℤ[1/p][q]^{S_a}, S_a = {n ∈ N : v_p(n) = a}: after inverting p, orders differing by a power of p are no longer adjacent, H_{R/ℤ} has infinitely many non-zero factors and is not a domain, and the Taylor expansion at ζ_n with p ∤ n is injective on the factor S_0 and zero on the others. The localisation ℤ_(p) at the prime ideal (p) is not an admissible input: it is not of finite presentation, hence not étale, over ℤ.

**Hypotheses.**

- R = ℤ[1/p] with A = ℤ; the stage text's 'localisation at a prime' is read as inverting p, which is étale; ℤ_(p) is excluded by the étaleness hypothesis of 2.7.
- The decomposition is HabiroCyclotomicCompletions HC.5's, imported.

**Proof.**

1. HabiroRings:HR.5/untwisted-relative-habiro-rings with A = ℤ and R = ℤ[1/p].
2. HabiroCyclotomicCompletions:HC.5/inverting-a-prime-and-the-rational-case with Δ = p.
3. ℤ_(p) inverts infinitely many primes and is not a finitely generated ℤ-algebra (mathlib:Algebra.Etale requires finite presentation).

**Acceptance.**

- H_{ℤ[1/p]/ℤ} is not a domain although ℤ[1/p] is.
- Restriction to the orders prime to p is not injective on H_{ℤ[1/p]/ℤ}.

**Depends on.** this roadmap: `HR.5/untwisted-relative-habiro-rings`; other roadmaps: `HabiroCyclotomicCompletions:HC.5/inverting-a-prime-and-the-rational-case`; stages: `HabiroCyclotomicCompletions:HC.5`; libraries: `mathlib:Algebra.Etale`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, 2.7, PDF p. 15: “2.7. Relative Habiro rings. — Let R be an étale A-algebra. For all primes p, the pth Adams operation ψp : A ! A can be uniquely extended to a Frobenius lift ϕp : bRp ! bRp.” — The étaleness hypothesis, which admits Z[1/p] and excludes Z_(p).
- `Wagner.qHodgeHabiro.2025`, Remark 2.8, PDF p. 16: “If we were to construct R[q]∧ (qm−1) using Corollary 2.4, we would take Ed := R[q]∧ Φd(q), together with the identity maps on R[q]∧ (p,Φd(q)) (instead of ϕp/A) as gluing equivalences.” — For R with global Frobenius lifts, here the identity, the stages are the ordinary completions.

### Constant families do not glue over ℤ[∛2][1/6]

`HR.7/constant-families-do-not-glue` · theorem · first packet · added by REV-HabiroRings

Let F = ℚ(∛2), with O_F = ℤ[∛2] and disc F = −108, and R = ℤ[∛2][1/6] = O_F[1/disc F]. A constant family c(r) = (r ⊗ 1)_m ∈ ∏_m R[ζ_m][[q − ζ_m]] lies in the equaliser of Lemma 2.12 if and only if φ_p(r) = r in R̂_p for every prime p ∤ 6. For r = ∛2 and p = 5 this fails: x³ − 2 ≡ (x − 3)(x² + 3x + 4) mod 5 with the quadratic factor irreducible, so R̂_5 ≅ ℤ_5 × ℤ_25 (ℤ_25 the unramified quadratic extension of ℤ_5), φ_5 acts on the second factor by its non-trivial automorphism, and it moves the image of ∛2 there to the other root of the lifted quadratic factor. Hence r ↦ c(r) is not a ring map R → H_{R/ℤ}: H_{R/ℤ} carries no R-algebra structure by constant families, which is the check 'no ring action uses incompatible constant families'. R has no compatible global Frobenius lifts: its only ring endomorphism is the identity.

**Hypotheses.**

- F = ℚ(∛2) is not Galois over ℚ, so no global Frobenius lift exists; for abelian fields GSWZ's footnote 1 gives a different, twisted embedding, which is HB.6's.
- The equaliser is that of Lemma 2.12 with A = ℤ; a constant series re-expands to itself.

**Proof.**

1. For a constant family the (p, m)-component of the equaliser condition reads r ⊗ 1 = φ_p(r) ⊗ 1 in R̂_p ⊗_ℤ ℤ[ζ_{pm}], which is equivalent to φ_p(r) = r because ℤ[ζ_{pm}] is free over ℤ.
2. Modulo 5 the only cube root of 2 is 3, and x² + 3x + 4 has discriminant −7 ≡ 3, a non-square modulo 5; Hensel's lemma gives R̂_5 = ℤ_5[x]/(x³ − 2) ≅ ℤ_5 × ℤ_25.
3. φ_5 is the unique Frobenius lift on the étale ℤ_5-algebra R̂_5 (HabiroRings:HR.1/the-etale-frobenius-lift): the identity on ℤ_5 and the Frobenius automorphism on ℤ_25, which swaps the two roots of the lifted quadratic factor; the image of ∛2 in ℤ_25 is one of them.
4. A ring endomorphism of R extends to an embedding F → F, which is the identity because the other cube roots of 2 are not real.

**Acceptance.**

- φ_5(∛2) ≠ ∛2 in R̂_5, so c(∛2) ∉ H_{R/ℤ}.
- End(R) = {id}.

**Depends on.** this roadmap: `HR.5/the-equaliser-presentation`, `HR.5-number-field-comparison/the-inverted-discriminant-ring-is-etale`, `HR.1/the-etale-frobenius-lift`; libraries: `mathlib:PadicInt`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Remark 2.8, PDF p. 16: “Thus, there’s no reason to expect that HR/A,m ≃R[q]∧ (qm−1), unless R itself (rather than only its p-completions) admits Frobenius lifts for all prime factors p | m.” — The source's condition, global Frobenius lifts on R itself, which this R lacks.
- `Wagner.qHodgeHabiro.2025`, 2.11, PDF p. 17: “where the map on the right is induced by the relative Frobenius ϕp/A from 2.7, followed by a reexpansion of power series as above. We’ll call the map on the left the canonical map and the map on the right the Frobenius.” — The Frobenius arrow acts on coefficients by φ_{p/A}, which is why constants need φ_p(r) = r.

### The stages H_{R/ℤ,m} are not the naive completions for R = ℤ[∛2][1/6]

`HR.7/the-stage-is-not-the-naive-completion` · theorem · first packet · added by REV-HabiroRings

Let R = ℤ[∛2][1/6]. For every m divisible by 5 there is no ℤ[q]-algebra isomorphism H_{R/ℤ,m} ≅ R[q]^∧_{(q^m−1)}; consequently H_{R/ℤ} is not isomorphic to R[q]^N as a ℤ[q]-algebra. This is the nontrivial finite étale arithmetic test of the HR.7 stage text: the Frobenius twist in the gluing is visible.

**Hypotheses.**

- R is étale over ℤ (HabiroRings:HR.5-number-field-comparison/the-inverted-discriminant-ring-is-etale), a domain, and 5 is not invertible in R, so R → R̂_5 is injective and Spec R is connected.
- The obstruction is q-Witt v5 Corollary 2.52, the result Remark 2.8 cites; it must be available as an HR.4 item (gap).

**Proof.**

1. Suppose ψ: H_{R/ℤ,m} ≅ R[q]^∧_{(q^m−1)}; reducing modulo q^m − 1 and using Theorem 2.9 (HabiroRings:HR.4/the-etale-lift) gives q-W_m(R) = q-W_m(R/ℤ) ≅ R[q]/(q^m − 1) as ℤ[q]-algebras (q-W_m(R) = q-W_m(R/ℤ) since Z is a perfect Λ-ring, q-Witt v5 Remark 2.47).
2. q-Witt v5 Corollary 2.52 (HabiroRings:HR.4/relative-q-witt-rings; see the gaps) then says that φ_5 restricts to a ring endomorphism of R.
3. The only endomorphism of R is the identity, but φ_5(∛2) ≠ ∛2 (HabiroRings:HR.7/constant-families-do-not-glue): contradiction.
4. An isomorphism H_{R/ℤ} ≅ R[q]^N would induce one after (q^m−1)-completion (HabiroRings:HR.5/the-relative-habiro-ring and HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products).

**Acceptance.**

- H_{R/ℤ,5} ≇ R[q]^∧_{(q^5−1)}.
- H_{R/ℤ} ≇ R[q]^N, whereas for R = A and for ℤ[1/N] they agree (HabiroRings:HR.5/untwisted-relative-habiro-rings).

**Depends on.** this roadmap: `HR.4/an-isomorphism-with-the-naive-quotient-forces-a-frobenius-lift`, `HR.5/the-relative-habiro-ring`, `HR.7/constant-families-do-not-glue`, `HR.5-number-field-comparison/the-inverted-discriminant-ring-is-etale`, `HR.4/the-etale-lift`, `HR.4/relative-q-witt-rings`; other roadmaps: `HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products`.

**Sources.**

- `Wagner.qHodgeHabiro.2025`, Remark 2.8, PDF p. 16: “Thus, there’s no reason to expect that HR/A,m ≃R[q]∧ (qm−1), unless R itself (rather than only its p-completions) admits Frobenius lifts for all prime factors p | m.” — The source says there is no reason to expect H_{R/A,m} ≃ R[q]^∧ without global Frobenius lifts, and cites the obstruction.
- `Wagner.qWitt.2024`, q-Witt v5, Corollary 2.52, PDF p. 35: “2.52. Corollary. — Let p be a prime and let R be an étale Z-algebra such that R ! bRp is injective (equivalently, p is not invertible on any connected component of Spec R).” — The hypotheses of the obstruction.
- `Wagner.qWitt.2024`, q-Witt v5, Corollary 2.52, PDF p. 35: “If a Z[q]-algebra isomorphism ψ: q9Wm(R) ∼ = −! R[q]/(qm −1) exists for some positive integer m divisible by p, then the unique Frobenius lift ϕp : bRp ! bRp restricts to a morphism ϕp : R ! R.” — Its conclusion, which R contradicts.
- `Wagner.qWitt.2024`, q-Witt v5, before Corollary 2.52, PDF p. 34: “It often appears on first glance that our q-Witt vectors (or later our q-de Rham–Witt complexes) are trivial in the sense of q9Wm(R/A) ∼= R[q]/(qm −1).” — The source's own reading: q-Witt vectors of étale Z-algebras are not the naive ones.

## Mistakes found in the sources

These are recorded under PROTOCOL.md section 18, and every node above uses the corrected statement. There are seventeen, all new, all confirmed by the independent review of the part that records them:

- **The first packet** lists twelve: E1–E8 in Wagner's *q-Hodge complexes over the Habiro ring* and E9–E12 in his *q-Witt vectors and q-Hodge complexes*. One is an error: E5, the claim in the proof of Lemma 2.12 that Φ_m is irreducible modulo every prime ℓ ∤ m, which affects the proof and not the lemma (`HR.5/the-ell-adic-taylor-comparison` repairs it, `HR.7/phi-five-over-f-eleven` is the counterexample). E2, the omitted hypothesis that R is étale in Theorem 2.9, affects a stated result. The rest are misprints.
- **The HR.1 part** lists two misprints in Hesselholt's *The big de Rham–Witt complex*, E13 and E14, checked against the version of record.
- **The HR.4 part** lists three misprints in §2.6 of the q-Witt paper, E15–E17, all of which affect the proofs of Remark 2.49, Lemma 2.50 and Corollary 2.51 but none of their statements.
- **The HR.2, HR.4 and HR.6 parts** reuse findings already recorded, in this roadmap or in HabiroNumberFields; they are listed after the findings.

### HabiroRings/E1 — misprint (affects nothing)

- **Source:** `Wagner.qHodgeHabiro.2025`, Proof of Corollary 2.4, PDF p. 14 (arXiv:2510.04782v2).
- **Recorded in:** the first packet.
- **Printed:** Then Lemma 2.2 implies D̂_{(q^m−1)}(A[q]) ≃ lim_{S∈⌟^r} D̂_S .
- **Correction:** lim_{S∈⌟^T} D̂_S, the poset of non-empty subsets of T defined in the preceding sentence.
- **Reason:** r is the size of the cover in the proof of Lemma 2.2; here the index poset is ⌟^T := P(T) ∖ {∅}, as the rest of the proof uses.
- **Known:** new. Searched: arXiv:2510.04782 abstract page: versions v1 (6 Oct 2025) and v2 (8 Oct 2025); v2 read; author copy https://ferdinand-wagner.github.io/papers/q-Habiro.pdf (14 January 2026): unchanged; author homepage https://ferdinand-wagner.github.io/: no errata listed
- **Review:** confirmed by REV-HabiroRings. Found by the review (checker C2) and checked at the locator in the version read.

### HabiroRings/E2 — misprint (affects a stated result)

- **Source:** `Wagner.qHodgeHabiro.2025`, Theorem 2.9, PDF p. 16 (arXiv:2510.04782v2).
- **Recorded in:** the first packet.
- **Printed:** Let A be a perfectly covered Λ-ring, R an A-algebra, and m ∈ N.
- **Correction:** R an étale A-algebra.
- **Reason:** H_{R/A,m} is constructed in 2.7 only for étale R ('Let R be an étale A-algebra'), and the theorem's own 'étale A[q]/(q^m − 1)-algebra q-W_m(R/A)' requires R étale (q-Witt Proposition 2.48). For R = ℤ[T] over A = ℤ, q-W_1(R) = ℤ[T] is not étale over ℤ[q]/(q − 1) = ℤ.
- **Known:** new. Searched: arXiv:2510.04782 abstract page: versions v1 (6 Oct 2025) and v2 (8 Oct 2025); v2 read; author copy https://ferdinand-wagner.github.io/papers/q-Habiro.pdf (14 January 2026): unchanged; author homepage https://ferdinand-wagner.github.io/: no errata listed
- **Review:** confirmed by REV-HabiroRings. Found by the review (checker C2) and checked at the locator in the version read.

### HabiroRings/E3 — misprint (affects the proof)

- **Source:** `Wagner.qHodgeHabiro.2025`, Proof of Theorem 2.9, PDF p. 17 (arXiv:2510.04782v2).
- **Recorded in:** the first packet.
- **Printed:** Since H_{R/A,m} is (q^m −1)-complete and becomes static modulo p, we see that H_{R/A,m} must be static as well.
- **Correction:** ... becomes static modulo q^m − 1 (its reduction is q-W_m(R/A); equivalently modulo each Φ_d(q), as just shown) ...
- **Reason:** Staticity modulo p does not force staticity of a (q^m − 1)-complete object: M = ℚ[1] with q acting as 1 is (q^m − 1)-complete (q^m − 1 acts by 0) and M/p = 0 is static, but M is not static. Modulo q^m − 1 the conclusion follows by derived Nakayama applied to the complete cohomology groups.
- **Known:** new. Searched: arXiv:2510.04782 abstract page: versions v1 (6 Oct 2025) and v2 (8 Oct 2025); v2 read; author copy https://ferdinand-wagner.github.io/papers/q-Habiro.pdf (14 January 2026): unchanged; author homepage https://ferdinand-wagner.github.io/: no errata listed
- **Review:** confirmed by REV-HabiroRings. Found by the review (checker C2) and checked at the locator in the version read.

### HabiroRings/E4 — misprint (affects nothing)

- **Source:** `Wagner.qHodgeHabiro.2025`, Lemma 2.12, proof after Φ_d(q)-completed rationalisation, PDF pp. 18–19 (arXiv:2510.04782v2).
- **Recorded in:** the first packet.
- **Printed:** Here we use that Q[q]∧ Φd(q) ! Q(ζm)Jq −ζmK is an equivalence. Indeed, this can be checked modulo Φm(q). Since Φm(q) is irreducible and has distinct roots in Q, the same argument as above shows that both sides become Q(ζm) modulo Φm(q), as desired. [...] except if their source is (R ⊗A,ψm A)[ζd]Jq −ζdK.
- **Correction:** Read ζ_d, Φ_d(q) and Q(ζ_d) for ζ_m, Φ_m(q) and Q(ζ_m) in the quoted sentences and in the two displayed formulas of the same step, ((R ⊗_{A,ψ^d} A) ⊗_Z Q(ζ_m))[[q − ζ_m]] for (H_{R/A} ⊗ Q)^∧_{Φ_d(q)} and ((R ⊗_{A,ψ^d} A) ⊗_Z Q[ζ_m])[[q − ζ_m]] for (E ⊗ Q)^∧_{Φ_d(q)} (p. 19); and read ψ^d for ψ^m in the factor (R ⊗_{A,ψ^d} A)[ζ_d][[q − ζ_d]].
- **Reason:** The step fixes d and completes at Φ_d(q); m is the running index of the product, and the text itself later writes Q[q]∧Φd(q) ≃ Q(ζd)Jq −ζdK (p. 19).
- **Known:** new. Searched: arXiv:2510.04782 abstract page, 2026-09-25: versions v1 (6 Oct 2025) and v2 (8 Oct 2025) only, comments '82 pages', no erratum; author page https://guests.mpim-bonn.mpg.de/ferdinand/ (2026-09-25): lists q-Habiro.pdf, no errata; the author copy (8 Oct 2025, SHA-256 bfa3dfb5…) prints the same text at the locator
- **Review:** confirmed by REV-HabiroRings. Found by the review (checker C3) and checked at the locator in the version read.

### HabiroRings/E5 — error (affects the proof)

- **Source:** `Wagner.qHodgeHabiro.2025`, Lemma 2.12, proof after ℓ-completion, PDF p. 18 (arXiv:2510.04782v2).
- **Recorded in:** the first packet.
- **Printed:** The left-hand side clearly becomes Fℓ[q]/Φm(q) ≃Fℓ(ζm) since the cyclotomic polynomial Φm(q) is irreducible in Fℓ[q] if (m, ℓ) = 1. ... It follows that Zℓ[ζm]Jq −ζmK/(ℓ, Φm(q)) ≃Fℓ(ζm) as well.
- **Correction:** Φ_m is separable, not irreducible, over F_ℓ when ℓ ∤ m: F_ℓ[q]/Φ_m(q) ≅ F_ℓ ⊗_Z Z[ζ_m] is a product of φ(m)/f copies of F_{ℓ^f}, f the order of ℓ in (Z/m)^×, and is a field only when ℓ generates (Z/m)^×. Replace F_ℓ(ζ_m) by this finite étale algebra throughout; Φ_m(q)/(q − ζ_m) is still a unit of (F_ℓ[q]/Φ_m(q))[[q − ζ_m]] because its constant term Φ_m'(ζ_m) divides mζ_m^{m−1}, so both sides reduce to F_ℓ[q]/Φ_m(q) and the conclusion Z_ℓ[q]^∧_{(ℓ,Φ_m(q))} ≅ Z_ℓ[ζ_m][[q − ζ_m]] stands (HabiroRings:HR.5/the-ell-adic-taylor-comparison).
- **Reason:** Φ_5 ≡ (q − 3)(q − 4)(q − 5)(q − 9) mod 11 (11 ≡ 1 mod 5; recomputed), and Φ_8 = q⁴ + 1 is reducible modulo every odd prime, e.g. q⁴ + 1 ≡ (q² + q + 2)(q² + 2q + 2) mod 3. The atlas stage text HabiroRings:HR.5 already flags the line.
- **Known:** new. Searched: arXiv:2510.04782 abstract page, 2026-09-25: versions v1 (6 Oct 2025) and v2 (8 Oct 2025) only, comments '82 pages', no erratum; author page https://guests.mpim-bonn.mpg.de/ferdinand/ (2026-09-25): lists q-Habiro.pdf, no errata; the author copy (8 Oct 2025, SHA-256 bfa3dfb5…) prints the same text at the locator
- **Review:** confirmed by REV-HabiroRings. Found by the review (checker C3) and checked at the locator in the version read.

### HabiroRings/E6 — misprint (affects nothing)

- **Source:** `Wagner.qHodgeHabiro.2025`, Proof of Corollary 3.13, PDF p. 27 (arXiv:2510.04782v2).
- **Recorded in:** the first packet.
- **Printed:** If R is étale, then combining this observation with Theorem 3.11(a) and [Wag24, Proposition 3.31] shows q9HdgR/A/(qm −1) ≃q9Wm(R/A) ≃HR/A/(qm −1) .
- **Correction:** Theorem 3.11(b): the filtration on the quotient modulo q^m − 1 with graded pieces Σ^{−*}qW_m dR^* is what computes the quotient; part (a) only provides the Habiro–Hodge complex. The TeX reference is \cref{thm:HabiroDescent}\cref{enum:HabiroDescent}, the label of part (a).
- **Reason:** With Corollary 3.31 and [Wag24, Proposition 3.31] the graded pieces vanish in positive degrees and are qW_m(R/A) in degree 0, which is a statement about 3.11(b).
- **Known:** new. Searched: arXiv:2510.04782 abstract page, 2026-09-25: versions v1 (6 Oct 2025) and v2 (8 Oct 2025) only, comments '82 pages', no erratum; author page https://guests.mpim-bonn.mpg.de/ferdinand/ (2026-09-25): lists q-Habiro.pdf, no errata; the author copy (8 Oct 2025, SHA-256 bfa3dfb5…) prints the same text at the locator
- **Review:** confirmed by REV-HabiroRings. Found by the review (checker C3) and checked at the locator in the version read.

### HabiroRings/E7 — misprint (affects nothing)

- **Source:** `Wagner.qHodgeHabiro.2025`, Proofs of Lemma B.2 (PDF pp.77–78) and Lemma B.3 (PDF p.78).
- **Recorded in:** the first packet.
- **Printed:** 'consider the Postikov filtration'; 'the filtration is complete and exaustive'; 'By the usual derived Nayama lemma'
- **Correction:** Postnikov; exhaustive; Nakayama.
- **Reason:** Spelling; the intended words are clear from the context.
- **Known:** new. Searched: arXiv versions v1 and v2 of 2510.04782; The author's thesis (same text, PDF pp.219–220)
- **Review:** confirmed by REV-HabiroRings. Found by the review (checker C1) and checked at the locator in the version read.

### HabiroRings/E8 — misprint (affects nothing)

- **Source:** `Wagner.qHodgeHabiro.2025`, Proof of Lemma B.2, the two-term resolution of Rr, PDF p.78 (arXiv:2510.04782v2).
- **Recorded in:** the first packet.
- **Printed:** where the first arrow sends (a_i)_{i⩾0} ↦ (a_i −(q; q)_i a_{i−1})_{i⩾0} (with a_{−1} := 0) and the second arrow sends (a_i)_{i⩾0} ↦ Σ_{i⩾0} a_i/(q; q)_i
- **Correction:** The first arrow should send (a_i) to (a_i − (1 − q^i)·a_{i−1}); equivalently, keep the printed first arrow and let the second send (a_i) to Σ_i a_i/∏_{j≤i}(q;q)_j.
- **Reason:** The composite of the printed arrows is not zero: e_1 ↦ e_1 − (q;q)_2 e_2 ↦ 1/(1 − q) − (q;q)_2/(q;q)_2 = q/(1 − q) ≠ 0 (and similarly for e_2, e_3; computed symbolically). With 1 − q^i the composite vanishes because (1 − q^i)/(q;q)_i = 1/(q;q)_{i−1}, matching the transition maps (1 − q^{n+1}) of the fibre formula a few lines earlier in the same proof.
- **Known:** new. Searched: arXiv listing https://arxiv.org/abs/2510.04782: v1 (6 Oct 2025) and v2 (8 Oct 2025), no later version (accessed 2026-09-25); Author's thesis 'q-Hodge filtrations, Habiro cohomology, and ku', https://guests.mpim-bonn.mpg.de/ferdinand/q-Thesis.pdf (PDF dated 15 Aug 2025, SHA-256 d074047f202ee7e64298801b15327a9a634b6f7b6e4bcd5be7b2fda959ad876c): Lemma B.2's proof on PDF p.220 prints the same arrow; Web search for the paper, the author's pages and MPG.PuRe record: no erratum found
- **Review:** confirmed by REV-HabiroRings. Found by the review (checker C1) and checked at the locator in the version read.

### HabiroRings/E9 — misprint (affects nothing)

- **Source:** `Wagner.qWitt.2024`, Lemma 2.4, PDF p. 9 (arXiv:2410.23078v5).
- **Recorded in:** the first packet.
- **Printed:** and let f_1, . . . , f_s be a finitely many elements of A
- **Correction:** finitely many elements of R
- **Reason:** The lemma is about a ring R; there is no A in it.
- **Known:** new. Searched: arXiv:2410.23078 abstract page: versions v1–v5 (v5 of 6 Oct 2025 read); author copies https://ferdinand-wagner.github.io/papers/q-Witt.pdf (14 January 2026) and https://guests.mpim-bonn.mpg.de/ferdinand/q-Witt.pdf (8 October 2025): unchanged; author homepage https://ferdinand-wagner.github.io/: no errata listed; sourceIssues of research/blueprint/packets/HabiroCyclotomicCompletions.json and HabiroCohomologyFoundations--HQ.1.json
- **Review:** confirmed by REV-HabiroRings. Found by the review (checker C2) and checked at the locator in the version read.

### HabiroRings/E10 — misprint (affects nothing)

- **Source:** `Wagner.qWitt.2024`, 2.6, PDF p. 10 (arXiv:2410.23078v5).
- **Recorded in:** the first packet.
- **Printed:** F_{m/d} : W_m(R) → W_d(R) and V_{m/d} : W_d(R) → W_d(R)
- **Correction:** V_{m/d} : W_d(R) → W_m(R)
- **Reason:** The Verschiebung raises the level: the same sentence makes V_{m/d} W_m(R)-linear for the F_{m/d}-module structure on W_d(R), and Definition 2.8(b) has V_{m/d} : W_d → W_m.
- **Known:** new. Searched: arXiv:2410.23078 abstract page: versions v1–v5 (v5 of 6 Oct 2025 read); author copies https://ferdinand-wagner.github.io/papers/q-Witt.pdf (14 January 2026) and https://guests.mpim-bonn.mpg.de/ferdinand/q-Witt.pdf (8 October 2025): unchanged; author homepage https://ferdinand-wagner.github.io/: no errata listed; sourceIssues of research/blueprint/packets/HabiroCyclotomicCompletions.json and HabiroCohomologyFoundations--HQ.1.json
- **Review:** confirmed by REV-HabiroRings. Found by the review (checker C2) and checked at the locator in the version read.

### HabiroRings/E11 — misprint (affects nothing)

- **Source:** `Wagner.qWitt.2024`, Corollary 2.35, PDF p. 28 (arXiv:2410.23078v5).
- **Recorded in:** the first packet.
- **Printed:** Let R be a Λ-ring. Then the ring morphism c_m : W_m(A) → A[q]/(q^m −1)
- **Correction:** Let A be a Λ-ring.
- **Reason:** The statement and its proof concern the Λ-ring A of Lemma 2.34; R does not occur again.
- **Known:** new. Searched: arXiv:2410.23078 abstract page: versions v1–v5 (v5 of 6 Oct 2025 read); author copies https://ferdinand-wagner.github.io/papers/q-Witt.pdf (14 January 2026) and https://guests.mpim-bonn.mpg.de/ferdinand/q-Witt.pdf (8 October 2025): unchanged; author homepage https://ferdinand-wagner.github.io/: no errata listed; sourceIssues of research/blueprint/packets/HabiroCyclotomicCompletions.json and HabiroCohomologyFoundations--HQ.1.json
- **Review:** confirmed by REV-HabiroRings. Found by the review (checker C2) and checked at the locator in the version read.

### HabiroRings/E12 — misprint (affects nothing)

- **Source:** `Wagner.qWitt.2024`, Proposition 2.48, PDF p. 33 (arXiv:2410.23078v5).
- **Recorded in:** the first packet.
- **Printed:** where the tensor product is taken with respect to the Frobenius map F_{m/d} : q-W_m(R/A) → q-W_{m/d}(R/A).
- **Correction:** F_{m/d} : q-W_m(R/A) → q-W_d(R/A).
- **Reason:** F_{m/d} maps level m to level d (Definition 2.40(b)), and the tensor product in the proposition is with q-W_d(R/A).
- **Known:** new. Searched: arXiv:2410.23078 abstract page: versions v1–v5 (v5 of 6 Oct 2025 read); author copies https://ferdinand-wagner.github.io/papers/q-Witt.pdf (14 January 2026) and https://guests.mpim-bonn.mpg.de/ferdinand/q-Witt.pdf (8 October 2025): unchanged; author homepage https://ferdinand-wagner.github.io/: no errata listed; sourceIssues of research/blueprint/packets/HabiroCyclotomicCompletions.json and HabiroCohomologyFoundations--HQ.1.json
- **Review:** confirmed by REV-HabiroRings. Found by the review (checker C2) and checked at the locator in the version read.

### HabiroRings/E13 — misprint (affects the proof)

- **Source:** `H-published`, Proposition 1.14, final paragraph of proof, published p.150; also arXiv:1006.3125v3 p.15.
- **Recorded in:** the HR.1 packet.
- **Printed:** i₁+2i₂+⋯+riᵣ=n
- **Correction:** The distinct factor indices satisfy i₁+i₂+⋯+iᵣ=n.
- **Reason:** In ∏_(d≥1)(1−a_d t^d), the term a₁a₂ contributes to t³. The printed weighted condition assigns it degree 1+2·2=5. The corrected degree-three coefficient is −a₃+a₁a₂.
- **Known:** new. Searched: https://arxiv.org/abs/1006.3125 — submission history ends with v3; the latest preprint retains the slips.; https://web.math.ku.dk/~larsh/papers/028/ — author’s paper page has no correction linked.; https://link.springer.com/article/10.1007/s11511-015-0124-y — publisher’s article page has no correction linked.; Public title/DOI searches with erratum, corrigendum and correction on 2026-10-06 found no correction of these slips.
- **Review:** confirmed by REV-HabiroRings--HR.1. Read the preprint and visually checked the version-of-record page. Expansion of the first three factors confirms the unweighted index sum; the proposition itself is unchanged.

### HabiroRings/E14 — misprint (affects nothing)

- **Source:** `H-published`, §2, paragraph introducing the right adjoint R to the forgetful U, published p.162; also arXiv:1006.3125v3 p.24.
- **Recorded in:** the HR.1 packet.
- **Printed:** with the counit and unit maps defined by
- **Correction:** Replace “counit and unit” by “unit and counit”: λ:(A,λ)→(W(A),Δ_A) is the unit, while ε_A:W(A)→A is the counit of U⊣R.
- **Reason:** A unit has source an object of the coalgebra category and target RU of that object, exactly the displayed λ. A counit has source UR(A) and target A, exactly ε_A. The maps and adjunction are correct; only their names are reversed.
- **Known:** new. Searched: https://arxiv.org/abs/1006.3125 — submission history ends with v3; the latest preprint retains the slips.; https://web.math.ku.dk/~larsh/papers/028/ — author’s paper page has no correction linked.; https://link.springer.com/article/10.1007/s11511-015-0124-y — publisher’s article page has no correction linked.; Public title/DOI searches with erratum, corrigendum and correction on 2026-10-06 found no correction of these slips.
- **Review:** confirmed by REV-HabiroRings--HR.1. Read both versions and visually checked published p.162; the displayed domains/codomains fix the reversal unambiguously.

### HabiroRings/E15 — misprint (affects the proof)

- **Source:** `Wagner.qWitt.2024`, Lemma 2.50 proof, printed p.34, arXiv:2410.23078v5; author copy 14 January 2026 p.33.
- **Recorded in:** the HR.4 packet.
- **Printed:** W_m(R′) ≅ coker(M′ ⊕ N′ → W_m(R′)[q]); equip W_{m/d}(R)[q]
- **Correction:** The left side of the first expression is qW_m(R′). The module carrying the F_{m/d}-action is W_d(R)[q].
- **Reason:** Definition 2.10 gives the q-Witt quotient, not W_m. For m=3 and R′=ℤ, the cokernel qW_3(ℤ)≅ℤ[q]/(q³−1) has additive rank three, while W_3(ℤ), a ghost lattice in ℤ², has additive rank two. The displayed summands and the explicitly displayed codomain of F_{m/d} are W_d, not W_{m/d}.
- **Known:** new. Searched: https://arxiv.org/abs/2410.23078: history through v5 (6 October 2025), no later version or erratum listed, checked 2026-10-06.; https://ferdinand-wagner.github.io/: paper entry and author copy q-Witt.pdf dated 14 January 2026; no correction linked. The same local expressions remain on pp.33–34.; Public searches for the title plus erratum/corrigendum/correction on 2026-10-06 found no correction.; All existing packet sourceIssues were searched: parent E12 concerns Proposition 2.48, while HR.1 E13/E14 concern Hesselholt; these three findings are distinct.
- **Review:** confirmed by REV-HabiroRings--HR.4. Confirmed in arXiv v5 p.34 and the author copy p.33: the displayed cokernel is the q-Witt quotient, not the ordinary Witt ring, and the F_{m/d} target is W_d. The m=3, R′=ℤ rank comparison distinguishes the first expressions; the module summands distinguish the second. Corrected the author-copy page locator.

### HabiroRings/E16 — misprint (affects the proof)

- **Source:** `Wagner.qWitt.2024`, Remark 2.49, printed p.33, arXiv:2410.23078v5; author copy 14 January 2026 p.33.
- **Recorded in:** the HR.4 packet.
- **Printed:** qW_m(R) → qW_m(R′); W_{p^α}(R) → W_{p^α}(R′)
- **Correction:** In this remark about ordinary Witt vectors the introductory map is W_m(R)→W_m(R′). The two bottom objects of the F_p pushout square are W_{p^(α−1)}(R) and W_{p^(α−1)}(R′).
- **Reason:** The remark supplies the ordinary-Witt analogue needed to prove q-Witt étaleness; using q-Witt étaleness as its starting point would be circular. The upper objects have truncation set divisors of p^α; F_p lowers that set to divisors of p^(α−1). At α=1 the lower objects are W_1=R,R′, not W_p.
- **Known:** new. Searched: https://arxiv.org/abs/2410.23078: history through v5 (6 October 2025), no later version or erratum listed, checked 2026-10-06.; https://ferdinand-wagner.github.io/: paper entry and author copy q-Witt.pdf dated 14 January 2026; no correction linked. The same local expressions remain on pp.33–34.; Public searches for the title plus erratum/corrigendum/correction on 2026-10-06 found no correction.; All existing packet sourceIssues were searched: parent E12 concerns Proposition 2.48, while HR.1 E13/E14 concern Hesselholt; these three findings are distinct.
- **Review:** confirmed by REV-HabiroRings--HR.4. Confirmed in Remark 2.49 p.33 of both copies. The introductory étaleness input must be ordinary Witt étaleness. F_p lowers divisors of p^α to divisors of p^(α−1), so both lower labels must have exponent α−1; the α=1 case has lower rings R and R′.

### HabiroRings/E17 — misprint (affects the proof)

- **Source:** `Wagner.qWitt.2024`, Corollary 2.51 proof, printed p.34, arXiv:2410.23078v5; author copy 14 January 2026 p.34.
- **Recorded in:** the HR.4 packet.
- **Printed:** M := ⊕_{d|m} qW_d(R/A)
- **Correction:** Sum over proper divisors d|m, d<m, and use that same proper-divisor indexing for the Verschiebung map.
- **Reason:** The printed indexing includes d=m and V_1=id, so the purported ghost cokernel is zero. At m=1 and R=A=ℤ the actual ghost is the identity of ℤ; the corrected proper-divisor sum is empty, while the printed sum has cokernel zero.
- **Known:** new. Searched: https://arxiv.org/abs/2410.23078: history through v5 (6 October 2025), no later version or erratum listed, checked 2026-10-06.; https://ferdinand-wagner.github.io/: paper entry and author copy q-Witt.pdf dated 14 January 2026; no correction linked. The same local expressions remain on pp.33–34.; Public searches for the title plus erratum/corrigendum/correction on 2026-10-06 found no correction.; All existing packet sourceIssues were searched: parent E12 concerns Proposition 2.48, while HR.1 E13/E14 concern Hesselholt; these three findings are distinct.
- **Review:** confirmed by REV-HabiroRings--HR.4. Confirmed in Corollary 2.51 p.34 of both copies. Including d=m introduces the identity Verschiebung V_1, making the displayed cokernel zero. At m=1, A=R=ℤ the ghost is the identity of ℤ; only the proper-divisor indexing gives the correct cokernel.

**Findings reused by the parts.** These were recorded and confirmed elsewhere, and the parts use their corrections without recording them again:

- `HabiroRings/E8` (recorded in `HabiroRings.json`), used by the HR.2 packet: Use the already reviewed correction 1−q^i, not P_i, in the localization two-term resolution. No duplicate erratum is filed.
- `HabiroRings/E2` (recorded in `HabiroRings.json`), used by the HR.4 packet: Theorem 2.9 assumes R étale.
- `HabiroRings/E3` (recorded in `HabiroRings.json`), used by the HR.4 packet: Staticity is detected modulo q^m−1, not modulo p.
- `HabiroRings/E12` (recorded in `HabiroRings.json`), used by the HR.4 packet: F_{m/d} in Proposition 2.48 has target qW_d, not qW_{m/d}.
- `HabiroRings/E6` (recorded in `HabiroRings.json`), used by the HR.6 packet: Use Theorem 3.11(b) rather than (a) in the Corollary 3.13 reduction argument. Confirmed again in the 14 January 2026 author copy; do not duplicate the finding.
- `HabiroNumberFields/E23` (recorded in `HabiroNumberFields.json`), used by the HR.6 packet: Accepted HB.7 G-global-descent remains upstream of this fibre argument; multiplication of local conditions is not tensor bijectivity.
- `HabiroNumberFields/E24` (recorded in `HabiroNumberFields.json`), used by the HR.6 packet: Use the accepted corrected integral linear-jet contract upstream. No whole Taylor-series integrality is asserted here.
- `HabiroNumberFields/E26` (recorded in `HabiroNumberFields.json`), used by the HR.6 packet: Unproved global abelian generator claim is not needed for this proof and is not used.

## Gaps

The six packets record eighteen gaps: eight in the first packet, and two, two, two and four in the HR.2, HR.3, HR.4 and HR.6 parts. The follow-up parts answer most of the first packet's: its two HR.1 gaps are supplied by the HR.1 part; the gap on completed étale deformations is planned by the HR.4 part, conditionally on supplier refinements; and the gaps on spectral modules, on the higher-categorical inputs of descent and on the regulator are refined into exact requests or conditional proofs. What remains open is supplier work in other roadmaps (light solid spectra, the enhanced categorical and derived-completion refinements, the étale theory of big Witt vectors, HB.7's descent and naturality), the Lean carriers those suppliers would provide, and one mathematical question: a non-trivial pre-completion regulator class. The status after each gap says which. The first packet still lists the gaps the parts answer; it is not a deliverable of the assembly, and the handoff note lists the records to change.

### Λ-rings as big-Witt coalgebras versus the torsion-free Adams form, and big Witt vectors

*Recorded by the first packet.* The sources' Λ-rings carry a structure map s : A → W(A) to the big Witt vectors (q-Witt 2.31: 'The cofree Λ-ring under A is the big Witt ring W(A)'), and the Adams operations are ψ^m = gh_m ∘ s; the q-Witt constructions of HR.4 use s and the δ_m. HR.1 defines Λ-rings in the stage text's torsion-free Adams-operation form. The comparison (for torsion-free A, commuting Frobenius lifts ψ^p determine a unique s with gh_m ∘ s = ψ^m: Wilkerson's theorem, via Dwork's lemma) is proved in neither source, and big Witt vectors W_S(A) for truncation sets S are not in Mathlib, which has only the p-typical WittVector (Mathlib/RingTheory/WittVector/Defs.lean:52), and no atlas stage owns them. NEXT SOURCE ACTION: obtain Wilkerson, 'Lambda-rings, binomial domains, and vector bundles over CP(∞)' (1982) or Borger, 'The basic geometry of Witt vectors I', and decide the owner of big Witt vectors together with HR.4.

Needed by: `HR.1/lambda-rings-with-commuting-adams-operations`, `HR.4/relative-q-witt-rings`.

**Supplied.** The HR.1 part plans the comparison at target level: `HR.1/dwork-ghost-image`, `HR.1/big-witt-comonad`, `HR.1/lambda-coalgebra`, `HR.1/adams-to-witt-section` and `HR.1/wilkerson-comparison`, which is an equivalence on torsion-free rings. Big Witt vectors on truncation sets are `HR.4/truncated-big-witt-vectors`, the interim owner under RS-10. REV-HabiroRings--HR.1 asks that this gap record be removed from the first packet; it is not a deliverable of the assembly, so the record stays there.

### Free Λ-rings: construction and perfect covering

*Recorded by the first packet.* The HR.1 stage text requires free Λ-rings among the examples, and Wagner 1.22(e) asserts without proof that every free Λ-ring ℤ{x_i | i ∈ I} is perfectly covered. The free Λ-ring on one generator is the ring of symmetric functions with ψ^m(f)(x_1, x_2, …) = f(x_1^m, x_2^m, …) (so ψ^2(e_1) = e_1^2 − 2e_2 and ψ^3(e_1) = e_1^3 − 3e_1e_2 + 3e_3, checked symbolically, with ψ^p(e_k) ≡ e_k^p mod p for k ≤ 3, p ≤ 3). Symmetric functions in infinitely many variables are not in Mathlib; the universal property in the torsion-free Adams form needs the Wilkerson comparison; and faithful flatness of ψ^m on them has no proof in either source.

Needed by: `HR.1/perfectly-covered`.

**Supplied.** The HR.1 part constructs L(I) with its universal property and proves every ψ^m faithfully flat (`HR.1/free-lambda-ring`, `HR.1/free-lambda-universal-property`, `HR.1/free-adams-local-presentations`, `HR.1/free-lambda-perfect-cover`). As for the first gap, REV-HabiroRings--HR.1 asks that the record be removed from the first packet.

### Solid light condensed spectra have no supplier

*Recorded by the first packet.* Wagner B.6–B.8 work in Mod_{S_H}(Sp■), solid light condensed spectra after Clausen–Scholze, and B.8's proof sketch uses ∏_ℕ S ⊗■ ∏_ℕ S ≃ ∏_{ℕ×ℕ} S and compact generation of Mod_{S_H}(Sp■) by ∏_ℕ S_H, cited to [CS24, Lectures 5–6] (video lectures) and [Bos23, Proposition A.3]. VS2's stage text supplies condensed and solid modules over rings ('Use Mathlib's CondensedMod ... derived solid tensor/Hom'), not solid spectra. Either a supplier for Sp■ is named, or B.7–B.8 are restated for ℤ[q^{±1}]-modules in solid abelian groups with their own proof.

Needed by: `HR.2/habiro-complete-solid-spectra`, `HR.2/the-solid-comparison-is-bounded-below`.

**Open, refined.** The HR.2 part restates it as G-solid, with the exact generic contract a supplier must meet, and adds its three solid nodes to the consumers. RS-10 names SolidAnalyticRings SA.1 as the owner of light solid spectra; see Boundaries.

### Spectral module categories for the spectral Habiro completion

*Recorded by the first packet.* B.1 defines Habiro-complete S[q^{±1}]-module spectra; this needs the E∞-ring spectra S[q^{±1}] and S_Rr and their module ∞-categories with relative smash product. H.6, the atlas supplier, gives cofibres, derived completion and lim¹ but not these; smash products are StableHomotopyKTheory H.5:S-delooping's ('Supply smash products and the pairing on homotopy groups') and spectral module categories are EnhancedDerivedSheaves E5:spectra-comparison's late return ('compare its concrete spectra and spectral module categories with the abstract stable/monoidal construction'). HR.2's derived-category nodes do not need them; the spectral comparison of the-monoidal-structure and the solid nodes do.

Needed by: `HR.2/the-monoidal-structure`, `HR.2/habiro-complete-solid-spectra`, `HR.2/the-solid-comparison-is-bounded-below`.

**Refined into requests.** The HR.2 part plans the spherical localization and the spectral Habiro completion as nodes and routes their prerequisites to exact requests: spectra and S[ℤ] to StableHomotopyKTheory H.5, cofibres and lim¹ to H.6, module objects and the spectral comparison to EnhancedDerivedSheaves E5. What remains missing is the requested supplier statements, and the Lean carriers (G-signatures).

### Unique completed deformations of étale algebras

*Recorded by the first packet.* For a commutative ring B, a finitely generated ideal I and an étale B/I-algebra C there is a unique, up to a contractible space of choices, I-complete E∞-algebra C̃ over B^∧_I with C̃ ⊗^L_B B/I ≃ C; it is static and I-completely étale, and maps between such lifts correspond to maps of their reductions. The Habiro–q-Witt comparison uses this for B = A[q] with I = (q^m − 1), (Φ_d(q)) and (p, Φ_d(q)). Mathlib has only the uniqueness of lifts of maps along square-zero ideals (Algebra.FormallyEtale.comp_bijective, Mathlib/RingTheory/Etale/Basic.lean:77), not the existence of lifts of étale algebras along complete thickenings nor the E∞ statement (Lurie, Higher Algebra §7.5; Elkik). No atlas stage owns it: DerivedDeRhamCohomology DD.1's stage text names complete flatness and complete faithfully flat descent, not étale deformations.

Needed by: `HR.4/the-etale-lift`.

**Planned, conditionally.** The HR.4 part plans the deformation theory: object lifting across any quotient, nilpotent rigidity, completion, the map equivalence and the unique complete principal deformation, with the cyclotomic ghost coherence for Theorem 2.9. Its derived and enhanced inputs are requests to DD.1, E1 and E5:abstract, recorded in the HR.4 part's first gap.

### Big Witt vectors of étale maps

*Recorded by the first packet.* For an étale map R → R′ and m ≥ 1: W_m(R) → W_m(R′) is étale, and W_m(R′) ⊗_{W_m(R), F_{m/d}} W_d(R) ≅ W_d(R′) for d | m (van der Kallen, Theorem 2.4; Borger, Theorem 9.2 and Corollaries 5.4 and 9.4; Langer–Zink, Corollary A.18; q-Witt Remark 2.49 explains how the Frobenius form, which it says is not stated in this generality in the literature, follows). Neither pinned library has big Witt vectors (library audit AUDIT-19), and no atlas stage owns their étale theory.

Needed by: `HR.4/q-witt-vectors-of-etale-maps`.

**Open.** The HR.4 part keeps it and files the request with QWittVectors QW.0, the permanent owner of big Witt vectors under RS-10, which is a draft and not yet in the atlas.

### Higher-categorical inputs of the general descent principle

*Recorded by the first packet.* Four statements the general descent principle needs and no stage owns: (i) straightening of cocartesian fibrations over a poset (EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening is restricted to Δ, products with intervals and refinement diagrams); (ii) Lurie, Higher Algebra Proposition 2.2.1.9: a localisation L with L(x ⊗ y) ≃ L(L(x) ⊗ y) is symmetric monoidal on the full sub-∞-operad; (iii) Lurie, HTT Corollary 5.5.3.4 and Proposition 5.5.3.13: Pr^L ≃ (Pr^R)^op and limits in Pr^L are computed in Cat_∞, together with CAlg(−) commuting with such limits; (iv) the dual of Higher Algebra Lemma 1.2.4.15 (a cubical diagram whose edges become equivalences has the expected limit). EnhancedDerivedSheaves E3 and E5 own adjoint functors, presentable categories, operads and algebra objects, but none of these four statements.

Needed by: `HR.3/the-general-descent-principle`.

**Open, refined.** The HR.3 part decomposes it into five exact requests to E0, E3, E5:abstract, E5:presentability and DD.1, sufficient for the finite diagrams here, and records the rest as its first gap. The arbitrary-site version keeps its size and accessibility boundary.

### The vanishing of the regulator classes after (q−1)-completion is asserted, not proved

*Recorded by the first packet.* Wagner §1.4 (p. 4) says 'the regulator becomes trivial after (q −1)-completion!' without proof or reference. Proving that c^*(κ^*H_{R,ξ}) is free over R[[q−1]] needs HB.7's description of H_{R,ξ} at the order-1 factor (GSWZ Definition 1.4, where f_1 ∈ ε_1(ξ)K[[x]], with the local sections of Definition 1.3 and Theorem 1), which neither this packet nor the HabiroNumberFields packet decomposes at m = 1. Separately, for the loss to be actual one needs a ξ whose class in Pic(H_{O_F[1/Δ]}) is non-zero; GSWZ §1.5 (p. 10) says only that H_{R,ξ} 'is not necessarily free, but it is of rank one and locally free'. NEXT ACTION: read GSWZ §3.2–3.3 (proofs of Theorems 1 and 2) for the order-1 component and for an explicit non-trivial class, and ask HB.7 for the m = 1 evaluation of H_{R,ξ}.

Needed by: `HR.6/the-regulator-dies-after-q-minus-one-completion`.

**Refined.** The HR.6 part proves the vanishing by the order-one fibre and Nakayama (`HR.6/followup-order-one-fibre`, `HR.6/followup-completed-regulator-triviality`), conditional on HB.7's effective descent (G-global-descent). The existence of a non-trivial class is the separate gap G-nonzero-regulator.

### Light solid spectra have no assigned supplier (G-solid)

*Recorded by the HR.2 packet.* Create Artin v-stacks, solid and lisse coefficient categories, Part II: light solid spectra, building on VS2, H.5 and E5. The exact generic contract is: light profinite hypersheaves of spectra; fully faithful symmetric monoidal discrete functor left adjoint to point evaluation; Null and the internal-Hom 1−σ* solidity criterion; discrete spectra solid; limit/colimit closure, accessible solidification and symmetric monoidal coherence; Null■≃∏_NS compact generator; (∏_NS)⊗■(∏_NS)≃∏_{N²}S with functorial maps; split finite-free tower tensor and derived relative-base-change compatibility, not arbitrary tensor/limit commutation; countable limits commuting with ω₁-filtered colimits; compatible t-structure and uniformly bounded-below simplicial resolution/realization comparison sufficient for B.8; the null-family calculation at hypersheaf/spectrum level including higher homotopy. Wagner B.6/B.8 and thesis §§5.1–5.3 state/recollect these, but their full spectral foundations are delegated to lecture recordings; only Bosco’s algebraic p-adic proof was established from a written primary source here. No source theorem read here proves that spectral supplier contract in full. Do not mark HR.2 closed or pretend CondensedMod.IsSolid is this category. The discrete-spectrum functor preserves finite products, but a countable product of condensed complete units must not be identified with the condensed completion of an ordinary spectral product without a separate comparison. The countable solid block calculation does not assume that identification.

Needed by: `HR.2/solid-habiro-unit-idempotence`, `HR.2/completed-countable-free-solid-modules`, `HR.2/countable-solid-habiro-tensor`, `HR.2/habiro-complete-solid-spectra`, `HR.2/the-solid-comparison-is-bounded-below`.

**Open.** RS-10 makes SolidAnalyticRings SA.1 the owner; the HR.2 part proposes a VStackSheavesAndLisseCategories Part II instead (see Structural proposals).

### Spectral and solid typed signatures await the imported carriers (G-signatures)

*Recorded by the HR.2 packet.* The pins have LaurentPolynomial, DerivedCategory and LightCondMod, but no Sp, spectral module category, light hypersheaf spectra or solid tensor types. The suggested file therefore contains an exact name/statement ledger for all unavailable spectral definitions, APIs and tests, and actual typed signatures/examples only for the polynomial and proper-profile calculations. No placeholder proposition or private spectrum carrier is introduced. Replacing the ledger by typed signatures is required after H.5/E5 and the G-solid supplier land; elaboration of the current file checks only the existing algebraic/index interfaces.

Needed by: `HR.2/spherical-rational-localization`, `HR.2/spectral-habiro-completion`, `HR.2/solid-habiro-unit-idempotence`, `HR.2/completed-countable-free-solid-modules`, `HR.2/countable-solid-habiro-tensor`.

**Open** until the StableHomotopyKTheory H.5, EnhancedDerivedSheaves E5 and light-solid carriers exist.

### Unwritten supplier refinements for the four categorical inputs

*Recorded by the HR.3 packet.* The parent gap is now decomposed into the exact E0 finite-poset/section/cube, E5:abstract monoidal-localization/operadic-limit, and E5:presentability adjoint-reversal/categorical-limit requests above, together with the supporting E3 and DD.1 contracts. Existing E0/E5 packet nodes define straightening, algebra objects and presentable categories but do not state all these results. Requests are plans, not evidence that those statements have been proved or that the parent arbitrary-poset-site theorem is closed. The rescope proposal gives these generic statements one foundational owner. Acceptance of that scope and supplier nodes meeting these requests remain to be checked.

Needed by: `HR.3/coherent-completion-diagram`, `HR.3/finite-localisation-contract`, `HR.3/reconstruction-functor`, `HR.3/prime-edge-mapping-spaces`.

**Open.** The five requests stand; the HR.3 part's restructuring proposal assigns each statement to one foundational owner.

### Derived and operadic Lean signatures require the supplied enhanced carriers

*Recorded by the HR.3 packet.* The pinned libraries have the quasicategory predicate and the ordinary nerve, but no API for Pr^L_st, E∞-algebra sections, their mapping spaces, or derived monoidal localization. The suggested file gives actual signatures, API and examples for the finite index. It records every other proposed declaration and test by name in mathematical comments with its exact missing carrier and supplier. No opaque carrier, arbitrary proposition field or vacuous theorem substitutes for them. Instantiate these comments as signatures after E0/E3/E5 and DD.1 expose the requested carriers; the Lean compilation checks only the finite index signatures.

Needed by: `HR.3/coherent-completion-diagram`, `HR.3/finite-localisation-contract`, `HR.3/reconstruction-functor`, `HR.3/prime-edge-mapping-spaces`.

**Open** until E0, E3, E5 and DD.1 expose their carriers.

### Supplier refinements and inherited big-Witt étale theorem are not yet decomposed

*Recorded by the HR.4 packet.* The completed étale-object deformation gap is supplied at target level by this seven-node graph. The parent Λ/Wilkerson gap is imported from accepted HR.1. The parent big-Witt étale/Frobenius-pushout gap remains a QW.0 obligation, not proved by quoting Remark 2.49 or the still-draft QW roadmap. Exact DD.1 regular-tower, E1 static algebra and E5:abstract compatibility refinements, and HR.3’s own generic supplier gaps, are also open. The requests identify their sole owners and consumers; they are not implementation claims.

Needed by: `HR.4/complete-principal-deformation-universality`, `HR.4/cyclotomic-ghost-lift-coherence`, `HR.4/q-witt-vectors-of-etale-maps`, `HR.4/ghost-maps-and-etale-base-change`.

**Open.** The QW.0, DD.1, E1 and E5:abstract requests stand, with HR.3's inherited supplier gaps.

### Enhanced and coefficient signatures lack supplied Lean carriers

*Recorded by the HR.4 packet.* The pinned libraries have ordinary étale algebras and completion but no installed big/relative q-Witt, Λ/Adams, derived complete E∞ algebra, or enhanced coherent-section API. The suggested file elaborates genuine ordinary marked algebra/completion signatures, all 24 API items and seven discriminating definition/construction tests. Its two enhanced targets are explicitly named mathematical omissions with exact supplier contracts. They must be instantiated using supplied carriers; no opaque stand-in or proposition-valued placeholder counts as a signature.

Needed by: `HR.4/complete-principal-deformation-universality`, `HR.4/cyclotomic-ghost-lift-coherence`.

**Open** until the enhanced carriers and the q-Witt and Λ-ring carriers are installed.

### Actual HB.7 global lines and inverse tensor certificates remain conditional (G-global-descent)

*Recorded by the HR.6 packet.* Import the accepted HabiroNumberFields--HB.7 G-global-descent exactly: additive closure of Definition 1.4, finite projectivity, actual chart base changes and conservative descent must be proved. The finite SUM inverse certificate used here follows from HB.7/followup-tensor-bijectivity once that contract holds. GSWZ §3.3 only verifies multiplication/gluing, not effective global descent. The new Nakayama proof closes the downstream reasoning, not this upstream gap.

Needed by: `HR.6/followup-order-one-fibre`, `HR.6/followup-completed-regulator-triviality`, `HR.6/followup-regulator-scalar-square`.

**Open**, with HabiroNumberFields HB.7.

### Supported field-change interfaces still inherit HB.7 naturality (G-arithmetic-naturality)

*Recorded by the HR.6 packet.* The exact common-Δ field scalar equivalence, Kummer/Chern torsor restriction and completed-regulator naturality are HB.7/followup-field-pullback and followup-scalar-equivalence contracts, conditional on its accepted G-arithmetic-naturality. Their existing D.1/D.4/M.8 requests stay with HB.7. Do not promote the formal Picard square to an arithmetic theorem without those inputs.

Needed by: `HR.6/followup-regulator-scalar-square`.

**Open**, with HabiroNumberFields HB.7.

### No rigorous nontrivial pre-completion regulator class is supplied (G-nonzero-regulator)

*Recorded by the HR.6 packet.* The parent asks for F, Δ, ξ such that the actual transported line has Picard class different from 1. Wagner paragraph 1.4 asserts nontrivial geometry; GSWZ printed p.10 reports numerical comparisons of knots in the cubic discriminant −23 field but does not give a nonfreeness proof for such a line. The completed triviality argument does not produce one, and nonzero K₃, a nonzero local regulator, or a nonzero ring-kernel idempotent is insufficient. No source-supported example was established in this pass. This remains an explicit target-level gap, not a proposed false theorem.

Needed by: `HR.6/followup-completed-regulator-triviality`, `HR.6/the-regulator-dies-after-q-minus-one-completion`.

**Open.** No source read so far gives a non-trivial example; GSWZ report numerical comparisons only.

### Actual K₃ and enhanced coefficient carriers are not installed at the pins (G-signatures-and-enhanced-inputs)

*Recorded by the HR.6 packet.* The pins supply ordinary invertible modules, Picard maps, power series and Nakayama, not actual indexed Habiro modules, relative Habiro rings, chosen q-Hodge pairs or enhanced complete E∞ module categories. The suggested file types the ordinary-module core and formal Picard square and gives an exact omission ledger for the unavailable actual signatures. The inherited HR.4 complete-principal deformation universality and HR.2/HQ derived completion/monoidal interfaces also retain their own supplier refinements. Install genuine imported carriers and discharge those recorded supplier obligations; no private stand-in or Prop-valued axiom field is used.

Needed by: `HR.6/followup-order-one-fibre`, `HR.6/followup-completed-regulator-triviality`, `HR.6/followup-regulator-scalar-square`, `HR.6/the-degree-zero-identification`, `HR.6/completed-scalar-extension`.

**Open** until the K₃ and enhanced carriers are installed.

## Requests

The six packets file 39 requests with other roadmaps: eighteen in the first packet and one, ten, five, four and one in the HR.1, HR.2, HR.3, HR.4 and HR.6 parts. They are the precise statements this roadmap needs and its suppliers do not yet state. Several are refinements of the same supplier stages by successive parts; they are listed as each packet files them.

| Supplier | Part | What is asked | Needed by |
|---|---|---|---|
| `PrismaticCohomology:PR.0` | first packet | δ-rings (p-derivations) and their equivalence with Frobenius lifts on p-torsion-free rings (stage text: 'Construct p-derivations/delta-rings, free delta-algebras and Frobenius lifts. Prove their equivalence with a lift of Frobenius only in p-torsionfree rings'), which identifies the Λ-structure at one prime with the δ-structure δ_p(x) = (ψ^p(x) − x^p)/p and makes each R̂_p of HR.1 a δ-ring with Frobenius φ_p. The all-prime Λ-structure is this roadmap's own, as the HR.1 stage text says. | `HR.1/lambda-rings-with-commuting-adams-operations`, `HR.1/the-etale-frobenius-lift` |
| `HabiroCyclotomicCompletions:HC.1` | first packet | The factorial polynomials (q;q)_N and the mutual cofinality of the ideals ((q;q)_N) and ((q^m − 1)^k) under divisibility (nodes HC.1/the-factorial-polynomials and HC.1/cofinality-of-the-factorial-products; stage text: 'prove cofinality of P_N(q)=∏_{i=1}^N(1−q^i). This identifies the completion with lim_N R[q]/(P_N), and with the system of completions at q^m−1 using divisibility in m'), used for the telescope presentation of Rr and for B.2(c); and the ordinary completion ℤ[q]^{ℕ>0} (HC.1/the-cyclotomic-completion), which is the unit of HR.2's completed category and which HR.5-number-field-comparison compares with. HR.2 constructs only the derived completion. HR.5 and HR.7 also use the ring R[q]^N = lim_m R[q]^∧_{(q^m−1)} for R = ℤ, ℤ[1/N] and perfectly covered Λ-rings. | `HR.2/habiro-complete-modules`, `HR.5/untwisted-relative-habiro-rings`, `HR.5-number-field-comparison/the-classical-ring`, `HR.7/the-stage-is-not-the-naive-completion`, `HR.2/the-two-term-resolution`, `HR.2/completeness-via-the-factorial-tower` |
| `HabiroCyclotomicCompletions:HC.3` | first packet | The p-adic closeness of roots, the re-expansion maps with their cocycle law and the Taylor maps (HC.3/p-adic-closeness-of-roots, HC.3/p-adic-re-expansion, HC.3/the-taylor-map; HC.3: 'every re-expansion uses topological nilpotence in a proved complete coefficient ring. Construct the relevant p-adic re-expansion maps and their cocycle law'). | `HR.5/roots-choices-and-substitutions`, `HR.5-number-field-comparison/the-classical-ring`, `HR.5-number-field-comparison/the-number-field-ring` |
| `HabiroCyclotomicCompletions:HC.4` | first packet | The comaximality of cyclotomic polynomials with non-prime-power ratio and the congruence Φ_{p^e n} ≡ Φ_n^d modulo p with p ∈ (Φ_n, Φ_{p^e n}) (nodes HC.4/cyclotomic-comaximality-and-resultant and HC.4/cyclotomic-congruence-and-prime-ideal; HC.4 stage text: 'Prove the cyclotomic resultant/comaximality lemmas'), the arithmetic input to HR.3's intersection calculation, to the ghost quotient of HR.4 and to HR.5's splitting repair. HR.6 also uses the rootwise Taylor injectivity over ℤ (HC.4/rootwise-taylor-injectivity). | `HR.3/the-divisor-poset-and-its-intersections`, `HR.6/the-q-minus-one-completion-is-not-injective`, `HR.4/q-witt-vectors` |
| `DerivedDeRhamCohomology:DD.1` | first packet | Derived completion at a finitely generated (here principal) ideal: completeness by vanishing of derived Hom from A[1/f], the reflective completion lim_n M/f^n, and conservativity of reduction on derived complete objects (stage text: 'construct derived I-completeness by vanishing of derived Hom from A[1/f] ... Prove independence of generators, adjunction, idempotence and conservativity of reduction on derived complete objects'), i.e. the 'usual derived Nakayama lemma' of B.3; and the bounded-torsion criterion under which derived and classical completions agree ('Prove the bounded-torsion criteria'), for the static p-completions of 2.7. The Habiro completion lim_m (−)^∧_(q^m−1) is a limit of these and is built in HR.2. HR.3 and HR.4 also use its left adjointness, its dependence only on the radical and (x ⊗ y)^∧ ≃ (x^∧ ⊗ y)^∧, for the cyclotomic completions and the finite stages. | `HR.2/habiro-complete-modules`, `HR.1/perfectly-covered`, `HR.1/the-etale-frobenius-lift`, `HR.2/completeness-via-the-factorial-tower`, `HR.2/the-derived-nakayama-lemma`, `HR.3/the-morphism-level-statement`, `HR.3/the-fracture-square-pieces`, `HR.4/the-finite-relative-habiro-rings`, `HR.4/the-etale-lift`, `HR.4/the-limit-of-the-finite-stages-is-static` |
| `EnhancedDerivedSheaves:E0` | first packet | The ∞-categorical setting: limits and colimits with mapping-space universal properties and the stable-category API (stage text: 'Construct equivalences, slices, limits and colimits with their mapping-space universal properties for the categories used below. Develop the stable-category API: zero objects, fibres/cofibres, suspension, exact functors'), for the limits lim_m (−)^∧_(q^m−1) and lim_n M/(q;q)_n and the fibre sequences of HR.2, and for HR.3's diagram of completed categories. HR.3's general descent principle also uses its cocartesian fibrations and straightening (E0 stage text: 'Construct coCartesian fibrations and coCartesian sections for the diagram shapes used here'); straightening over a general poset is recorded as a gap. | `HR.2/habiro-complete-modules`, `HR.3/the-divisor-poset-and-its-intersections`, `HR.2/completeness-via-the-factorial-tower`, `HR.3/the-general-descent-principle` |
| `EnhancedDerivedSheaves:E5:abstract` | first packet | Symmetric monoidal ∞-categories and monoidal localisations (stage text: 'Construct symmetric monoidal infinity categories via coCartesian fibrations over finite pointed sets, Segal conditions, operadic algebras, modules and monoidal functors with their coherent universal properties'), in particular [L-HA, Proposition 2.2.1.9], which Wagner 2.1 uses to make a localisation satisfying 2.1(c) symmetric monoidal. The stage text contains no descent or conservativity statements, so the former need ('the abstract descent and conservativity statements HR.2's detection results ... specialise') is not supported: the detection results B.2–B.4 are proved directly in HR.2. HR.3's descent principle is stated for the commutative algebra objects CAlg(−) of E5:abstract's ∞-operads; HR.3 owns Wagner's Lemma 2.2 itself. | `HR.2/the-detection-results`, `HR.3/the-morphism-level-statement`, `HR.2/the-monoidal-structure`, `HR.3/the-general-descent-principle`, `HR.3/the-complete-descent-corollary` |
| `StableHomotopyKTheory:H.6` | first packet | Replaces the request to H.3, the plus construction (stage text: 'For a connected CW-type space X and a perfect normal subgroup P of π₁X, construct X → X⁺_P'), which is unrelated to HR.2; the atlas lists H.6 among HR.2's requirements. From H.6: cofibres E/m, completion by the derived inverse system and the Milnor lim¹ sequence (stage text: 'Define E/m as the cofiber of multiplication by m on a spectrum ... Define p-completion by the derived inverse system of E/p^r. Construct the Milnor lim¹ exact sequence'), for the spectral form of B.1–B.4 and the comparison with the derived form. Smash products and spectral module categories over S[q^{±1}] are not in H.6's text (gap). | `HR.2/the-monoidal-structure`, `HR.2/habiro-complete-solid-spectra`, `HR.2/the-solid-comparison-is-bounded-below` |
| `VStackSheavesAndLisseCategories:VS2` | first packet | The qualified solid formalism (stage text: 'Use Mathlib's CondensedMod ... Construct the missing solidification universal property, derived solid tensor/Hom and the generators/exactness needed for FS VII.1'), for B.6–B.8. VS2's text is about solid modules over rings; B.7–B.8 need solid light condensed spectra (gap). VS2 has depth 30 in the atlas against HR.2's 10, so this prerequisite moves HR.2 and everything after it; see the restructure proposal. | `HR.2/the-solid-comparison-is-bounded-below`, `HR.2/habiro-complete-solid-spectra` |
| `HabiroCohomologyFoundations:HQ.3` | first packet | Theorem 3.11 (HQ.3/habiro-descent): the Habiro–Hodge complex and the ascending filtration on its reductions modulo q^m − 1 with graded pieces Σ^{−*}q-W_m dR^*; Definition 3.2 (HQ.3/q-hodge-filtrations), against which the (q−1)-adic filtration of an étale algebra is checked; and the multiplicative upgrade of 3.50–3.51 (HQ.3/multiplicative-upgrades). HQ.3 must not itself state Corollary 3.13, which the HR.6 and HQ.5 stage texts give to HR.6. | `HR.6/the-degree-zero-identification` |
| `HabiroCohomologyFoundations:HQ.4` | first packet | Corollary 3.31 (HQ.4/hodge-against-nygaard: q-W_m dR^n ≃ Σ^{−n} q-W_mΩ^n for smooth algebras) and the étale base change of q-de Rham–Witt complexes, q-Witt v5 Proposition 3.31 (HQ.4/etale-base-change-and-the-sheaf-property), which together give q-W_m dR_{R/A} ≃ q-W_m(R/A) in degree 0 for étale R. HR.4 does not depend on HQ.4. HR.4 does not import HQ.4: HQ.4's stage text says 'Import degree-zero q-Witt rings and their operations from HR.4', so a prerequisite of an HR.4 node on HQ.4 would be a stage cycle. | `HR.6/the-degree-zero-identification` |
| `HabiroCohomologyFoundations:HQ.5` | first packet | That the canonical q-Hodge filtration of Theorem 4.11 on an étale A-algebra is the (q−1)-adic one (compare §1.14, p. 8, for relative dimension ≤ 1), so that Corollary 3.13 computes algebraic Habiro cohomology of Spec R (1.16); and the exported finite étale object (HQ.5: 'For finite étale arithmetic inputs export the completed cohomology object to HR.6, which owns its degree-zero comparison with HR.5'). | `HR.6/the-degree-zero-identification` |
| `HabiroNumberFields:HB.6` | first packet | GSWZ's ring H_{O_F[1/Δ]} for Δ divisible by disc F with its Frobenius φ_p on R̂_p and gluing condition (HB.6/coefficient-rings-and-frobenius, HB.6/the-gluing-condition), and its comparison with Habiro's ring for F = Q, Δ = 1 (HB.6/ring-operations-and-the-classical-comparison). HB.6's stage text: 'Export this explicit ring and its Taylor/Frobenius maps to HabiroRings HR.5 ... HB.6 can be constructed first; the later HR comparison is not an input to HB.6.' | `HR.5-number-field-comparison/the-number-field-ring` |
| `HabiroNumberFields:HB.7` | first packet | The invertible modules H_{R,ξ} of GSWZ Definition 1.4 (HB.7/the-global-module) with H_{R,0} = H_R and H_{R,ξ} ⊗ H_{R,ξ'} ≅ H_{R,ξ+ξ'} (HB.7/operations-on-the-modules), for 6·disc F ∣ Δ, and their order-1 component (HB.7/invertible-local-sections), from which the (q−1)-completion of H_{R,ξ} is computed. | `HR.6/the-transported-regulator`, `HR.6/the-regulator-dies-after-q-minus-one-completion` |
| `EnhancedDerivedSheaves:E1` | first packet | The enhanced derived ∞-category of modules over A[q^{±1}] with derived tensor product and derived internal Hom, and identification of equivalences by cohomology (stage text: 'Construct the derived tensor product from the K-flat model ... Construct symmetric monoidal coherence, derived internal Hom, change of coefficients ... Provide identification of equivalences by quasi-isomorphisms and by cohomology sheaves'), in which RHom(Rr, M), the completed tensor product and the Postnikov argument of B.2(d) live. E1 is upstream of DD.1, which HR.2 already requires. | `HR.2/habiro-complete-modules`, `HR.2/the-two-term-resolution`, `HR.2/completeness-on-homotopy-groups`, `HR.2/the-monoidal-structure` |
| `EnhancedDerivedSheaves:E3` | first packet | Reflective full subcategories of presentable ∞-categories with their adjunction data (stage text: 'Construct accessible localizations and reflective/coreflective full subcategories in the applicable presentable categories'), for the reflective subcategory D̂_H ⊆ D(A[q^{±1}]) with left adjoint Habiro completion. E3 is upstream of DD.1. HR.3 also uses its Kan extensions with the pointwise formula, in the dual form for right Kan extensions (stage text: 'Prove the left Kan extension theorem along a full inclusion, its pointwise formula using slice categories, its uniqueness'). | `HR.2/completeness-via-the-factorial-tower`, `HR.3/the-general-descent-principle`, `HR.3/the-morphism-level-statement` |
| `EnhancedDerivedSheaves:E5:presentability` | first packet | Presentable ∞-categories (E5:presentability/presentable-categories), the setting Pr^L_st of HR.3's descent principle. | `HR.3/the-general-descent-principle` |
| `HabiroCyclotomicCompletions:HC.5` | first packet | The decomposition of ℤ[1/Δ][q]^N into the factors ℤ[1/Δ][q]^{S_a} with the behaviour of the Taylor maps (HC.5/inverting-a-prime-and-the-rational-case; HC.5: 'Compute R=ℚ and R=ℤ[1/p] examples: inversion changes which orders are adjacent'). | `HR.6/the-q-minus-one-completion-is-not-injective`, `HR.7/inverting-a-prime` |
| `DerivedDeRhamCohomology:DD.1` | HR.1 packet | Inherited HR.1 interface only: derived principal p-completion, derived Nakayama on p-complete objects, and the bounded-torsion criterion equating derived and classical completion, for the completion criterion and étale Frobenius lift. These accepted parent targets remain imported. | `HR.1/perfectly-covered`, `HR.1/the-etale-frobenius-lift` |
| `StableHomotopyKTheory:H.5:spectra` | HR.2 packet | Concrete Sp, cofibres, integer homotopy, complete Postnikov t-structure and filtered-colimit homotopy comparison; do not import the E5 spectra-comparison return back into early H.5. | `HR.2/spherical-rational-localization`, `HR.2/spectral-habiro-completion` |
| `StableHomotopyKTheory:H.5:S-delooping` | HR.2 packet | Presentable closed symmetric monoidal Sp with the required E∞ refinement, sphere and group ring S[Z]; H.5 explicitly owns smash products, so HR.2 does not reconstruct spectra. | `HR.2/spherical-rational-localization`, `HR.2/spectral-habiro-completion` |
| `StableHomotopyKTheory:H.6` | HR.2 packet | Principal cofiber homotopy exact sequences, homotopy inverse limits with Milnor lim¹, and complete/exhaustive filtered-spectrum convergence with a uniform two-degree graded amplitude; generalize the scalar integer cofiber interface to module endomorphisms via E5 module objects. | `HR.2/spectral-habiro-completion` |
| `EnhancedDerivedSheaves:E3` | HR.2 packet | Accessible reflective full subcategories of presentable stable categories, with enhanced adjunction and uniqueness. Exhibit accessibility before invoking the reflection. The light-solid limit/colimit interface remains in G-solid, rather than being presumed from this abstract adjoint theorem. | `HR.2/spectral-habiro-completion` |
| `EnhancedDerivedSheaves:E5:abstract` | HR.2 packet | Import module-objects and algebra-objects; additionally supply coherent E∞ localization, relative module tensor products and HA 2.2.1.9 for tensor-ideal localizations. This is a requested extension of this generic owner, not a private Habiro module-category model. Supply the compact-generator extension-of-scalars theorem for module categories used by the solid-unit node; the solid category and its generator remain the separate G-solid input. | `HR.2/spherical-rational-localization`, `HR.2/spectral-habiro-completion`, `HR.2/solid-habiro-unit-idempotence`, `HR.2/completed-countable-free-solid-modules`, `HR.2/countable-solid-habiro-tensor` |
| `EnhancedDerivedSheaves:E5:spectra-comparison` | HR.2 packet | HA 7.1.2.13: Mod_{H(A)}≃D(A) with A-relative symmetric monoidal comparison and change-of-scalars. Underlying restriction to S[q±1] preserves Habiro completion by the localization base-change identity, but is only lax monoidal. | `HR.2/spectral-habiro-completion` |
| `DerivedDeRhamCohomology:DD.1` | HR.2 packet | Generic principal derived completion and cofinal-tower comparison in the enhanced module setting; HR.2 adds only the cyclotomic family. | `HR.2/spectral-habiro-completion` |
| `HabiroCyclotomicCompletions:HC.1` | HR.2 packet | Reuse factorial polynomials, mutual cofinality with principal q^m−1-power ideals, static integral completion, and polynomial monic division. Supply finite-free quotient rank deg(P_n)=n(n+1)/2; this is the ordinary polynomial toolkit, not a new spectral definition. Normalize P_n by (−1)^n before invoking monic division, and supply the compatible integral quotient bases; HR.2 proves the spectral basis comparison and S-linear tower splitting. | `HR.2/spherical-rational-localization`, `HR.2/spectral-habiro-completion`, `HR.2/solid-habiro-unit-idempotence`, `HR.2/completed-countable-free-solid-modules`, `HR.2/countable-solid-habiro-tensor` |
| `QSeriesPartitionsAndMockModularForms:QM.0` | HR.2 packet | Import q-binomial-coefficient: Gaussian polynomials have integral coefficients and P_aP_b divides P_{a+b}, including a=0 or b=0. Only this polynomial identity is used, not analytic q-series. | `HR.2/countable-solid-habiro-tensor` |
| `VStackSheavesAndLisseCategories:VS2` | HR.2 packet | Only the HZ-relative compatibility with solid abelian groups and their derived solid tensor. VS2 does not supply light solid spectra or justify replacing the spherical unit by HZ. | `HR.2/solid-habiro-unit-idempotence`, `HR.2/completed-countable-free-solid-modules`, `HR.2/countable-solid-habiro-tensor` |
| `EnhancedDerivedSheaves:E0` | HR.3 packet | For the nerves of the finite posets Q(m), its surviving subposet, P(m), their slice categories and products with Δ¹, supply coCartesian straightening/unstraightening with fibrewise evaluation and naturality, and the coherent-section model for limits in Cat_∞ (HTT 3.2.0.1, dualized, and 3.3.3.2). Supply the mapping-space universal property on sections, including Map_{lim C_S}(x,y)≃lim_S Map_{C_S}(x_S,y_S) for coCartesian sections. For a height-one finite poset, identify this limit of spaces with the homotopy equalizer of the product of vertex mapping spaces and the product of target mapping spaces over incidences, retaining one specified path per incidence and all higher simplices. Verify that elimination of the common chain component turns a chain of length r+1 into r successive prime-edge paths. Supply the finite stable cubical contraction: if an augmented r-cube has equivalences along one coordinate, it is Cartesian, so its initial value is the limit over nonempty subsets; prove by fibres, using the dual of HA 1.2.4.15. This needs only finite diagrams for HR.3; do not assume an unrestricted arbitrary-site straightening theorem. | `HR.3/coherent-completion-diagram`, `HR.3/finite-localisation-contract`, `HR.3/reconstruction-functor`, `HR.3/prime-edge-mapping-spaces` |
| `EnhancedDerivedSheaves:E3` | HR.3 packet | For the accessible reflective completion subcategories, supply coherent adjunction units, counits, mates and their identity/composition/pasting laws. Supply the dual of the pointwise full-inclusion Kan-extension theorem (HTT 4.3.2 as planned in EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion): right Kan extensions are computed by limits over (S↓j). For the inclusions P(m) ↪ surviving subsets ↪ Q(m), handle empty slices (terminal value), the initial object S when S already belongs to the included subposet, and the singleton slice at the unique maximal chain for a surviving nonsingleton S not in P. Supply invariance of the total limit under such a right Kan extension, with the induced equivalences on sections and transformations. | `HR.3/coherent-completion-diagram`, `HR.3/finite-localisation-contract`, `HR.3/reconstruction-functor` |
| `EnhancedDerivedSheaves:E5:abstract` | HR.3 packet | For an accessible localization L of a presentable stable symmetric monoidal category whose tensor preserves colimits separately, if L(x⊗y)→L(L(x)⊗y) is an equivalence, construct the monoidal localization on the full sub-operad, with unit L(1) and tensor L(x⊗y); give its unit map and coherent functorial restriction to nested local subcategories (HA 2.2.1.9). The right-adjoint inclusions are canonically lax monoidal. For finite diagrams of these completed monoidal categories with strong monoidal transition functors, supply CAlg(lim C_S)≃lim CAlg(C_S) with mapping-space compatibility, by operadic sections (HA 2.1.3.1). Also supply finite limits of E∞ algebras in a fixed monoidal category, created by the underlying-object functor (HA 3.2.2.1 and 3.2.2.3, specialized by 3.2.2.4, with their operadic hypotheses). These are distinct limit statements; the fixed-category result alone does not prove the varying-category result. | `HR.3/coherent-completion-diagram`, `HR.3/reconstruction-functor`, `HR.3/prime-edge-mapping-spaces` |
| `EnhancedDerivedSheaves:E5:presentability` | HR.3 packet | For the size range of D(A[q]) and its accessible complete subcategories, construct Pr^L_st and Pr^R_st and their adjoint-reversal equivalence, natural on diagrams (HTT 5.5.3.4). Prove that limits of finite diagrams of presentable stable categories and colimit-preserving exact functors are their Cat_∞ limits, with colimits componentwise (HTT 5.5.3.5, 5.5.3.12–13); stability follows pointwise. This concerns limits of categories, not a claim that each localization functor preserves arbitrary limits of objects. | `HR.3/coherent-completion-diagram` |
| `DerivedDeRhamCohomology:DD.1` | HR.3 packet | For B=A[q] and finitely generated I_S=(Φ_d:d∈S), supply accessible exact Koszul-model derived completion, the reflective adjunction, radical and generator independence, L_I L_J≃L_(I+J) coherently, tensor compatibility L_I(M⊗^L N)≃L_I(L_I M⊗^L N), completeness closed under limits and derived Nakayama. Explicitly, for I=(g₁,…,gᵣ) the completion unit induces N/(g₁,…,gᵣ)≃(L_I N)/(g₁,…,gᵣ), with derived cofibre quotients; this reduction invariance is the input that turns L_{Φ_d}N=0 into N/Φ_d=0. For a unit ideal the complete category is zero. Supply the underlying-module comparison for E∞-B-algebra completion in the completed tensor category. These are the finite-ideal specializations of the generic DD.1 completion package; no unconditional ordinary quotient-tower formula or staticity is needed. | `HR.3/coherent-completion-diagram`, `HR.3/finite-localisation-contract`, `HR.3/reconstruction-functor` |
| `QWittVectors:QW.0` | HR.4 packet | Permanent owner on atomic RS-10 installation: big Witt vectors on divisor truncation sets; étaleness of W_m(R)→W_m(R′) for every étale map, and the Frobenius pushout W_m(R′)⊗_{W_m(R),F_{m/d}}W_d(R)≅W_d(R′), without F-finiteness hypotheses. Include the filtered finite-type descent and truncation-set decomposition in Remark 2.49. Existing HR.4/truncated-big-witt-vectors is the interim definition, not a proof of these étale theorems. The theorem’s unexpanded literature inputs remain an honest supplier gap. | `HR.4/q-witt-vectors-of-etale-maps`, `HR.4/ghost-maps-and-etale-base-change` |
| `DerivedDeRhamCohomology:DD.1` | HR.4 packet | Supply the generic exact derived completion, completeness closed under limits, reduction invariance and derived Nakayama already requested by HR.2/3. Refine the principal regular specialization: for f a nonzerodivisor and E flat over B, derived completion is lim_n E/f^nE; it is the ordinary completion, static and f-regular. If derived f-complete C has static derived C/f, successive-power cofibre triangles and the Milnor sequence imply C is static and f-regular and π₀C ordinarily f-complete. For overlaps in flat twisted A[q]-algebras, (p,Φ_d) is a regular two-generator ideal: give the ordinary quotient-tower comparison and radical-independence coherences for its completion. No unconditional t-exactness, no noetherian hypothesis and no surjectivity of the m-divisor transition maps are asserted. | `HR.4/complete-principal-deformation-universality`, `HR.4/cyclotomic-ghost-lift-coherence`, `HR.4/the-etale-lift`, `HR.4/the-limit-of-the-finite-stages-is-static` |
| `EnhancedDerivedSheaves:E1` | HR.4 packet | Supply the fully faithful embedding of ordinary static commutative B-algebras into actual enhanced commutative B-algebras (compatible with the completed monoidal setting), identifying mapping spaces between static algebras with the discrete algebra-hom sets. Supply fibre/limit and Milnor-sequence interfaces for the regular quotient towers used here, in the required universe. Staticity and contractible marked comparison fibres must be expressed using real enhanced carriers. | `HR.4/complete-principal-deformation-universality`, `HR.4/cyclotomic-ghost-lift-coherence` |
| `EnhancedDerivedSheaves:E5:abstract` | HR.4 packet | Supply actual E∞-B-algebra objects, their equivalences and mapping spaces, the complete-base action, and compatibility of forgetful functors with the finite completion/section limits already requested by HR.3. Identify the static complete algebra subcategory with ordinary complete algebras and retain the path data in HR.3 prime-edge section mapping spaces. Do not replace enhanced objects by ordinary rings plus an arbitrary proposition. | `HR.4/complete-principal-deformation-universality`, `HR.4/cyclotomic-ghost-lift-coherence` |
| `HabiroNumberFields:HB.7` | HR.6 packet | Supply, for actual Definition 1.4 modules and m=1, a canonical ε_1-torsor trivialization, the H_R→R-semilinear map f↦f_1(0) valued in R by Proposition 1.5(f), and compatibility with addition, module scalars and graded multiplication. Carry the accepted effective global descent/tensor certificate and supported field scalar/naturality contracts explicitly, including common Δ. This is a small HB.7 API extension, not a second K₃ or line construction. | `HR.6/followup-order-one-fibre`, `HR.6/followup-completed-regulator-triviality`, `HR.6/followup-regulator-scalar-square` |

**Requests other roadmaps have filed with this one.** HabiroCohomologyFoundations' HQ.1 packet files five requests, by stage. The nodes that answer them are listed here, so that the consumer can cite node ids rather than stages.

| Asked of | What is asked | Answered by |
|---|---|---|
| HR.1 | Λ-rings with commuting Adams operations and perfectly covered Λ-rings in both equivalent descriptions, with the torsion-freeness of the base | `HR.1/lambda-rings-with-commuting-adams-operations`, `HR.1/perfectly-covered`, `HR.1/the-colimit-perfection` (already cited by id) |
| HR.2 | Habiro-complete objects, the completion functor, the detection results, the completed monoidal structure, and the record that the solid comparison is bounded below | `HR.2/habiro-complete-modules`, `HR.2/completeness-via-the-factorial-tower`, `HR.2/the-detection-results`, `HR.2/the-monoidal-structure`, `HR.2/the-solid-comparison-is-bounded-below` (already cited by id) |
| HR.3 | The complete-descent principle for gluing along prime edges | `HR.3/the-complete-descent-corollary` (already cited), with `HR.3/reconstruction-functor` and `HR.3/prime-edge-mapping-spaces` for its functoriality |
| HR.4 | Degree-zero relative q-Witt rings with F, V and Teichmüller lifts; the restriction obstruction (2.14); joint ghost injectivity (Lemma 2.23); étale base change (Proposition 2.48, Lemma 2.50, Corollary 2.51); base change along Λ-maps (Lemma 2.46) and Remark 2.47; also Corollary 2.22, Example 2.38 with the localisation formula, Proposition 2.15 and the p-local decomposition of Lemma 4.36 | `HR.4/q-witt-vectors`, `HR.4/relative-q-witt-rings`, `HR.4/there-is-no-restriction-map`, `HR.4/q-witt-vectors-of-etale-maps`, `HR.4/ghost-maps-and-etale-base-change`. Not planned here: Proposition 2.15, Corollary 2.22, the localisation formula and the p-local decomposition, and Example 2.38 only as an acceptance check of `HR.4/the-etale-lift`. Under RS-10 they belong to QWittVectors QW.2–QW.4, and the request should move there. The first packet records that HQ.4's citation of Corollary 2.22 through `HR.4/relative-q-witt-rings` must either be dropped or met by planning Proposition 2.15. |
| HR.5 | The relative Habiro ring as a limit, its equaliser presentation and the convergence of the substitutions | `HR.5/the-relative-habiro-ring`, `HR.5/the-equaliser-presentation`, `HR.5/roots-choices-and-substitutions` |

## Structural proposals

The parts record twelve proposals: eight in the first packet, two in the HR.2 part and one each in the HR.3 and HR.4 parts. Each is given as its packet records it, with a note on where it stands now. RS-10 was accepted after the first packet's review and before the follow-ups, so several of the first packet's ownership notes are settled by it.

### HR.2 carries a general theory and a specific one

*propose-split, rescope; from the first packet; roadmaps: HabiroRings.* Superseded: HR.2 now has nine nodes. The generic derived completion, ∞-categorical and monoidal inputs are imports (DD.1, E0, E1, E3, E5:abstract); the Habiro-specific content is B.1–B.5 (habiro-complete-modules, the-two-term-resolution, completeness-via-the-factorial-tower, completeness-on-homotopy-groups, the-derived-nakayama-lemma, the-detection-results) and the completed tensor product. The split that matters is the solid part, B.6–B.8 (see 'Move Wagner B.6–B.8 (solid Habiro-complete spectra) off the HR.2 critical path').

**Proposal.** No split beyond the HR.2:solid substage.

**Status.** **Superseded** by the next proposal, as its own text says.

### Move Wagner B.6–B.8 (solid Habiro-complete spectra) off the HR.2 critical path

*propose-substage, rescope; from the first packet; roadmaps: HabiroRings, VStackSheavesAndLisseCategories, HabiroCohomologyFoundations.* HR.2 has depth 10; VS2, which B.8 needs, has depth 30, and the atlas deliberately omits VS2 from HR.2's requirements (the stage text calls B.8 a 'bounded-below extension'). With HR.2/habiro-complete-solid-spectra and HR.2/the-solid-comparison-is-bounded-below inside HR.2, HR.2 and everything after it (HR.3–HR.7, HQ.3 onwards) inherit depth above 30. Lemma B.8 is referenced nowhere else in the source (checked: the label lem:SolidTensorProductHabiroComplete occurs only at its statement), and its only consumer in the atlas is HabiroCohomologyFoundations HQ.6/what-may-not-be-inferred-from-the-analytic-side.

**Proposal.** Create the substage HabiroRings:HR.2:solid containing those two nodes, requiring HR.2, VS2 and a supplier of solid spectra, consumed by HabiroCohomologyFoundations:HQ.6; HR.2 keeps the derived-category theory B.1–B.5 and the completed tensor product.

**Status.** **Awaiting the maintainer.** The HR.2 part keeps the proposal and adds its three solid nodes to the sub-layer, which this document displays as HR.2:solid. RS-10's HR.2 entry keeps B.7–B.8 in HR.2 and the light solid spectra there until SolidAnalyticRings SA.1 is installed, so the sub-layer is a display decision within HR.2, not a new owner.

### Big Witt vectors with truncation sets are planned in HR.4

*ownership; from the first packet.* No atlas stage and neither pinned library has truncation-set big Witt vectors (library audit AUDIT-19: 'Neither library has q-Witt vectors, q-de Rham–Witt complexes, big Witt vectors or truncation sets'). q-W_m(R) is a quotient of W_m(R)[q], so HR.4/truncated-big-witt-vectors plans them for arbitrary truncation sets, the generality HQ.4's truncation sets also need; CrystallineCohomology CR.4 keeps Mathlib's p-typical carrier and can import the comparison BigWittVector.equivTruncatedWittVector. This is the interim owner before QWittVectors promotion under accepted RS-10; transfer, do not duplicate, the truncation-set carrier and its p-typical comparison.

**Status.** **Interim, as recorded.** Under RS-10 the permanent owner is QWittVectors QW.0; the HR.1 part's use of the carrier moves with it.

### Historical restriction-obstruction concern is resolved in the current HQ packet

*note; from the first packet.* Rechecked for FIX-RT-AREA-etale~2: HQ.4/there-are-no-restriction-operators-and-what-replaces-them now imports HR.4/there-is-no-restriction-map in proof step 1, derives only the positive-degree consequence in step 2 and requests the restriction-free ordinary universal property from CR.4 in step 3. Preserve this one-owner boundary through QW promotion. No repeat of q-Witt 2.14 is requested.

**Status.** **Resolved**, as recorded.

### HR.4's citation of the obstruction

*note; from the first packet.* HR.4's stage text cites 'q-Witt v5 §1.3'. The current arXiv version is v5 (6 October 2025), and 1.3 is the introductory paragraph 'A theory without restrictions' (PDF p. 3); the argument is paragraph 2.14 (PDF p. 13), which the stage text should cite as well.

**Status.** **Open:** a stage-text edit for the maintainer.

### The HabiroCohomologyFoundations HQ.1 packet makes HQ.3 and HQ.5 depend on HR.6

*cross-packet-cycle; from the first packet.* Historical review observation, now partly resolved: the current HQ.3 coordinate-model and HQ.5 coefficient-export nodes no longer require HR.6, and HQ.4/no-automatic-multiplicative-upgrade no longer requires HQ.3. Preserve these directions. HQ.3 owns the functorial étale cohomology specialization and HQ.5 exports it; HR.6 owns its comparison with the separately built coefficient ring. Verification rejected /36 as a duplicate-owner finding. Do not erase the generic HQ comparison or add HR.6 → HQ.3/HQ.5.

**Status.** **Resolved.** The HR.6 part checked the current HabiroCohomologyFoundations packets: HQ.3/the-coordinate-model-and-the-etale-case, HQ.3/the-etale-case and HQ.5/algebraic-habiro-cohomology-of-a-scheme do not require HR.6, and the late HQ.3–HQ.5 → HR.6 edge is kept.

### Remark 2.14 is also HB.6's comparison of Habiro's ring with GSWZ's H_Z

*ownership; from the first packet.* The HR.5-number-field-comparison stage asks to 'Recover classical H_ℤ (Remark 2.14) using HC.1–4', and the HB.6 stage asks to 'compare the construction with the usual Habiro completion when F=Q and Δ=1'. For R = ℤ both statements say that Habiro's ring is the ring of compatible Taylor families. This packet proves H_{ℤ/ℤ} ≅ H and derives the presentation from Lemma 2.12, and proves compatibility with HB.6's identification (HabiroRings:HR.5-number-field-comparison/the-number-field-ring, F = ℚ) rather than a second proof of Habiro's theorem. The orchestrator should confirm the two owners: HB.6 for the GSWZ-side comparison (built first, from Habiro's theorem), HR.5-number-field-comparison for H_{ℤ/ℤ} ≅ H and the specialisation of Lemma 2.12.

**Status.** **Settled by RS-10.** Its HR.5-number-field-comparison entry owns Corollary 2.13 after HB.6 and HR.5, without making HB.6 depend on it, and its HB.6 entry keeps the F = ℚ comparison in HB.6. `HR.5-number-field-comparison/the-classical-ring` proves H_{ℤ/ℤ} ≅ H and specialises Lemma 2.12; `HR.5-number-field-comparison/the-number-field-ring` checks compatibility with HB.6's identification rather than proving Habiro's theorem again.

### RS-10 promotion boundary and retained Habiro coefficient work

*ownership; from the first packet.* RS-10 round 2 is accepted (review dated 2026-09-29), but QWittVectors and AnalyticHabiroStack still have no stages in the assembled atlas at base 10b68f9. Acceptance is not promotion. Keep the current HR.1/HR.4/HQ.1/HQ.4 suppliers until an atomic promotion transfers their nodes, requests and consumers. No second implementation and no dependency on an absent QW stage is introduced. HR.1 retains étale Frobenius lifts, relative Frobenius and completed base-change/naturality. HR.4 retains finite Habiro rings, staticity and complete étale lifting (Theorem 2.9). HR.6 consumes HQ.5's functorial cohomology/completion exports to identify the independently constructed degree-zero coefficient rings. Finding /36 was rejected; that construction/comparison handoff is preserved.

**Status.** **Current.** It governs every follow-up part: each keeps the present suppliers and records the permanent owners for the atomic move.

### Retain HR.2:solid off the algebraic critical path

*propose-split, rescope; from the HR.2 packet; roadmaps: HabiroRings.* Propose HR.2:solid, titled Solid Habiro-complete spectra. Keep the parent algebraic nodes and the two new spherical completion nodes in HR.2; move only the parent B.7/B.8 nodes plus solid-habiro-unit-idempotence, completed-countable-free-solid-modules and countable-solid-habiro-tensor to this substage. Prerequisites are HR.2 and the proposed generic light-solid supplier; the solid comparison is consumed by HQ.6/analytic coefficients, not by HR.3–HR.5 or HQ.3–HQ.5. This is a proposal, not an existing stage id.

**Proposal.** Preserve the accepted parent’s split recommendation; do not create a nonexistent prerequisite id in this packet.

**Status.** **Awaiting the maintainer;** the same sub-layer as the first packet's proposal.

### Artin v-stacks, solid and lisse coefficient categories, Part II: light solid spectra

*propose-extension, new-roadmap; from the HR.2 packet; roadmaps: VStackSheavesAndLisseCategories, HabiroRings.* VS2 supplies solid abelian groups/modules. It does not supply B.6’s light hypersheaves of spectra. Build the proposed Part II on VS2, H.5:spectra, H.5:S-delooping, E5:abstract and E3; assign G-solid’s generic contract there exactly once. HR.2:solid, the thesis’s spectral analytic coefficients and future spherical coefficient consumers import it. Keep HZ-relative compatibility with VS2 explicit.

**Proposal.** New generic supplier needed; do not bury solidification inside an arithmetic Habiro node.

**Status.** **Not recommended as written.** RS-10 already names SolidAnalyticRings SA.1 for light solid spectra, and that draft's SA.1 stage cites Wagner B.6–B.8. A VStackSheavesAndLisseCategories Part II would plan the same mathematics a second time. The G-solid contract should be given to SA.1 instead.

### The parent HR.3 review records four generic categorical inputs with no exact own

*rescope; from the HR.3 packet; roadmaps: EnhancedDerivedSheaves, HabiroRings.* The parent HR.3 review records four generic categorical inputs with no exact owning target. E0/E3/E5 are the foundational suppliers already used by the general descent principle, but their existing packets do not explicitly supply all these statements.

**Proposal.** Make EnhancedDerivedSheaves:E0 own finite-poset straightening, section limits and stable cubical contraction for the refinement diagrams Q(m), P(m) and their slices; E3 owns coherent adjoints and dual full-inclusion Kan extensions; E5:abstract owns compatible monoidal localization and both fixed- and varying-category algebra limit theorems; E5:presentability owns Pr^L/Pr^R reversal and finite categorical limits. HabiroRings:HR.3 keeps the arithmetic completion diagram and its descent/reconstruction specializations. Do not move Wagner’s general descent principle into E5 or construct a second copy of these categorical foundations in HR.3. An arbitrary-site extension of the parent principle still requires straightening in that site’s size range and accessible presentability hypotheses; this finite job does not claim that extension.

**Status.** **Awaiting the maintainer.** The five requests are filed with the proposed owners already.

### Refine the existing generic supplier contracts without moving Wagner’s arithmeti

*rescope; from the HR.4 packet; roadmaps: HabiroRings, DerivedDeRhamCohomology, EnhancedDerivedSheaves.* Refine the existing generic supplier contracts without moving Wagner’s arithmetic comparison or rebuilding a completion/enhanced algebra theory.

**Proposal.** DD.1 owns regular principal and regular two-generator quotient-tower comparison, staticity and detection. E1 owns static embedding/mapping discreteness; E5:abstract owns enhanced commutative and complete-base algebra compatibility. HR.4 owns marked ordinary étale deformation, its completion wrapper, and the cyclotomic application. QW ownership follows accepted RS-10 atomically; no new QW ids or generic completion planets are introduced.

**Status.** **Awaiting the maintainer.** The four requests are filed with the proposed owners already.

**Ownership records of the parts.** Besides these proposals, the HR.1, HR.4 and HR.6 parts record how they apply RS-10 (their `ownership` fields). They agree: until QWittVectors is installed, HR.1 holds Λ-rings and perfect covering and HR.4 holds big Witt vectors and the degree-zero q-Witt rings; on installation these nodes, their consumers and the Lean declarations move in one step, to QW.0 (big Witt vectors), QW.1 (Λ-rings and the coalgebra comparison) and QW.2–QW.4 (absolute and relative q-Witt rings, étale and ghost pushouts), and no parallel QW node is created meanwhile. HR.4 keeps E_d, the finite stages, Theorem 2.9, staticity, the transitions and naturality; HR.1 keeps the étale Frobenius lifts. The HR.1 part adds one obligation that no packet meets yet: RS-10's early Taylor-glued ring H^Tay_{R/A} in HR.1 (see Boundaries).

## Dependencies between the layers

Within the roadmap, the nodes of each layer use the nodes of these other layers (HR.2:solid counted with HR.2). The graph of nodes is acyclic, also through every packet on main, and it follows the layer order with one exception, recorded after the lists.

- **HR.1** uses HR.4.
- **HR.2** uses no other layer.
- **HR.3** uses no other layer.
- **HR.4** uses HR.1, HR.2, HR.3.
- **HR.5** uses HR.1, HR.2, HR.3, HR.4.
- **HR.5-number-field-comparison** uses HR.1, HR.5.
- **HR.6** uses HR.1, HR.2, HR.4, HR.5, HR.5-number-field-comparison.
- **HR.7** uses HR.1, HR.4, HR.5, HR.5-number-field-comparison.

The atlas requirements of each layer:

- **HR.1** requires `PrismaticCohomology:PR.0`.
- **HR.2** requires `DerivedDeRhamCohomology:DD.1`, `EnhancedDerivedSheaves:E5:abstract`, `HabiroCyclotomicCompletions:HC.1`, `HabiroRings:HR.1`, `StableHomotopyKTheory:H.6`.
- **HR.3** requires `HabiroRings:HR.2`.
- **HR.4** requires `HabiroRings:HR.3`.
- **HR.5** requires `HabiroRings:HR.4`.
- **HR.5-number-field-comparison** requires `HabiroNumberFields:HB.6`, `HabiroRings:HR.5`.
- **HR.6** requires `HabiroCohomologyFoundations:HQ.3`, `HabiroCohomologyFoundations:HQ.4`, `HabiroCohomologyFoundations:HQ.5`, `HabiroNumberFields:HB.7`, `HabiroRings:HR.5`, `HabiroRings:HR.5-number-field-comparison`.
- **HR.7** requires `HabiroRings:HR.6`.

**HR.1 uses HR.4.** Eleven nodes of the HR.1 part use `HR.4/truncated-big-witt-vectors`, the carrier W_S of big Witt vectors, at the full truncation set: Dwork's criterion, the universal Frobenius polynomials, the Witt-ring congruence, the comonad and its laws, Λ-coalgebras, the Witt section and its laws, Wilkerson's comparison, Witt addition and the exterior operations. The node graph stays acyclic because that HR.4 node uses only `HR.1/lambda-rings-with-commuting-adams-operations`, and no node of HR.4 uses the HR.1 part. At stage level the edge runs against the layer order. It disappears when RS-10 is installed: the carrier then belongs to QWittVectors QW.0, which precedes both. Until then a display can place `HR.4/truncated-big-witt-vectors` before the HR.1 part, as the suggested Lean file does, or move it to HR.1; either changes no statement.

**Late return edges.** HR.6 uses HabiroCohomologyFoundations HQ.3, HQ.4 and HQ.5, whose packets use HR.1–HR.5 but not HR.6, so there is no cycle. HR.5-number-field-comparison uses HabiroNumberFields HB.6, which uses `HR.1/the-etale-frobenius-lift` and `HR.5/the-ell-adic-taylor-comparison` but nothing of HR.5-number-field-comparison or HR.6.

**Across roadmaps.** Every prerequisite outside the roadmap is a pinned declaration, a node of another packet or one of the stages listed under Boundaries, and each of those node ids exists in its packet on main. A check over the prerequisite graph of all packets on main finds no cycle through a node of this roadmap.

## What this blueprint does not claim

- **Formalisation.** Nothing here is formalised. The suggested Lean file names the objects and states signatures, API and unit tests with `sorry`; what the pinned libraries cannot express (derived and enhanced categories, E∞-algebras, spectra and solid spectra, K₃, the Habiro–Hodge complex) is recorded there as comments with its exact statement and supplier.
- **Closure.** No layer is `closed`. HR.1, HR.2, HR.3, HR.4 and HR.6 are planned with open supplier requests or gaps; HR.5, HR.5-number-field-comparison and HR.7 are source-decomposed.
- **Restriction maps.** No restriction map on q-Witt vectors, and no ring lim_{Res} q-W_m(R), is asserted: the obstruction is a theorem, and the transitions are Frobenii.
- **Global Frobenius lifts.** R is not assumed to have a Frobenius lift; only R̂_p has one. H_{R/A} carries no R-algebra structure through constant families.
- **Exactness of completion.** Habiro completion is not assumed t-exact; staticity always comes from the detection results, and the staticity of the limit uses the HR.4 part's argument, which commutes only finite cofibres with limits. Derived limits keep their lim¹ terms.
- **Base change.** No uncompleted tensor-product formula for H_{R/A} is asserted; base change holds after Habiro completion.
- **Irreducibility.** Φ_m is not assumed irreducible modulo ℓ ∤ m; it is separable, and every argument runs on its factors.
- **Solid and unbounded statements.** The solid comparison is asserted for bounded-below objects only, and conditionally on a supplier of light solid spectra; nothing is claimed for unbounded objects or for naive solid modules over arbitrary rings.
- **K₃.** No K₃ group is constructed, no K₃-indexed module is asserted free, and no class in the image of the regulator is shown to be non-trivial before completion.
- **Descent beyond the finite case.** Wagner's descent principle for arbitrary poset sites is planned with its size and accessibility boundary recorded; the categorical inputs are requested for the finite diagrams this roadmap uses.
