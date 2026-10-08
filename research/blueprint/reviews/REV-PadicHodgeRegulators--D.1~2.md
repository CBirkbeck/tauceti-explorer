# Independent round-2 review: p-adic regulators

Job `REV-PadicHodgeRegulators--D.1~2`; issue [#7078](https://github.com/CBirkbeck/tauceti-explorer/issues/7078). Reviewer: Codex, session `codex-TuYhgJ`, 8 October 2026. This session wrote neither planning round.

**Verdict: accepted.** The corrected packet is a complete target-level planning pass, with **54 verified and 18 corrected nodes**. No node was added, removed or left unverifiable. All 72 stable IDs remain. This acceptance does not close external producers or prove the global regulator conjecture.

| Check | Result |
|---|---|
| Scope | L0–L2 and D.1–D.5; 8 planned stages, 0 closed |
| Nodes | 72: 5 definitions, 19 constructions, 19 comparisons, 20 theorems, 8 lemmas, 1 application |
| Definition/construction API and tests | 178 API items; 106 tests across 24 carriers, each with at least 3 tests |
| Whole-packet API and tests | 198 API items; 119 tests, including 1 new filtered-complex test |
| Baseline | All 19 declarations independently read at full pins; none removed/replaced in this round |
| Source findings | All 17 independently checked: 16 confirmed, E103 rejected |
| Planets | 22 retained; names describe mathematical objects/results |
| Remaining obligations | 9 recorded gaps and 20 external requests retained |

## Method and source limits

Read WORKERS, both protocols, UPSTREAM_GUIDE, the reviewed library audit, the roadmap/atlas targets, RS-26 ownership material, the prior review and revision handoff, and the four red-team findings with their verifications. The upstream HodgeStructures and LocalFieldsRamification documents supplied the density/ownership model; NumberFieldArithmetic Layer 5 supplied the semilocal boundary. Each node was checked for source domain, prerequisites, proof route, API and discriminating tests. Supplier node statements were read directly, and stage-only references were checked against their atlas contracts and the exact requests, rather than treated as already existing declarations.

The packet lists 31 source records: 30 public source files plus the pinned Tau Ceti module. Downloaded source-file hashes matched the records. Relevant passages were read in the recorded editions, including the public Besser 2000 author PostScript, BK 1990 scan, Fontaine–Ouyang author draft, Rubin author copy, and the newly used relative/semistable sources. Public published BdJ and NN, the HAL accepted CN manuscript, published Berger and the author errata list were checked at the needed correction loci. Sources/readSections and sourceVersions distinguish this target/erratum check from inherited broader reading notes. No private-library copy was used, no source file is submitted, and no source prose or sequential source summary is reproduced.

No assertion is made about an unread CN publisher version or an unread HK version of record. The primary sources and public publication/errata records were checked for existing corrections on 8 October; no authors were contacted. Source locators below refer to the edition named in the packet; printed page numbers differ from PDF indices in the books/scans.

## Resolution of the first review

| Previous unresolved item | Round-2 finding |
|---|---|
| L1/local-duality-of-conditions | BK Proposition 3.8, pp.354–359 gives the direct de Rham proof. The plan uses rational local pairing/dimension and continuous period-cohomology requests; it no longer claims ramified descent of H_g from a discrete class-formation theorem. |
| D2/log-syntomic-complex | EN §§2.1–2.1.2, pp.4–6 supplies separate divided and undivided models, actual ideals, products and omega/tau composites. CS.0 is a precise external request. |
| D2/fontaine-messing-kato-period-map | EN §2.2, pp.7–8 supplies the directed Godement/topos construction; alpha_U=alpha_D omega and the weight-one p-factor are explicit. CS.1 is requested, not attributed to current CP.4. |
| D2/small-twist-comparison | EN Theorem 2.2, p.7 proves divided exactness only through r≤p−2. Undivided comparison remains bounded torsion with conservative CN K-dependent constants. |
| D2/syntomic-exponential | CN Corollary 3.16 p.37 and NN Proposition 4.13 pp.53–54 support the rational range and normalized exponential. This review makes the EN-convention boundary omega_Q^-1 delta_D explicit; no integral inverse or unscaled p^r square is asserted. |
| D5/curve-weight-two-target | Besser Proposition 8.6(3), Remark 8.7(3), Proposition 10.1(3), author pp.26–28,34 give the rigid-to-modified norm beta, transported scalar action and normalized target. |
| D5/curve-etale-comparison | Besser Proposition 9.11 p.32 and the preceding norm comparison identify Theta(reg_syn), not raw can, with log_BK of the étale class. The Frobenius correction and adjunction are retained. |

The four added D5 nodes from the revision are independently justified by AM2022 Theorems 2.23/3.7 and §4.1, pp.18–20,27–36; Asakura Theorem 4.9/Corollary 4.10, p.435; Besser2025 §§3–4,7, pp.6–14,28–29; and BR2019 §§3–4, pp.10–11,19–20. The relative proper-family hypotheses were restored in full, specialization retains sigma compatibility, and the absolute regP identification now requires finite residue field. The semistable contracts retain both continuous/discrete coordinates, ker N and the second-kind triple-index formula.

## Corrections made in this review

Every corrected node is described in the per-node table below. The changes group as follows:

- **Local conditions:** repaired the finite-level twist counterexample and its canonical-map claim; replaced the dual-exponential discrete Ext proof reference by the rational pairing route; added the exact B_dR cohomology request and restricted the two-character computation to Q_p; fixed the semilocal HK2 locator.
- **Dilogarithms and signs:** made the root-value lattice test conditional on p>3 and on the modified value being a unit; marked the dictionary’s D2 comparison as forward; supplied a well-typed field-preservation counterexample for norm/trace; carried the de Jeu sign into the Habiro export.
- **Syntomic models:** restored filtered-complex cohomology in the long exact sequence and added the Frobenius-lift homotopy prerequisite and A^1 test; corrected Besser 8.8 to Proposition and the completed-versus-algebraic K3 acceptance; retained the higher-weight factorial explicitly in Lean and in the Gros formula on identical symbols; made the rational boundary normalization and factor-25 example explicit.
- **K3 and curves:** weakened the ramified Suslin tensor test to the image of the torsion term; changed the finite-polylogarithm source description to own words; imported scheme-level Adams operations for the integral curve model and applied E.3 localization only to the generic curve; normalized curve functoriality and gave the raw base-change norm factor; restored the AM proper-refinement hypotheses and finite-base specialization distinction.
- **Evidence and documents:** independently refreshed all 17 source verdicts and scoped source/baseline reading records; corrected E105’s split preprint locator, the first review’s BdJ Conjecture page and Berger published lemma number, and Asakura’s page; clarified rejected E103 without preserving an asserted correction; replaced the review object with 72 round-2 verdicts; synchronized every mathematical field and request consumer in the reader.

No new node was needed at target granularity. All clear repairs fit the existing interfaces. The suggestion file adds only the new filtered-complex test, exposes the factorial/sign/range already expressible in Lean, and types the rational divided-boundary transport. Its geometric supplier hypotheses remain explicitly omitted where the pin lacks their carriers.

## Pinned baseline

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each full declaration statement was read, not just searched by name. There are no round-2 removals. The previous removal of FormallyUnramified remains correct: separability in characteristic zero is not arithmetic unramifiedness.

| Declaration | Module and declaration line | Confirmed support and limit |
|---|---|---|
| `mathlib:Algebra.norm` | `Mathlib/RingTheory/Norm/Defs.lean:61` | The norm S →* R of an R-algebra as the determinant of multiplication. |
| `mathlib:Algebra.trace` | `Mathlib/RingTheory/Trace/Defs.lean:71` | The trace S →ₗ[R] R of an R-algebra as the trace of multiplication. |
| `mathlib:FreeAbelianGroup` | `Mathlib/GroupTheory/FreeAbelianGroup.lean:96` | The free abelian group on a type, the group of formal symbols [z]. |
| `mathlib:IsArithFrobAt` | `Mathlib/RingTheory/Frobenius.lean:183` | Predicate stating the arithmetic residue congruence at an ideal; it does not construct the unramified Frobenius automorphism (imported upstream). |
| `mathlib:Module.Free` | `Mathlib/LinearAlgebra/FreeModule/Basic.lean:43` | The predicate that a module is free. |
| `mathlib:OrzechProperty` | `Mathlib/RingTheory/OrzechProperty.lean:63` | Commutative rings have the Orzech property: a surjection onto a finitely generated module from a submodule (or through an injection) is injective; used for 'surjective between free modules of equal rank implies injective'. |
| `mathlib:PadicComplex` | `Mathlib/NumberTheory/Padics/Complex.lean:137` | ℂ_[p], the completion of the algebraic closure of ℚ_[p]. |
| `mathlib:Polynomial` | `Mathlib/Algebra/Polynomial/Basic.lean:73` | Polynomial rings, the carrier of the finite polylogarithm. |
| `mathlib:Submodule.span` | `Mathlib/LinearAlgebra/Span/Defs.lean:46` | The span of a set in a module. |
| `mathlib:Submodule.le_of_le_smul_of_le_jacobson_bot` | `Mathlib/RingTheory/Nakayama.lean:146` | Nakayama's lemma: for N' finitely generated and I ≤ jacobson ⊥, N' ≤ N ⊔ I•N' implies N' ≤ N; used to lift spanning modulo p. |
| `mathlib:WittVector` | `Mathlib/RingTheory/WittVector/Defs.lean:52` | p-typical Witt vectors W(R). |
| `mathlib:WittVector.frobenius` | `Mathlib/RingTheory/WittVector/Frobenius.lean:221` | Witt-vector Frobenius ring homomorphism; the unramified integer-ring classification and equality with arithmetic Frobenius are imported upstream, not supplied by this declaration alone. |
| `mathlib:ZMod` | `Mathlib/Data/ZMod/Defs.lean:142` | ℤ/nℤ, in particular 𝔽_p. |
| `mathlib:bernoulli` | `Mathlib/NumberTheory/Bernoulli.lean:195` | Bernoulli numbers with B_1 = −1/2 (bernoulli n = (−1)^n bernoulli' n). |
| `tauceti:TauCeti.teichmuller` | `TauCeti/NumberTheory/LocalField/Teichmuller.lean:100` | The Teichmüller lift 𝓀[K]ˣ →* 𝒪[K]ˣ of a nonarchimedean local field. |
| `tauceti:TauCeti.residue_teichmuller` | `TauCeti/NumberTheory/LocalField/Teichmuller.lean:132` | The Teichmüller lift is a section of reduction. |
| `tauceti:TauCeti.eq_teichmuller` | `TauCeti/NumberTheory/LocalField/Teichmuller.lean:158` | A (q−1)-torsion unit reducing to α is the Teichmüller lift of α. |
| `tauceti:TauCeti.range_teichmuller` | `TauCeti/NumberTheory/LocalField/Teichmuller.lean:175` | The image of the Teichmüller lift is μ_{q−1}(𝒪[K]). |
| `tauceti:TauCeti.kummerClassMap` | `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:279` | Finite-coefficient injective Kummer class map Kˣ/(Kˣ)^n→H¹(G_K,μ_n); the continuous p-adic identification and inverse-limit compatibility are supplied by SelmerIwasawaCohomology L0. |

The norm and trace use the finite-free field/product instances in these applications; they do not supply regulator transfer. OrzechProperty needs the finitely generated target and an identified equal-rank free source; Module.Free alone does not imply finite rank. Nakayama needs its finitely generated module and Jacobson containment. Polynomial/ZMod/PadicComplex supply carriers, not polylogarithms. Witt Frobenius becomes the needed arithmetic automorphism only through upstream unramified classification. The four Teichmuller theorems retain their local-field/topological hypotheses. The pinned Kummer class is finite-coefficient and injective; continuous realization/limit compatibility is a supplier obligation.

## Individual node verdicts

IDs below carry the common prefix `PadicHodgeRegulators:`. The packet’s checked array contains the same 72 verdicts.

| Node | Verdict | Source, closure and acceptance check |
|---|---|---|
| `L0/hodge-tate-and-twist-conventions` | verified | BNQD §1.3 p.646 fixes the epsilon-independent de Rham basis; FO 9.4–9.5 and Berger I.2 give the translated filtration/weight convention. Representation bases in L2 remain distinct. |
| `L0/fundamental-exact-sequences` | verified | FO 7.28(4),7.29 pp.170–171 support the two rational sequences. CN §2.4.3 p.23 gives only bounded-torsion integral exactness, correctly kept separate. |
| `L0/integral-period-interface` | verified | BNQD Lemma 1.3.2 p.647 supplies the unramified lattice conclusion; the general abelian-field Tamagawa index is not replaced by that special lattice. |
| `L1/bloch-kato-subgroups` | verified | FO Definition 9.22 p.232 and Rubin I.3.6 p.7 give kernel local conditions and propagation to lattices/torsion. Tests distinguish finite, geometric and full groups. |
| `L1/bloch-kato-exponential` | verified | FO (9.11) p.233 and Berger introduction p.2 give the connecting map, quotient by Fil^0 and image H_e. No unconditional isomorphism is inferred. |
| `L1/bloch-kato-logarithm` | verified | HK §1.3 pp.8–9 identifies the inverse for positive Tate weight at least two; injectivity uses the explicitly requested rational local Euler characteristic and duality. |
| `L1/dual-exponential` | corrected | Replaced the discrete Ext pairing in the proof by D7 rationalized cup duality plus R02.4's arbitrary-local-field extension. Added the R06.1 B_dR cohomology request from FO 6.35 p.149 and Berger II.5 p.13. The two-character formula is restricted to Q_p. |
| `L1/dimension-formulas` | verified | BK Corollary 3.8.4,(3.8.5) pp.355–356 and Benois 2.8.2 p.44 support the finite/geometric dimensions; the positive weight convention and rational-duality request prevent mixing source signs. |
| `L1/local-duality-of-conditions` | verified | Read BK Proposition 3.8 and proof pp.354–359. Its direct de Rham argument supports e/g orthogonality without asserting descent of H_g from an arbitrary ramified extension; continuous period cohomology is requested explicitly. Rubin I.4.3 pp.9–10 propagates an already proved rational orthogonality. |
| `L1/twist-and-change-of-field` | corrected | Corrected the false dimension counterexample: both full H^1 groups over Q_p have dimension two, while H_g dimensions are one and two. Only the absence of a canonical Galois-compatible finite-level twist is asserted. Rubin Appendix B.5.2 p.157 supplies restriction/corestriction, not such a twist. |
| `L1/tate-twist-examples` | verified | HK2 Appendix A pp.46–47 and BNQD Lemma 1.3.1 p.646 justify the unit, unramified and higher-weight cases. Negative weights use the requested Euler characteristic and H^0/H^2 vanishing. |
| `L1/abelian-variety-logarithm` | verified | Berger introduction p.2 and Rubin I.6.4 p.16 support the formal-group/Kummer diagram and finite rational local condition; ordinary points and tensoring are kept distinct. |
| `L1/integral-logarithm-unramified` | verified | BNQD 1.3.2 p.647, Theorem 2.1 p.648 and Fontaine §2.1 p.153 fix the actual integral lattice. The p>2, unramified hypotheses exclude the ramified and weight-one substitutes. |
| `L1/semilocal-bloch-kato` | corrected | Corrected the HK2 locator to §2.3.2 p.21. Rubin II.2 p.25 supplies the finite direct sum; upstream NumberFieldArithmetic Layer 5 supplies the semilocal algebra equivalence. |
| `L2/fontaine-iwasawa-map` | verified | CC II.1.3 p.12 and published Berger II.8 p.118 support the psi-fixed/Iwasawa isomorphism and component cocycle. The actual integral complex and coefficient compatibility remain precise PG.5 requests. |
| `L2/generator-independence` | verified | CC I.4.2 p.7 gives the coboundary comparison on changing gamma; published Berger I.8 p.110 uses the normalized cocycle. This is cohomology-class independence, not identical representatives. |
| `L2/root-change` | verified | LZ Remark 4.16 p.20 tracks the representation basis and the action under changing the root system; the de Rham invariant vector is not rescaled with it. |
| `L2/local-iwasawa-twist` | verified | CC II.1.2 p.12 and LZ Lemma 2.4 p.7 give a completed Iwasawa twist with the character in the action. Finite-level untwisted cohomology is not identified by a basis choice. |
| `L2/twist-compatibility` | verified | CC IV.2.1 proof p.21 and Berger Appendix A p.124 support the D(T(j))/Wach twist square. PG.1/PG.6 requests retain the coefficient lattice and chosen representation basis. |
| `L2/wach-psi-fixed-vectors` | verified | Published Berger A.3 pp.124–126, with its weight convention translated, supplies the psi-fixed inclusion under the stated bound. LLZ §1 p.4 agrees; the negative-weight non-example detects the missing hypothesis. |
| `L2/character-specialisation` | verified | LZ Definition 4.14 p.20 and Berger II.8 p.118 identify finite-character evaluation after the Iwasawa twist; the lattice and finite-character maps have the declared distinct domains. |
| `L2/lattice-and-coefficient-squares` | verified | LLZ §2.2 p.8 and Berger Limites III.4.2 p.21 support the lattice bijection and coefficient extension squares. No arbitrary ramified-base Wach theorem is asserted. |
| `L2/kummer-coleman-comparison` | verified | CC V.3.2(iii) p.27 gives the logarithmic derivative. The unresolved sign against the supplier's Kummer convention remains a named gap rather than a fabricated equality. |
| `D.1/teichmuller-unit-decomposition` | verified | The four pinned Tau Ceti Teichmuller declarations give section, characterization and range. Upstream LocalFieldsRamification Layer 1 supplies the deep-unit/log decomposition; no existing carrier is replanned. |
| `D.1/unramified-frobenius-on-roots` | verified | The pinned torsion-unit characterization and residue Frobenius congruence prove the prime-to-p root formula after importing unramified Frobenius existence. IsArithFrobAt alone does not construct that automorphism. |
| `D.1/etale-algebra-dilogarithm` | verified | GSWZ (174) pp.37–38 and BdJ §1 p.3 support the admissible product-domain function, Iwasawa branch and Galois equivariance. Component 0 or 1 is excluded, not assigned an arbitrary value. |
| `D.1/dilogarithm-scalar-extension` | corrected | Corrected the lattice acceptance to p>3 and exact equality with the modified value, with the unit conclusion conditional on that value being a unit. GSWZ (176) and BdJ Remark 1.13 give the Frobenius square; trace on an included scalar is ordinary finite-free trace. |
| `D.1/combined-dilogarithm` | verified | GSWZ Example 4.3 p.54 supports the semilocal vector. Field-to-product maps use the upstream completion dictionary; no single coordinate is mistaken for the full regulator. |
| `D.1/regulator-normalisation-dictionary` | corrected | The Bernoulli convention B_1=-1/2 identifies the functions. Added p>3 to the p^2 lattice clause and marked the Bloch–Kato equality as a forward D2 result, avoiding a D1→D2→D1 cycle. BdJ Remark 1.7 retains the chosen sign. |
| `D.1/unit-logarithm-kernel` | verified | GSWZ p.37 and the upstream deep-unit isomorphism give torsion as kernel. The unramified odd-prime principal-unit lattice is a special case, not a statement for arbitrary ramification. |
| `D.1/logarithm-norm-trace` | corrected | The finite product of conjugates and field-preserving equivariant logarithm prove the square. Replaced the vague branch test by an unramified quadratic extension and branch log(p)=a outside Q_p: 2a differs from Tr(a), precisely failing field preservation. |
| `D.2/etale-regulator` | verified | HK §1.3 p.8 and NN §5.2 p.59 support compatible finite Chern classes and their continuous realization. M.7 is the early Soulé producer and M.1 handles the inverse limit; neither is silently supplied by M.8. |
| `D.2/rigid-syntomic-cohomology` | corrected | Corrected the long exact API to H^i(Fil^n RΓ_dR), added the Frobenius-lift homotopy supplier and the A^1 filtered-complex non-example. HK 2.2.1–2.2.4 pp.14–15 fixes the cone and point; no nonproper degeneration is assumed. |
| `D.2/syntomic-regulator` | corrected | Corrected Besser 8.8 to Proposition and the algebraic K3 test to an additive map with completed rational isomorphism. HK 2.3.3 p.16 and NN 5.6 p.57 supply Chern compatibility; algebraic K3 is not silently a Z_p-module. |
| `D.2/syntomic-etale-regulator-comparison` | verified | HK 2.3.4 p.16, Tamme Corollary 5.19 proof pp.20–21 and Besser 9.10–9.11 p.32 support the smooth unramified comparison. NN 5.7 p.58 supplies the broader rational comparison with the stated safe twist range. |
| `D.2/weight-two-dilogarithm-comparison` | verified | BdJ 1.6(2),1.12 pp.4,6 prove special-unit and cyclotomic presentations with one fixed sign. Conjecture 1.14 remains the explicit gap for arbitrary Bloch symbols; it is not used for the completed regulator definition. |
| `D.2/higher-weight-polylogarithm-comparison` | corrected | BdJ 1.10(2),1.12 pp.5–6 require the factor ±(n−1)!, retained in the packet and restored explicitly in Lean with n≥2 and sign ±1. Corrected Besser 8.8's kind in the proof. |
| `D.2/gros-normalisation` | corrected | Corrected the value to epsilon times (n−1)! times Li_n^(p) on the SAME de Jeu symbols, with n≥2 and weight-two p>3 lattice hypotheses. Remark 1.13 alone does not identify Gros's different symbols, so E103 remains rejected. |
| `D.2/log-syntomic-complex` | verified | EN §§2.1–2.1.2 pp.4–6 gives U,D, their divided-power ideals, products and omega/tau composites. The source-supported CS.0 contract is explicitly requested externally; no fake integral equivalence is introduced. |
| `D.2/fontaine-messing-kato-period-map` | verified | EN §2.2 pp.7–8 gives the directed Godement/topos map and alpha_U=alpha_D omega. Its degree-one symbol formula on p.6 detects the missing p factor. The enlarged Tate lattice and external CS.1 construction are retained. |
| `D.2/small-twist-comparison` | verified | EN Theorem 2.2 p.7 is the divided exact theorem with r≤p−2; the undivided result is bounded torsion. CN 5.4 pp.54–55 supports the conservative N(K,p,r), not a proved e-only bound. Both endpoint and model tests discriminate. |
| `D.2/syntomic-exponential` | corrected | Made alpha_norm=omega_Q^-1 delta_D explicit. EN's omega legs multiply the raw quotient coordinate by p^r; NN 4.13 pp.53–54 and 2.14 p.14 identify the normalized signed boundary with exp_BK. Added the p=5,r=2 factor-25 test and precise CS.3 request. CN 3.16 p.37 supplies the rational range. |
| `D.3/unramified-etale-algebra` | verified | GSWZ Theorem 9 p.39 uses products of local unramified fields. The arithmetic integer-ring/Witt identification is an upstream request; formally unramified characteristic-zero algebras do not detect this condition. |
| `D.3/completed-k3-unramified` | verified | GSWZ Theorem 9 proof p.39 imports the completed K3 comparison and free Z_p rank equal to the local degree. K3BlochGroups and KTheoryFiniteLocalFields supply the K-theory substrate, not a new duplicate here. |
| `D.3/completed-k3-bloch-description` | corrected | Corrected the ramified non-example to the image of mu-tilde/p in K3ind/p. Tensoring Suslin's exact sequence need not preserve an injection; no nonzero torsion kernel is deduced. The unramified prime-to-p torsion argument remains valid. |
| `D.3/finite-polylogarithm` | corrected | GSWZ (177),(180) p.38 fixes coefficients and degree; changed the source-match wording to an own-words description. Native Polynomial and ZMod carriers already exist at the pin. |
| `D.3/finite-polylogarithm-reduction` | verified | GSWZ Proposition 3.2,(178) p.38 supports the derivative congruence with the p>3 range. This is the modified integral polynomial reduction, not reduction of an arbitrary Coleman value. |
| `D.3/dilogarithm-integrality` | verified | GSWZ Lemma 3.1,(175) p.38 gives p^2 integrality only in the stated unramified special-unit range. The root-of-unity and modified-value tests distinguish the two lattices. |
| `D.3/residue-spanning` | verified | Read GSWZ Proposition 3.3 proof pp.38–39. The corrected admissible-domain count and separate s=1 zero/nonzero argument give difference-spanning; coordinate isolation handles products with no component 1. This fills E102 without guessing product surjectivity. |
| `D.3/root-of-unity-classes` | verified | GSWZ Theorem 9 p.39 and the imported Bloch/Suslin presentation map supply completed classes. Admissibility is imposed componentwise, so the product case does not smuggle in a symbol at 1. |
| `D.3/local-regulator` | verified | Defined via completed étale realization and BK logarithm, then fixed the sign by a permitted tame-root presentation. HK 1.3.2,2.3.4 pp.9,16 supply the comparison; the arbitrary-symbol conjecture is not assumed. |
| `D.3/unramified-regulator-theorem` | verified | GSWZ Theorem 9,(183) p.39 and BNQD 1.3.2 p.647 justify the p^2 lattice isomorphism. Residue spanning lifts by the pinned finitely generated Nakayama theorem, and free equal ranks turn surjectivity into injectivity. |
| `D.3/roots-of-unity-generate` | verified | The lattice isomorphism and difference-spanning give generation, including multiple local factors. The admissible roots remain distinct from arbitrary roots with a component 1. |
| `D.4/global-p-adic-regulator` | verified | GSWZ (19) p.9 supplies the semilocal target; functorial étale realization and BK logarithm define the map on global K3. This does not prove its global injectivity. |
| `D.4/special-unit-formula` | verified | BdJ 1.10(2),1.11 p.5 and GSWZ Lemma 3.1 p.38 support precisely the special-unit formula at every chosen p-adic embedding. Arbitrary Bloch presentations remain outside the proved range. |
| `D.4/norm-trace-compatibility` | verified | Transfer/corestriction of the imported Chern class and the exponential trace square give the regulator trace. The restriction formula for a dilogarithm scalar is not confused with a general K3 transfer formula. |
| `D.4/frobenius-compatibility` | verified | GSWZ (176) p.38 and the D1 Frobenius square support arithmetic Frobenius on prime-to-p roots. Ramified cases retain their separate hypotheses. |
| `D.4/torsion-and-denominators` | verified | GSWZ Theorem 9 proof p.39 and Z_p-linearity of the completed map kill torsion and control the declared lattice denominator. No p^2 divisibility is exported at ramified primes. |
| `D.4/habiro-regulator-export` | corrected | Corrected the Besser regulator equality to include the chosen de Jeu sign epsilon. GSWZ Definition 1.3,(20)–(22) p.9 and the verified D1→D2→D3→D4 chain supply HB.7's regulator input without constructing Habiro objects here. |
| `D.4/padic-k3-regulator-injectivity` | verified | The global rational injectivity target is marked conjectural, separately from the proved completed local theorem. Its inclusion as a target and explicit remaining task is honest planning coverage. |
| `D.4/example-cubic-field-five-two` | verified | GSWZ Example 4.3,(270)–(275) p.54 supplies the displayed cubic-field coordinates and precision. The suggested examples are typed obligations; no fresh analytic or p-adic numerical computation is claimed. |
| `D.5/curve-weight-two-target` | verified | Read Besser 8.6(3),8.7(3),10.1(3) pp.26–28,34. The rigid-to-modified norm beta and its transpose identify the normalized target; raw can and Theta coordinates are distinguished. Besser Arakelov Lemma 3.3 p.8 gives the pairing behavior. |
| `D.5/open-curve-splitting` | verified | BdJ2012 pp.4–5 gives the Frobenius-stable cohomological splitting and the good-pair restrictions. Colliding support and genus comparison limitations are retained as supplier gaps. |
| `D.5/curve-syntomic-regulator` | corrected | Added S.6/soule-scheme-operations for the integral-model weight source and restricted E.3 localization to the generic curve. Besser 10.3 p.35, BdJ 4.7 p.24, BdJ2012 (5.1)–(5.2) p.34 and AM18 6.4 p.34 give the cup cocycle under an integral good-pair presentation. |
| `D.5/coleman-symbol-formula` | verified | AM18 Theorem 9.1 p.45 and BdJ2012 Remark 1.10 p.4 give the normalized holomorphic pairing. The Frobenius correction and finite-etale support restrictions are essential; this formula is not fed a raw can coordinate. |
| `D.5/curve-etale-comparison` | verified | Besser 8.6–8.7,9.11,10.1 pp.26–28,32,34, NN Proposition 1.1 p.3 and AC footnote 4 p.43 identify Theta(reg_syn) with log_BK of the étale class. It is a normalized comparison, not equality of the raw boundary coordinate. |
| `D.5/curve-regulator-functoriality` | corrected | Restricted scalar-extension and transfer statements to normalized regP. For residue degree d, the raw coordinate gains sum_j(Phi/q^2)^j with Phi'=Phi^d and q'=q^d, from Besser 8.6–8.7 pp.26–28. Added a quadratic test. The recorded pushforward gap is addressed through the stated étale/corestriction route, not an unread direct syntomic proof. |
| `D.5/semistable-input-boundary` | verified | NN Theorem B p.7 and BZ Theorem 1.1 p.2 support the requested semistable and harmonic-gluing inputs. This boundary does not apply the good-reduction raw coordinate at a Tate/nodal curve. |
| `D.5/relative-curve-syntomic-regulator` | corrected | AM2022 2.23,3.7,4.3–4.5 pp.18–20,27–36 supports the tame-kernel symbol extension. Restored all proper-refinement hypotheses from §4.1, including projectivity, connected fibres, finite-etale horizontal divisor and prime-to-p vertical multiplicities. Generic Ext/F-MIC machinery remains requested. |
| `D.5/smooth-family-specialisation` | corrected | AM2022 Lemma 4.4 pp.35–36 requires a sigma-compatible smooth W-point. Added finite residue field for the absolute regP clause; Asakura 4.9–4.10 p.435 over W(F_p-bar) only illustrates the adapted Frobenius coordinate. No descent to a finite base is inferred. |
| `D.5/semistable-continuous-regulator` | verified | Besser2025 (3.5)–(3.11),3.3–3.8 pp.6–9 gives the continuous/discrete coordinates and ker N target, with branch and uniformizer dependence separated. These are full source-supported regulator contracts conditional on their external period/integration inputs. |
| `D.5/semistable-symbol-formula` | verified | Besser2025 3.10 p.9, §§4,7 pp.11–14,28–29 and BR2019 (3.1)–(3.5) pp.10–11,4.7 pp.19–20 support the full second-kind triple-index formula and the quotient pairing on ker N. The holomorphic specialization alone is not substituted for the full formula. |

## Individual source-issue verdicts

Confirmed means the stated defect in the specified source/version and scope, including a citation or proof gap; it does not mean a disproved mathematical conclusion. E103 is rejected. Corrections to this packet are planning corrections, not newly invented source errata.

| Finding | Verdict | Independent check |
|---|---|---|
| E101 | confirmed | The unrestricted identity cited after GSWZ (19), p.9, exceeds BdJ 1.6(2)'s special-unit domain. Published BdJ Conjecture 1.14 is on p.872. Confirmed as a scope gap, with the étale-defined regulator still available; no counterexample to the conjecture is claimed. |
| E102 | confirmed | GSWZ Theorem 9 proof p.39 needs coordinate isolation for an admissible product with every entry different from 1. The corrected nonzero-domain count and the separate s=1 argument give difference-spanning, which provides that step; the printed scalar spanning argument alone does not. |
| E103 | rejected | Rejected: the factorial difference between the de Jeu and Gros formulae does not identify their input symbols or Chern conventions. On the SAME de Jeu symbols, applying 1−sigma/p^n preserves epsilon(n−1)!. Agreement with Gros's independent higher-weight symbol convention remains an obligation, not a demonstrated erratum. |
| E104 | confirmed | In the preprint proof of BdJ 1.12 p.41, the distribution step must also permit s=1 and the intermediate regulator value needs its factorial/sign. Published p.910 restores that factor but still uses the strict s>1 range, so only the latter defect is claimed to persist there. |
| E105 | confirmed | The cone differential forces the derivative of epsilon inside the second coordinate, and the proof's mixed eta/epsilon notation does not match its pair. Preprint (4.4) is on p.24 and Lemma 4.10 on p.25. Published p.891 fixes the differential parentheses; p.893 retains the notation slip. |
| E106 | confirmed | CN v4 pp.2,23 gives a weak remainder upper bound. At r=p−1 both decompositions are admitted and differ in lattice scale. The strict Euclidean remainder b<p−1 fixes it; the HAL accepted manuscript also retains the weak inequality. The unread publisher text is not assessed. |
| E107 | confirmed | CN v4 introductory Theorem 1.1(ii), p.2 advertises e-only dependence, while 5.4(ii) and the descent proof pp.54–60 retain K-dependent constants. The HAL accepted manuscript agrees at those loci. Confirmed as a proof-scope gap; no falsehood of a stronger uniform theorem or claim about the publisher PDF is inferred. |
| E108 | confirmed | NN Remark 4.14 fails for Spec K, q=0,r=1: the unit exponential misses the valuation class. The passage remains on published p.1772. The plan uses the sufficient range r≥q+2 and does not assert an optimal corrected theorem. |
| E109 | confirmed | NN's regulator definition and Theorem B use degree i; 5.9 changes the target to i+1 without such a shift in its comparison. Confirmed in v5 p.59 and published p.1779. Restoring degree i matches the construction. |
| E110 | confirmed | NN 2.16 admits the trivial representation under F^1=0; its H^1_st dimension is one whereas full H^1 has dimension [K:Q_p]+1. Published pp.1714–1715 retains this counterexample. Excluding Q_p(1) is additionally needed for the printed H^2-vanishing proof step, not asserted here as an optimal hypothesis for the result. |
| E111 | confirmed | HK Definition 0.4.5 p.6 sums a trace independent of the permutation, so for n≥2 the signed sum is zero. Permuting the matrix factors instead gives the intended alternating primitive expression. This is checked in the recorded preprint, without asserting what an unread version of record prints. |
| E112 | confirmed | The arXiv Lemma II.1 p.10 uses psi(y)=y in its proof but omits it in the statement and repeats the positive-n condition in the second branch. Published Documenta Lemma II.1 p.111 supplies psi=1 and n=0. Corrected the first review's erroneous published number I.9; the public author errata list has no entry for this paper. |
| E113 | confirmed | FO proof of 6.36(1), author p.150, invokes the wrong duality partner for H^1(Q_p(−1)). Its dual group is H^1(Q_p(2)), not H^0. The Euler characteristic with vanishing H^0,H^2 gives the claimed dimension independently. |
| E114 | confirmed | HK2 Proposition A.3 p.47 begins with the unit group of O_K although its field is F. The proof's kernel is the completed unit group of O_F. This is a variable slip in the recorded preprint. |
| E115 | confirmed | Published Berger A.3 proof p.126 calls the representation positive despite using nonnegative weights, whereas the convention on p.105 calls nonpositive weights positive. The repaired weight wording agrees with the theorem and LLZ §1 p.4. |
| E116 | confirmed | LZ §2 p.7 cites Berger A.2 for the psi-fixed inclusion. Published A.3 p.124 supplies that inclusion; A.2 is the Wach characterization. This is a citation-number slip in the recorded accepted/preprint copy. |
| E117 | confirmed | AC Remark 3.2(1) p.15 points to Besser Proposition 8.6.6, which is absent from the read author text. Proposition 8.6(3), pp.26–27, is the norm comparison and is the item cited by BdJ2012 §5 p.33. |

## Coverage, closure and external ownership

All stage targets are realized by nodes or explicit source-supported imported consumer interfaces. Every proof route ends in the pinned baseline, a read supplier node/stage with an exact request, or a named gap. The request boundary is essential: current CP.4 is a proper rational semistable comparison, not the early integral/open or relative syntomic producer. AI.4/CR.2/CR.3/CR.5 and DD.2 likewise name requested scope extensions where the current contracts are narrower. Generic objects are not reconstructed locally.

| External request | Consumers | Contract checked |
|---|---|---|
| `MotivicEtaleKTheory:M.7` | `D.2/etale-regulator` | Soulé's étale Chern classes c_{i,k} : K_{2i−k}(R; Z/n) → H^k_et(R, μ_n^{⊗i}) for rings R with n invertible (fields, p-adic integer rings with p ∤ n replaced by their generic fibres, number rings), natural in R, compatible with the coefficient maps n \| n', with products and with transfers (corestriction), and Soulé's product formula — planned in the part of MotivicEtaleKTheory that needs only M.7 (étale K-theory), as RT-AREA-ktheory-2/18 directs, so that HabiroNumberFields HB.1/HB.2 and PadicHodgeRegulators D.2 import one construction. |
| `MotivicEtaleKTheory:M.1` | `D.2/etale-regulator` | The continuous realisation K_{2n−1}(F) → H^1(F, Z_p(n)) = lim_ν H^1(F, μ_{p^ν}^{⊗n}) obtained from the classes c_{n,1} with p-power coefficients, its agreement with the Kummer map for n = 1, and its compatibility with restriction and transfer. |
| `Polylogarithms:P.4` | `D.2/weight-two-dilogarithm-comparison`, `D.2/higher-weight-polylogarithm-comparison` | De Jeu's complexes M̃^{(n)}(F) (n ≥ 2; in weight two M̃^{(2)}(F) → ∧²F^×_Q) of a field of characteristic 0 and its subcomplex M̃^{(2)}(O) for a discrete valuation ring O ⊂ F generated by special units (Besser–de Jeu §3), with the map H^1(M̃^{(2)}(F)) → K_3^{(2)}(F) and its comparison, up to the sign fixed by de Jeu, with Suslin's isomorphism B(F) ⊗ Q ≅ K_3^ind(F) ⊗ Q of K3BlochGroups V.4/V.6; in weight n, the map H^1(M̃^{(n)}(F)) → K^{(n)}_{2n−1}(F) for number fields (an isomorphism for n = 2, 3 and for cyclotomic fields) and the cyclotomic symbols [ζ]_n. |
| `CrystallineCohomology:CR.5` | `D.2/log-syntomic-complex` | Absolute log-crystalline cohomology RΓ_cr(X, J^{[r]})_n of fs log-schemes X log-smooth over O_K^× (O_K a complete DVR of mixed characteristic with perfect residue field, any ramification), with its divided-power filtration, Frobenius, base change in n and the Cartier-type hypotheses needed for the Hyodo–Kato comparison. |
| `CrystallineCohomology:CR.3` | `D.2/log-syntomic-complex` | Frobenius on absolute crystalline cohomology of smooth O_K-schemes, compatible with the PD filtration, used in the non-log case of the syntomic complex. |
| `CrystallineCohomology:CR.2` | `D.2/fontaine-messing-kato-period-map` | The crystalline (PD) Poincaré lemma for the relative period rings A_cr(R) of small semistable O_K-algebras (Tsuji, as used by Colmez–Nizioł §4.7), identifying Galois cochains in the PD de Rham complex of the envelope with Galois cochains in [F^r A_cr(R) → A_cr(R)]. |
| `AInfCohomology:AI.4` | `D.2/fontaine-messing-kato-period-map` | The relative period rings A_cr(R) and their filtration and Frobenius for small (semistable, log) O_K-algebras R, with the Galois action of G_R, as used in the local construction of the Fontaine–Messing–Kato period map. |
| `DerivedDeRhamCohomology:DD.2` | `D.2/rigid-syntomic-cohomology` | Algebraic de Rham cohomology of smooth K-schemes with its Hodge filtration, functorial in X, and the comparison of Fil^n RΓ_dR(X_K) with the de Rham term of rigid syntomic cohomology. |
| `PhiGammaModulesAndIwasawaCohomology:PG.5` | `L2/fontaine-iwasawa-map`, `L2/lattice-and-coefficient-squares` | For p odd, E/Q_p finite and T a free O_E-lattice with continuous G_{Q_p}-action: instantiate PG.5/psi-complex on D(T) over O_E ⊗ A_{Q_p} with the actual ψ of PG.4; construct the quasi-isomorphism to SelmerIwasawaCohomology:L3/iwasawa-cohomology; prove that D(T)^{ψ=1} → lim_cor H^1(Q_p(μ_{p^n}), T) is a Λ_{O_E}(G_∞)-linear bijection whose n-th component (n ≥ 1) is Cherbonnier–Colmez's ℓ(γ_n)ι_{φ,γ_n}(x_n, y) (their Proposition I.4.1 cocycle); H^2_Iw ≅ D(T)/(ψ − 1); compatibility with O_{E'} ⊗ − and with H^1_Iw(V) = H^1_Iw(T) ⊗ Q. |
| `PhiGammaModulesAndIwasawaCohomology:PG.6` | `L2/wach-psi-fixed-vectors`, `L2/twist-compatibility`, `L2/lattice-and-coefficient-squares` | Wach modules: for an E-linear crystalline V of G_{Q_p} with Hodge–Tate weights in [a; b] (HT(E(1)) = +1) and a G-stable O_E-lattice T, N(T) is free of rank d over O_E ⊗ A^+_{Q_p}, Γ-trivial modulo π, N(T) = N(V) ∩ D(T), φ(π^b N) ⊆ π^b N with π^b N/φ^*(π^b N) killed by q^{b−a}; N(T(j)) = π^{−j}N(T) ⊗ e_j; N(T) ⊆ φ^*N(T) when a ≥ 0; the inclusion-preserving lattice bijection (Berger, Limites III.4.2); and the φ-module isomorphism N(V)/πN(V) ≅ D_cris(V). |
| `PhiGammaModulesAndIwasawaCohomology:PG.4` | `L2/wach-psi-fixed-vectors` | The actual ψ on O_E ⊗ A_{Q_p} and on D(T): ψφ = id, ψ(φ(λ)x) = λψ(x), Γ-equivariance and integrality; ψ(π^{−1}) = π^{−1} and ψ(π^{−m}) = π^{−m}(p^{m−1} + πQ_m(π)) with Q_m ∈ Z_p[X] (Berger, Lemma A.4). |
| `PhiGammaModulesAndIwasawaCohomology:PG.1` | `L2/fontaine-iwasawa-map`, `L2/twist-compatibility`, `L2/lattice-and-coefficient-squares` | The O_E-linear Fontaine equivalence with D(T(η)) = D(T) ⊗ e_η for continuous characters η of G_∞ (φ and ψ acting on the first factor, g acting by η(g)g), D(O_{E'} ⊗ T) = O_{E'} ⊗ D(T), D(T) free and D(T) ⊂ D(V). |
| `CohomologyComparisons:CP.4` | `D.5/semistable-input-boundary`, `D.2/log-syntomic-complex`, `D.2/fontaine-messing-kato-period-map`, `D.2/small-twist-comparison`, `D.2/syntomic-exponential` | CP.4 supplies the proper rational Hyodo–Kato comparison. Separately route the early integral/open prefix to the proposed contracts CohomologyComparisonsPartII:CS.0/classical-divided-and-undivided-syntomic; CohomologyComparisonsPartII:CS.1/integral-fontaine-messing-period; CohomologyComparisonsPartII:CS.2/divided-small-weight-comparison; CohomologyComparisonsPartII:CS.3/semistable-syntomic-exponential. Their precise statements are the four retained D.2 consumer interfaces, including ω/τ, divided exactness, directed Godement/topos map and rational exponential. These are proposed stable IDs, not existing CP.4 nodes. The CS.3 boundary must be ω_Q⁻¹δ_D in the EN period convention, rather than the unscaled quotient-coordinate boundary δ_U; the latter has α_U^FMδ_U=p^r exp_BK. No integral inverse to ω is requested. |
| `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places` | `D.1/combined-dilogarithm`, `D.1/unit-logarithm-kernel`, `D.3/unramified-etale-algebra`, `D.4/global-p-adic-regulator`, `L1/semilocal-bloch-kato` | The named semilocal equivalence F ⊗_Q Q_p ≅ ∏_{v\|p} F_v (and O_F ⊗ Z_p ≅ ∏ O_v) with its characteristic property, as planned in that layer; this roadmap uses it as given. |
| `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group` | `D.1/teichmuller-unit-decomposition`, `D.1/unit-logarithm-kernel`, `L1/integral-logarithm-unramified` | Import the local unit filtration, canonical Teichmüller splitting and p-adic log/exp isomorphism on sufficiently deep units from upstream Layer 1. For finite L/Q_p, kernel(log on O_L^×)=μ(L); for unramified L and odd p, log:1+pO_L≅pO_L. Check agreement with the pinned TauCeti.teichmuller section and Coleman’s Iwasawa branch, without rebuilding the upstream carrier. |
| `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius` | `D.1/unramified-frobenius-on-roots`, `D.3/unramified-etale-algebra` | Import finite unramified extension classification, existence/uniqueness of arithmetic Frobenius and the integer-ring identification O_L≅W(F_q), natural under embeddings and finite products, including the agreement of Frobenius with WittVector.frobenius. IsArithFrobAt only states a residue congruence; FormallyUnramified on the generic characteristic-zero field only states separability. Supply the specialized product interface retained at D.3/unramified-etale-algebra. |
| `ArithmeticGaloisDuality:R02.4` | `L1/bloch-kato-logarithm`, `L1/dimension-formulas`, `L1/local-duality-of-conditions`, `L1/tate-twist-examples`, `L1/dual-exponential` | For K/Q_p finite and finite-dimensional continuous Q_p-representation V, provide the perfect cup-product pairings H^i(K,V)×H^{2−i}(K,V*(1))→Q_p, the invariant identification H²(K,Q_p(1))≅Q_p, finite-dimensional H^i(K,V), vanishing above 2 and the local Euler characteristic dim H⁰−dim H¹+dim H²=−[K:Q_p]dim V, obtained by finite coefficients, a stable lattice, inverse limits and rationalization. It must agree with the read D7/local-invariant-trivialization and D7/duality-after-localization pairings; a discrete class-formation Ext theorem alone is not this statement. The result must apply to every finite K/Q_p, without assuming that K is already presented as a completion of a chosen global field. |
| `PadicHodgeTheory:R06.1` | `L1/local-duality-of-conditions`, `L1/dual-exponential` | Continuous cohomology of B_dR⁺→B_dR for de Rham V, Hodge–Tate graded C_p cohomology and its filtration-limit compatibility, with the Kummer boundary used by BK Proposition 3.8, pp. 355–359. Required by the direct e/g proof, not finite ramified descent. Also supply Kato’s cup-with-log χ identification H^1(K,B_dR⊗V)≅D_dR(V) and the corresponding B_dR⁺ identification for de Rham V (FO Proposition 6.35; Berger Proposition II.5), used by the dual exponential. |
| `CohomologyComparisons:CP.4` | `D.5/relative-curve-syntomic-regulator`, `D.5/smooth-family-specialisation` | Relative syntomic-symbol and σ-compatible evaluation/base change for the proposed CS prefix, exactly AM2022 Theorem 3.7 and §4.1. CP.4 remains a routing anchor; its existing proper rational theorem does not supply this relative integral contract. |
| `PadicDifferentialEquationsAndRigidCohomology:RD.4` | `D.5/relative-curve-syntomic-regulator`, `D.5/smooth-family-specialisation` | Route filtered F-MIC(S,σ), Ext¹, logarithm extensions and their σ-compatible pullback to the owner of relative filtered F-isocrystals/connections, alongside relative rigid/de Rham comparison. These are generic carriers imported by the regulator-specific extension of AM2022 §2, not a claim that current RD.4 already implements them. |

The additional S.6/soule-scheme-operations prerequisite was read in its supplier packet: it applies to regular noetherian finite-dimensional schemes, hence the smooth integral model. E.4 applies only to a curve over a field, and is used after restricting to the generic fibre. E.3 supplies its curve localization, not a two-dimensional model localization. The previously recorded higher-genus model-integrality gap is retained rather than bypassed.

| Handed red-team finding | Verified routing |
|---|---|
| RT-AREA-iwasawa-1/19 | L1 has no reverse prerequisite on Selmer L2; L4 may consume L1. Read the finding and its verifier; generic periods remain permitted earlier inputs. |
| RT-AREA-iwasawa-2/3 | The early classical integral/open producer is requested in CohomologyComparisons Part II after CR.5/CR.6. The four CS interfaces are proposed IDs, not existing CP.4 nodes or a regulator-owned generic carrier. The rejected alternative-source detour is not reinstated. |
| RT-AREA-ktheory-2/15 | D1 and the imported Bloch/K3 substrate feed D2, then D3 and D4, then HB.7. Habiro objects are not planned in the regulator packet. |
| RT-AREA-ktheory-2/18 | Soulé’s Chern producer is requested from the M.7-only prefix with continuous realization from M.1; no M.8 cycle input is used by D2 or HB.1/HB.2. |

Twenty requests and nine gaps remain. They cover the general non-special dilogarithm formula, CC/Kummer sign, curve pushforward source limitation, colliding-support/genus integration, higher-genus model integrality, Vologodsky/index owner, CS prefix, missing geometric Lean hypotheses, and relative F-MIC/syntomic producers. Coverage also retains the separate global injectivity conjecture and exact numerical recomputation as remaining work. A stage marked planned is not closed under PROTOCOL §0; none is relabelled closed.

## API, tests, planets and validation

All 24 definitions/constructions have enough API to expose constructors or data, maps, extensionality, zero/additivity where applicable, compatibility and examples. Their 106 tests include actual computations, degenerate cases, compatibility squares and non-examples. The 119 whole-packet tests are present as typed examples in the suggestion file. The added A^1 case distinguishes H^1(Fil^1 RΓ_dR)=K[x]dx from Fil^1 H^1_dR=0; the native derivative-surjectivity/nonzero-polynomial prototype is an unproved test, not a computed de Rham formalization. The factor-25 scalar identity is proved, but the geometric exponential theorem retains `sorry`.

All 198 API names, 72 declaration names and 119 test names occur in the suggestion file. The native polynomial, field, submodule, complex and linear-map prototypes elaborate; source-specific geometry/topology/cohomology hypotheses absent at the pin remain explicitly omitted under §13. Several theorem prototypes expose representative clauses only. Successful elaboration is not a proof of those mathematical contracts or a fresh numerical recomputation of GSWZ/Asakura examples.

| Stage | Planet |
|---|---|
| L1 | Bloch–Kato local conditions |
| L1 | Bloch–Kato exponential |
| L1 | Kato's dual exponential |
| L1 | Integral Bloch–Kato logarithm |
| L2 | Fontaine's ψ-isomorphism |
| L2 | Berger's ψ-invariants theorem |
| D.1 | p-adic dilogarithm D_p on étale algebras |
| D.1 | Combined p-adic dilogarithm D_p |
| D.2 | Soulé's étale regulator |
| D.2 | Besser's syntomic regulator |
| D.2 | Besser–de Jeu dilogarithm formula |
| D.3 | Completed K₃ of an unramified p-adic algebra |
| D.3 | p-adic regulator on completed K₃ |
| D.3 | Unramified K₃ regulator theorem |
| D.3 | Roots of unity generate completed K₃ |
| D.4 | Global p-adic K₃ regulator |
| D.5 | Weight-two syntomic cohomology of curves |
| D.5 | Syntomic regulator on K₂ of curves |
| D.5 | Besser's symbol formula |
| D.5 | Relative syntomic regulator of curve symbols |
| D.5 | Specialization of syntomic regulators |
| D.5 | Semistable symbol formula for the continuous regulator |

Checks completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/PadicHodgeRegulators--D.1.json`: 0 errors, 0 warnings.
- `lean-check research/blueprint/suggested/PadicHodgeRegulators--D.1.lean`: exit 0 at the shared pinned Mathlib build; only declaration-uses-`sorry` warnings. Memory was checked before each compilation. No Lean server or library build/update/cache command was started.
- All mathematical statement/hypothesis/proof/acceptance/API/test strings were checked against the synchronized reader; no missing field. All definition/construction test minima and declaration/API/test-name coverage checks pass.
- `git diff --check`: clean. The change set is restricted to the four issue deliverables and this review’s handoff.

## Questions and follow-up for the orchestrator

These are routing/implementation follow-ups, not blockers to acceptance:

1. Assign or confirm the proposed CS.0–CS.3 producer IDs in CohomologyComparisons Part II, retaining EN model normalization, the safe divided comparison range and the normalized rational boundary. Route the relative extension/evaluation contract alongside them; CP.4 is only the anchor.
2. Route the arbitrary-finite-local-field rational Euler characteristic/cup pairing and continuous B_dR cohomology exports requested from ArithmeticGaloisDuality R02.4 and PadicHodgeTheory R06.1.
3. Supply the exact PG.1/PG.4/PG.5/PG.6 lattice/Wach/coefficient exports, and settle the CC/Kummer sign against L3’s convention rather than assigning it by a suggestive cocycle calculation.
4. Assign the generic relative filtered F-MIC/Ext/base-change producer and ColemanIntegration Part II’s Vologodsky/gluing/double/triple-index producers. The regulator nodes already specify the source-supported comparisons and restricted domains.
5. Follow-up implementation must restore omitted geometric hypotheses, carry the corrected raw-versus-normalized base-change maps, and turn the retained source numerical data into executable exact-precision checks. Keep global injectivity and BdJ Conjecture 1.14 as conjectural targets.
