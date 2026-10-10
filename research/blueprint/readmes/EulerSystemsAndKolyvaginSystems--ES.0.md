# Euler systems, Kolyvagin systems and higher-rank descent — ES.0–ES.7

This roadmap plans the descent from norm-compatible arithmetic cohomology classes to Selmer bounds, primitivity and module structure. The rank-one Mazur–Rubin and Rubin constructions, Howard’s self-dual theory, and the higher-rank Stark and bidual theories have separate coefficient and local hypotheses. Cyclotomic units, Kato classes, and CM points are supplied by their arithmetic owners. ES.8, including Howard’s Λ-adic theorem, is outside this part.

The pass is at target level: all eight layers are planned and none is closed. Each prerequisite chain ends in the pinned libraries, an inspected owner, an exact supplier request, or a recorded gap. Every implementation status is unchecked. The review object dated 2026-10-06 remains the historical independent review; this revision requires a new independent review.

## Conventions and ownership

- K is a number field; R is the stated local coefficient ring, with maximal ideal m and residue characteristic p. Principal artinian rings, discrete valuation rings and Gorenstein orders are distinguished in each result.
- The Cartier dual of a lattice is discrete torsion; its lattice Tate dual is used in Euler polynomials. Finite self-injective coefficient duals need the explicit L2 dictionary.
- Frobenius is arithmetic. Rubin’s polynomial is det(1−Fr_q⁻¹X on the lattice Tate dual); the Mazur–Rubin polynomial is det(1−Fr_q X on T). Every comparison transports the polynomial convention.
- Conductors are squarefree finite prime sets, with conductor one represented by the empty set. Divisibility is inclusion and ν(n) is cardinality. Norm relations use corestriction.
- Signed MR16 core rank and the MR04 positive-part convention are distinct. Artinian zero divisibility is truncated at the ring length; DVR zero divisibility is infinity.
- Continuous arithmetic cohomology, coefficient propagation and duality belong to ArithmeticGaloisDuality and SelmerIwasawaCohomology. Generic exterior biduals, contractions and normalized group-ring transfer belong to PadicMeasuresIwasawaAlgebras L6. ES only specializes these to its arithmetic systems.
- Current Tau Ceti already supplies generic Fitting ideals; IntegralHeckeAndGaloisDeterminants consumes them. This post-pin API is imported by the plan, while the pinned prototype supplies a presentation-minor adapter. It is not a new ES or L6 target.
- ClassFieldTheory native Layer 13 supplies class fields, Layer 7 supplies normalized local Artin maps and Layer 5 supplies finite local Tate duality. Chebotarev native Layer 10 supplies Frobenius prime selection.
- Howard’s inert primes use ℓ+1, ring-class local extensions and k_λ×/k_ℓ×. Their rank-two finite/transverse comparison is distinct from the MR rank-one-coinvariant polynomial comparison. HE.0 owns the ring-class specialization.
- ES.4 supplies conditional bounded-error descent. HE.7 owns CM-point geometry, verification of exceptional-prime inputs, and the passage to full Mordell–Weil/Sha finiteness.

## Arithmetic prototype and its limits

The [suggested Lean file](../suggested/EulerSystemsAndKolyvaginSystems--ES.0.lean) uses canonical continuous H¹ of absolute Galois representations and finite field subgroups, literal localization kernels for Selmer modules, ray and ring-class local subgroups, coefficient quotients and tame tensor factors. It includes induced connecting classes, raw and corrected derivative formulas, graph sections, Stark transitions, regulators, and the conditional arithmetic bounds. It does not prove the proposed theorems.

Each API entry below has a typed proposed declaration. Each registered unit-test label is placed beside its typed anonymous example. Wider arithmetic source examples appear as acceptance checks. The labels do not turn the examples into implementation tests.

Unavailable supplier conditions are explicitly absent from the prototype in accordance with PROTOCOL §13: the elliptic local Kummer/Weil-pairing realization, Nekovář’s quaternionic/CM-point geometry and non-CM condition (*), the purity/polarization realization of the finite local torsion criterion, and the ordered archimedean regulator characterization of Rubin–Stark elements. The mathematical statements retain these hypotheses. No source theorem follows from the displayed prototype data alone. The prototype takes a rational Rubin–Stark norm family as input, and then tests integral bidual membership at every level.

The higher derivative is formed over the full reduced group ring of E(n)/K. Relative Galois products only define the derivative operator; no splitting of the full Galois group is assumed. The correction keeps Δ₁=1, Δ_q=0 and the negative two-prime cross-term. Frobenius injectivity 6.11 is required for the local-relation theorem, rather than for the correction expression itself. At fixed E the typed comparison verifies independence of generators. The larger-auxiliary-field/target-field comparison of Corollary 6.13 and the full corrected MR rank-one comparison remain exact supplier dictionaries; the rank-one typed check covers the raw base component.

## Counts and coverage

| Item | Result |
| --- | --- |
| Nodes | 89: 30 definitions, 7 lemmas, 33 theorems, 6 applications, 10 constructions, 3 comparisons |
| API / unit tests | 245 / 125 |
| Planets | 35; 6/3/3/5/5/5/4/4 |
| Pinned baseline declarations | 19 |
| Supplier requests / gaps | 10 / 5 |
| Pass status | complete |

| Layer | Status | Refinement and implementation boundary |
| --- | --- | --- |
| ES.0 | planned | Implement the exact general-R duality and compact/discrete coefficient adapters in the L2 request. All target-level definitions and arithmetic signatures are supplied; their proofs remain implementation work. |
| ES.1 | planned | Lemma level: Mazur–Rubin 2004 Lemma 3.6.3 and the two-step proof of Propositions 3.6.1–3.6.2; Rubin Lemma V.2.1.; The consumer requests of HeegnerPointEulerSystems (Zhang's two-class detection over a finite field k₀, Gross's eigenspace pairings) are special cases of chebotarev-nonvanishing and transverse-duality for self-dual T; state them in Howard's setting as corollaries once HE.6 fixes its exact forms.; The remaining items of the Liu–Tian–Xiao–Zhang–Zhu route (S23-closure, S23-norm, S23-paired, S23-obstruction, S23-defect, S23-error, S24-rows, S24-bounded) refine abundant-tuples and ES.4/abundant-localization to the paired-evaluation obstruction; they are lemma-level statements of linear algebra over a discrete valuation ring. |
| ES.2 | planned | Lemma level: Rubin Lemma IX.6.3 and Corollary 6.4 (units and shifts of the variable) in full, and Proposition IV.3.1(iv)–(v), Lemmas IV.2.5, IV.4.6 and Proposition IV.4.7 as separate statements.; Smoothing (removing the dependence on an auxiliary prime, as for cyclotomic units) is stated by the cyclotomic owner; a generic smoothing operation was not found in the sources read. |
| ES.3 | planned | Lemma level: Rubin IV §6 (Proposition 6.1 is planned in SelmerIwasawaCohomology L3; Corollaries 6.2, 6.5, Lemma 6.3, Definition 6.6, Lemma 6.7, Proposition 6.8), IV §7 (Lemmas 7.1, 7.3, the lifted telescoping identity), and Mazur–Rubin Appendix A (Lemma A.6 to Proposition A.15).; The derivative descent statement with explicit kernel and cokernel when W^{G_{F(r)}} ≠ 0 is contained in lifting-to-induced-module; an explicit bound for the non-canonical descent used by HeegnerPointEulerSystems HE.7 (bounded denominators) is a follow-up. |
| ES.4 | planned | Lemma level: Mazur–Rubin 2004 Lemmas 4.3.8–4.3.9, Propositions 4.3.10–4.3.11, Theorem 4.3.12, Theorem 4.4.3 (sufficiently liftable systems) and Appendix B (Howard's proof of Theorem 4.3.3).; Rubin Theorem II.2.10 is included in rubin-bound(c); Rubin Chapter V §2 general case of Lemma 2.5 at lemma level.; Castella–Grossi–Lee–Skinner Lemmas 3.3.10 and Proposition 3.3.11 are cited inside howard-descent-with-errors; they become nodes at lemma level.; Fulfil CA.7’s noncommutative maximal-order pairing-cokernel bound and HE.7’s geometric/non-CM input dictionary; the exact all-prime annihilator target and dyadic error constants are stated here. |
| ES.5 | planned | Lemma level: Mazur–Rubin 2004 Lemmas 4.5.13–4.5.14, Proposition 4.5.15, Lemmas 5.2.7–5.2.8; Howard Lemmas 1.5.6–1.5.8 and 1.6.2–1.6.4.; Howard's Λ-adic theorem (Theorem 2.2.10) belongs to ES.8 and is planned with that layer (red-team finding RT-AREA-iwasawa-1/10). |
| ES.6 | planned | Generic Gorenstein duality, contractions and transfer remain the exact L6 supplier contract.; Lemma-level refinement of MR16 Appendix A/§14 and the BSS/Sakamoto auxiliary lemmas; target-level proof interiors and Stark comparison have been read. |
| ES.7 | planned | The Σ-modified cohomology comparison avoiding BSS Hypothesis 6.1(i).; Fulfil the exact L6 modulo-M transfer and compatible-functional-lift contract.; Implement the exact auxiliary/target-field and full corrected rank-one comparison dictionaries; the typed tests currently check generator independence and raw base evaluation.; The ordered archimedean regulator/rationality supplier is I.7 Part II; the conditional class-group theorem is fully stated here. |

## Pinned baseline

Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174. Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369. The declaration statements were read at these commits. Current upstream roadmaps and library were inspected separately so post-pin work is consumed rather than planned again.

| Declaration | What it supplies |
| --- | --- |
| mathlib:Squarefree | Squarefree elements of a monoid; used for the index set N(P) of squarefree products. |
| mathlib:Module.length | The length of a module as an element of ℕ∞. |
| mathlib:LinearMap.charpoly | The characteristic polynomial of an endomorphism of a finite free module; the Euler polynomials are its reversals. |
| mathlib:LinearMap.aeval_self_charpoly | Cayley–Hamilton: aeval f f.charpoly = 0. |
| mathlib:MonoidAlgebra | The group ring k[G], in which N_Γ and D_σ live. |
| mathlib:Representation.norm | For a representation ρ of a finite group, norm ρ = Σ_g ρ g. |
| mathlib:SimpleGraph | Simple graphs; the graph X(P) is one. |
| mathlib:exteriorPower.pairingDual | The linear map ⋀^n(Dual R M) → Dual R (⋀^n M), with pairingDual (ιMulti f) (ιMulti v) = det(f j (v i)). |
| mathlib:exteriorPower.bijective_pairingDual | pairingDual R M n is bijective for M finite free. |
| mathlib:exteriorPower.map | Functoriality of exterior powers. |
| mathlib:Module.Dual | The dual module M →ₗ[R] R. |
| mathlib:Module.IsReflexive | Reflexive modules: evaluation M → Dual (Dual M) is bijective. |
| mathlib:Module.Injective | Injective modules; R self-injective is Module.Injective R R. |
| tauceti:TauCeti.ContCohomology.explicitCor1 | Corestriction H¹(U, M) → H¹(G, M) for a finite-index subgroup, on continuous cochains of discrete modules. |
| tauceti:TauCeti.ContCohomology.explicitCor1_comp_res1 | cor ∘ res = multiplication by the index on H¹. |
| tauceti:TauCeti.ContCohomology.DiscreteShortExact.explicitCor_delta0 | Corestriction commutes with the connecting map δ⁰ of a short exact sequence of discrete modules (Rubin, Proposition IV.4.5(iii)). |
| tauceti:NumberField.Chebotarev.frobeniusPrimeSet | The set of primes of K unramified in L whose Artin symbol is a given conjugacy class. |
| tauceti:NumberField.artinSymbol | The Artin symbol (Frobenius conjugacy class) of an unramified prime in a finite Galois extension of number fields. |
| tauceti:TauCeti.GlobalNumberFields.RayClassGroup | The ray class group of a modulus: ideals prime to the modulus modulo the ray. |

## Sources and versions

All results and source findings below are stated in our own words. There are no source excerpts. Page numbers refer to the version named in the locator; published page numbers and preprint pages are kept separate. The earlier source-reading records are retained as historical evidence, with bounded additional reading dated 2026-10-10.

### Kolyvagin systems (mr-ks)

Barry Mazur and Karl Rubin. Memoirs of the American Mathematical Society 168 (2004), no. 799; authors' copy, 96 pp., read 2026-10-06. [Source](https://web.archive.org/web/2020id_/https://www.math.uci.edu/~krubin/preprints/kolysys.pdf).

- Chapters 1–3 in full (statements and proofs)
- Chapter 4: statements of §§4.1–4.5 and the proofs of 4.1.5, 4.1.7, 4.1.9, 4.1.16, 4.2.1–4.2.2, 4.4.1 (case k = 1)
- Chapter 5 §§5.1–5.2: statements and the proofs of 5.2.2, 5.2.9, 5.2.10, 5.2.14
- §§6.1–6.2: Definitions 6.1.1, 6.2.1, Lemmas 6.1.5, 6.2.3, Propositions 6.1.6, 6.2.2, 6.2.6
- Appendix A: Lemma A.1, Proposition A.2, Definition A.3, Theorem A.4 and the proof of Theorem 3.2.4
- Not read: §5.3 (Iwasawa algebras, layer ES.8), Appendix B beyond its statements

### Euler systems (rubin-es)

Karl Rubin. Author's 1999 draft of Annals of Mathematics Studies 147 (Princeton University Press, 2000), 187 pp., read 2026-10-06; chapter-relative numbering as in the draft. [Source](https://swc-math.github.io/notes/files/99RubinES.pdf).

- Chapter II §§1, 2 and 4 in full; §3 notation only
- Chapter IV §1, §2, §3 (statements), §4 (Definitions 4.1, 4.4, 4.10, Lemmas 4.2, 4.12, 4.13, Propositions 4.5, 4.8 statements, Remarks 4.3, 4.11), §5 in full, §8 Corollary 8.1 statement
- Chapter V: Lemmas 2.1, 2.3, 2.5, 3.1, 3.2 (statements) and Definition 2.4
- Chapter IX §§1, 3, 4, 5 and Lemmas 6.1, 6.3, Corollary 6.4 (statements)
- Appendix A: Corollaries 2.6 and 2.7
- Additional reading 2026-10-10: IV §§6–7 and V §2 in full, pp. 68–76 and 80–86, including local lifts and the general Lemma 2.5 proof.

### Controlling Selmer groups in the higher core rank case (mr-higher)

Barry Mazur and Karl Rubin. arXiv:1312.4052v1 (14 December 2013), 32 pp., read 2026-10-06; published in Journal de Théorie des Nombres de Bordeaux 28 (2016). [Source](https://arxiv.org/abs/1312.4052v1).

- §§2–4 in full
- §5: Definition 5.1, Lemma 5.2, Corollary 5.3, Theorem 5.4, Proposition 5.9
- §§6–8: definitions and statements, proofs of Lemma 6.9 and Theorems 6.10, 7.4, 8.6
- §§10–13: definitions and statements
- Not read: §9, §14 and Appendix A beyond their statements
- Additional published-version reading 2026-10-10: §§10–14 and Appendix A, pp.169–183; the preprint citations remain labelled separately.

### On the theory of higher rank Euler, Kolyvagin and Stark systems, II (bss2)

David Burns, Ryotaro Sakamoto and Takamichi Sano. arXiv:1805.08448v1 (22 May 2018), 51 pp., read 2026-10-06; the only version on arXiv. [Source](https://arxiv.org/abs/1805.08448v1).

- §2.1 in full; §2.2 statements of Proposition 2.4, Corollaries 2.6, 2.7
- §3.1 in full; Lemma 3.9 statement
- §4: §4.1, Definition 4.1, Hypothesis 4.2, Remark 4.3, Corollary 4.5, Theorem 4.6 with proof, §4.3 Hypothesis 4.7, Remarks 4.8–4.9, Definition 4.11, Theorem 4.12
- §5: §§5.1–5.3 definitions, Theorem 5.2, Definition 5.24, Theorem 5.25 (statements)
- §6: §6.1, §6.2, §6.3 (Lemma 6.9, Proposition 6.10), Hypothesis 6.11, Theorem 6.12, Corollaries 6.13, 6.15 (statements)
- §7: Theorem 7.1 statement
- Additional reading 2026-10-10: §5.4 pp. 26–35, §6.5 pp. 44–48 and §7 pp. 48–50, statements and proofs.

### The Heegner point Kolyvagin system (howard)

Benjamin Howard. Compositio Mathematica 140 (2004), 1439–1472, published version, read 2026-10-06. [Source](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf).

- §1.2 and §1.3 in full
- §1.4: Proposition 1.4.1, Theorem 1.4.2 with proof
- §1.5: Lemma 1.5.1, Definition 1.5.2, Lemma 1.5.3, Definition 1.5.4, Propositions 1.5.5, 1.5.9
- §1.6: Theorem 1.6.1 statement and the outline of its proof
- Not read: §1.7 and Section 2 (Heegner points and the Λ-adic theory)
- Additional reading 2026-10-10: §1.1 local ring-class conditions and §§1.5–1.6 structure/descent proofs, pp.1441–1444 and 1451–1459.

### On the Brumer–Stark conjecture (dk)

Samit Dasgupta and Mahesh Kakde. arXiv:2010.00657v3, 99 pp., read 2026-10-06; published in Annals of Mathematics 197 (2023), 289–388. [Source](https://arxiv.org/abs/2010.00657v3).

- §1.2 (equations (8)–(10), the Rubin–Brumer–Stark element, Rubin's lattice, Conjecture 1.5, Theorem 1.6)

### On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives (ltxzz)

Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu. arXiv:1912.11942 (latest version, 179 pp.), read 2026-10-06; published in Inventiones mathematicae 228 (2022), 107–375. [Source](https://arxiv.org/abs/1912.11942).

- §2.1 Definition 2.1.6
- §2.3: Definition 2.3.2, Lemmas 2.3.3–2.3.5 (statements)
- §2.4: Proposition 2.4.6 (statement)
- §2.6: Definitions 2.6.3, 2.6.5, Lemma 2.6.4, Propositions 2.6.6, 2.6.7 (statements and the first lines of the proofs)
- The statements were read together with the reviewed extraction research/blueprint/papers/PAPER-LIU-ETAL-22.result.json, whose corrections E1, E2 and E23 are used
- Additional published-version reading 2026-10-10: §§2.3–2.6, printed pp.126–135. Read the maintainer-cleared copy in place; no text or PDF is copied into the repository.

### On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes (cgls)

Francesc Castella, Giada Grossi, Jaehoon Lee and Christopher Skinner. arXiv:2008.02571v2 (authors' final version), 34 pp., read 2026-10-06; published in Inventiones mathematicae 227 (2022), 517–580. [Source](https://arxiv.org/abs/2008.02571v2).

- §3.2: Theorem 3.2.1
- §3.3: statements of Lemma 3.3.1, Proposition 3.3.2, Lemmas 3.3.3–3.3.4, Proposition 3.3.6, Corollary 3.3.7, Theorem 3.3.8, Lemma 3.3.9
- Read together with the reviewed extraction research/blueprint/papers/PAPER-CASTELLA-ETAL-22.result.json (items 18–23)
- Additional reading 2026-10-10: §§3.2–3.3 weak pairing, residual-trivial twist and uniform-error descent, arXiv v2 pp.16–29.

### The Euler system method for CM points on Shimura curves (nekovar)

Jan Nekovář. Archived author manuscript, 51 pp.; author-page numbering, read 2026-10-10. [Source](https://web.archive.org/web/20240000000000id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf).

- §3.1 and Theorem 3.2, pp. 18–19; §5.19; §§6.1–6.4 and 6.6.2, pp. 34–43; §§7.2–7.6, pp. 44–51

### Stark systems over Gorenstein local rings (sakamoto)

Ryotaro Sakamoto. Algebra & Number Theory 12 (2018), 2295–2326; publisher issue PDF, read 2026-10-10. [Source](https://msp.org/ant/2018/12-10/ant-v12-n10-p.pdf).

- §4.5, Lemma 4.13 and Proposition 4.14, pp. 2313–2314

### Refined abelian Stark conjectures and the equivariant leading term conjecture of Burns (sano14)

Takamichi Sano. arXiv:1406.4623v1; read 2026-10-10. [Source](https://arxiv.org/abs/1406.4623v1).

- §§2.1–2.2, pp. 3–7: lattice duality, invariant functionals, Lemmas 2.10–2.11 and Remark 2.12

### Controlling Selmer groups in the higher core rank case (mr-higher-published)

Barry Mazur and Karl Rubin. Journal de Théorie des Nombres de Bordeaux 28 (2016), 145–183; Numdam version of record, read 2026-10-10. [Source](https://www.numdam.org/article/JTNB_2016__28_1_145_0.pdf).

- Definitions 3.4, 4.1 and §§10–13 compared to the preprint; original nodes retain their preprint locators

| Source | Version / reading date | Fingerprint |
| --- | --- | --- |
| mr-ks | author copy; 2026-10-06; [link](https://web.archive.org/web/2020id_/https://www.math.uci.edu/~krubin/preprints/kolysys.pdf) | 4cc432d0d719a51c8dd1d2b27829014b9f090f7c53f179d6c628e6208c84e01f |
| rubin-es | author copy; 2026-10-06; [link](https://swc-math.github.io/notes/files/99RubinES.pdf) | de47655dc35066fd01f2e76a37076ad03dee62e816130586c7674e520be73d50 |
| mr-higher | preprint; 2026-10-06; [link](https://arxiv.org/pdf/1312.4052v1) | 15ec72e48fab1790e5b96e7172b4af88c974b0d487a515cdbd9dd0ced3ea4ee8 |
| bss2 | preprint; 2026-10-06; [link](https://arxiv.org/pdf/1805.08448v1) | 2f6da843d3dcedde65a2b04b80c711863306f9fd9ab20580d245d2c4d2f06429 |
| howard | published; 2026-10-06; [link](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf) | 89082beb9117b111558f1c62356a0610602781ec2a2b3487ce561920cf4d78d7 |
| dk | preprint; 2026-10-06; [link](https://arxiv.org/pdf/2010.00657v3) | c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099 |
| ltxzz | preprint; 2026-10-06; [link](https://arxiv.org/pdf/1912.11942) | 84dc7c8369298314bd4e7ece5a45e5e096f39bd376f08c4c489950873c46fe86 |
| cgls | preprint; 2026-10-06; [link](https://arxiv.org/pdf/2008.02571v2) | 7cd995e0d9ee1c931f728da8b39603c4205fa0a84c25df27d44b4451a81a2c59 |
| rubin-es-book-copy | author copy; 2026-10-06; [link](https://www.wstein.org/people/rubin/book/hEulerSystems.pdf) | 1b0229731e38bfaaa55b38a219c055019d1c7db1f0ecec3c083125da87b6e8e4 |
| nekovar | author copy; 2026-10-10; [link](https://web.archive.org/web/20240000000000id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf) | 05c8debf4783f4604afe71a0b4367554ac62d52a6a462daa5e2e8c2ed6bfd26a |
| sakamoto | published; 2026-10-10; [link](https://msp.org/ant/2018/12-10/ant-v12-n10-p.pdf) | ea04b2b3cafe1b990ab32c461f8aea0563baf75fa11b0e93eaea06b1cb325ee0 |
| sano14 | preprint; 2026-10-10; [link](https://arxiv.org/abs/1406.4623v1) | 83ca6e59cefdb60833f418aa57617a451101977de1b767ddf6138661758ccea4 |
| mr-higher-published | published; 2026-10-10; [link](https://www.numdam.org/article/JTNB_2016__28_1_145_0.pdf) | 00725ad7afc9d7f3d69dac9eb8f872319974bf846be850dc3c0b56ba3b49d926 |
| ltxzz | published; 2026-10-10; [link](https://doi.org/10.1007/s00222-021-01088-4) | dd821abd2b06233cb69cdc88de242b689686d5f2ce0c2072128abcd54ec89d97 |

- mr-ks: Archived author copy only. AMS version-of-record download https://www.ams.org/memo/0799/memo0799.pdf returned HTTP 403; Proposition 3.4.4 finding is scoped to this copy.
- bss2: arXiv lists only v1. The KCL accepted manuscript PDF https://kclpure.kcl.ac.uk/portal/files/345599305/bss-acceptedversion.pdf returned HTTP 403; accepted/published collation remains open.
- rubin-es-book-copy: 233-page book-format author copy mirrored by William Stein, inspected visually at title, contents and §9.1 p.175 (PDF p.181); same outside-N wording as the course draft. It has no publisher imprint, so is not certified as the version of record. Other numbered nodes still use the 1999 draft.
- ltxzz: Maintainer-cleared Inventiones copy, §§2.3–2.6, printed pp.126–135. The earlier arXiv locators remain explicitly versioned. The abundance exponent is reducibility depth; the Frobenius-image and positive-loss localisation corrections are still needed in this published range.

## ES.0. Coefficient data, quotient propagation and Selmer interfaces

**Planets:** Selmer triple; Cartesian local condition; Core rank; Canonical Selmer structure; Mazur–Rubin hypotheses (H.0)–(H.6); Mazur–Rubin hypotheses over number fields.

### Selmer triples and squarefree conductors

`EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple` — definition.

**Statement.** Fix a number field K, a prime p and a coefficient ring R: a complete noetherian local ring with maximal ideal m and finite residue field k = R/m of characteristic p. A Selmer triple (T, F, P) consists of a free R-module T of finite rank with a continuous R-linear action of G_K unramified outside finitely many primes, a Selmer structure F on T (a finite set Σ(F) of places containing the archimedean places, the places above p and the primes where T is ramified, with an R-submodule H¹_F(K_v, T) ⊆ H¹(K_v, T) for v ∈ Σ(F), and the unramified condition elsewhere), and a set P of primes of K disjoint from Σ(F). N(P) is the set of squarefree products of primes of P, with 1 ∈ N(P), and ν(n) is the number of prime factors of n. Selmer data (T, F, P, r) add an integer r ≥ 1. The dual is T^* = Hom(T, μ_{p^∞}) with the dual structure F^*.

**Suggested declarations.** `TauCeti.KolyvaginSystems.SelmerTriple`, `TauCeti.KolyvaginSystems.SelmerTriple.conductors`, `TauCeti.KolyvaginSystems.SelmerTriple.one_mem_conductors`, `TauCeti.KolyvaginSystems.SelmerTriple.conductors_dvd_closed`, `TauCeti.KolyvaginSystems.SelmerTriple.restrictPrimes`, `TauCeti.KolyvaginSystems.SelmerTriple.dual`.

**Hypotheses.**

- R is complete noetherian local with finite residue field of characteristic p
- T is free of finite rank over R
- P ∩ Σ(F) = ∅

**Construction or proof.**

1. The Selmer structure, its Selmer module H¹_F(K, T) and the dual structure F^* are those of SelmerIwasawaCohomology L2 (dual-selmer-structure); this node only adds the prime set P and the index set N(P).
2. N(P) is the set of finite subsets of P, written multiplicatively; divisibility is inclusion and ν is cardinality.
3. Mazur–Rubin 2004 take K = ℚ (Chapter 2 and the first lines of Chapter 3); Mazur–Rubin 2016 Definition 4.1 states the same data over a number field K, and Howard Definition 1.2.1 over an imaginary quadratic field with P ⊆ the rational primes inert in K.

**Uses.**

- Mazur–Rubin 2004, Definitions 3.1.2–3.1.3: the vertices of the graph X(P) are the elements of N(P), and a Kolyvagin system has one class for each of them.
- Mazur–Rubin 2016, Definition 6.8: Stark systems are an inverse limit over N(P) ordered by divisibility.
- Howard, Definition 1.2.3: Kolyvagin systems over an imaginary quadratic field are indexed by N(L) for a set L of inert rational primes.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.SelmerTriple` | structure | The triple (T, F, P): a Selmer structure F on T together with a set P of primes disjoint from Σ(F). |
| `TauCeti.KolyvaginSystems.SelmerTriple.conductors` | data | N(P): the squarefree products of primes of P, as finite subsets of P. |
| `TauCeti.KolyvaginSystems.SelmerTriple.one_mem_conductors` | simp | 1 ∈ N(P). |
| `TauCeti.KolyvaginSystems.SelmerTriple.conductors_dvd_closed` | characterisation | If n ∈ N(P) and m \| n then m ∈ N(P). |
| `TauCeti.KolyvaginSystems.SelmerTriple.restrictPrimes` | functoriality | For P′ ⊆ P, (T, F, P′) is a Selmer triple and N(P′) ⊆ N(P). |
| `TauCeti.KolyvaginSystems.SelmerTriple.dual` | constructor | The Cartier dual data (T^*, F^*, P) use the imported discrete Selmer carrier, with Σ(F^*) = Σ(F). For a DVR lattice T, T^* = Hom(T, μ_{p^∞}) is discrete torsion, not a finite free lattice and hence not an object of the same lattice-triple type. Over a principal artinian ring, the finite Cartier dual is free of the same rank after the coefficient duality identification. |

**Unit tests.**

- `SelmerTriple.conductors_empty` (degenerate): For an empty prime set, the sole squarefree conductor is the empty product 1.
- `SelmerTriple.card_conductors_of_finite` (computation): For two distinct primes q₁,q₂, conductors are exactly 1,q₁,q₂,q₁q₂.
- `SelmerTriple.disjoint_sigma` (non-example): A prime in Σ(F) divides no allowed conductor.
- `SelmerTriple.not_mem_conductors_of_sq` (non-example): No squarefree conductor product is the square of a prime ideal.

**Acceptance checks.**

- For P = ∅ one has N(P) = {1} and a Selmer triple is a Selmer structure.
- N(P) is closed under taking divisors, and n, nq ∈ N(P) with q prime implies q ∈ P and q ∤ n.

**Prerequisites.** `SelmerIwasawaCohomology:L2`, `SelmerIwasawaCohomology:L2/selmer-kernel`, `mathlib:Squarefree`.

**Sources.**

- mr-ks, Chapter 3, first paragraph, p. 19: Definition of a Selmer triple over ℚ.
- mr-higher, Definition 4.1, p. 8: The same data over a number field K, with the rank r.

### The category of quotients of T

`EulerSystemsAndKolyvaginSystems:ES.0/quotient-category` — definition.

**Statement.** Quot_R(T) is the category whose objects are the quotients T/IT for all ideals I of R, and whose morphisms from T/IT to T/JT are the scalar multiplications by elements r ∈ R with rI ⊆ J. A local condition propagated from T to all quotients (images under T → T/IT) is functorial over Quot_R(T). For R principal artinian of length k with uniformiser π, the objects are T/m^iT for 0 ≤ i ≤ k, and multiplication by π^{j−i} is an injective morphism T/m^iT → T/m^jT for i ≤ j.

**Suggested declarations.** `TauCeti.KolyvaginSystems.QuotCat`, `TauCeti.KolyvaginSystems.QuotCat.scalarHom`, `TauCeti.KolyvaginSystems.QuotCat.scalarHom_comp`, `TauCeti.KolyvaginSystems.QuotCat.scalarHom_injective_iff`, `TauCeti.KolyvaginSystems.QuotCat.propagate_functorial`.

**Hypotheses.**

- R as in selmer-triple; T an R[[G_K]]-module

**Construction or proof.**

1. Objects are indexed by ideals; a morphism is a class of scalars r modulo the scalars acting by the same map, so that composition is multiplication.
2. Functoriality of propagated conditions: for r with rI ⊆ J, multiplication by r maps the image of H¹_F(K_v, T) in H¹(K_v, T/IT) into its image in H¹(K_v, T/JT), since r commutes with T → T/IT and T → T/JT.

**Uses.**

- Mazur–Rubin 2004, Definition 1.1.4 and hypothesis (H.6): the category on which local conditions are required to be cartesian.
- Mazur–Rubin 2004, Lemma 1.1.5: the injections π^j : T/m^iT → T/m^{i+j}T give the exact sequences behind the linear growth of lengths.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.QuotCat` | structure | The category Quot_R(T): objects the ideals I of R (standing for T/IT), morphisms I → J the scalars r with rI ⊆ J acting T/IT → T/JT. |
| `TauCeti.KolyvaginSystems.QuotCat.scalarHom` | constructor | For r ∈ R with r·I ≤ J, the G_K-equivariant R-linear map T/IT → T/JT induced by multiplication by r. |
| `TauCeti.KolyvaginSystems.QuotCat.scalarHom_comp` | functoriality | scalarHom s ∘ scalarHom r = scalarHom (sr), and scalarHom 1 is the identity of T/IT. |
| `TauCeti.KolyvaginSystems.QuotCat.scalarHom_injective_iff` | characterisation | For T free and nonzero, multiplication by r : T/IT → T/JT is injective if and only if (J : r) = I. |
| `TauCeti.KolyvaginSystems.QuotCat.propagate_functorial` | compatibility | A local condition propagated to quotients is a subfunctor of H¹(K_v, −) on Quot_R(T). |

**Unit tests.**

- `QuotCat.quotient_zero` (degenerate): The coefficient quotient comparison takes the zero class to zero.
- `QuotCat.zmod_sq_mul_p_injective` (computation): Over ℤ/p², the kernel of multiplication by p is the ideal (p), giving the injective scalar map R/(p)→R.
- `QuotCat.not_hom_of_not_le` (non-example): Over ℤ/p², scalar 1 does not carry the source ideal (p) into the target ideal 0, so it defines no such quotient morphism.

**Acceptance checks.**

- Over a field R = k the category has the two objects 0 and T.
- For R = ℤ/p², the map p : T/pT → T is a morphism and is injective when T is free.
- Additional arithmetic check: If R is a field, the objects of Quot_R(T) are T/0 = T and T/R·T = 0.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`, `SelmerIwasawaCohomology:L2/condition-propagation`.

**Sources.**

- mr-ks, Example 1.1.3, p. 8: Definition of the category of quotients.

### Cartesian local conditions

`EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition` — definition.

**Statement.** A local condition F at a place v, functorial over a category 𝒯 of R[[G_{K_v}]]-modules, is cartesian on 𝒯 if for every injective morphism α : T₁ → T₂ of 𝒯 the square formed by H¹_F(K_v, T₁) ⊆ H¹(K_v, T₁) and H¹_F(K_v, T₂) ⊆ H¹(K_v, T₂) is cartesian: H¹_F(K_v, T₁) is the inverse image of H¹_F(K_v, T₂) under α_*. A Selmer structure F on T is cartesian if for every q ∈ Σ(F) the condition at q, propagated to quotients, is cartesian on Quot_R(T).

**Suggested declarations.** `TauCeti.KolyvaginSystems.IsCartesian`, `TauCeti.KolyvaginSystems.isCartesian_iff_comap`, `TauCeti.KolyvaginSystems.isCartesian_unramified`, `TauCeti.KolyvaginSystems.isCartesian_of_field`, `TauCeti.KolyvaginSystems.isCartesian_of_torsionFree_quotient`, `TauCeti.KolyvaginSystems.IsCartesian.quotient`.

**Hypotheses.**

- F is functorial over 𝒯

**Construction or proof.**

1. Equivalently, for injective α the condition on T₁ equals the condition propagated backwards from T₂ (inverse image), as in SelmerIwasawaCohomology L2/condition-propagation.
2. The unramified (finite) condition is cartesian on unramified modules: for injective T₁ → T₂ the map Hom(I, T₁) → Hom(I, T₂) is injective (Mazur–Rubin 2004, Lemma 1.1.9).
3. If R is a discrete valuation ring and H¹(K_q, T)/H¹_F(K_q, T) is torsion-free for q ∈ Σ(F), the structures induced on T/m^kT are cartesian (Lemma 3.7.1(i)); cartesianness passes from T to T/m^jT (Lemma 3.7.3).

**Uses.**

- Mazur–Rubin 2004, Lemma 1.1.5 and Theorem 4.1.5: exactness in the middle of the sequence of propagated conditions, which makes lengths linear in the modulus and the core rank well defined.
- Mazur–Rubin 2016, hypothesis (H.5): the running hypothesis that the Selmer structure is cartesian.
- Howard, hypothesis H.3: the same condition on Quot(T) at every v ∈ Σ(F).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.IsCartesian` | structure | The predicate: for every injective morphism α of Quot_R(T), H¹_F(K_v, T₁) = α_*⁻¹(H¹_F(K_v, T₂)). |
| `TauCeti.KolyvaginSystems.isCartesian_iff_comap` | characterisation | F is cartesian iff for all i ≤ j the condition on T/m^iT is the inverse image of the condition on T/m^jT under π^{j−i} (R principal artinian). |
| `TauCeti.KolyvaginSystems.isCartesian_unramified` | example | The finite condition is cartesian on any category of unramified modules. |
| `TauCeti.KolyvaginSystems.isCartesian_of_field` | example | If R is a field every local condition on T is cartesian on Quot_R(T). |
| `TauCeti.KolyvaginSystems.isCartesian_of_torsionFree_quotient` | compatibility | R a discrete valuation ring and H¹(K_q, T)/H¹_F(K_q, T) torsion-free imply that the induced condition on T/m^kT is cartesian on Quot(T/m^kT) for every k. |
| `TauCeti.KolyvaginSystems.IsCartesian.quotient` | functoriality | If F is cartesian on Quot_R(T) then the induced condition is cartesian on Quot_{R/m^j}(T/m^jT). |

**Unit tests.**

- `isCartesian_strict_and_relaxed_field` (degenerate): Over a field, both strict and relaxed local conditions are cartesian.
- `isCartesian_unramified` (compatibility): For an unramified coefficient representation, the unramified local condition is cartesian.
- `not_isCartesian_torsion_condition` (non-example): For the rank-one trivial ℤ/p² representation at a place with nonzero reduced H¹, the p-torsion local condition is not cartesian.

**Acceptance checks.**

- The unramified condition on unramified modules is cartesian; over a field every condition is cartesian.
- A condition defined by an extension L/K_v need not be cartesian (Mazur–Rubin 2004, Remark 1.1.8); the non-example test below exhibits a failure.
- Additional arithmetic check: For K_v = ℚ_ℓ, ℓ ≠ p, R = ℤ/p^k and T = R with trivial action, the unramified condition Hom(G_{𝔽_ℓ}, T/p^iT) is cartesian: a homomorphism to ℤ/p^i whose composite with p^{j−i} : ℤ/p^i → ℤ/p^j is unramified is unramified.
- Additional arithmetic check: For R = ℤ_p and T = ℤ_p(1) over ℚ_ℓ, ℓ ≠ p, the condition ker(H¹(ℚ_ℓ, T) → H¹(ℚ_ℓ^{ur}, T ⊗ ℚ_p)) has torsion-free quotient, and its propagation to T/p^k is cartesian.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.0/quotient-category`, `SelmerIwasawaCohomology:L2/condition-propagation`, `SelmerIwasawaCohomology:L2/unramified-condition`, `SelmerIwasawaCohomology:L2/lattice-passage`.

**Sources.**

- mr-ks, Definition 1.1.4, p. 8: The definition, in its equivalent form.
- mr-higher, Definition 3.1 and Remark 3.2, p. 7: Cartesian Selmer structures and the two standard sufficient conditions.

### Lengths of cartesian conditions grow linearly

`EulerSystemsAndKolyvaginSystems:ES.0/cartesian-length-linearity` — lemma.

**Statement.** Let R be principal artinian of length k and F a local condition on T at v, cartesian on Quot_R(T). Then there is an integer r such that length H⁰(K_v, T/m^iT) − length H¹_F(K_v, T/m^iT) = r·i for 0 < i ≤ k.

**Suggested declarations.** `TauCeti.KolyvaginSystems.cartesian_length_linearity`.

**Hypotheses.**

- R principal artinian of length k
- F cartesian on Quot_R(T)
- T free of finite rank

**Construction or proof.**

1. For i + j ≤ k the sequence 0 → T/m^i → T/m^{i+j} → T/m^j → 0 gives a six-term exact sequence of H⁰ and H¹_F: exactness in the middle of the H¹_F terms is the cartesian condition for π^j, and surjectivity on the right is the definition of propagation to a quotient.
2. Hence λ(i) + λ(j) = λ(i + j) for λ(i) = length H⁰ − length H¹_F, so λ(i) = i·λ(1).

**Acceptance checks.**

- For the unramified condition on an unramified T one gets r = 0, since H¹_f(K_v, T) ≅ T/(Fr − 1)T has the length of T^{Fr=1}.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`, `mathlib:Module.length`.

**Sources.**

- mr-ks, Lemma 1.1.5, p. 8: Statement and proof of the linearity.

### Propagation commutes with local duality

`EulerSystemsAndKolyvaginSystems:ES.0/quotient-dual-propagation` — lemma.

**Statement.** Let F be a local condition on T at v and I an ideal of R. The two local conditions induced on T^*[I] = (T/IT)^* agree: the orthogonal complement of the condition propagated to the quotient T/IT, and the condition propagated to the submodule T^*[I] from the orthogonal complement F^* on T^*. Consequently, for a Selmer structure F, (F on T/IT)^* = (F^* on T^*[I]), and the same holds for the passages T → V and V → V/T of a lattice in its rational representation.

**Suggested declarations.** `TauCeti.KolyvaginSystems.quotient_dual_propagation`.

**Hypotheses.**

- Local Tate duality for T and T^* = Hom(T, μ_{p^∞}) at v

**Construction or proof.**

1. The local pairings for T/IT × T^*[I] and T × T^* are compatible with T → T/IT and T^*[I] → T^* (SelmerIwasawaCohomology L1/lattice-pairing-compatibility).
2. Apply the image/inverse-image rule for orthogonal complements (orthogonal_map_eq_comap of L1/orthogonal-complement): (image of L)^⊥ = inverse image of L^⊥.
3. The lattice case T ⊆ V and W = V/T is L2/lattice-passage together with L2/finite-condition-lattice-duality.

**Acceptance checks.**

- For F relaxed on T both constructions give the strict condition on T^*[I]; for F strict both give the relaxed condition.
- The condition on a quotient remembers T: H¹_{F_can}(ℚ_p, T/IT) is the image of H¹(ℚ_p, T), which can be smaller than H¹(ℚ_p, T/IT) (Mazur–Rubin 2004, Definition 3.2.1 and Lemma A.1).

**Prerequisites.** `SelmerIwasawaCohomology:L2`, `SelmerIwasawaCohomology:L2/condition-propagation`.

**Sources.**

- mr-ks, Example 1.3.3, p. 12: The square relating propagation and orthogonal complements.

### Selmer modules of quotients and torsion submodules

`EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification` — lemma.

**Statement.** Assume T̄^{G_K} = (T̄^*)^{G_K} = 0 for T̄ = T/mT (which follows from (H.1) and (H.3) of Mazur–Rubin 2004). (a) For every ideal I of R, T^*[I] → T^* induces an isomorphism H¹_{F^*}(K, T^*[I]) ≅ H¹_{F^*}(K, T^*)[I]. (b) If R is principal artinian of length k and F is cartesian, then for 0 < i ≤ k the injection π^{k−i} : T/m^iT → T induces isomorphisms H¹(K, T/m^iT) ≅ H¹(K, T)[m^i] and H¹_F(K, T/m^iT) ≅ H¹_F(K, T)[m^i], and H¹_F(K, T)[m^i] is the kernel of H¹_F(K, T) → H¹_F(K, T/m^{k−i}T).

**Suggested declarations.** `TauCeti.KolyvaginSystems.selmer_torsion_identification`.

**Hypotheses.**

- (T/mT)^{G_K} = (T^*[m])^{G_K} = 0
- for (b): R principal artinian, F cartesian on Quot_R(T)

**Construction or proof.**

1. S^{G_K} = 0 for every subquotient S of T or T^* (Mazur–Rubin 2004, Lemmas 2.1.4 and 3.5.2).
2. (a) for I = (β): the sequences 0 → T^*[I] → T^* → IT^* → 0 and 0 → IT^* → T^* give H¹(G, T^*[I]) ≅ H¹(G, T^*)[I]; induct on the number of generators; the Selmer conditions agree because F^* on T^*[I] is the inverse image.
3. (b): the same argument with 0 → T/m^i → T → T/m^{k−i} → 0; the local conditions match by cartesianness at Σ(F) and by Lemma 1.1.9 at the unramified places.

**Acceptance checks.**

- For T = μ_{p^k} ⊗ ρ^{-1} with ρ ≠ 1, ω, both identifications hold (Mazur–Rubin 2004, Lemma 6.1.5).
- Without the invariants hypothesis the statement fails: for T = ℤ/p² with G_K acting through a nontrivial character χ ≡ 1 (mod p), the connecting map (T/pT)^{G_K} → H¹(K, T/pT) is nonzero, so H¹(K, T/pT) → H¹(K, T)[p] is not injective.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`, `SelmerIwasawaCohomology:L2/condition-propagation`, `ArithmeticGaloisDuality:R02.1/continuous-section-long-exact`.

**Sources.**

- mr-ks, Lemma 3.5.3, p. 28: Part (a).
- mr-ks, Lemma 3.5.4, p. 29: Part (b).
- mr-higher, Proposition 3.3(i)–(ii), p. 7: The same statements over a number field under the invariants hypothesis alone.

### The Euler characteristic formula for Selmer modules

`EulerSystemsAndKolyvaginSystems:ES.0/selmer-length-difference` — theorem.

**Statement.** Let T be a finite R[[G_K]]-module and F a Selmer structure on T. Then length H¹_F(K, T) − length H¹_{F^*}(K, T^*) = length H⁰(K, T) − length H⁰(K, T^*) − Σ_{v ∈ Σ(F)} (length H⁰(K_v, T) − length H¹_F(K_v, T)), all lengths over R.

**Suggested declarations.** `TauCeti.KolyvaginSystems.selmer_length_difference`.

**Hypotheses.**

- T finite
- lengths taken over R (for R = ℤ/p^k these are p-adic valuations of orders)

**Construction or proof.**

1. This is the Greenberg–Wiles formula (the general-R Greenberg–Wiles formula requested from SelmerIwasawaCohomology L2) for M = T, L_v = H¹_F(K_v, T), rewritten additively.
2. To pass from orders to R-lengths apply the formula to T as an R-module: every group in it is an R-module of finite length and #B = (#k)^{length_R B}; the factors at v ∉ Σ(F) are 1 because #H¹_ur(K_v, T) = #H⁰(K_v, T).
3. Mazur–Rubin state it over ℚ and include p = 2; the archimedean term uses ordinary H⁰(K_v, T).

**Acceptance checks.**

- For K = ℚ, R = 𝔽_p, T = μ_p with the relaxed condition at p and strict at ∞ (p odd), the left side is dim (ℤ[1/p]^×/p) − dim H¹_{F^*}(ℚ, ℤ/p) = 1 − 0 and the right side is 0 − 1 − ((0 − 2) + (0 − 0)) = 1: the term at p is length H⁰(ℚ_p, μ_p) − length H¹(ℚ_p, μ_p) = 0 − 2 and the term at ∞ is 0 − 0.

**Prerequisites.** `SelmerIwasawaCohomology:L2`, `mathlib:Module.length`.

**Sources.**

- mr-ks, Proposition 2.3.5, p. 17: The finite-level Euler characteristic formula.

### The core rank of a cartesian Selmer structure

`EulerSystemsAndKolyvaginSystems:ES.0/core-rank` — definition.

**Statement.** Let R be principal artinian of length k, F a cartesian Selmer structure on T, and T^{G_K} = (T^*)^{G_K} = 0. There is a unique integer r such that H¹_F(K, T) ≅ H¹_{F^*}(K, T^*) ⊕ R^r if r ≥ 0 and H¹_F(K, T) ⊕ R^{−r} ≅ H¹_{F^*}(K, T^*) if r ≤ 0 (noncanonically). Mazur–Rubin 2016 Definition 3.4 calls the signed integer r the core rank. In the convention of Mazur–Rubin 2004 Definition 4.1.11, the nonnegative core ranks are χ(T, F) = max(r, 0) and χ(T^*, F^*) = max(−r, 0); one of these is zero. Higher-rank systems use the signed r and require r ≥ 1. For R a discrete valuation ring and F cartesian, χ(T, F) is the common value of χ(T/m^kT, F) for k ≥ 1.

**Suggested declarations.** `TauCeti.KolyvaginSystems.coreRankInt`, `TauCeti.KolyvaginSystems.coreRank`, `TauCeti.KolyvaginSystems.coreRank_mul_length`, `TauCeti.KolyvaginSystems.coreRank_eq_zero_or_dual`, `TauCeti.KolyvaginSystems.selmer_equiv_dual_prod_free`, `TauCeti.KolyvaginSystems.coreRank_field`.

**Hypotheses.**

- R principal artinian (or a discrete valuation ring)
- F cartesian
- (T/mT)^{G_K} = (T^*[m])^{G_K} = 0

**Construction or proof.**

1. The isomorphism class of a finitely generated module B over a principal artinian ring is determined by i ↦ length B[m^i]; so it suffices that length H¹_F(K,T)[m^i] − length H¹_{F^*}(K,T^*)[m^i] = t·i for an integer t.
2. By selmer-torsion-identification these are the lengths of H¹_F(K, T/m^i) and H¹_{F^*}(K, T^*[m^i]); by selmer-length-difference their difference is a sum of local terms, each linear in i by cartesian-length-linearity (the global H⁰ terms vanish).
3. Then r = t. Independence of the modulus is core-rank-independence-of-modulus.

**Uses.**

- Mazur–Rubin 2004, Theorem 4.2.2 and Corollary 4.5.2: core rank 0 forces KS(T) = 0, and core rank 1 makes KS(T) free of rank one.
- Mazur–Rubin 2016, hypothesis (H.6) and Theorem 6.10: Stark systems of rank r = χ(T) form a free module of rank one.
- Burns–Sakamoto–Sano II, Hypothesis 4.2: the rank r + ν(n) of the relaxed Selmer module at a core vertex.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.coreRankInt` | data | The integer r with length H¹_F(K, T) − length H¹_{F^*}(K, T^*) = r·k. |
| `TauCeti.KolyvaginSystems.coreRank` | data | χ(T, F) = max(r, 0) as a natural number; χ(T^*, F^*) = max(−r, 0). |
| `TauCeti.KolyvaginSystems.coreRank_mul_length` | characterisation | If χ(T) > 0 then length H¹_F(K, T) − length H¹_{F^*}(K, T^*) = k·χ(T); if χ(T) = 0 the difference is −k·χ(T^*). |
| `TauCeti.KolyvaginSystems.coreRank_eq_zero_or_dual` | relation | χ(T, F) = 0 or χ(T^*, F^*) = 0. |
| `TauCeti.KolyvaginSystems.selmer_equiv_dual_prod_free` | equivalence | If coreRankInt(T,F) = r ≥ 0, there is a noncanonical R-linear isomorphism H¹_F(K,T) ≃ H¹_{F^*}(K,T^*) × R^r. For r ≤ 0 the free factor occurs on the other side. |
| `TauCeti.KolyvaginSystems.coreRank_field` | example | For R = k a field, χ(T) − χ(T^*) = dim_k H¹_F(K, T) − dim_k H¹_{F^*}(K, T^*). |

**Unit tests.**

- `coreRank_negative_signed` (non-example): Signed core rank −2 has MR04 positive part 0, rather than absolute value 2.
- `coreRank_positive_signed` (computation): Signed core rank 3 has positive part 3.
- `coreRank_length_quotient` (computation): With vanishing residual invariants, Selmer lengths 5 and 3 and coefficient length 2 give signed core rank 1.

**Acceptance checks.**

- χ(T, F) = 1 for T = μ_{p^k} ⊗ ρ^{-1} with ρ even and nontrivial and F the unit-root structure of Mazur–Rubin 2004 §6.1; χ = 0 for ρ odd, ρ ≠ ω.
- The core rank is not the R-rank of T: Under the hypotheses of example-elliptic, for T = E[p^k], a module of rank 2, χ(T, F_can) = 1 and χ(T, F) = 0 for the classical Selmer structure.
- Additional arithmetic check: For K = ℚ, R = ℤ/p^k, ρ an even nontrivial character of order prime to p and T = μ_{p^k} ⊗ ρ^{-1} with the structure F of Mazur–Rubin 2004 Definition 6.1.1, χ(T, F) = 1; for ρ odd with ρ ≠ ω, χ(T, F) = 0.
- Additional arithmetic check: For E/ℚ and p ≥ 5 with surjective mod-p representation, T = E[p^k] has rank two, χ(T,F) = 0 for the classical Kummer structure, and χ(T,F_can) = 1 for the structure propagated from T_pE.
- Additional arithmetic check: Over R = k, replacing F by the structure relaxed at one prime q ∈ P_1 (so that H¹_s(K_q, T) is one-dimensional) raises r by exactly 1.
- Additional arithmetic check: For E/ℚ and p ≥ 5 with surjective mod-p representation, T = E[p^k] has rank two, χ(T,F) = 0 for the classical Kummer structure, and χ(T,F_can) = 1 for the structure propagated from T_pE.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification`, `EulerSystemsAndKolyvaginSystems:ES.0/selmer-length-difference`, `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-length-linearity`, `mathlib:Module.length`.

**Sources.**

- mr-higher, Proposition 3.3(iii) and Definition 3.4, p. 8: The integer r and the definition of the core rank from it.
- mr-ks, Theorem 4.1.5 and Definition 4.1.11, pp. 36–38: The same statement over ℚ; the case n = 1 is used here.

### The core rank is independent of the modulus

`EulerSystemsAndKolyvaginSystems:ES.0/core-rank-independence-of-modulus` — theorem.

**Statement.** Let R be principal artinian of length k and F cartesian with the invariants hypothesis of core-rank. Then for 0 < i ≤ k the Selmer triple (T/m^iT, F, P) over R/m^i has χ(T/m^iT) = χ(T) and χ(T^*[m^i]) = χ(T^*), and H¹_F(K, T/m^iT) ≅ (R/m^i)^{χ(T)} ⊕ H¹_{F^*}(K, T^*[m^i]) when χ(T) > 0. If R is a discrete valuation ring and H¹(K_q, T)/H¹_F(K_q, T) is torsion-free for q ∈ Σ(F), then rank_R H¹_F(K, T) − corank_R H¹_{F^*}(K, T^*) = χ(T) − χ(T^*).

**Suggested declarations.** `TauCeti.KolyvaginSystems.coreRank_independence_of_modulus`.

**Hypotheses.**

- as in core-rank

**Construction or proof.**

1. Take m^i-torsion in the isomorphism of core-rank and apply selmer-torsion-identification.
2. For a discrete valuation ring pass to the limit over k using SelmerIwasawaCohomology L2/selmer-limits and the bounded cokernel of H¹_F(K,T)/m^k → H¹_F(K, T/m^k) (Mazur–Rubin 2004, Lemma 3.7.1(ii)).

**Acceptance checks.**

- For T = T_pE and F_can, rank H¹_{F_can}(ℚ, T) − corank H¹_{F_can^*}(ℚ, E[p^∞]) = 1.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.0/core-rank`, `EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification`, `SelmerIwasawaCohomology:L2/selmer-limits`.

**Sources.**

- mr-ks, Theorem 4.1.13 and Definition 5.2.4, pp. 38, 56: Independence of the modulus.
- mr-ks, Corollary 5.2.6, p. 56: The rank formula over a discrete valuation ring.

### The canonical and the unramified Selmer structures

`EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure` — definition.

**Statement.** Let R be the ring of integers of a finite extension of ℚ_p (or a discrete valuation ring as in Mazur–Rubin 2016). The canonical Selmer structure F_can on T has Σ(F_can) = {q : T ramified at q} ∪ {v | p} ∪ {v | ∞}; H¹_{F_can}(K_q, T) = ker(H¹(K_q, T) → H¹(K_q^{ur}, T ⊗ ℚ_p)) for q ∈ Σ(F_can), q ∤ p∞; and H¹_{F_can}(K_v, T) = H¹(K_v, T) for v | p∞. On T/IT it is the structure induced from T, which depends on T and not only on T/IT. The unramified structure F_ur of Mazur–Rubin 2016 has the same conditions away from p and, at 𝔭 | p, the saturation of the universal norm subgroup ∩_L Cor_{L/K_𝔭} H¹(L, T) over finite unramified L/K_𝔭.

**Suggested declarations.** `TauCeti.KolyvaginSystems.canonicalStructure`, `TauCeti.KolyvaginSystems.canonicalStructure_torsionFree`, `TauCeti.KolyvaginSystems.canonicalStructure_dual_at_p`, `TauCeti.KolyvaginSystems.canonicalStructure_quotient_at_p`, `TauCeti.KolyvaginSystems.unramifiedStructure`, `TauCeti.KolyvaginSystems.unramifiedStructure_eq_canonical`.

**Hypotheses.**

- R a discrete valuation ring, finite over ℤ_p for F_can

**Construction or proof.**

1. The condition away from p is the inverse image of the unramified condition on V = T ⊗ ℚ_p (SelmerIwasawaCohomology L2/lattice-passage), so its quotient is torsion-free and F_can is cartesian on quotients by Mazur–Rubin 2004 Lemma 3.7.1(i).
2. At 𝔭 | p, H¹_{F_ur}(K_𝔭, T) = H¹(K_𝔭, T) when H⁰(K_𝔭, T^*) has finite length (Mazur–Rubin 2016, Corollary 5.3), so F_ur = F_can in that case.
3. Euler-system classes lie in H¹_{F_can}(F, T) (SelmerIwasawaCohomology L3/universal-norms-unramified; Rubin, Corollary B.3.5).

**Uses.**

- Mazur–Rubin 2004, Theorem 3.2.4: the target of the Euler-system-to-Kolyvagin-system map is KS(T, F_can, P).
- Burns–Sakamoto–Sano II, Theorem 6.12: higher-rank Kolyvagin derivatives land in systems for F_can.
- Mazur–Rubin 2004, Theorem 5.2.15; Mazur–Rubin 2016, Theorem 5.4: the core rank formulas are for F_can and F_ur.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.canonicalStructure` | constructor | F_can: relaxed at v \| p∞, and at ramified q ∤ p the kernel of H¹(K_q, T) → H¹(K_q^{ur}, T ⊗ ℚ_p). |
| `TauCeti.KolyvaginSystems.canonicalStructure_torsionFree` | characterisation | H¹(K_q, T)/H¹_{F_can}(K_q, T) is torsion-free for every q, so F_can is cartesian on quotients. |
| `TauCeti.KolyvaginSystems.canonicalStructure_dual_at_p` | compatibility | The dual structure F_can^* is strict at every v \| p and equals the dual of the unramified-saturated condition elsewhere. |
| `TauCeti.KolyvaginSystems.canonicalStructure_quotient_at_p` | relation | H¹_{F_can}(K_𝔭, T/IT) is the image of H¹(K_𝔭, T); it equals H¹(K_𝔭, T/IT) if H⁰(K_𝔭, T^*) is divisible. |
| `TauCeti.KolyvaginSystems.unramifiedStructure` | constructor | F_ur of Mazur–Rubin 2016, Definition 5.1. |
| `TauCeti.KolyvaginSystems.unramifiedStructure_eq_canonical` | compatibility | If H⁰(K_𝔭, T^*) has finite length for every 𝔭 \| p then F_ur = F_can. |

**Unit tests.**

- `canonicalStructure_unramified_place` (compatibility): Outside Σ, the unramified structure equals the inertia restriction kernel.
- `canonicalStructure_relaxed_lattice` (characterisation): At a designated p or infinite place the lattice canonical condition is all local H¹.
- `canonicalStructure_quotient_ne_relaxed` (non-example): If the local coefficient reduction map on H¹ is not surjective, the propagated finite canonical condition at a relaxed lattice place is a proper submodule.

**Acceptance checks.**

- For T = ℤ_p(1) ⊗ ρ^{-1} with ρ(p) ≠ 1, F_can equals the unit structure F of Mazur–Rubin 2004 §6.1 (Lemma 6.1.2).
- H¹_{F_can}(ℚ_p, T/IT) = H¹(ℚ_p, T/IT) when H⁰(ℚ_p, T^*) is divisible (Lemma A.1) and can be smaller otherwise.
- Additional arithmetic check: For K = ℚ, T = ℤ_p(1), p odd: H¹_{F_can}(ℚ, T) is the p-adic completion of ℤ[1/p]^×, free of rank one over ℤ_p, generated by the class of p.
- Additional arithmetic check: For T=T_pE over ℚ and p odd, F_can is the classical lattice Kummer structure relaxed at p, with F_can^* ≤ F ≤ F_can under the Weil-pairing dictionary. On E[p^k] use the image of H¹(ℚ_p,T_pE); it is the full local group when E(ℚ_p)[p^∞]=0 and may be proper otherwise.
- Additional arithmetic check: For T = ℤ_p(1) ⊗ ρ^{-1} with ρ finite order prime to p, unramified at p, and ρ(p)=1, T^* is locally ℚ_p/ℤ_p. Its invariants are divisible, so the propagated canonical condition on T/p^kT is all H¹(ℚ_p,T/p^kT). The unit condition on the lattice remains proper.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`, `SelmerIwasawaCohomology:L2/lattice-passage`, `SelmerIwasawaCohomology:L2/unramified-condition`, `SelmerIwasawaCohomology:L2`.

**Sources.**

- mr-ks, Definition 3.2.1, p. 23: Definition of F_can over ℚ.
- mr-higher, Definition 5.1, pp. 9–10: Definition of F_ur over a number field.
- bss2, §6.2, p. 38: The same structure over a number field and a Gorenstein order.

### Core rank of the canonical and unramified structures

`EulerSystemsAndKolyvaginSystems:ES.0/core-rank-formula` — theorem.

**Statement.** (a) (K = ℚ) For R the ring of integers of a finite extension of ℚ_p and T satisfying (H.0)–(H.3), χ(T^*, F_can^*) = 0 and χ(T, F_can) = rank_R T^− + corank_R H⁰(ℚ_p, T^*), where T^− is the minus part for a complex conjugation. (b) (K a number field, R a discrete valuation ring) χ(T, F_ur) = Σ_{v | ∞} corank_R H⁰(K_v, T^*).

**Suggested declarations.** `TauCeti.KolyvaginSystems.canonical_core_rank_formula`, `TauCeti.KolyvaginSystems.unramified_core_rank_formula`.

**Hypotheses.**

- the invariants hypothesis of core-rank
- for (a): K = ℚ and the hypotheses of Mazur–Rubin 2004 §5.2

**Construction or proof.**

1. By core-rank-independence-of-modulus and selmer-length-difference applied to T^*[m^k], k(χ(T) − χ(T^*)) is a sum of local terms length H⁰(K_v, T^*[m^k]) − length H¹_{F^*}(K_v, T^*[m^k]) up to a bounded error.
2. At v | ∞ the term is ∼ k·corank H⁰(K_v, T^*); at q ∤ p∞ it is bounded (unramified-dimension-count of SelmerIwasawaCohomology L2); at p it is ∼ k·corank H⁰(ℚ_p, T^*) for F_can^* strict, and bounded for F_ur by Mazur–Rubin 2016 Lemma 5.2.

**Acceptance checks.**

- T = ℤ_p(1) ⊗ ρ^{-1}: χ(T, F_can) = 1 if ρ is even with ρ(p) ≠ 1; T = T_pE: χ(T, F_can) = 1.
- For an abelian variety A of dimension d over K with large image, χ(T_pA, F) = d[K : ℚ] (Mazur–Rubin 2016, Proposition 5.9): the core rank is not the analytic rank.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-independence-of-modulus`, `EulerSystemsAndKolyvaginSystems:ES.0/selmer-length-difference`, `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`, `SelmerIwasawaCohomology:L2/unramified-dimension-count`.

**Sources.**

- mr-ks, Theorem 5.2.15, p. 59: Part (a).
- mr-higher, Theorem 5.4, p. 10: Part (b).

### The Mazur–Rubin 2004 hypotheses (H.0)–(H.6) over ℚ

`EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004` — definition.

**Statement.** For a Selmer triple (T, F, P) over K = ℚ: (H.0) T is free of finite rank over R. (H.1) T/mT is an absolutely irreducible k[G_ℚ]-representation. (H.2) There is τ ∈ G_ℚ with τ = 1 on μ_{p^∞} and T/(τ − 1)T free of rank one over R. (H.3) H¹(ℚ(T, μ_{p^∞})/ℚ, T/mT) = H¹(ℚ(T, μ_{p^∞})/ℚ, T^*[m]) = 0. (H.4) Either (H.4a) Hom_{𝔽_p[[G_ℚ]]}(T/mT, T^*[m]) = 0, or (H.4b) p > 4. (H.5) P_t ⊆ P ⊆ P_1 for some t ≥ 1, with P_k the Kolyvagin primes of level k. (H.6) For every ℓ ∈ Σ(F) the local condition at ℓ is cartesian on Quot_R(T). Each is a separate proposition; the record has one field for each.

**Suggested declarations.** `TauCeti.KolyvaginSystems.MR04Hypotheses`, `TauCeti.KolyvaginSystems.MR04Hypotheses.invariants_eq_bot`, `TauCeti.KolyvaginSystems.MR04Hypotheses.dual`, `TauCeti.KolyvaginSystems.MR04Hypotheses.quotient`, `TauCeti.KolyvaginSystems.MR04Hypotheses.of_rank_one`.

**Hypotheses.**

- K = ℚ

**Construction or proof.**

1. Each field is stated against the carriers of this layer and of ES.1: ℚ(T, μ_{p^∞}) is the fixed field of the kernel of G_ℚ → Aut(T) × Aut(μ_{p^∞}), and P_k is ES.1/kolyvagin-primes.
2. (H.2) holds with τ = 1 when rank T = 1; (H.6) holds when R is a field; (H.0)–(H.4) pass to T ⊗_R R′ for a surjection R → R′ (Remark 3.5.1).
3. (H.3) implies S^{G_ℚ} = 0 for every subquotient S of T or T^* (Lemma 3.5.2).

**Uses.**

- Mazur–Rubin 2004, §3.6 and Chapter 4: the standing hypotheses for the Chebotarev lemmas and for all results over principal artinian rings.
- Mazur–Rubin 2004, Theorems 5.2.2–5.2.14: over a discrete valuation ring, (H.0)–(H.5) plus torsion-free local quotients.
- EulerSystemsCyclotomicMainConjecture L1 and KatoEulerSystems L4: applications verify the fields for their representation.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.MR04Hypotheses` | structure | The record with fields irreducible (H.1), tau (H.2: an element τ with its two properties), h1Vanishing (H.3), homVanishingOrLarge (H.4), primes (H.5), cartesian (H.6). |
| `TauCeti.KolyvaginSystems.MR04Hypotheses.invariants_eq_bot` | characterisation | (H.3) implies S^{G_ℚ} = 0 for every subquotient S of T and of T^*. |
| `TauCeti.KolyvaginSystems.MR04Hypotheses.dual` | functoriality | If T satisfies (H.0)–(H.5) then so does T^* (for R principal artinian). |
| `TauCeti.KolyvaginSystems.MR04Hypotheses.quotient` | functoriality | (H.0)–(H.4) pass to T ⊗_R R′ for surjective R → R′; (H.6) passes to T/m^jT for R principal artinian. |
| `TauCeti.KolyvaginSystems.MR04Hypotheses.of_rank_one` | example | If rank_R T = 1 then (H.1) holds and (H.2) holds with τ = 1. |

**Unit tests.**

- `MR04Hypotheses.residual_invariants_zero` (characterisation): MR04 admissibility forces H⁰(K,T/mT)=0.
- `MR04Hypotheses.rank_one_coinvariants` (computation): For a rank-one coefficient module, τ=1 has rank-one coinvariants.
- `MR04Hypotheses.not_dual_invariants` (non-example): A representation with nonzero residual Cartier-dual H⁰ cannot satisfy MR04 hypotheses.

**Acceptance checks.**

- The record is satisfied by T = ℤ_p(1) ⊗ ρ^{-1}, ρ ≠ 1, ω of order prime to p, with (H.4a); and by T = T_pE with surjective mod-p representation and p ≥ 5, with (H.4b).
- It is not satisfied by T = ℤ_p(1): (H.3) fails.
- Additional arithmetic check: For p odd, ρ : G_ℚ → ℤ_p^× of finite order prime to p with ρ ≠ 1 and ρ ≠ ω, T = ℤ_p(1) ⊗ ρ^{-1} satisfies (H.0), (H.1), (H.2) with τ = 1, (H.3) and (H.4a).
- Additional arithmetic check: For E/ℚ with G_ℚ → Aut(E[p]) surjective and p ≥ 5, T = T_pE satisfies (H.0)–(H.3) and (H.4b).
- Additional arithmetic check: T = ℤ_p(1) (ρ = 1) does not satisfy (H.3): T^*[m] = Hom(μ_p, μ_p) is the trivial module 𝔽_p, so (T^*[m])^{G_ℚ} ≠ 0, contradicting the consequence S^{G_ℚ} = 0 of (H.3). Likewise ρ = ω fails because T/mT is trivial.
- Additional arithmetic check: If R is a field, (H.6) holds for every Selmer structure.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`, `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`, `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`.

**Sources.**

- mr-ks, §3.5, pp. 27–28: The list (H.0)–(H.6).
- mr-ks, §3.5, p. 27: The condition on the set of primes.

### The Mazur–Rubin 2016 hypotheses (H.1)–(H.7) over a number field

`EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2016` — definition.

**Statement.** For Selmer data (T, F, P, r) over a number field K, let M be the smallest power of p with MR = 0 if R is artinian and M = p^∞ if R is a discrete valuation ring, H the Hilbert class field of K and H_M = H(μ_M, (O_K^×)^{1/M}). (H.1) T̄^{G_K} = (T̄^*)^{G_K} = 0 and T̄ is an absolutely irreducible k[[G_K]]-module. (H.2) There are τ ∈ Gal(K̄/H_M) and a finite Galois extension L of K in H_M such that T/(τ − 1)T is free of rank one over R and P(L, τ) ⊆ P, where P(L, τ) is the set of primes q ∉ Σ(F) unramified in L with Fr_q conjugate to τ in Gal(L/K). (H.3) H¹(H_M(T)/K, T/mT) = H¹(H_M(T)/K, T^*[m]) = 0. (H.4) Either T̄ ≇ T̄^* as k[[G_K]]-modules, or p > 3. (H.5) F is cartesian. (H.6) r = χ(T) > 0. For R artinian only: (H.7) I_q = 0 for every q ∈ P.

**Suggested declarations.** `TauCeti.KolyvaginSystems.MR16Hypotheses`, `TauCeti.KolyvaginSystems.MR16Hypotheses.IsArtinianAdmissible`, `TauCeti.KolyvaginSystems.MR16Hypotheses.quotient`, `TauCeti.KolyvaginSystems.MR16Hypotheses.artinianAdmissible_of_frobenius`, `TauCeti.KolyvaginSystems.MR16Hypotheses.of_mr04`.

**Hypotheses.**

- K a number field
- R principal artinian or a discrete valuation ring

**Construction or proof.**

1. The fields are stated with ES.1/conductor-ideal (I_q) and ES.1/kolyvagin-primes (P(L, τ)).
2. If the properties hold for (T, F, P, r) they hold for T/m^k over R/m^k (Remark 4.3).
3. If R is artinian and (H.1)–(H.6) hold, then (H.1)–(H.7) hold after replacing L by H_M and P by P(H_M, τ) (Lemma 4.5): Fr_q fixes H so q is principal, and [K(q)_q : K_q] is divisible by M.

**Uses.**

- Mazur–Rubin 2016, Theorems 6.10, 7.4, 8.9, 11.7, 12.4 and 13.4: the standing hypotheses for Stark and stub Kolyvagin systems.
- Burns–Sakamoto–Sano II, Hypotheses 3.2 and 3.3: the Gorenstein-coefficient analogues, compared in ES.6/bss-hypotheses.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.MR16Hypotheses` | structure | The record with fields invariantsAndIrreducible (H.1), tau (H.2: τ, L and the inclusion P(L, τ) ⊆ P), h1Vanishing (H.3), notSelfDualOrLarge (H.4), cartesian (H.5), coreRank (H.6). |
| `TauCeti.KolyvaginSystems.MR16Hypotheses.IsArtinianAdmissible` | structure | (H.7): I_q = 0 for all q ∈ P, for R artinian. |
| `TauCeti.KolyvaginSystems.MR16Hypotheses.quotient` | functoriality | The record for (T, F, P, r) gives the record for (T/m^kT, F, P, r) over R/m^k. |
| `TauCeti.KolyvaginSystems.MR16Hypotheses.artinianAdmissible_of_frobenius` | characterisation | If R is artinian and q ∈ P(H_M, τ) then I_q = 0; so (H.7) holds for P(H_M, τ). |
| `TauCeti.KolyvaginSystems.MR16Hypotheses.of_mr04` | compatibility | For K = ℚ and p odd, a triple satisfying (H.0)–(H.4), (H.6) of 2004 with χ(T) = r > 0 and P ⊇ P(L, τ) for some finite L ⊆ ℚ(μ_M) satisfies the 2016 record; here 2004 (H.4a) gives the first alternative of 2016 (H.4) and p > 4 is p > 3. |

**Unit tests.**

- `MR16Hypotheses.positive_rank` (non-example): MR16 admissibility excludes core rank zero.
- `MR16Hypotheses.infinite_primes` (characterisation): The required Frobenius containment forces the selected prime set to be infinite.
- `MR16Hypotheses.not_empty_primes` (non-example): The empty selected prime set admits no MR16 hypothesis data.

**Acceptance checks.**

- Satisfied by T = T_pA for an abelian variety with large image and p > 3, with r = d[K : ℚ] (Mazur–Rubin 2016, §5).
- (H.6) excludes core rank zero: it is a hypothesis on (T, F), not a consequence of the others.
- Additional arithmetic check: For an abelian variety A of dimension d over K with image of G_K in Aut(A[p]) containing GSp_{2d}(𝔽_p) and p > 3, T = T_pA with the structure of Mazur–Rubin 2016 §5 satisfies (H.1)–(H.6) with r = d[K : ℚ].
- Additional arithmetic check: T = E[p^k] with the classical Selmer structure has χ = 0, so (H.6) fails for every r ≥ 1 although (H.1)–(H.5) can hold.
- Additional arithmetic check: For K = ℚ and p odd, H_M = ℚ(μ_M), so (H.2) asks for τ trivial on μ_M, as in 2004 (H.2).
- Additional arithmetic check: For p = 3 and T̄ ≅ T̄^* (for example T̄ = E[3]) hypothesis (H.4) fails; p = 3 is allowed only when T̄ is not self-dual.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`, `EulerSystemsAndKolyvaginSystems:ES.0/core-rank`, `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`, `EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal`, `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`.

**Sources.**

- mr-higher, §4, hypotheses (H.1)–(H.7), p. 9: The list of running hypotheses.
- mr-higher, Lemma 4.5, p. 9: How (H.7) is obtained.

### Implications between the hypothesis records

`EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-implications` — lemma.

**Statement.** (a) (H.0)–(H.4) of 2004 are stable under R → R′ surjective, and (H.6) under T → T/m^jT. (b) For R a discrete valuation ring, torsion-freeness of H¹(K_q, T)/H¹_F(K_q, T) for q ∈ Σ(F) implies (H.6)/(H.5) for every T/m^kT. (c) 2004 (H.3) implies T̄^{G_ℚ} = (T̄^*)^{G_ℚ} = 0, hence 2016 (H.1) given (H.1) of 2004; 2004 (H.3) implies 2016 (H.3) for K = ℚ, because ℚ(T, μ_M) ⊆ ℚ(T, μ_{p^∞}) and inflation is injective on H¹. (d) 2016 (H.1)–(H.6) for artinian R give (H.7) for the prime set P(H_M, τ). (e) Rubin's Hyp(K, T) (ES.4/rubin-hypotheses) gives residual irreducibility and a rank-one τ fixing the maximal p-Hilbert class extension K(1), cyclotomic p-power roots and p-power roots of units. It gives the τ of 2016 (H.2) only with the additional condition that this τ fixes the full Hilbert class field H (and the specified finite extension L); absolute residual irreducibility in 2016 (H.1) is also an additional condition; it does not give (H.3), whose failure is measured by Rubin's error terms n_W and n_W^*.

**Suggested declarations.** `TauCeti.KolyvaginSystems.MR04Hypotheses.dual`, `TauCeti.KolyvaginSystems.MR04Hypotheses.quotient`, `TauCeti.KolyvaginSystems.MR16Hypotheses.of_mr04`.

**Hypotheses.**

- as in the two records

**Construction or proof.**

1. (a), (b): Mazur–Rubin 2004, Remark 3.5.1, Lemmas 3.7.1(i) and 3.7.3. (c): Lemma 3.5.2 and inflation–restriction for ℚ(T, μ_M) ⊆ ℚ(T, μ_{p^∞}) (ArithmeticGaloisDuality R02.2/compact-five-term).
2. (d): Mazur–Rubin 2016, Lemma 4.5. (e): compare Rubin's Hyp(K, T)(i) with (H.2): τ fixes μ_{p^∞}, (O_K^×)^{1/p^∞} and only the p-part K(1) of H. Fixing all of H and L must be separately checked; the comparison of (c) and (e) is derived here from the two texts, which do not state it.

**Acceptance checks.**

- For a rank-one twist the rank-one coinvariant condition alone holds with τ=1 in all three records. This checks that condition only; vanishing, absolute irreducibility and prime-set hypotheses still require their own verifications.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004`, `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2016`, `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`, `ArithmeticGaloisDuality:R02.2/compact-five-term`.

**Sources.**

- mr-ks, Remark 3.5.1, p. 28: Stability under quotients of the coefficient ring.
- mr-higher, Remark 4.3, p. 9: Passage to (H.7).

### Worked example: twists of ℤ_p(1) by characters of finite order

`EulerSystemsAndKolyvaginSystems:ES.0/example-cyclotomic-twist` — application.

**Statement.** Let p be odd, ρ : G_ℚ → ℤ_p^× a character of finite order prime to p, L its field, R = ℤ/p^k (or ℤ_p) and T = μ_{p^k} ⊗ ρ^{-1} (or ℤ_p(1) ⊗ ρ^{-1}). With H¹(ℚ, T) = (L^×/(L^×)^{p^k})^ρ, let F be the structure with H¹_F(ℚ_ℓ, T) = (O_{L,ℓ}^×/(O_{L,ℓ}^×)^{p^k})^ρ for all ℓ. Then: if ρ ≠ 1, ω, T satisfies (H.0)–(H.3), (H.4a), and F, F_can satisfy (H.6); χ(T, F) = 1 if ρ is even and ρ ≠ 1, and χ(T, F) = 0 if ρ is odd and ρ ≠ ω; F = F_can if ρ(p) ≠ 1; and there are exact sequences 0 → (O_L^×/(O_L^×)^{p^k})^ρ → H¹_F(ℚ, T) → Cl(L)[p^k]^ρ → 0 with H¹_{F^*}(ℚ, T^*) ≅ Hom(Cl(L), ℤ/p^k)^{ρ^{-1}}.

**Suggested declarations.** `TauCeti.KolyvaginSystems.cyclotomicTwist_basic_hypotheses`.

**Hypotheses.**

- p odd
- ρ of order prime to p

**Construction or proof.**

1. Kummer theory identifies the local and global H¹; the unramified classes are the unit classes (Mazur–Rubin 2004, §6.1).
2. kχ(T, F) = length H¹_F − length H¹_{F^*} = length (O_L^×/(O_L^×)^{p^k})^ρ by the two sequences, which is k for ρ even nontrivial and 0 for ρ odd ≠ ω (Dirichlet's unit theorem).
3. Propagation: the structure on T/p^i is the unit structure for μ_{p^i} ⊗ ρ^{-1}; the dual condition is the unramified one on Hom(G_{L_λ}/I_λ, ℤ/p^k)^{ρ^{-1}}.

**Acceptance checks.**

- The computed core rank matches core-rank-formula: rank T^− + corank H⁰(ℚ_p, T^*) for F_can.
- For finite-order ρ unramified at p with ρ(p)=1, the propagated condition at p for F_can on T/p^k is all H¹(ℚ_p,T/p^k), since the dual invariants on the lattice are divisible (Lemma A.1). It differs from the unit structure F.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.0/core-rank`, `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004`, `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`.

**Sources.**

- mr-ks, Lemma 6.1.5 and Proposition 6.1.6, pp. 71–72: Hypotheses and core rank for the twists of ℤ_p(1).

### Worked example: the Tate module of an elliptic curve

`EulerSystemsAndKolyvaginSystems:ES.0/example-elliptic` — application.

**Statement.** Let E/ℚ be an elliptic curve and p ≥ 5 a prime with G_ℚ → Aut(E[p]) surjective, T = E[p^k] or T_pE, and F the classical Selmer structure (images of the local Kummer maps at the bad primes, p and ∞). Then F^* = F under the Weil pairing, H¹_F(ℚ, E[p^k]) is the p^k-Selmer group, T satisfies (H.0)–(H.4), F and F_can satisfy (H.6), χ(T, F) = 0 and χ(T, F_can) = 1, where on T_pE, F_can is F relaxed at p and F_can^* ≤ F ≤ F_can. On E[p^k], F_can is propagated from T_pE; its local condition at p is the image of H¹(ℚ_p,T_pE), which may be proper if E(ℚ_p)[p^∞] ≠ 0.

**Suggested declarations.** `TauCeti.KolyvaginSystems.elliptic_basic_hypotheses`.

**Hypotheses.**

- p ≥ 5
- surjective mod-p representation

**Construction or proof.**

1. (H.1)–(H.3) follow from surjectivity onto GL₂(𝔽_p); (H.4b) holds as p > 4; (H.6) by Lemma 3.7.1 since the Kummer images on T_pE have torsion-free quotient.
2. χ(T, F) = 0 because F is self-dual (core-rank); χ(T, F_can) = rank T_pE^− = 1 by core-rank-formula.

**Acceptance checks.**

- Both structures on the same T have different core ranks, 0 and 1: the core rank depends on F.
- The analytic rank of E plays no role in either value.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-formula`, `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004`, `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`, `HeegnerPointEulerSystems:HE.7`.

**Sources.**

- mr-ks, Proposition 6.2.2 and Lemma 6.2.3, p. 74: Core ranks and hypotheses for T_pE.

### Worked non-example: the trivial and Teichmüller characters

`EulerSystemsAndKolyvaginSystems:ES.0/non-example-inadmissible` — application.

**Statement.** For ρ = 1 the module T = ℤ_p(1) does not satisfy (H.3) of Mazur–Rubin 2004: T^*[m] = Hom(μ_p, μ_p) = 𝔽_p with trivial action, so (T^*[m])^{G_ℚ} ≠ 0 and H¹(ℚ(μ_{p^∞})/ℚ, 𝔽_p) = Hom(Gal(ℚ(μ_{p^∞})/ℚ), 𝔽_p) ≠ 0. For ρ = ω, T/mT = μ_p ⊗ ω^{-1} is trivial and (H.3) fails for the same reason. In both cases Lemma 3.5.2 (no invariants in subquotients), on which the definition of the core rank rests, is false, and no instance of the hypothesis record exists. Rubin's error-tolerant theorem still applies to T = ℤ_p(1) through Hyp(K, V), with the finiteness of S_{Σ_p}(K, W^*) equivalent to Leopoldt's conjecture for T = O.

**Suggested declarations.** `TauCeti.KolyvaginSystems.tateOne_not_mr04`, `TauCeti.KolyvaginSystems.tateOne_dual_residual_invariants`.

**Hypotheses.**

- p odd

**Construction or proof.**

1. Compute T^*[m] and T/mT as Galois modules; Gal(ℚ(μ_{p^∞})/ℚ) ≅ ℤ_p^× has a quotient of order p.
2. Rubin, Remark II.2.7 and Lemma V.3.2: for T = O or O(1) the groups H¹(Ω/K, W), H¹(Ω/K, W^*) are infinite.

**Acceptance checks.**

- The record MR04Hypotheses has no term for T = ℤ_p(1): the field h1Vanishing is refutable.
- The failure is of (H.3), not of (H.1) or (H.2), which both hold for rank one.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`.

**Sources.**

- mr-ks, Lemma 6.1.5, proof, p. 71: The two excluded characters are exactly those for which (H.3) fails.
- rubin-es, Chapter II, Remark 2.7, p. 25: What remains true in the excluded case.

## ES.1. Auxiliary primes and local conditions

**Planets:** Ray class p-extensions K(q); Transverse local condition; Finite–singular comparison map.

### The fields K(q), K(r) and their Galois groups

`EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower` — construction.

**Statement.** For a prime q of K not dividing p, K(q) is the maximal p-extension of K inside the ray class field of K modulo q, and K(1) is the maximal p-extension of K inside the Hilbert class field. K(q)/K(1) is unramified outside q, totally ramified above q and cyclic, with Γ_q = Gal(K(q)/K(1)) the maximal p-quotient of (O_K/q)^×/(O_K^× mod q). For a squarefree product r = q₁⋯q_k, K(r) = K(q₁)⋯K(q_k), Γ_r = Gal(K(r)/K(1)) ≅ ∏_{q | r} Γ_q with Γ_q the inertia group of q in Γ_r; for s | r, Γ_s is both a subgroup and a quotient of Γ_r. For K ⊆ F ⊆ K_∞ finite over K, F(r) = F·K(r) and Gal(F(r)/K(1)) ≅ Gal(F(1)/K(1)) × Γ_r when K_∞/K is unramified outside p.

**Suggested declarations.** `TauCeti.KolyvaginSystems.rayPExtension`, `TauCeti.KolyvaginSystems.gammaPrime`, `TauCeti.KolyvaginSystems.gammaPrime_equiv`, `TauCeti.KolyvaginSystems.gammaConductor_equiv_pi`, `TauCeti.KolyvaginSystems.card_gammaPrime_dvd`, `TauCeti.KolyvaginSystems.rayPExtension_ramification`.

**Hypotheses.**

- q ∤ p
- r squarefree and prime to p

**Construction or proof.**

1. Existence of the ray class field modulo q and its Galois group Cl_q(K) come from global class field theory (Tau Ceti's ClassFieldTheory roadmap, layers 12–13); K(q) is the fixed field of the prime-to-p part.
2. The exact sequence 0 → (O_K/q)^×/im(O_K^×) → Cl_q(K) → Cl(K) → 0 of Tau Ceti's ray class groups identifies Γ_q; ramification considerations show the K(q) are linearly disjoint over K(1).
3. For K = ℚ: K(1) = ℚ, ℚ(ℓ) is the maximal p-extension in ℚ(μ_ℓ)^+, and Γ_ℓ is the p-part of 𝔽_ℓ^×/{±1}, which for p odd is the p-part of 𝔽_ℓ^×.

**Uses.**

- Rubin, Definition II.1.1: an Euler system needs classes over all K(q), q ∤ N.
- Rubin, Definition IV.4.1: the derivative operators D_q live in ℤ[Γ_q].
- Mazur–Rubin 2016, Definition 10.1: the tensor factor G_q is the Galois group of the completion of K(q) at q.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.rayPExtension` | constructor | K(q) as an intermediate field of K̄/K, for q ∤ p; K(1) for the trivial modulus. |
| `TauCeti.KolyvaginSystems.gammaPrime` | data | Γ_q = Gal(K(q)/K(1)), a finite cyclic p-group. |
| `TauCeti.KolyvaginSystems.gammaPrime_equiv` | equivalence | Γ_q is the maximal p-quotient of (O_K/q)^×/(O_K^× mod q). |
| `TauCeti.KolyvaginSystems.gammaConductor_equiv_pi` | equivalence | Γ_r ≅ ∏_{q \| r} Γ_q, compatibly with the inclusions and projections for s \| r. |
| `TauCeti.KolyvaginSystems.card_gammaPrime_dvd` | relation | #Γ_q divides N(q) − 1. |
| `TauCeti.KolyvaginSystems.rayPExtension_ramification` | characterisation | K(q)/K(1) is unramified outside q and totally ramified at the primes above q. |

**Unit tests.**

- `gammaConductor_one` (degenerate): The relative Galois group of the conductor-one ray layer over K(1) is trivial.
- `gammaPrime_trivial_of_not_dvd` (computation): If p does not divide N(q)−1, the relative p-ray group Γ_q is trivial.
- `gammaConductor_product` (compatibility): The relative ray Galois group at n is the product of its one-prime relative groups.

**Acceptance checks.**

- [K(q) : K(1)] divides N(q) − 1.
- K(r) is contained in, and in general not equal to, the maximal p-extension of K in the ray class field modulo r.
- Additional arithmetic check: For K = ℚ and p = 3, Γ_7 is cyclic of order 3 and Γ_5 is trivial; for p = 2, Γ_7 has order 1 because 6 = 2·3 and (ℤ/7)^×/{±1} has order 3.
- Additional arithmetic check: For K = ℚ, p = 3: Γ_{7·13} ≅ ℤ/3 × ℤ/3, and the maximal 3-extension of ℚ of conductor 91 has this Galois group.
- Additional arithmetic check: For K = ℚ, p = 3, q = 13: the ray class field modulo 13 is ℚ(μ_13)^+, of degree 6, and ℚ(13) is its cubic subfield, a proper subfield.

**Prerequisites.** `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`, `tauceti:TauCeti.GlobalNumberFields.RayClassGroup`.

**Sources.**

- rubin-es, Chapter IV §1, p. 55: The fields K(q), K(r) and the groups Γ_q, Γ_r.

### The ideals I_q, I_n and the groups G_q, G_n

`EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal` — definition.

**Statement.** Let (T, F, P) be a Selmer triple and q a prime with q ∤ p∞ and T unramified at q. G_q = Gal(K(q)_q/K_q), the Galois group of the completion of K(q) at q (for K = ℚ and in Mazur–Rubin 2004: G_ℓ = 𝔽_ℓ^× = Gal(ℚ(μ_ℓ)/ℚ)). Over ℚ, I_ℓ is the ideal of R generated by ℓ − 1 and P_ℓ(1), where P_ℓ(x) = det(1 − Fr_ℓ x | T). Over K (R principal): I_q = R if q is not principal, and otherwise I_q is the largest power of m with [K(q)_q : K_q]R ⊆ I_q and T/((Fr_q − 1)T + I_qT) free of rank one over R/I_q. For n ∈ N(P): I_n = Σ_{q | n} I_q (I_1 = 0) and G_n = ⊗_{q | n} G_q (G_1 = ℤ). Then G_n ⊗ R/I_n is free of rank one over R/I_n, and I_q annihilates |𝔽_q^×|-torsion requirements for the finite–singular map on T/I_nT.

**Suggested declarations.** `TauCeti.KolyvaginSystems.conductorIdeal`, `TauCeti.KolyvaginSystems.conductorIdeal_one`, `TauCeti.KolyvaginSystems.conductorIdeal_mono`, `TauCeti.KolyvaginSystems.tameGroup`, `TauCeti.KolyvaginSystems.tameGroup_tensor_free`, `TauCeti.KolyvaginSystems.conductorIdeal_rat`.

**Hypotheses.**

- T free over R, unramified at q, q ∤ p∞

**Construction or proof.**

1. G_q is cyclic and its order lies in I_q, so G_q ⊗ R/I_q ≅ R/I_q noncanonically; tensor over the primes dividing n.
2. The two definitions of I_q agree in their use: both give |G_q|·(T/I_qT) = 0 and det(1 − Fr_q | T/I_qT) = 0 (under the rank-one coinvariants condition), which are the hypotheses of the finite–singular comparison.
3. Howard's variant for K imaginary quadratic and ℓ inert: I_ℓ is the smallest ideal containing ℓ + 1 for which Fr_λ acts trivially on T/I_ℓT, and G_ℓ = k_λ^×/k_ℓ^×.

**Uses.**

- Mazur–Rubin 2004, Definition 3.1.2: the stalk at n is H¹_{F(n)}(ℚ, T/I_nT) ⊗ G_n.
- Mazur–Rubin 2004, Appendix A, Definition A.3: ρ_ℓ identifies the augmentation quotient of (R/I)[G_ℓ ⊗ R/I] with G_ℓ ⊗ R/I, which carries the correction terms.
- HeegnerPointEulerSystems HE.4: the Heegner coefficient ideal is Howard's I_ℓ.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.conductorIdeal` | data | I_q ⊆ R for a prime q, and I_n = ⨆_{q \| n} I_q for squarefree n. |
| `TauCeti.KolyvaginSystems.conductorIdeal_one` | simp | I_1 = ⊥. |
| `TauCeti.KolyvaginSystems.conductorIdeal_mono` | relation | m \| n implies I_m ≤ I_n. |
| `TauCeti.KolyvaginSystems.tameGroup` | data | G_q = Gal(K(q)_q/K_q) and G_n = ⊗_{q \| n} G_q, with G_1 = ℤ. |
| `TauCeti.KolyvaginSystems.tameGroup_tensor_free` | characterisation | G_n ⊗_ℤ R/I_n is a free R/I_n-module of rank one. |
| `TauCeti.KolyvaginSystems.conductorIdeal_rat` | compatibility | For K = ℚ and R principal, the 2016 ideal I_ℓ is the largest power of m containing the 2004 ideal (ℓ − 1, P_ℓ(1)) for which the coinvariants are free of rank one. |

**Unit tests.**

- `conductorIdeal_two_primes` (computation): I_{q₁q₂}=I_{q₁}+I_{q₂}, not their product or intersection.
- `conductorIdeal_one` (degenerate): The conductor-one coefficient ideal is zero.
- `tameGroup_one` (compatibility): The conductor-one tame tensor factor is ℤ, not the zero group.

**Acceptance checks.**

- For T = ℤ_p(1) over ℚ: P_ℓ(x) = 1 − ℓx and I_ℓ = (ℓ − 1).
- I_n depends on Frobenius and on |G_q|, not only on n.
- Additional arithmetic check: For K = ℚ, R = ℤ_p, T = ℤ_p(1): I_ℓ = (ℓ − 1)ℤ_p, so ℓ ∈ P_k iff ℓ ≡ 1 (mod p^k).
- Additional arithmetic check: For T = T_pE over ℚ: P_ℓ(1) = 1 − a_ℓ + ℓ and I_ℓ = (ℓ − 1, a_ℓ − 2).
- Additional arithmetic check: Two primes ℓ, ℓ′ with ℓ ≡ ℓ′ ≡ 1 (mod p^k) can have I_ℓ ≠ I_ℓ′ for T = T_pE, since a_ℓ ≢ a_ℓ′ in general: I_ℓ is not a function of ℓ − 1 alone.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower`, `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`, `mathlib:LinearMap.charpoly`.

**Sources.**

- mr-ks, Definition 2.2.1, p. 16: I_ℓ, I_n and G_n over ℚ.
- mr-higher, Definition 2.2, p. 6: I_q over a number field.
- howard, Definition 1.2.1, p. 1444: The inert-prime variant.

### Kolyvagin primes: P_k, P(L, τ) and R_{F,M}

`EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes` — definition.

**Statement.** (a) Over ℚ: P_k is the set of primes ℓ ∉ Σ(F) with T/(m^kT + (Fr_ℓ − 1)T) free of rank one over R/m^k and I_ℓ ⊆ m^k; P_1 ⊇ P_2 ⊇ ⋯ and N_k = N(P_k). (b) Over K: P_k = {q ∈ P : I_q ⊆ m^k}; for a finite Galois L/K and τ ∈ G_K, P(L, τ) is the set of primes q ∉ Σ(F) unramified in L with Fr_q conjugate to τ in Gal(L/K). (c) Rubin: for K ⊆ F ⊆ K_∞ finite and 0 ≠ M ∈ O, R_{F,M} is the set of r ∈ R(N) such that every prime q | r satisfies M | [K(q) : K(1)], M | P(Fr_q^{-1} | T^*; 1), and q splits completely in F(1)/K.

**Suggested declarations.** `TauCeti.KolyvaginSystems.kolyvaginPrimes`, `TauCeti.KolyvaginSystems.kolyvaginPrimes_antitone`, `TauCeti.KolyvaginSystems.frobeniusPrimes`, `TauCeti.KolyvaginSystems.mem_kolyvaginPrimes_of_frobenius`, `TauCeti.KolyvaginSystems.rubinPrimes`, `TauCeti.KolyvaginSystems.mem_rubinPrimes_of_frobenius`, `TauCeti.KolyvaginSystems.kolyvaginPrimes_infinite`.

**Hypotheses.**

- a Selmer triple; for (c) an ideal N divisible by p and the ramified primes

**Construction or proof.**

1. If τ satisfies (H.2) and the Frobenius class of ℓ in Gal(ℚ(T/m^kT, μ_{p^d})/ℚ) is that of τ (p^d generating the kernel of ℤ_p → R/m^k), then ℓ ∈ P_k (Mazur–Rubin 2004, Lemma 3.5.6(i)).
2. M | [K(q) : K(1)] iff q splits completely in K(μ_M̄, (O_K^×)^{1/M̄}); and if Fr_q is conjugate to τ on F(1)(μ_M̄, (O_K^×)^{1/M̄}, W_M) with T^{τ=1} ≠ 0 then q ∈ R_{F,M} (Rubin, Lemmas IV.1.2–1.3).
3. P(L,τ) is a nonempty conjugacy-class Frobenius set and has positive density. For the unrestricted 2004 P_k, (H.2) provides a nonempty Frobenius subset by Lemma 3.5.6(i). For P_k restricted to a chosen P, require the containment hypothesis (H.5), or 2016 (H.7) and k large enough as specified there. An arbitrary P, including P=∅, need not have positive density. Rubin’s prime-selection hypotheses similarly supply a nonempty Frobenius subset of the allowed primes.

**Uses.**

- Mazur–Rubin 2004, hypothesis (H.5) and §3.6: P_t ⊆ P ⊆ P_1, and the useful primes are found inside P_k.
- Rubin, Definition IV.4.10: derivative classes κ_{F,r,M} exist for r ∈ R_{F,M}.
- Burns–Sakamoto–Sano II, §3.1.2: P is the set of primes with Frobenius conjugate to τ in Gal(K(A)_M/K).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.kolyvaginPrimes` | data | P_k ⊆ P for k ≥ 1. |
| `TauCeti.KolyvaginSystems.kolyvaginPrimes_antitone` | relation | P_{k+1} ⊆ P_k. |
| `TauCeti.KolyvaginSystems.frobeniusPrimes` | data | P(L, τ), as Tau Ceti's frobeniusPrimeSet of the class of τ minus Σ(F). |
| `TauCeti.KolyvaginSystems.mem_kolyvaginPrimes_of_frobenius` | characterisation | If Fr_ℓ is conjugate to τ in Gal(ℚ(T/m^kT, μ_{p^d})/ℚ) and τ satisfies (H.2), then ℓ ∈ P_k. |
| `TauCeti.KolyvaginSystems.rubinPrimes` | data | R_{F,M} ⊆ R(N). |
| `TauCeti.KolyvaginSystems.mem_rubinPrimes_of_frobenius` | characterisation | Rubin's Lemma IV.1.3: Fr_q conjugate to τ on F(1)(μ_M̄, (O_K^×)^{1/M̄}, W_M) with T^{τ=1} ≠ 0 implies q ∈ R_{F,M}. |
| `TauCeti.KolyvaginSystems.kolyvaginPrimes_infinite` | other | For the unrestricted 2004 P_k, (H.2) implies positive density and infinitude after removing a finite set. For the definition restricted to P, also require P to contain that Frobenius subset, as ensured by the stated (H.5)/(H.7) bounds. |

**Unit tests.**

- `kolyvaginPrimes_not_outside` (non-example): A prime outside the selected set is outside every level set.
- `kolyvaginPrimes_unit_ideal` (non-example): At positive level and a proper maximal-ideal power, a prime with unit conductor ideal is excluded.
- `kolyvaginPrimes_level_zero` (degenerate): At level zero, every selected prime is allowed.

**Acceptance checks.**

- For ℓ ∈ P_k with R principal artinian of length k: H¹_f(ℚ_ℓ, T), H¹_s(ℚ_ℓ, T) and their duals are free of rank one and φ^fs_ℓ is an isomorphism (Lemma 3.5.6(ii)).
- All chosen primes avoid Σ(F) and any prescribed finite set.
- Additional arithmetic check: For T = ℤ_p(1) over ℚ with Σ(F) = {p, ∞}: P_k = {ℓ ≠ p : ℓ ≡ 1 (mod p^k)}.
- Additional arithmetic check: For R = ℤ_p and T = ℤ_p(1), ∩_k P_k = ∅: no prime is ≡ 1 modulo every power of p.
- Additional arithmetic check: For K = ℚ, F = ℚ, T = ℤ_p(1) and M = p^k, a prime ℓ ∤ N lies in R_{ℚ,M} iff ℓ ≡ 1 (mod p^k), since P(Fr_ℓ^{-1} | T^*; 1) = 1 − Fr_ℓ^{-1} acting on T^* = ℤ_p is 0 and [ℚ(ℓ) : ℚ] is the p-part of ℓ − 1.
- Additional arithmetic check: For T = T_pE and ℓ ≡ 1 (mod p) with a_ℓ ≢ 2 (mod p), ℓ ∉ P_1: I_ℓ = R.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal`, `EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `tauceti:NumberField.Chebotarev.frobeniusPrimeSet`, `tauceti:NumberField.artinSymbol`.

**Sources.**

- mr-ks, Definition 3.1.6, p. 21: The sets P_k.
- mr-higher, Definition 4.2, p. 9: The sets P(L, τ).
- rubin-es, Chapter IV, Definition 1.1, p. 57: Rubin's sets R_{F,M}.

### Finite and singular parts at an unramified prime

`EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition` — lemma.

**Statement.** Let K_v be nonarchimedean of residue characteristic ≠ p with residue field 𝔽, T a finitely generated R-module with unramified G_{K_v}-action and |𝔽^×|·T = 0. There are canonical functorial isomorphisms H¹_f(K_v, T) ≅ T/(Fr − 1)T (evaluate cocycles at Frobenius), H¹_s(K_v, T) := H¹(K_v, T)/H¹_f(K_v, T) ≅ Hom(I, T^{Fr=1}), and H¹_s(K_v, T) ⊗ 𝔽^× ≅ T^{Fr=1}.

**Suggested declarations.** `TauCeti.KolyvaginSystems.finite_singular_decomposition`.

**Hypotheses.**

- T unramified, of finite type
- |𝔽^×|·T = 0

**Construction or proof.**

1. H¹_f = H¹(G_𝔽, T) ≅ T/(Fr − 1)T is SelmerIwasawaCohomology L2/unramified-condition (unramified_equiv_coinvariants).
2. The sequence 0 → H¹(G_𝔽, T) → H¹(K_v, T) → H¹(I, T)^{G_𝔽} → 0 (vanishing of H²(G_𝔽, T)) gives H¹_s ≅ Hom(I, T)^{Fr=1}; since |𝔽^×|T = 0 and I/|𝔽^×|I ≅ 𝔽^× canonically (tame inertia), Hom(I, T)^{Fr=1} = Hom(𝔽^×, T^{Fr=1}).

**Acceptance checks.**

- For T = ℤ/p^k with trivial action and p^k | #𝔽^×: H¹_f ≅ ℤ/p^k and H¹_s ≅ Hom(𝔽^×, ℤ/p^k).
- The isomorphisms commute with maps T → T′ of such modules.

**Prerequisites.** `SelmerIwasawaCohomology:L2/unramified-condition`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `ArithmeticGaloisDuality:R02.2/compact-five-term`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

**Sources.**

- mr-ks, Lemma 1.2.1, p. 10: The two canonical identifications.

### The transverse local condition

`EulerSystemsAndKolyvaginSystems:ES.1/transverse-condition` — definition.

**Statement.** In the situation of finite-singular-decomposition, fix a maximal totally tamely ramified abelian extension L/K_v (so Gal(L/K_v) ≅ 𝔽^×; for K_v = ℚ_ℓ take L = ℚ_ℓ(μ_ℓ); globally L is the completion of K(q) at q, of degree |G_q|, with T killed by |G_q|). The L-transverse condition is H¹_tr(K_v, T) = ker(H¹(K_v, T) → H¹(L, T)) = H¹(L/K_v, T^{G_L}). It projects isomorphically onto H¹_s(K_v, T), so H¹(K_v, T) = H¹_f(K_v, T) ⊕ H¹_tr(K_v, T), functorially in T. It is defined by restriction to the specified extension L, not by a choice of complement.

**Suggested declarations.** `TauCeti.KolyvaginSystems.transverse`, `TauCeti.KolyvaginSystems.transverse_isCompl_finite`, `TauCeti.KolyvaginSystems.transverse_equiv_singular`, `TauCeti.KolyvaginSystems.transverse_map`, `TauCeti.KolyvaginSystems.finitePart`, `TauCeti.KolyvaginSystems.transverse_eq_bot_iff`.

**Hypotheses.**

- T unramified with |𝔽^×|·T = 0 (or |Gal(L/K_v)|·T = 0 for the p-part)
- L/K_v totally tamely ramified abelian of maximal degree

**Construction or proof.**

1. Since L/K_v is totally ramified and T unramified, T^{G_L} = T^{Fr=1}; the composite H¹(L/K_v, T^{G_L}) = Hom(Gal(L/K_v), T^{Fr=1}) → Hom(I/|𝔽^×|I, T^{Fr=1}) ≅ H¹_s is an isomorphism (Mazur–Rubin 2004, Lemma 1.2.4).
2. c ∈ H¹(K_v, T) decomposes as c_f + c_tr.

**Uses.**

- Mazur–Rubin 2004, Example 2.1.8: the Selmer structure F(n) puts the transverse condition at the primes dividing n.
- Mazur–Rubin 2016, Definition 6.2: loc^tr_q is the projection to H¹_tr with kernel H¹_f.
- Howard, Proposition 1.1.9 and §1.2: the L-transverse condition for the p-part of the ring class field of conductor ℓ.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.transverse` | constructor | H¹_tr(K_v, T) = ker(res : H¹(K_v, T) → H¹(L, T)). |
| `TauCeti.KolyvaginSystems.transverse_isCompl_finite` | characterisation | H¹_f(K_v, T) and H¹_tr(K_v, T) are complementary submodules of H¹(K_v, T). |
| `TauCeti.KolyvaginSystems.transverse_equiv_singular` | equivalence | The projection H¹_tr(K_v, T) → H¹_s(K_v, T) is an isomorphism. |
| `TauCeti.KolyvaginSystems.transverse_map` | functoriality | A map T → T′ of unramified modules killed by \|𝔽^×\| carries H¹_tr to H¹_tr. |
| `TauCeti.KolyvaginSystems.finitePart` | projection | c ↦ c_f and c ↦ c_tr, the two projections of the decomposition. |
| `TauCeti.KolyvaginSystems.transverse_eq_bot_iff` | simp | H¹_tr(K_v, T) = 0 iff T^{Fr=1} = 0. |

**Unit tests.**

- `transverse_restriction_kernel` (characterisation): The transverse condition is exactly the kernel of restriction to the designated totally ramified tame extension.
- `transverse_trivial` (degenerate): If the Frobenius-fixed module is zero, the transverse condition is zero.
- `transverse_finite_projection` (compatibility): The finite projection of a transverse class is zero under the supplied direct-sum comparison.

**Acceptance checks.**

- Different choices of L give different complements; all are transverse to H¹_f.
- The transverse condition does not in general propagate to subquotients as the transverse condition (Remark 1.1.8), but F(n) stays cartesian on quotients (Lemma 3.7.4).
- Additional arithmetic check: For K_v = ℚ_ℓ, ℓ ≡ 1 (mod p^k), T = ℤ/p^k: H¹(ℚ_ℓ, T) = Hom(ℚ_ℓ^×, ℤ/p^k) ≅ (ℤ/p^k)², H¹_f is the homomorphisms trivial on ℤ_ℓ^×, and H¹_tr is the homomorphisms trivial on the norm group ⟨ℓ⟩ × (1 + ℓℤ_ℓ) of ℚ_ℓ(μ_ℓ), that is, those with f(ℓ) = 0.
- Additional arithmetic check: In the example above, {f : f(ℓu) = 0}, for a unit u ∈ ℤ_ℓ^× that is not a p-th power modulo ℓ, is another complement of H¹_f = {f : f(ℤ_ℓ^×) = 0}, and it is not H¹_tr = {f : f(ℓ) = 0}: the transverse condition is determined by L = ℚ_ℓ(μ_ℓ).
- Additional arithmetic check: H¹_tr(K_v, T) and H¹_tr(K_v, T^*) are exact orthogonal complements under the local Tate pairing.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`, `EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower`.

**Sources.**

- mr-ks, Definition 1.1.6(iv) and Lemma 1.2.4, pp. 9, 11: Definition of the transverse condition and the splitting.

### The finite–singular comparison map

`EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison` — construction.

**Statement.** Let T be free of finite rank over R, unramified at v, with |𝔽^×|·T = 0 and det(1 − Fr | T) = 0. Put P(x) = det(1 − Fr x | T) and let Q(x) ∈ R[x] be the unique polynomial with (x − 1)Q(x) = P(x). By Cayley–Hamilton Q(Fr^{-1})T ⊆ T^{Fr=1}, and φ^fs : H¹_f(K_v, T) ≅ T/(Fr − 1)T → T^{Fr=1} ≅ H¹_s(K_v, T) ⊗ 𝔽^× is induced by Q(Fr^{-1}). If R is artinian, |𝔽^×|R = 0 and T/(Fr − 1)T is free of rank one, then det(1 − Fr | T) = 0 automatically and Q(Fr^{-1}) and φ^fs are isomorphisms, so H¹_f and H¹_s are free of rank one. With the tensor factor 𝔽^× (globally G_q) retained the map involves no choice. A generator σ of the tame quotient gives Rubin's map φ^fs_{q,σ} = α_q^{-1} ∘ Q_q(Fr_q^{-1}) ∘ β_q : H¹_f → H¹_s (α_q evaluation at σ, β_q evaluation at Frobenius), and φ^fs(c) = φ^fs_{q,σ}(c) ⊗ σ; for another generator σ^a one has φ^fs_{q,σ^a} = a^{-1}·φ^fs_{q,σ}, so the tensor-valued map is independent of the generator.

**Suggested declarations.** `TauCeti.KolyvaginSystems.fsQuotientPoly`, `TauCeti.KolyvaginSystems.fsQuotientPoly_spec`, `TauCeti.KolyvaginSystems.finiteSingular`, `TauCeti.KolyvaginSystems.finiteSingular_bijective`, `TauCeti.KolyvaginSystems.finiteSingular_map`, `TauCeti.KolyvaginSystems.finiteSingular_generator`.

**Hypotheses.**

- T free of finite rank, unramified
- |𝔽^×|·T = 0
- det(1 − Fr | T) = 0

**Construction or proof.**

1. P(1) = 0 gives Q; P(Fr^{-1}) = 0 on T by Cayley–Hamilton (Mathlib's LinearMap.aeval_self_charpoly after reversing the polynomial), so (Fr^{-1} − 1)Q(Fr^{-1}) = 0 and Q(Fr^{-1}) kills (Fr − 1)T.
2. Compose with the identifications of finite-singular-decomposition.
3. Isomorphism statement: reduce to R a field by Nakayama, where it is Rubin's Corollary A.2.7; then compare lengths of T/(Fr − 1)T and T^{Fr=1} (Mazur–Rubin 2004, Lemma 1.2.3).
4. Rubin's convention uses the Euler polynomial P(Fr_q^{-1} | T^*; x) ≡ det(1 − Fr_q x | W_M) modulo M (Lemma IV.1.2(iii)), so the two maps agree on W_M = T/MT.

**Uses.**

- Mazur–Rubin 2004, Definition 3.1.3, relation (5): (κ_{nℓ})_{ℓ,s} = φ^fs_ℓ(κ_n) is the Kolyvagin system relation.
- Rubin, Theorem IV.5.4: the singular part of κ_{F,rq,M} at q is φ^fs_q of the finite part of κ_{F,r,M}.
- Mazur–Rubin 2016, Definition 6.2: loc^f_q is the finite projection followed by φ^fs_q.
- HeegnerPointEulerSystems HE.5: the Heegner finite–singular comparison is this map for T_pE at an inert prime.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.fsQuotientPoly` | data | Q(x) with (x − 1)·Q(x) = det(1 − Fr·x \| T), defined when det(1 − Fr \| T) = 0. |
| `TauCeti.KolyvaginSystems.fsQuotientPoly_spec` | characterisation | (X − 1) * Q = P and Q is unique. |
| `TauCeti.KolyvaginSystems.finiteSingular` | constructor | φ^fs : H¹_f(K_v, T) → H¹_s(K_v, T) ⊗ 𝔽^×, induced by Q(Fr^{-1}) : T/(Fr − 1)T → T^{Fr=1}. |
| `TauCeti.KolyvaginSystems.finiteSingular_bijective` | characterisation | If R is artinian, \|𝔽^×\|R = 0 and T/(Fr − 1)T is free of rank one, φ^fs is bijective and H¹_f, H¹_s are free of rank one. |
| `TauCeti.KolyvaginSystems.finiteSingular_map` | functoriality | The comparison is natural under equivariant maps compatible with the chosen quotient polynomials: f ∘ Q_T(Fr_T^{-1}) = Q_T′(Fr_T′^{-1}) ∘ f. In particular, for reductions of one fixed finite free lattice under R/I → R/J, characteristic and quotient polynomials reduce together, so φ^fs commutes with the coefficient-reduction maps. Arbitrary equivariant maps between representations with different characteristic polynomials need not commute. |
| `TauCeti.KolyvaginSystems.finiteSingular_generator` | compatibility | For a generator σ of the tame quotient, φ^fs(c) = φ^fs_{q,σ}(c) ⊗ σ with φ^fs_{q,σ} = α_q^{-1} ∘ Q_q(Fr_q^{-1}) ∘ β_q Rubin's map; φ^fs_{q,σ^a} = a^{-1}·φ^fs_{q,σ}, so the tensor-valued map does not depend on σ. |

**Unit tests.**

- `finiteSingular_cyclotomic` (computation): P=1−X has quotient polynomial Q=−1.
- `finiteSingular_rank_two` (computation): P=(1−X)(1−aX) has quotient polynomial Q=−(1−aX).
- `finiteSingular_not_iso` (non-example): For P=(1−X)², Q(1)=0, so the rank-two fixed space does not have the rank-one isomorphism.
- `finiteSingular_not_natural_inclusion` (non-example): Over 𝔽₅, Q(1) for the included fixed line is −1 but for diag(1,2) it is −(1−2), so arbitrary equivariant inclusions do not preserve the comparison.

**Acceptance checks.**

- φ^fs commutes with the quotient maps T/I_nT → T/JT: both identifications and Q(Fr^{-1}) are functorial.
- For T = ℤ/p^k(1) and ℓ ≡ 1 (mod p^k): P(x) = 1 − ℓx ≡ 1 − x, Q = −1, and φ^fs is −1 times the tautological identification of T/(Fr − 1)T = T with T^{Fr=1} = T.
- Additional arithmetic check: For R=ℤ/p² and T=R with Fr=1, compare the finite–singular maps for T over R and T/pT over R/p: both quotient polynomials are Q=−1, and the maps on finite and singular terms commute with reduction.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`, `EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal`, `mathlib:LinearMap.aeval_self_charpoly`, `mathlib:LinearMap.charpoly`.

**Sources.**

- mr-ks, Definition 1.2.2, p. 10: The comparison map with its tensor factor.
- rubin-es, Chapter IV, Definition 5.3, pp. 67–68: Rubin's version with a chosen generator σ_q.

### The Selmer structures F_a^b(c)

`EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures` — definition.

**Statement.** For a Selmer structure F and pairwise coprime a, b, c with c ∈ N(P) (and I_cT = 0 when needed for the transverse condition; in general one works on T/I_cT), F_a^b(c) has Σ = Σ(F) ∪ {q : q | abc} and local conditions: H¹_F(K_q, T) for q ∈ Σ(F), q ∤ ab; 0 for q | a (strict); H¹(K_q, T) for q | b (relaxed); H¹_tr(K_q, T) for q | c (transverse). One writes F(n) = F^1_1(n), F^n, F_n. Then F_n ≤ F ≤ F^n and F_n ≤ F(n) ≤ F^n, and the dual is (F_a^b(c))^* = (F^*)_b^a(c).

**Suggested declarations.** `TauCeti.KolyvaginSystems.SelmerTriple.modify`, `TauCeti.KolyvaginSystems.SelmerTriple.modify_le`, `TauCeti.KolyvaginSystems.SelmerTriple.dual_modify`, `TauCeti.KolyvaginSystems.SelmerTriple.selmer_strict_eq_inf`, `TauCeti.KolyvaginSystems.SelmerTriple.modify_isCartesian`.

**Hypotheses.**

- a, b, c pairwise coprime; c ∈ N(P); T killed by I_c for the transverse places

**Construction or proof.**

1. Built from SelmerIwasawaCohomology L2/selmer-data (withCond, strict, relax) and the transverse condition.
2. Duals: strict and relaxed are exchanged; finite and transverse are self-dual (transverse-duality).
3. If R is principal artinian of length k, (H.2) holds, F is cartesian and n ∈ N_k, then F(n) is cartesian (Mazur–Rubin 2004, Lemma 3.7.4).

**Uses.**

- Mazur–Rubin 2004, Definitions 3.1.2 and 3.1.8: stalks H¹_{F(n)} for Kolyvagin systems and H¹_{F^n} for weak ones.
- Mazur–Rubin 2016, Definition 6.1: Stark systems use the relaxed Selmer modules H¹_{F^n}.
- Mazur–Rubin 2004, Lemma 4.1.6: the lattice of inclusions among F_ℓ(n), F(n), F(nℓ), F^ℓ(n).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.SelmerTriple.modify` | constructor | F_a^b(c): strict at a, relaxed at b, transverse at c. |
| `TauCeti.KolyvaginSystems.SelmerTriple.modify_le` | relation | If a′ \| a, b \| b′ and c = c′ then F_a^b(c) ≤ F_{a′}^{b′}(c′); in particular F_n ≤ F ≤ F^n and F_n ≤ F(n) ≤ F^n. |
| `TauCeti.KolyvaginSystems.SelmerTriple.dual_modify` | compatibility | (F_a^b(c))^* = (F^*)_b^a(c). |
| `TauCeti.KolyvaginSystems.SelmerTriple.selmer_strict_eq_inf` | characterisation | H¹_{F_n}(K, T) = H¹_F(K, T) ⊓ H¹_{F(n)}(K, T). |
| `TauCeti.KolyvaginSystems.SelmerTriple.modify_isCartesian` | other | Under (H.2), R principal artinian of length k and n ∈ N_k, F cartesian implies F(n) cartesian. |

**Unit tests.**

- `modify_one` (degenerate): Strict and relaxed modification at conductor one both give F.
- `modify_strict_one_prime` (computation): Strict modification at q sets its local condition to zero.
- `modify_relaxed_one_prime` (computation): Relaxed modification at q sets its local condition to the full local H¹.

**Acceptance checks.**

- H¹_{F_n}(K, T) = H¹_F(K, T) ∩ H¹_{F(n)}(K, T).
- The dual of F(n) is F^*(n): the transverse condition is not replaced by its naive complement.
- Additional arithmetic check: (F^n)^* = (F^*)_n and (F_n)^* = (F^*)^n.
- Additional arithmetic check: F_n ≤ F(n) ≤ F^n, and the quotient H¹_{F^n}/H¹_{F_n} injects into ⊕_{q | n} H¹(K_q, T).
- Additional arithmetic check: For q ∈ P_1 with H¹_s(K_q, T) ≠ 0, F(q) ≠ F and neither F(q) ≤ F nor F ≤ F(q).

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.1/transverse-condition`, `EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal`, `SelmerIwasawaCohomology:L2/selmer-data`, `SelmerIwasawaCohomology:L2`, `SelmerIwasawaCohomology:L2/change-of-conditions`.

**Sources.**

- mr-ks, Example 2.1.8, p. 15: The modified structures.
- mr-ks, Example 2.3.2, p. 17: Their duals.

### The transverse condition is self-dual

`EulerSystemsAndKolyvaginSystems:ES.1/transverse-duality` — theorem.

**Statement.** Let K_v be nonarchimedean of residue characteristic ≠ p, T unramified with |𝔽^×|·T = 0, and L/K_v totally ramified abelian of degree |𝔽^×|. Then H¹_tr(K_v, T) and H¹_tr(K_v, T^*) are exact orthogonal complements under the local Tate pairing H¹(K_v, T) × H¹(K_v, T^*) → ℚ_p/ℤ_p, as are H¹_f(K_v, T) and H¹_f(K_v, T^*).

**Suggested declarations.** `TauCeti.KolyvaginSystems.transverse_duality`.

**Hypotheses.**

- v ∤ p
- T unramified
- |𝔽^×|·T = 0

**Construction or proof.**

1. The finite parts are orthogonal complements (the general-R local exact-annihilator theorem requested from SelmerIwasawaCohomology L2; SelmerIwasawaCohomology L2/finite-condition-lattice-duality).
2. By the splitting it suffices that the transverse parts are orthogonal. Reduce to T = ℤ/p^k with p^k | #𝔽^×: H¹_tr(T) = Hom(K_v^×/N L^×, ℤ/p^k) and H¹_tr(T^*) = ker(K_v^×/p^k → L^×/p^k) by class field theory and Kummer theory; if α = β^{p^k} then N_{L/K_v}β = α^{#𝔽^×/p^k}, so α is divisible by p^k in the cyclic group K_v^×/N L^× of order #𝔽^×.
3. General T: H¹_tr(K_v, T) = H¹_tr(K_v, T^{G_{K_v}}) and T^{G_{K_v}} is a sum of cyclic modules.

**Acceptance checks.**

- Local orthogonality for the strict, relaxed and transverse modifications: (F_a^b(c))^* = (F^*)_b^a(c).
- For T = ℤ/p^k the pairing of a transverse character with a transverse Kummer class is 0.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.1/transverse-condition`, `SelmerIwasawaCohomology:L2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

**Sources.**

- mr-ks, Proposition 1.3.2, p. 12: Self-duality of the finite and transverse conditions.

### Simultaneous nonvanishing of localisations

`EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing` — theorem.

**Statement.** Let R be principal artinian and (T, F, P) satisfy (H.0)–(H.5) of Mazur–Rubin 2004. If c₁, c₂ ∈ H¹(ℚ, T) and c₃, c₄ ∈ H¹(ℚ, T^*) are all nonzero, then for every k ≥ 1 there is a set S ⊆ P_k of positive density such that for every ℓ ∈ S the four localisations (c_i)_ℓ are nonzero. Over a number field with self-injective coefficients (Burns–Sakamoto–Sano II, Lemma 3.9, under Hypothesis 3.2): for nonzero c₁, …, c_s ∈ H¹(K, A) and c₁^*, …, c_t^* ∈ H¹(K, A^*(1)) with s + t < p, there is a set of primes q ∈ P of positive density with all localisations nonzero.

**Suggested declarations.** `TauCeti.KolyvaginSystems.chebotarev_nonvanishing`.

**Hypotheses.**

- (H.0)–(H.5); this is the only place (H.4) is used
- for the second form: Hypothesis 3.2 of Burns–Sakamoto–Sano II

**Construction or proof.**

1. Let F = ℚ(T, μ_{p^k}) and fix τ as in (H.2). By (H.3) restriction C → Hom(G_F, T)^{G_ℚ} is injective; by (H.1) the image of c_i(G_F) in T/(τ − 1)T is nonzero.
2. Each condition 'c_i(γτ) ≠ 0 in T/(τ − 1)T' excludes a proper coset union in G_F; (H.4) ((H.4a), or p > 4 counting four proper subgroups) shows the four conditions hold simultaneously for some γ.
3. Chebotarev (Tau Ceti's Chebotarev roadmap) gives a positive density of ℓ with Frobenius γτ on the field cut out by the classes; such ℓ lie in P_k by kolyvagin-primes, and loc_ℓ(c_i) ≠ 0 since H¹_f(ℚ_ℓ, T) ≅ T/(Fr − 1)T.

**Acceptance checks.**

- A single prime with Frobenius τ on ℚ(T, μ_{p^k}) does not suffice: the condition is on the larger field cut out by the classes.
- The primes may be chosen outside any finite set, in particular prime to Σ(F) and to a given n ∈ N.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`, `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004`, `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Sources.**

- mr-ks, Proposition 3.6.1, p. 30: The four-class statement.
- bss2, Lemma 3.9, p. 17: The version over a number field with Gorenstein coefficients.

### Primes with prescribed localisation kernels

`EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-prescribed-kernels` — theorem.

**Statement.** In the setting of chebotarev-nonvanishing, suppose the image of R → End(T) is contained in the image of ℤ_p[[G_ℚ]] → End(T). Fix a finite R-submodule C ⊆ H¹(ℚ, T), a homomorphism φ : C → R and k ≥ 1. (i) There is a set S ⊆ P_k of positive density with ker(loc_ℓ : C → H¹(ℚ_ℓ, T)) = ker φ for all ℓ ∈ S. (ii) If also (H.4a) holds, D ⊆ H¹(ℚ, T^*) is a finite submodule and ψ : D → R a homomorphism, then S can be chosen with in addition ker(loc_ℓ on D) = ker ψ.

**Suggested declarations.** `TauCeti.KolyvaginSystems.chebotarev_prescribed_kernels`, `TauCeti.KolyvaginSystems.chebotarev_prescribed_dual_kernels`.

**Hypotheses.**

- (H.0)–(H.5)
- image of R in End(T) inside the image of ℤ_p[[G_ℚ]]
- (H.4a) for (ii)

**Construction or proof.**

1. Via C → Hom(G_F, T/(τ − 1)T) ≅ Hom(G_F, R) (after fixing a generator), find γ ∈ G_F realising φ; the hypothesis on End(T) makes the span of the image of G_F an R-module (Mazur–Rubin 2004, Lemma 3.6.3).
2. (H.4a) makes the extensions cut out by C and D linearly disjoint, so φ and ψ can be realised by one γ; apply Chebotarev as before.

**Acceptance checks.**

- Used with C = H¹_F(ℚ, T) and ker φ_i cutting out a submodule L to find leading vertices through L (ES.4/leading-vertices).
- Fails without the End(T) hypothesis: only 𝔽_p-rational subspaces occur when T = T₀ ⊗ k (Remark 4.1.17).

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing`.

**Sources.**

- mr-ks, Proposition 3.6.2, p. 30: Prescribed kernels of localisation.

### Rubin's selection of primes with large localisation

`EulerSystemsAndKolyvaginSystems:ES.1/rubin-prime-selection` — theorem.

**Statement.** Let p > 2, let T satisfy Hyp(K, T) with its element τ, fix a power M of p, and let L/K be Galois with G_L acting trivially on W_M and W_M^*. (a) For κ ∈ H¹(K, W_M) and η ∈ H¹(K, W_M^*) there is γ ∈ G_L with order(κ(γτ), W_M/(τ − 1)W_M) ≥ order((κ)_L, H¹(L, W_M)) and the same for η. (b) For an Euler system c with derivative classes κ_{r,M} = κ_{K,r,M} and a finite subset C ⊆ H¹(K, W_M^*) with k = |C|, there are primes q₁, …, q_k of K such that, with r_i = q₁⋯q_i: q_i ∈ R_{K,M}; Fr_{q_i} is in the class of τ in Gal(K(W_M)/K); order((κ_{r_{i−1},M})_{q_i}, H¹_f(K_{q_i}, W_M)) ≥ order((κ_{r_{i−1},M})_Ω, H¹(Ω, W_M)); and every η ∈ C vanishing at all q_i lies in H¹(Ω/K, W_M^*). Under Hyp(K, V) alone the same holds with both orders lowered by a + 1 for a constant a (Lemma V.3.1).

**Suggested declarations.** `TauCeti.EulerSystems.rubin_prime_evaluation_selection`.

**Hypotheses.**

- Hyp(K, T) for (a), (b); Hyp(K, V) for the weakened form
- Ω = K(1)K(W)K(μ_{p^∞}, (O_K^×)^{1/p^∞})

**Construction or proof.**

1. (a): the evaluation maps G_L → W_M/(τ − 1)W_M are homomorphisms whose images generate modules of the stated order by irreducibility of T ⊗ k; a group is not the union of two proper subgroups (p > 2 is used here).
2. (b): choose q_i inductively by Chebotarev in the extension of Ω-level cut out by κ_{r_{i−1},M} and η_i, with Frobenius γτ; then q_i ∈ R_{K,M} by Lemma IV.1.3.
3. The loss between K and Ω is H¹(Ω/K, W_M) and H¹(Ω/K, W_M^*): the source of n_W and n_W^*.

**Acceptance checks.**

- With H¹(Ω/K, W) = H¹(Ω/K, W^*) = 0 the selection has no loss, as in chebotarev-nonvanishing.
- The primes avoid N and all earlier q_j.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`, `EulerSystemsAndKolyvaginSystems:ES.3/derivative-class`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Sources.**

- rubin-es, Chapter V, Lemma 2.3, p. 81: The inductive choice of primes.
- rubin-es, Chapter V, Lemma 3.1, p. 87: The weakened form under Hyp(K, V).

### Exponents, orders and reducibility depth

`EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth` — definition.

**Statement.** Let O_λ be a discrete valuation ring with uniformiser λ. For an O_λ-module M and x ∈ M: exp_λ(x, M) = min{d ≥ 0 : λ^d x = 0} ∈ ℤ_{≥0} ∪ {∞} and ord_λ(x, M) = sup{d ≥ 0 : x ∈ λ^d M}. For a profinite group G and a torsion O_λ[G]-module R of finite type, the reducibility depth of R is the smallest integer r_R ≥ 0 such that (1) every G-stable O_λ-submodule R′ ⊆ R not contained in λR contains λ^{r_R}R, and (2) for every m ≥ 1, End_{O_λ[G]}(R̄^{(m)})/O_λ·id is annihilated by λ^{r_R}, where R̄^{(m)} = R/λ^mR. If R/λR is absolutely irreducible then d_R = 0. If R is a lattice with R ⊗ ℚ absolutely irreducible, there is r_R depending only on R bounding the reducibility depth of every R̄^{(m)}. In the abundance and localisation formulas below we write d_R for this reducibility depth (called r_R in LTXZZ), to distinguish it from ranks.

**Suggested declarations.** `TauCeti.ErrorTolerant.expAt`, `TauCeti.ErrorTolerant.ordAt`, `TauCeti.ErrorTolerant.expAt_add_ordAt_le`, `TauCeti.ErrorTolerant.reducibilityDepth`, `TauCeti.ErrorTolerant.reducibilityDepth_eq_zero`, `TauCeti.ErrorTolerant.reducibilityDepth_bounded`.

**Hypotheses.**

- O_λ a discrete valuation ring with finite residue field
- R of finite type

**Construction or proof.**

1. Absolutely irreducible residual representation: a submodule not in λR surjects onto R/λR, so equals R by Nakayama; endomorphisms are scalars by Schur and lifting.
2. Uniform bound: for R_ℚ absolutely irreducible the lattices stable under G in R_ℚ form finitely many homothety classes and End(R) = O_λ; a compactness argument bounds both conditions uniformly in m (Liu–Tian–Xiao–Zhang–Zhu, Lemma 2.3.3).

**Uses.**

- Liu–Tian–Xiao–Zhang–Zhu, Lemma 2.3.4 and Definition 2.6.5: the loss λ^{𝔣(r_S) d_R} in the saturation of θ_S and in abundant tuples.
- Castella–Grossi–Lee–Skinner, §3.3.1: the constants C_1, C_2 play the role of the reducibility depth for T_pE with reducible residual representation.
- HeegnerPointEulerSystems HE.7: exceptional primes need bounds uniform in the torsion exponent.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.ErrorTolerant.expAt` | data | exp_λ(x, M) ∈ ℕ∞. |
| `TauCeti.ErrorTolerant.ordAt` | data | ord_λ(x, M) ∈ ℕ∞. |
| `TauCeti.ErrorTolerant.expAt_add_ordAt_le` | relation | In a free O_λ/λ^n-module, exp_λ(x) + ord_λ(x) = n for x ≠ 0. |
| `TauCeti.ErrorTolerant.reducibilityDepth` | data | r_R for a torsion O_λ[G]-module R of finite type. |
| `TauCeti.ErrorTolerant.reducibilityDepth_eq_zero` | example | If R/λR is absolutely irreducible then d_R = 0. |
| `TauCeti.ErrorTolerant.reducibilityDepth_bounded` | other | For a lattice R with R_ℚ absolutely irreducible, sup_m r_{R̄^{(m)}} < ∞. |

**Unit tests.**

- `expAt_zero` (degenerate): The annihilator exponent of zero is zero.
- `expAt_uniformizer_quotient` (computation): In O/(πⁿ), πᵈ has annihilator exponent n−d for d<n.
- `reducibilityDepth_stable_counterexample` (non-example): A primitive stable submodule missing πᵈT disproves the depth bound d.

**Acceptance checks.**

- r_R measures the failure of residual irreducibility that Mazur–Rubin's (H.1) excludes; with d_R = 0 the error-tolerant statements reduce to the clean ones.
- exp and ord are the 'order' functions of Rubin's Chapter V.
- Additional arithmetic check: In M = ℤ/p³, exp_p(p) = 2 and ord_p(p) = 1.
- Additional arithmetic check: For R = E[p^m] with E[p] absolutely irreducible, d_R = 0.
- Additional arithmetic check: For R = ℤ/p² ⊕ ℤ/p² with G acting through the upper unipotent matrices (1, p·b; 0, 1), b ∈ ℤ/p, the submodule generated by e₁ is G-stable and not contained in pR but does not contain R, so r_R ≥ 1: r_R ≠ 0 although R is free.
- Additional arithmetic check: ord_λ(x, M) = ∞ iff x ∈ ∩_d λ^d M; for M of finite length this means x = 0.

**Prerequisites.** `SelmerIwasawaCohomology:L2/selmer-data`.

**Sources.**

- ltxzz, Definition 2.3.2, arXiv v3 p. 14: Definition of the reducibility depth.
- ltxzz, Lemma 2.3.3, arXiv v3 p. 14: The uniform bound.
- ltxzz, Definition 2.3.2, Lemmas 2.3.3–2.3.4, published pp.126–128: Published-version collation of the stated result, expressed here in our own words.

### The field cut out by a Selmer module and saturation of θ_S

`EulerSystemsAndKolyvaginSystems:ES.1/selmer-field-saturation` — theorem.

**Statement.** Fix m ≥ 1 and R free of finite rank over O_λ/λ^m with ρ : Γ_F → GL(R), F_ρ the field fixed by ker ρ and G = Gal(F_ρ/F). Restriction Res_ρ : H¹(F, R) → Hom_G(Γ^{ab}_{F_ρ}, R) gives a pairing [ , ] : H¹(F, R) × Γ^{ab}_{F_ρ} → R. For a finitely generated submodule S ⊆ H¹(F, R), F_S/F_ρ is the finite abelian extension with Gal(F^{ab}_ρ/F_S) = {γ : [s, γ] = 0 ∀ s ∈ S}, and θ_S : Gal(F_S/F_ρ) → Hom_{O_λ}(S, R) is injective and G-equivariant. (a) If Res_ρ is injective and S is free of rank r_S over O_λ/λ^m, the O_λ-span of the image of θ_S contains λ^{𝔣(r_S) d_R} Hom_{O_λ}(S, R), where 𝔣(0) = 𝔣(1) = 1, 𝔣(2) = 4, 𝔣(r + 1) = 2(𝔣(r) + 1) for r ≥ 2. (b) Res_ρ is injective if the image of Γ_F in GL(R̄) contains a nontrivial scalar, or if dim R̄ ≤ min{(ℓ + 1)/2, ℓ − 3}, R̄ is semisimple and Hom_{Γ_F}(End(R̄), R̄) = 0.

**Suggested declarations.** `TauCeti.ErrorTolerant.selmer_field_saturation`.

**Hypotheses.**

- R free over O_λ/λ^m
- for (a): Res_ρ injective

**Construction or proof.**

1. θ_S is injective by definition of F_S; equivariance is the compatibility of the pairing with G.
2. (a) by induction on r_S using both conditions of the reducibility depth; (b) by inflation–restriction: ker Res_ρ = H¹(G, R), which vanishes by the scalar trick or by the cited H¹-vanishing for small faithful semisimple modules.

**Acceptance checks.**

- With d_R = 0 and r_S = 1 the image of θ_S spans Hom(S, R): the clean Chebotarev input of Mazur–Rubin's Proposition 3.6.1.
- (H.3) of Mazur–Rubin 2004 is the statement that Res is injective for the field ℚ(T, μ_{p^∞}).

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth`, `ArithmeticGaloisDuality:R02.2/compact-five-term`.

**Sources.**

- ltxzz, Lemma 2.3.4, arXiv v3 p. 15: The saturation statement.
- ltxzz, Lemma 2.3.5, arXiv v3 pp. 15–16: The two criteria for injectivity of restriction.
- ltxzz, Lemma 2.3.5, published pp.127–128: Published-version collation of the stated result, expressed here in our own words.

### γ-associated places and (S, γ)-abundant tuples

`EulerSystemsAndKolyvaginSystems:ES.1/abundant-tuples` — definition.

**Statement.** Setting of Liu–Tian–Xiao–Zhang–Zhu §2.6: F/F⁺ of degree ≤ 2, R a polarised lattice with reductions ρ̄^{(m)} and their extensions ρ̄₊^{(m)} to Γ_{F⁺}, fields F ⊆ F^{(m)} ⊆ F₊^{(m)}, an element γ in the image of ρ̄₊^{(m)} lying in the nontrivial coset, h_γ the first component of γ^{[F:F⁺]}, and S a finitely generated submodule of the Selmer module in H¹(F, R̄^{(m)}). A place w₊ of F₊^{(m)} is γ-associated if it is not above ∞ or ℓ, is unramified over F⁺, its place of F^{(m)} is unramified in F_S, and its Frobenius in Gal(F₊^{(m)}/F⁺) is γ. G_{S,γ} ⊆ Gal(F_S/F^{(m)}) is the set of Frobenius elements Ψ_w of γ-associated places. Corrected Lemma 2.6.4: if the order of γ is prime to ℓ then G_{S,γ} ⊆ θ_S^{-1} Hom_{O_λ}(S, (R̄^{(m)})^{h_γ}), with equality when [F : F⁺] = 1; in general G_{S,γ} = q(N^α) for N the Galois group of the normal closure over F₊^{(m)}, α conjugation by a prime-to-ℓ lift of γ and q restriction to F_S. If S is free of rank r_S over O_λ/λ^{m−m₀}, an r_S-tuple (Ψ₁, …, Ψ_{r_S}) ∈ G_{S,γ}^{r_S} is (S, γ)-abundant if the image of S → ((R̄^{(m)})^{h_γ})^{⊕ r_S}, s ↦ (θ_S(Ψ_i)(s))_i, contains λ^{m₀ + 𝔣(r_S) d_R}((R̄^{(m)})^{h_γ})^{⊕ r_S}.

**Suggested declarations.** `TauCeti.ErrorTolerant.gammaAssociated`, `TauCeti.ErrorTolerant.frobeniusSet`, `TauCeti.ErrorTolerant.frobeniusSet_subset_fixed`, `TauCeti.ErrorTolerant.frobeniusSet_eq_image`, `TauCeti.ErrorTolerant.IsAbundant`, `TauCeti.ErrorTolerant.exists_isAbundant`.

**Hypotheses.**

- the setting of §2.6 of the source
- order of γ prime to ℓ

**Construction or proof.**

1. Frobenius elements of γ-associated places land in the h_γ-fixed part because Ψ_w is fixed by conjugation by the Frobenius of w₊ raised to [F : F⁺].
2. The exact image q(N^α) is computed by Chebotarev in the normal closure of F_S F₊^{(m)} over F⁺; the printed equality fails when [F : F⁺] = 2 and q(N^α) is a proper subgroup (PAPER-LIU-ETAL-22/E1 in the register of source mistakes).
3. The abundance loss uses the reducibility depth d_R, not the lattice rank. The published Lemma 2.3.4 gives the power λ^{𝔣(r_S)d_R}; Definition 2.6.5 adds m₀. This notation is also used in the diagonal-localisation bound.

**Uses.**

- Liu–Tian–Xiao–Zhang–Zhu, Proposition 2.6.7 and §8: abundant tuples give primes at which a basis of S localises diagonally with bounded loss.
- ES.4/abundant-localization: the bounded-error localisation statement used in descent.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.ErrorTolerant.gammaAssociated` | structure | The four conditions for a place of F₊^{(m)} to be γ-associated. |
| `TauCeti.ErrorTolerant.frobeniusSet` | data | G_{S,γ} ⊆ Gal(F_S/F^{(m)}). |
| `TauCeti.ErrorTolerant.frobeniusSet_subset_fixed` | characterisation | θ_S(G_{S,γ}) ⊆ Hom_{O_λ}(S, (R̄^{(m)})^{h_γ}), for γ of order prime to ℓ. |
| `TauCeti.ErrorTolerant.frobeniusSet_eq_image` | characterisation | G_{S,γ} = q(N^α); equality with the full preimage holds iff q : N^α → Gal(F_S/F^{(m)})^{h_γ} is surjective, in particular when [F : F⁺] = 1. |
| `TauCeti.ErrorTolerant.IsAbundant` | structure | The predicate on r_S-tuples of G_{S,γ}. |
| `TauCeti.ErrorTolerant.exists_isAbundant` | other | If Res is injective, R_ℚ is absolutely irreducible, (R̄^{(m)})^{h_γ} is free of rank one and q : N^α → K^{h} is surjective, an abundant r_S-tuple exists (corrected Proposition 2.6.6). |

**Unit tests.**

- `frobeniusSet_proper` (non-example): A Selmer Galois element outside q(N^α) is not realized by a γ-associated prime.
- `frobeniusSet_fixed_evaluation` (compatibility): Every realized Frobenius evaluation is fixed by h_γ.
- `isAbundant_zero_loss` (characterisation): With m₀=d=0, abundance is surjectivity onto the fixed target, with every tuple entry realized by a γ-associated prime.

**Acceptance checks.**

- For [F : F⁺] = 1 the printed Lemma 2.6.4 holds as stated.
- Abundance is a property of actual Frobenius elements, not of arbitrary elements of Gal(F_S/F^{(m)}).
- Additional arithmetic check: If F = F⁺ then G_{S,γ} = θ_S^{-1} Hom(S, (R̄^{(m)})^{h_γ}) with h_γ = γ: the printed lemma.
- Additional arithmetic check: For r_S = 1, d_R = 0, m₀ = 0: Ψ is abundant iff θ_S(Ψ) : S → (R̄^{(m)})^{h_γ} is surjective.
- Additional arithmetic check: If (Ψ_i) is abundant for S free over O_λ/λ^{m−m₀}, then it is abundant for λS over O_λ/λ^{m−m₀−1} with m₀ replaced by m₀ + 1.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.1/selmer-field-saturation`, `EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Sources.**

- ltxzz, Definition 2.6.5, arXiv v3 p. 20: Definition of abundant tuples.
- ltxzz, Lemma 2.6.4, arXiv v3 p. 19: The printed lemma, used here in its corrected form.
- ltxzz, Lemma 2.6.4 and Definition 2.6.5, published pp.133–135: Published-version collation of the stated result, expressed here in our own words.

## ES.2. Euler systems and norm relations

**Planets:** Euler polynomial; Euler system; Universal Euler system.

### Euler polynomials and their conventions

`EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial` — definition.

**Statement.** Let T be a free module of finite rank over O (the ring of integers of a finite extension Φ of ℚ_p, or a coefficient order), with G_K-action unramified at a prime q ∤ p, Fr_q an arithmetic Frobenius, and T^* = Hom_O(T, O(1)). Rubin's Euler polynomial is P(Fr_q^{-1} | T^*; x) = det(1 − Fr_q^{-1}x | T^*) ∈ O[x]; it equals det(1 − N(q)^{-1}Fr_q x | T). Mazur–Rubin use P_q(x) = det(1 − Fr_q x | T). Burns–Sakamoto–Sano use P_q(x) = det(1 − Fr_q^{-1}x | T^*(1)) with T^* = Hom_R(T, R), which is Rubin's polynomial. The operators entering norm relations are obtained by substituting x = Fr_q^{-1} (acting on cohomology through Gal(F/K)): P(Fr_q^{-1} | T^*; Fr_q^{-1}) for Rubin and P_q(Fr_q^{-1}) for Mazur–Rubin. The coefficients satisfy a_i^{Rubin} = N(q)^{-i} a_i^{MR}, so the two polynomials are congruent modulo N(q) − 1, hence modulo M whenever M | [K(q) : K(1)].

**Suggested declarations.** `TauCeti.EulerSystems.eulerPoly`, `TauCeti.EulerSystems.eulerPoly_eq_det_twist`, `TauCeti.EulerSystems.eulerPolyMR`, `TauCeti.EulerSystems.eulerPoly_coeff`, `TauCeti.EulerSystems.eulerPoly_congr`, `TauCeti.EulerSystems.eulerPoly_aeval_annihilates`, `TauCeti.EulerSystems.eulerPoly_twist`.

**Hypotheses.**

- T unramified at q, q ∤ p
- Fr_q arithmetic Frobenius; the dual is the Tate dual Hom(T, O(1))

**Construction or proof.**

1. det(1 − Fr_q^{-1}x | Hom(T, O(1))) = det(1 − N(q)^{-1}Fr_q x | T): Fr_q^{-1} acts on Hom(T, O(1)) as the transpose of Fr_q on T times ε_cyc(Fr_q)^{-1} = N(q)^{-1}.
2. P(Fr_q^{-1} | T^*; N(q)Fr_q^{-1}) annihilates T by Cayley–Hamilton; if M | [K(q) : K(1)] then P(Fr_q^{-1} | T^*; x) ≡ det(1 − Fr_q x | W_M) modulo M and P(Fr_q^{-1} | T^*; Fr_q^{-1}) annihilates W_M (Rubin, Lemma IV.1.2).

**Uses.**

- Rubin, Definition II.1.1: the factor in the norm relation for a prime ramifying in F′/F.
- Mazur–Rubin 2004, Definitions 2.2.1 and 3.2.2: P_ℓ(1) enters I_ℓ and P_ℓ(Fr_ℓ^{-1}) the norm relation.
- EulerSystemsCyclotomicMainConjecture L0; KatoEulerSystems L2: the adapters identify their Euler factors with this polynomial.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystems.eulerPoly` | data | P(Fr_q^{-1} \| T^*; x) = det(1 − Fr_q^{-1}·x \| T^*) ∈ O[X], for T unramified at q. |
| `TauCeti.EulerSystems.eulerPoly_eq_det_twist` | characterisation | P(Fr_q^{-1} \| T^*; x) = det(1 − N(q)^{-1}·Fr_q·x \| T). |
| `TauCeti.EulerSystems.eulerPolyMR` | data | P_q(x) = det(1 − Fr_q·x \| T), the Mazur–Rubin convention. |
| `TauCeti.EulerSystems.eulerPoly_coeff` | relation | coeff_i(eulerPoly) · N(q)^i = coeff_i(eulerPolyMR). |
| `TauCeti.EulerSystems.eulerPoly_congr` | relation | eulerPoly ≡ eulerPolyMR modulo (N(q) − 1)·O[X]. |
| `TauCeti.EulerSystems.eulerPoly_aeval_annihilates` | characterisation | P(Fr_q^{-1} \| T^*; N(q)Fr_q^{-1}) = 0 on T, and P(Fr_q^{-1} \| T^*; Fr_q^{-1}) = 0 on W_M when M \| [K(q) : K(1)]. |
| `TauCeti.EulerSystems.eulerPoly_twist` | compatibility | For a character χ of finite order unramified at q: P(Fr_q^{-1} \| (T ⊗ χ)^*; x) = P(Fr_q^{-1} \| T^*; χ(Fr_q)x). |

**Unit tests.**

- `eulerPoly_zp_one` (computation): For rank-one Frobenius multiplication by N(q), the Rubin polynomial is 1−X and the MR polynomial is 1−N(q)X.
- `eulerPoly_elliptic` (compatibility): An MR polynomial 1−aX+N(q)X² becomes 1−aN(q)⁻¹X+N(q)⁻¹X² in the Rubin normalization.
- `eulerPoly_rank_zero` (degenerate): For the zero representation both Euler polynomials equal 1.

**Acceptance checks.**

- For T = ℤ_p(1): Rubin's polynomial is 1 − x (T^* = ℤ_p) and Mazur–Rubin's is 1 − N(q)x; they agree modulo N(q) − 1.
- The polynomials differ as elements of O[x]; systems for the two conventions are related by an explicit map, not equal (euler-factor-change).
- Additional arithmetic check: For T = ℤ_p(1) and N(q) ≠ 1 the two polynomials are different elements of O[X], although congruent modulo N(q) − 1.

**Prerequisites.** `mathlib:LinearMap.charpoly`, `mathlib:LinearMap.aeval_self_charpoly`.

**Sources.**

- rubin-es, Chapter IV, Lemma 1.2 and its proof, p. 57: The identity between the two determinants and the annihilation statements.
- mr-ks, Remark 3.2.3, p. 23: The two conventions differ and are equivalent.
- bss2, §6.1, pp. 36–37: The convention of Burns–Sakamoto–Sano, P_q(x) = det(1 − Fr_q^{-1}x | T^*(1)).

### The module of Euler systems

`EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module` — definition.

**Statement.** Let 𝒦/K be an abelian extension and N an ideal of K divisible by p and by all primes where T is ramified. Write K ⊂_f F for finite subextensions F of 𝒦/K, and for F ⊆ F′ let Σ(F′/F) be the set of primes of K not dividing N that ramify in F′ but not in F. An Euler system for (T, 𝒦, N) is a family c = (c_F)_F with c_F ∈ H¹(F, T) such that for all K ⊂_f F ⊂_f F′ ⊆ 𝒦, Cor_{F′/F}(c_{F′}) = (∏_{q ∈ Σ(F′/F)} P(Fr_q^{-1} | T^*; Fr_q^{-1})) c_F. The set ES(T, 𝒦, N) of such families is the O[[Gal(𝒦/K)]]-submodule of ∏_F H¹(F, T) cut out by these equations (an equaliser). (𝒦, N) is admissible in Rubin's sense if (i) 𝒦 ⊇ K(q) for every q ∤ N and (ii) 𝒦 contains a ℤ_p^d-extension K_∞ of K, d ≥ 1, in which no finite prime splits completely. The definition itself does not require (i)–(ii); the theorems do. The zero family is an Euler system.

**Suggested declarations.** `TauCeti.EulerSystems.EulerSystem`, `TauCeti.EulerSystems.EulerSystem.eval`, `TauCeti.EulerSystems.EulerSystem.cor_eval`, `TauCeti.EulerSystems.EulerSystem.cor_eval_of_ramified_eq`, `TauCeti.EulerSystems.EulerSystem.ext`, `TauCeti.EulerSystems.EulerSystem.lift`, `TauCeti.EulerSystems.EulerSystem.restrictTower`, `TauCeti.EulerSystems.IsAdmissibleTower`.

**Hypotheses.**

- 𝒦/K abelian
- p | N and N divisible by the primes where T is ramified

**Construction or proof.**

1. Cor_{F′/F} is corestriction on continuous cohomology (Tau Ceti's explicitCor1 for the open subgroup G_{F′} ⊆ G_F), and Fr_q acts on H¹(F, T) through Gal(F/K), in which q is unramified.
2. The relations are O-linear in c and compatible with the Gal(𝒦/K)-action (σc)_F = σ(c_F), giving the module structure.
3. Since p | N, no Euler factors at primes above p occur and, for F ⊆ F′ ⊆ F K_∞, Cor_{F′/F}(c_{F′}) = c_F: the classes are universal norms in the K_∞-direction. The tower relation and the auxiliary-prime relation are the two cases Σ(F′/F) = ∅ and Σ(F′/F) = {q}.

**Uses.**

- Rubin, Theorems II.2.2, II.2.3, II.2.10: an Euler system for an admissible tower bounds the Selmer group of W^*.
- Mazur–Rubin 2004, Theorem 3.2.4: the source of the map to Kolyvagin systems.
- EulerSystemsCyclotomicMainConjecture L0, KatoEulerSystems L2, HeegnerPointEulerSystems HE.4: the cyclotomic-unit, Kato and Heegner classes are elements of this module after their normalisation maps.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystems.EulerSystem` | structure | The submodule ES(T, 𝒦, N) ⊆ ∏_{K ⊂_f F ⊆ 𝒦} H¹(F, T) of families satisfying the corestriction relations. |
| `TauCeti.EulerSystems.EulerSystem.eval` | projection | c ↦ c_F, an O-linear map ES(T, 𝒦, N) → H¹(F, T). |
| `TauCeti.EulerSystems.EulerSystem.cor_eval` | relation | Cor_{F′/F}(c_{F′}) = (∏_{q ∈ Σ(F′/F)} P(Fr_q^{-1} \| T^*; Fr_q^{-1}))·c_F. |
| `TauCeti.EulerSystems.EulerSystem.cor_eval_of_ramified_eq` | simp | If Σ(F′/F) = ∅ then Cor_{F′/F}(c_{F′}) = c_F. |
| `TauCeti.EulerSystems.EulerSystem.ext` | extensionality | Two Euler systems with the same classes c_F for all F are equal. |
| `TauCeti.EulerSystems.EulerSystem.lift` | universal-property | A family of O-linear maps f_F : X → H¹(F, T) satisfying the relations is the same as an O-linear map X → ES(T, 𝒦, N); it is determined by the f_F. |
| `TauCeti.EulerSystems.EulerSystem.restrictTower` | functoriality | For 𝒦′ ⊆ 𝒦, restriction of the index family is an O-linear map ES(T, 𝒦, N) → ES(T, 𝒦′, N); for an ideal N′ prime to p and 𝒦₀ the maximal subextension of 𝒦 unramified at the primes dividing N′, it lands in ES(T, 𝒦₀, NN′). |
| `TauCeti.EulerSystems.IsAdmissibleTower` | structure | Rubin's conditions (i) and (ii) on (𝒦, N, K_∞). |

**Unit tests.**

- `EulerSystem.zero_mem` (degenerate): The zero family is an Euler system.
- `EulerSystem.universal_norm` (characterisation): When no new ramified primes occur, each component is in the image of corestriction from the larger layer.
- `EulerSystem.not_restriction` (non-example): On such a layer, a restriction-compatible family fails the norm relation when ([F′:F]−1)c_F is nonzero.

**Acceptance checks.**

- ES is the equaliser of two maps ∏_F H¹(F, T) ⇉ ∏_{F ⊆ F′} H¹(F, T), so a morphism into ES is a compatible family of morphisms.
- The norm relation uses corestriction: replacing it by restriction or by equality c_{F′} = c_F gives a different (wrong) object.
- Additional arithmetic check: For K = ℚ, T = ℤ_p(1) and the Kummer images of the p-extended cyclotomic units c̃_m, the relation for ℚ(μ_m) ⊆ ℚ(μ_{mℓ}), ℓ ∤ mp, is N(c̃_{mℓ}) = c̃_m^{1 − Fr_ℓ^{-1}}: the factor is P(Fr_ℓ^{-1} | ℤ_p; Fr_ℓ^{-1}) = 1 − Fr_ℓ^{-1}.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`, `EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower`, `tauceti:TauCeti.ContCohomology.explicitCor1`, `tauceti:TauCeti.ContCohomology.explicitCor1_comp_res1`, `ArithmeticGaloisDuality:R02.1/carrier-comparison`.

**Sources.**

- rubin-es, Chapter II, Definition 1.1, pp. 21–22: The definition.
- rubin-es, Chapter II, Remark 2.8, p. 25: The zero system is an Euler system.

### Euler-system classes are unramified away from p

`EulerSystemsAndKolyvaginSystems:ES.2/classes-unramified-outside-p` — theorem.

**Statement.** Let c be an Euler system for an admissible tower (so 𝒦 ⊇ K_∞ with no finite prime splitting completely). Then for every F and every place w ∤ p of F, (c_F)_w ∈ H¹_ur(F_w, T); that is, c_F ∈ S^{Σ_p}(F, T), and c_F ∈ H¹_{F_can}(F, T). Hence c_F lies in H¹(O_{F,S(F)}, T) for S(F) = S ∪ S_ram(F/K), the cohomology of the maximal extension unramified outside S(F).

**Suggested declarations.** `TauCeti.EulerSystems.classes_unramified_outside_p`.

**Hypotheses.**

- admissible tower
- T finitely generated over ℤ_p

**Construction or proof.**

1. c_F is a universal norm from F K_∞, in which the decomposition group of w is infinite; apply SelmerIwasawaCohomology L3/universal-norms-unramified(ii).
2. The comparison H¹_ur(F_w, T) ⊆ ker(H¹(F_w, T) → H¹(F_w^{ur}, V)) gives the statement for F_can at ramified primes.

**Acceptance checks.**

- Without condition (ii) the statement fails: c_K is then unconstrained (rigidity-variants).

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`, `SelmerIwasawaCohomology:L3/universal-norms-unramified`, `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`.

**Sources.**

- rubin-es, Chapter II, before Theorem 2.10, p. 25: The classes are unramified outside p.
- bss2, Lemma 6.6, p. 38: The same statement for the canonical Selmer structure.

### The conductor-indexed presentations

`EulerSystemsAndKolyvaginSystems:ES.2/conductor-presentation` — theorem.

**Statement.** (a) For an admissible (𝒦, N), an Euler system is equivalent to a family c̃_m ∈ H¹(K[m] ∩ 𝒦, T) indexed by all generalised ideals m (K[m] the ray class field), with Cor_{K[mq]∩𝒦/K[m]∩𝒦}(c̃_{mq}) = P(Fr_q^{-1} | T^*; Fr_q^{-1}) c̃_m if q ∤ mN and = c̃_m if q | mN: put c_F = Cor_{K[m]∩𝒦/F}(c̃_m) for m the conductor of F/K, and conversely c̃_m = ∏_q P(Fr_q^{-1} | T^*; Fr_q^{-1}) c_{K[m]∩𝒦}, the product over primes dividing m, not dividing N, unramified in (K[m] ∩ 𝒦)/K. (b) For 𝒦_min = K_∞·∏_{q ∤ N} K(q), an Euler system is determined by, and equivalent to, a family {c_{F(r)}} over squarefree r prime to N and K ⊂_f F ⊆ K_∞ with Cor_{F(rq)/F(r)}(c_{F(rq)}) = P(Fr_q^{-1} | T^*; Fr_q^{-1}) c_{F(r)} when K(q) ≠ K(1), and Cor_{F′(r)/F(r)}(c_{F′(r)}) = c_{F(r)}; then c_L = Cor_{F(r)/L}(c_{F(r)}) for r, F minimal with L ⊆ F(r).

**Suggested declarations.** `TauCeti.EulerSystems.conductorPresentation`, `TauCeti.EulerSystems.conductorPresentation_eval`.

**Hypotheses.**

- admissible (𝒦, N)

**Construction or proof.**

1. Check the relations in both directions using transitivity of corestriction and that Fr_q acts trivially through fields in which q splits.
2. (b): every finite subextension of 𝒦_min lies in some F(r); the family on the cofinal set {F(r)} determines the rest.

**Acceptance checks.**

- The archimedean part of a generalised ideal is allowed in (a).
- The equivalence is an isomorphism of modules ES(T, 𝒦_min, N) ≅ {families (c_{F(r)})}.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`, `EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

**Sources.**

- rubin-es, Chapter II, Remarks 1.3 and 1.4, pp. 22–23: Both presentations.

### Twisting Euler systems by characters of finite order

`EulerSystemsAndKolyvaginSystems:ES.2/twisting` — construction.

**Statement.** Let c be an Euler system for (T, 𝒦, N) and χ : Gal(𝒦/K) → O^× a character of finite order with conductor 𝔣 and field L = 𝒦^{ker χ}; let O_χ be free of rank one with generator ξ_χ and T ⊗ χ = T ⊗ O_χ. Define c^χ_F ∈ H¹(F, T ⊗ χ) as the image of c_{FL} under H¹(FL, T) → H¹(FL, T) ⊗ O_χ ≅ H¹(FL, T ⊗ χ) → H¹(F, T ⊗ χ), the last map being corestriction. Then {c^χ_F} is an Euler system for (T ⊗ χ, 𝒦, 𝔣N). If L ⊆ L′ ⊆ 𝒦 have the same conductor, the image of c^χ_F under Res then ⊗ξ_χ^{-1} in H¹(FL′, T) is Σ_{δ ∈ Gal(FL′/F)} χ(δ)δ c_{FL′}. Coefficient extension along O → O′ finite flat acts on families termwise when H¹(F, T) ⊗ O′ = H¹(F, T ⊗ O′), and is used to adjoin the values of χ.

**Suggested declarations.** `TauCeti.EulerSystems.EulerSystem.twist`, `TauCeti.EulerSystems.EulerSystem.twist_eval`, `TauCeti.EulerSystems.EulerSystem.twist_one`, `TauCeti.EulerSystems.EulerSystem.res_twist`, `TauCeti.EulerSystems.EulerSystem.baseChange`.

**Hypotheses.**

- χ of finite order on Gal(𝒦/K)
- values of χ in O^× (after enlarging O)

**Construction or proof.**

1. Compute Cor_{F′/F}(c^χ_{F′}) = Cor_{FL/F}((∏ P(Fr_q^{-1} | T^*; Fr_q^{-1}) c_{FL}) ⊗ ξ_χ); moving ξ_χ past Fr_q^{-1} multiplies by χ(Fr_q), and P(Fr_q^{-1} | T^*; χ(Fr_q)x) = P(Fr_q^{-1} | (T ⊗ χ)^*; x).
2. Σ(F′L/FL) computed with N equals Σ(F′/F) computed with 𝔣N.
3. The restriction formula follows from Res ∘ Cor = Σ δ and Cor_{FL′/FL} c_{FL′} = c_{FL}.

**Uses.**

- Rubin, Chapter III and Mazur–Rubin 2004, Remark 3.2.5: an Euler system for T gives Kolyvagin systems for all twists T ⊗ ρ.
- EulerSystemsCyclotomicMainConjecture L0: the χ-twisted cyclotomic class is c^χ_ℚ with the formula of Lemma 4.3.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystems.EulerSystem.twist` | constructor | c ↦ c^χ : ES(T, 𝒦, N) → ES(T ⊗ χ, 𝒦, 𝔣N), O-linear after fixing ξ_χ. |
| `TauCeti.EulerSystems.EulerSystem.twist_eval` | simp | (c^χ)_F = Cor_{FL/F}(c_{FL} ⊗ ξ_χ). |
| `TauCeti.EulerSystems.EulerSystem.twist_one` | simp | c^1 = c. |
| `TauCeti.EulerSystems.EulerSystem.res_twist` | relation | Res_{FL′/F}(c^χ_F) ⊗ ξ_χ^{-1} = Σ_{δ ∈ Gal(FL′/F)} χ(δ)·δ·c_{FL′}. |
| `TauCeti.EulerSystems.EulerSystem.baseChange` | functoriality | For O → O′ finite flat, ES(T, 𝒦, N) ⊗_O O′ → ES(T ⊗ O′, 𝒦, N) is defined termwise and is injective. |

**Unit tests.**

- `EulerSystem.twist_zero` (degenerate): Twisting takes the zero Euler system to zero.
- `EulerSystem.twist_conductor` (non-example): Every prime ramified in the character field enters the twisted bad support.
- `EulerSystem.twist_inverse_norm` (compatibility): If the character compositum introduces no new Euler factors, cor(c_{FLχ})=c_F; in general the inverse-twist norm is the Euler-factor product, as stated by the API.

**Acceptance checks.**

- Twisting by the trivial character is the identity.
- Twisting is O-linear after choosing compatible generators. For finite-order χ,ψ, the iterated twist is obtained by corestriction from FL_χL_ψ, while the direct χψ-twist uses FL_{χψ}. Comparing these by the Euler relation introduces the Euler factors for primes ramifying in the former and not the latter outside N. In particular (c^χ)^{χ^{-1}}_F = Cor_{FL_χ/F}(c_{FL_χ}), after cancelling generators; this equals the applicable Euler-factor product times c_F and need not equal c_F. Both families are compared in the common conductor f_χ f_ψ N.
- Additional arithmetic check: For χ = 1, L = K and c^χ_F = c_F.
- Additional arithmetic check: For K = ℚ, T = ℤ_p(1), χ of conductor f: the image of c^χ_ℚ in H¹(L, T) is Σ_{δ ∈ Gal(L/ℚ)} χ(δ)δc_L, the χ^{-1}-component of the Kummer class of the cyclotomic unit of L.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`, `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`.

**Sources.**

- rubin-es, Chapter II, Proposition 4.2, p. 30: The twisted family is an Euler system.
- rubin-es, Chapter II, Lemma 4.3, p. 31: The restriction formula.

### Changing the Euler factors

`EulerSystemsAndKolyvaginSystems:ES.2/euler-factor-change` — theorem.

**Statement.** (a) Let f_q, g_q ∈ O[x] (q ∤ N) with f_q ≡ g_q modulo N(q) − 1, and c̃ a family with Cor_{F′/F}(c̃_{F′}) = (∏_{q ∈ Σ(F′/F)} f_q(Fr_q^{-1})) c̃_F. Then there is a family c with the same relations for g_q, with c_F = c̃_F for every finite abelian F/K unramified outside N, and with Σ_γ χ(γ)γc_F = Σ_γ χ(γ)γc̃_F whenever χ is a character of Gal(F/K) of conductor 𝔣 and every prime ramified in F/K divides N𝔣; the construction is an explicit O-linear map c̃ ↦ c. (b) Units u_q ∈ O^× and a shift x ↦ x^d of the variable can be absorbed similarly. (c) In particular a family satisfying the relations with P(Fr_q^{-1} | T; Fr_q) gives an Euler system in the sense of Definition II.1.1, and the modules of Euler systems for the conventions of Rubin and of Mazur–Rubin are isomorphic. The change of factors is a map of systems, not an equality.

**Suggested declarations.** `TauCeti.EulerSystems.changeEulerFactors`, `TauCeti.EulerSystems.changeEulerFactors_unramified`.

**Hypotheses.**

- f_q ≡ g_q (mod N(q) − 1)

**Construction or proof.**

1. Since [K(q) : K(1)] divides N(q) − 1, (f_q − g_q)(Fr_q^{-1}) is divisible by the degree of the q-part; correct c̃_F by an explicit alternating sum over the primes ramified in F (Rubin, Lemma IX.6.1).
2. The Mazur–Rubin and Rubin polynomials are congruent modulo N(q) − 1 by euler-polynomial.

**Acceptance checks.**

- Rubin's Example IX.6.2: K = ℚ, f_q = 1 − x and g_q = 1 − q^{-1}x.
- The map is the identity on classes over fields unramified outside N.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`, `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`.

**Sources.**

- rubin-es, Chapter IX, Lemma 6.1, p. 141: Changing congruent Euler factors.
- mr-ks, Remark 3.2.3, p. 23: The two conventions give isomorphic modules.

### The universal Euler system

`EulerSystemsAndKolyvaginSystems:ES.2/universal-euler-system` — construction.

**Statement.** Fix N and K_∞/K as in an admissible tower, R(N) the squarefree products of primes not dividing N. For r ∈ R(N) and K ⊂_f F ⊆ K_∞, X_{F(r)} = Y_{F(r)}/Z_{F(r)}, where Y_{F(r)} is the free O[Gal(F(r)/K)]-module on symbols x_{F(s)}, s | r, and Z_{F(r)} is generated by σx_{F(s)} − x_{F(s)} (σ ∈ Gal(F(r)/F(s))), N_q x_{F(qs)} − P(Fr_q^{-1} | T^*; Fr_q^{-1})x_{F(s)} (qs | r, K(q) ≠ K(1)) and x_{F(qs)} − x_{F(s)} (qs | r, K(q) = K(1)). The universal Euler system is X = colim_{F,r} X_{F(r)}; X_{∞,r} = lim_F X_{F(r)}. Sending x_{F(r)} ↦ c_{F(r)} gives G_K-equivariant maps X_{F(r)} → H¹(F(r), T) for every Euler system c. Structure: X_{F(r)} is a finitely generated free O-module, free over O[Gal(F(r)/K(r))] of rank [K(r) : K], X_{F(r)} ⊗ Φ is free of rank one over Φ[Gal(F(r)/K)], X_{F′(r)} ⊗ O[Gal(F(r)/K)] ≅ X_{F(r)}, X_{F(s)} ≅ X_{F′(r)}^{Gal(F′(r)/F(s))}; X_{∞,r} is free of rank [K(r) : K] over O[[Gal(K_∞(r)/K(r))]]; and Ext¹_{(O/M)[G]}(X_{F(r)}/M, (O/M)[G]^k) = 0 for G = Gal(F(r)/K), with the analogue for X_{∞,r}.

**Suggested declarations.** `TauCeti.EulerSystems.Universal.X`, `TauCeti.EulerSystems.Universal.gen`, `TauCeti.EulerSystems.Universal.norm_gen`, `TauCeti.EulerSystems.Universal.lift`, `TauCeti.EulerSystems.Universal.free`, `TauCeti.EulerSystems.Universal.ext_eq_zero`.

**Hypotheses.**

- N, K_∞ as in an admissible tower

**Construction or proof.**

1. The relations of X_{F(r)} are exactly the Euler system relations in the presentation of conductor-presentation(b); this gives the universal property (Rubin, Lemma IV.2.3).
2. Freeness: an explicit O-basis of X_{F(r)} built from coset representatives and Γ_q − {1} (Proposition IV.3.1).
3. Ext vanishing: for B free over R[[H]] with H of finite index in G, Ext¹_{R[[G]]}(B, R[[G]]) = 0 (Lemma IV.3.3).

**Uses.**

- Rubin, Lemma IV.4.2: D_r x_{F(r)} is Gal(F(r)/F)-invariant modulo M, proved in X_{F(r)}.
- Rubin, Proposition IV.4.8: the Ext vanishing lifts an Euler system to maps X_{F(r)} → 𝕎_M/W_M, the key step in defining derivative classes without assuming W^{G_{F(r)}} = 0.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystems.Universal.X` | constructor | X_{F(r)} as a quotient of a free O[Gal(F(r)/K)]-module by the three families of relations. |
| `TauCeti.EulerSystems.Universal.gen` | data | The class x_{F(s)} ∈ X_{F(r)} for s \| r. |
| `TauCeti.EulerSystems.Universal.norm_gen` | relation | N_q·x_{F(qs)} = P(Fr_q^{-1} \| T^*; Fr_q^{-1})·x_{F(s)} when K(q) ≠ K(1), and x_{F(qs)} = x_{F(s)} otherwise. |
| `TauCeti.EulerSystems.Universal.lift` | universal-property | For an Euler system c, the unique O[G_K]-linear map X_{F(r)} → H¹(F(r), T) with x_{F(s)} ↦ res(c_{F(s)}). |
| `TauCeti.EulerSystems.Universal.free` | instance | X_{F(r)} is free of finite rank over O and free of rank [K(r) : K] over O[Gal(F(r)/K(r))]. |
| `TauCeti.EulerSystems.Universal.ext_eq_zero` | other | Ext¹_{(O/M)[G]}(X_{F(r)}/M X_{F(r)}, (O/M)[G]^k) = 0 for G = Gal(F(r)/K). |

**Unit tests.**

- `Universal.X_one` (degenerate): When F=K and K(1)=K, the conductor-one universal module is R.
- `Universal.rank_one_prime` (computation): With F=K and K(1)=K, the one-prime universal module has R-rank |Γ_q| under admissibility.
- `Universal.zero_lift` (characterisation): The universal lift of the zero Euler system takes every distinguished generator to zero.

**Acceptance checks.**

- For r = 1 and F = K with K(1) = K: X_K = O·x_K.
- Hom_{G_K}(X_{∞,R}, colim_r lim_F H¹(F(r), T)) recovers Euler systems for 𝒦_min (Remark IV.2.4).
- Additional arithmetic check: X_{F(r)} is not free over O[Gal(F(r)/K)] in general: only X_{F(r)} ⊗ Φ is free of rank one over Φ[Gal(F(r)/K)].

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.2/conductor-presentation`, `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`, `mathlib:MonoidAlgebra`.

**Sources.**

- rubin-es, Chapter IV, Definitions 2.1–2.2, p. 58: Definition of X_{F(r)} and X.
- rubin-es, Chapter IV, Proposition 3.1, p. 59: Freeness of the universal Euler system.
- rubin-es, Chapter IV, Proposition 3.4, p. 61: The Ext¹ vanishing.

### Variants: rigidity conditions, finite depth and anticyclotomic systems

`EulerSystemsAndKolyvaginSystems:ES.2/rigidity-variants` — definition.

**Statement.** (a) Rigidity. Without condition (ii) of an admissible tower the class c_K can be unconstrained: if K has class number one, P(Fr_q^{-1} | T^*; 1) = 0 for every q ∤ N and 𝒦 is the maximal abelian extension unramified at every prime dividing N, the only relations involving c_K are Cor_{F/K}c_F = ∏_{q ∈ Σ(F/K)} P(Fr_q^{-1} | T^*; 1)c_K = 0, and the family c_F = 0 (F ≠ K), c_K arbitrary is an Euler system. Condition (ii) is therefore replaced by (ii)′: at least one of (a) 𝒦 contains a ℤ_p^d-extension of K in which no finite prime splits completely; (b) c_{K(r)} ∈ S^{Σ_p}(K(r), T) for every r, and there is γ ∈ G_K with γ = 1 on K(1)(μ_{p^∞}, (O_K^×)^{1/p^∞}) and γ − 1 injective on T; (c) c_{K(r)} ∈ S^{Σ_p}(K(r), T) for every r, Fr_q^n − 1 is injective on T for every prime q ∤ N and every power n of p, and the family {c_{K(r)}} satisfies the congruence of Corollary IV.8.1. Under (ii)′ and T^{G_{K(1)}} = 0, Theorems II.2.2, II.2.3 and II.2.10 hold as stated. (b) Finite depth. For 0 ≠ M ∈ O an Euler system for W_M (of depth M) is a family as in the definition with c_F ∈ H¹(F, W_M). (c) Anticyclotomic. For a character χ of Gal(K′/K) of order d and an abelian extension 𝒦′/K′ on which Gal(K′/K) acts through χ, a χ-anticyclotomic Euler system for (T, 𝒦′, N) is a family c_F ∈ H¹(F, T), K′ ⊂_f F ⊆ 𝒦′, with the corestriction relations for primes q of K and one of the three rigidity conditions adapted to χ. (d) An Euler system is trivial at a finite set Σ of primes not dividing p if c_F ∈ S_Σ^{Σ_p}(F, T) for all F.

**Suggested declarations.** `TauCeti.EulerSystems.IsRigid`, `TauCeti.EulerSystems.FiniteDepthEulerSystem`, `TauCeti.EulerSystems.EulerSystem.toFiniteDepth`, `TauCeti.EulerSystems.AnticyclotomicEulerSystem`, `TauCeti.EulerSystems.AnticyclotomicEulerSystem.of_trivial`, `TauCeti.EulerSystems.EulerSystem.IsTrivialAt`.

**Hypotheses.**

- as in each variant

**Construction or proof.**

1. Each variant is the module cut out by the same corestriction equations in a different product; the predicates (b), (c) are stated with ES.3/derivative-class and ES.3/congruence.
2. For d = 1 a χ-anticyclotomic system is an Euler system; for K = ℚ, d = 2 and χ odd quadratic, K′ is imaginary quadratic and 𝒦′ an anticyclotomic p-extension (the setting of Heegner points).

**Uses.**

- Rubin, Theorems IX.3.3, IX.4.3, IX.5.3: the bounds for each variant, planned in ES.4.
- HeegnerPointEulerSystems HE.4: Heegner points form a χ-anticyclotomic Euler system with rigidity (c).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystems.IsRigid` | structure | Condition (ii)′: one of the alternatives (a), (b), (c). |
| `TauCeti.EulerSystems.FiniteDepthEulerSystem` | structure | Euler systems for W_M. |
| `TauCeti.EulerSystems.EulerSystem.toFiniteDepth` | functoriality | ES(T, 𝒦, N) → ES(W_M, 𝒦, N) by reduction modulo M, compatible in M. |
| `TauCeti.EulerSystems.AnticyclotomicEulerSystem` | structure | χ-anticyclotomic Euler systems for (T, 𝒦′, N). |
| `TauCeti.EulerSystems.AnticyclotomicEulerSystem.of_trivial` | compatibility | For d = 1 (χ trivial) a χ-anticyclotomic Euler system is an Euler system. |
| `TauCeti.EulerSystems.EulerSystem.IsTrivialAt` | structure | c_F ∈ S_Σ^{Σ_p}(F, T) for every F. |

**Unit tests.**

- `IsRigid.of_admissible` (compatibility): An admissible tower supplies the rigidity conditions.
- `not_isRigid_failed_unramified` (non-example): Without an infinite direction, a family failing the ray unramified condition is not rigid.
- `IsRigid.of_injective_direction` (characterisation): The ray unramified condition together with an injective γ−1 direction in H_M gives rigidity.

**Acceptance checks.**

- A system of infinite depth gives one of depth M for every M.
- The counterexample family (c_K arbitrary, others 0) satisfies none of (a), (b), (c) when c_K ∉ S^{Σ_p}.
- Additional arithmetic check: If K has class number one, P(Fr_q^{-1} | T^*; 1) = 0 for all q ∤ N and 𝒦 is the maximal abelian extension of K unramified at every prime dividing N, the family c_K = x, c_F = 0 for F ≠ K is an Euler system for every x ∈ H¹(K, T); for x ∉ S^{Σ_p}(K, T) it satisfies none of (a), (b), (c).
- Additional arithmetic check: For K = ℚ, χ the quadratic character of an imaginary quadratic field K′: d = 2 and the relation at a prime ℓ inert in K′ uses P(Fr_ℓ^{-1} | T^*; Fr_ℓ^{-1}) with Fr_ℓ ∈ G_ℚ, whose square is the Frobenius of the prime of K′ above ℓ.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`, `EulerSystemsAndKolyvaginSystems:ES.2/classes-unramified-outside-p`.

**Sources.**

- rubin-es, Chapter IX §1, p. 133: The failure of rigidity without condition (ii) and the replacement (ii)′.
- rubin-es, Chapter IX, Definition 3.1, p. 136: Finite depth.
- rubin-es, Chapter IX, Definition 4.1, p. 138: Anticyclotomic Euler systems.
- rubin-es, Chapter IX, Definition 5.1, p. 140: Triviality at Σ.

## ES.3. Derivative classes and Kolyvagin systems

**Planets:** Kolyvagin derivative operator; Kolyvagin derivative class; Finite–singular relation for derivative classes; Kolyvagin system; Euler-to-Kolyvagin system map.

### The norm and Kolyvagin derivative operators

`EulerSystemsAndKolyvaginSystems:ES.3/derivative-operators` — definition.

**Statement.** Let Γ be a finite cyclic group of order n with generator σ. In ℤ[Γ] put N_Γ = Σ_{γ ∈ Γ} γ and D_σ = Σ_{i=0}^{n−1} i·σ^i. Then (σ − 1)D_σ = n − N_Γ. For a prime q ∤ p, with Γ_q = Gal(K(q)/K(1)) and the generator σ_q fixed through tame inertia (a generator ξ of lim μ_{p^n} and a prime of K̄ above q), write N_q = N_{Γ_q} and D_q = D_{σ_q}; for squarefree r, N_r = ∏_{q | r} N_q = Σ_{σ ∈ Γ_r} σ and D_r = ∏_{q | r} D_q ∈ ℤ[Γ_r], with N_r = N_sN_{r/s} and D_r = D_sD_{r/s} for s | r. Under the augmentation ε, ε(N_Γ) = n and ε(D_σ) = n(n − 1)/2. For another generator σ^a (a prime to n) and a′a ≡ 1 (mod n), D_{σ^a} − a′D_σ ∈ nℤ[Γ].

**Suggested declarations.** `TauCeti.KolyvaginSystems.normElement`, `TauCeti.KolyvaginSystems.kolyvaginDerivative`, `TauCeti.KolyvaginSystems.sub_one_mul_kolyvaginDerivative`, `TauCeti.KolyvaginSystems.augmentation_kolyvaginDerivative`, `TauCeti.KolyvaginSystems.kolyvaginDerivative_prod`, `TauCeti.KolyvaginSystems.kolyvaginDerivative_generator`, `TauCeti.KolyvaginSystems.normElement_eq_representation_norm`.

**Hypotheses.**

- Γ finite cyclic with a chosen generator

**Construction or proof.**

1. Telescoping: (σ − 1)Σ_{i<n} iσ^i = Σ_{i=1}^{n} (i − 1)σ^i − Σ_{i<n} iσ^i = (n − 1)σ^n − Σ_{i=1}^{n−1} σ^i = n − N_Γ, using σ^n = 1.
2. Products: Γ_r ≅ ∏ Γ_q, and elements of ℤ[Γ_q] for different q commute.
3. Change of generator: D_{σ^a} = Σ_i i·σ^{ai} = Σ_j (a′j mod n)·σ^j, which is congruent to a′·Σ_j j·σ^j modulo n.

**Uses.**

- Rubin, Lemma IV.4.2 and Definition IV.4.10: D_r applied to the Euler system class over F(r) is invariant modulo M, and descends to κ_{F,r,M}.
- Burns–Sakamoto–Sano II, §6.3: the higher-rank derivative uses the same D_n on the induced module.
- HeegnerPointEulerSystems HE.4: Kolyvagin's derivative of Heegner points.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.normElement` | data | N_Γ = Σ_{γ ∈ Γ} γ ∈ ℤ[Γ] for a finite group Γ. |
| `TauCeti.KolyvaginSystems.kolyvaginDerivative` | data | D_σ = Σ_{i < n} i·σ^i ∈ ℤ[Γ] for σ of order n. |
| `TauCeti.KolyvaginSystems.sub_one_mul_kolyvaginDerivative` | relation | (σ − 1)·D_σ = n − N_Γ when σ generates Γ of order n. |
| `TauCeti.KolyvaginSystems.augmentation_kolyvaginDerivative` | simp | ε(D_σ) = n(n − 1)/2 and ε(N_Γ) = n. |
| `TauCeti.KolyvaginSystems.kolyvaginDerivative_prod` | relation | For Γ = Γ₁ × Γ₂ and r = st: D_r = D_s·D_t and N_r = N_s·N_t in ℤ[Γ₁ × Γ₂]. |
| `TauCeti.KolyvaginSystems.kolyvaginDerivative_generator` | compatibility | For a·a′ ≡ 1 (mod n): D_{σ^a} − a′·D_σ ∈ n·ℤ[Γ]. |
| `TauCeti.KolyvaginSystems.normElement_eq_representation_norm` | compatibility | For a representation ρ of Γ, the action of N_Γ is Mathlib's Representation.norm ρ. |

**Unit tests.**

- `kolyvaginDerivative_order_two` (computation): For order 2, D_σ=σ.
- `kolyvaginDerivative_order_three` (computation): For order 3, D_σ=σ+2σ².
- `kolyvaginDerivative_trivial` (degenerate): The derivative of the identity in the trivial cyclic group is zero.
- `kolyvaginDerivative_not_norm_multiple` (non-example): For a cyclic group of order at least 2, (σ−1)D_σ is nonzero in the integral group ring.

**Acceptance checks.**

- For n = 2: D_σ = σ and (σ − 1)σ = 1 − σ = 2 − (1 + σ).
- The identity is the only property of D_q used in the invariance of derivative classes.

**Prerequisites.** `mathlib:MonoidAlgebra`, `mathlib:Representation.norm`, `EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower`.

**Sources.**

- rubin-es, Chapter IV, Definition 4.1 and (4), p. 62: The operators D_q, D_r and the identity (σ_q − 1)D_q = |Γ_q| − N_q.

### Invariance of the derivative of the universal class

`EulerSystemsAndKolyvaginSystems:ES.3/derivative-invariance` — lemma.

**Statement.** Let K ⊂_f F ⊆ K_∞, 0 ≠ M ∈ O and r ∈ R_{F,M}. If N_{F(1)/F} ∈ ℤ[Gal(F(r)/F)] restricts to Σ_{γ ∈ Gal(F(1)/F)} γ, then N_{F(1)/F}D_r x_{F(r)} ∈ (X_{F(r)}/M X_{F(r)})^{Gal(F(r)/F)}, independently of the choice of N_{F(1)/F}. Consequently for an Euler system c the image of N_{F(1)/F}D_r c_{F(r)} in H¹(F(r), W_M) is fixed by Gal(F(r)/F).

**Suggested declarations.** `TauCeti.KolyvaginSystems.derivative_invariance`.

**Hypotheses.**

- r ∈ R_{F,M}

**Construction or proof.**

1. Show (σ − 1)D_r x_{F(r)} ∈ M X_{F(r)} for σ ∈ Gal(F(r)/F(1)) by induction on the number of primes of r: for r = qs, (σ_q − 1)D_r = (|Γ_q| − N_q)D_s and N_q x_{F(r)} = P(Fr_q^{-1} | T^*; Fr_q^{-1})x_{F(s)} ≡ P(Fr_q^{-1} | T^*; 1)x_{F(s)} modulo (Fr_q − 1)D_s x_{F(s)}.
2. Both M | |Γ_q| and M | P(Fr_q^{-1} | T^*; 1) hold by definition of R_{F,M}; Fr_q acts on x_{F(s)} through Gal(F(s)/K), where the induction hypothesis applies since q splits completely in F(1)/K.

**Acceptance checks.**

- For r = q: (σ_q − 1)D_q x_{F(q)} = |Γ_q|x_{F(q)} − P(Fr_q^{-1} | T^*; Fr_q^{-1})x_F ∈ M X_{F(q)}.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.3/derivative-operators`, `EulerSystemsAndKolyvaginSystems:ES.2/universal-euler-system`, `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`.

**Sources.**

- rubin-es, Chapter IV, Lemma 4.2, p. 62: The invariance statement.

### The induced module, the connecting map and lifts of an Euler system

`EulerSystemsAndKolyvaginSystems:ES.3/lifting-to-induced-module` — theorem.

**Statement.** Let 𝕎_M = Maps_cont(G_K, W_M) with (γf)(g) = f(gγ), containing W_M via t ↦ (g ↦ gt). (a) For K ⊂_f L ⊆ K_∞(r) there is a canonical δ_L : (𝕎_M/W_M)^{G_L} → H¹(L, W_M) with 0 → W_M^{G_L} → 𝕎_M^{G_L} → (𝕎_M/W_M)^{G_L} → H¹(L, W_M) → 0 exact; δ_L(f) is represented by γ ↦ (γ − 1)f̂ for a lift f̂ ∈ 𝕎_M; and δ commutes with restriction and with norm/corestriction. (b) For an Euler system c and r ∈ R there is a family of O[G_K]-maps d_F : X_{F(r)} → (𝕎_M/W_M)^{G_{F(r)}}, K ⊂_f F ⊆ K_∞, with δ_{F(r)} ∘ d_F equal to x_{F(s)} ↦ c_{F(s)} (mod M) and compatible with norms N_{F′(r)/F(r)}; each d_F is unique up to Hom_{O[G_K]}(X_{F(r)}, 𝕎_M).

**Suggested declarations.** `TauCeti.KolyvaginSystems.delta_surjective`, `TauCeti.KolyvaginSystems.inducedLift_delta`.

**Hypotheses.**

- an Euler system for an admissible tower
- 0 ≠ M ∈ O

**Construction or proof.**

1. (a): 𝕎_M is induced, hence H¹(L, 𝕎_M) = 0; take G_L-cohomology of 0 → W_M → 𝕎_M → 𝕎_M/W_M → 0. The cocycle formula and the compatibility with corestriction are in Tau Ceti for discrete coefficients (the connecting map of a short exact sequence and explicitCor_delta0).
2. (b): the obstruction to lifting X_{F(r)}/M → H¹(F(r), W_M) through δ lies in Ext¹ of X_{F(r)}/M against the induced module, which vanishes by the freeness of the universal Euler system (ES.2/universal-euler-system, Proposition IV.3.4) and the structure of 𝕎_M^{G_{F(r)}} as a free (O/M)[Gal(F(r)/K)]-module (Lemma IV.4.6); pass to the limit over F using Proposition IV.4.7.

**Acceptance checks.**

- If W^{G_{F(r)}} = 0 the lift is unnecessary: restriction H¹(F, W_M) → H¹(F(r), W_M)^{Gal(F(r)/F)} is an isomorphism.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.2/universal-euler-system`, `tauceti:TauCeti.ContCohomology.DiscreteShortExact.explicitCor_delta0`, `tauceti:TauCeti.ContCohomology.explicitCor1`.

**Sources.**

- rubin-es, Chapter IV, Proposition 4.5, pp. 63–64: The connecting map δ_L and its properties.
- rubin-es, Chapter IV, Proposition 4.8, p. 65: Existence and uniqueness of the lifts d_F.

### Kolyvagin's derivative classes κ_{F,r,M}

`EulerSystemsAndKolyvaginSystems:ES.3/derivative-class` — construction.

**Statement.** For an Euler system c, K ⊂_f F ⊆ K_∞, 0 ≠ M ∈ O and r ∈ R_{F,M}, fix a lift d = d_F and put D_{r,F} = N_{F(1)/F}D_r. Then d(D_{r,F}x_{F(r)}) ∈ (𝕎_M/W_M)^{G_F} and κ_{F,r,M} = δ_F(d(D_{r,F}x_{F(r)})) ∈ H¹(F, W_M). It is independent of the choices of N_{F(1)/F} and d, and is represented by γ ↦ (γ − 1)f for any f ∈ 𝕎_M lifting d(D_{r,F}x_{F(r)}). Properties: (i) κ_{F,1,M} is the image of c_F in H¹(F, W_M); (ii) the restriction of κ_{F,r,M} to F(r) is the image of D_{r,F}c_{F(r)}; (iii) for M | M′ and r ∈ R_{F,M′}, κ_{F,r,M′} ↦ κ_{F,r,M} under H¹(F, W_{M′}) → H¹(F, W_M) and κ_{F,r,M} ↦ (M′/M)κ_{F,r,M′} under H¹(F, W_M) → H¹(F, W_{M′}). The class depends only on the images of c_{F(s)}, s | r, in H¹(F(r), W_M), so the construction applies to Euler systems of finite depth and to χ-anticyclotomic ones.

**Suggested declarations.** `TauCeti.KolyvaginSystems.derivativeClass`, `TauCeti.KolyvaginSystems.derivativeClass_one`, `TauCeti.KolyvaginSystems.res_derivativeClass`, `TauCeti.KolyvaginSystems.derivativeClass_reduction`, `TauCeti.KolyvaginSystems.derivativeClass_cocycle`, `TauCeti.KolyvaginSystems.derivativeClass_linear`, `TauCeti.KolyvaginSystems.derivativeClass_generator`.

**Hypotheses.**

- r ∈ R_{F,M}
- an Euler system (or one of the variants of ES.2/rigidity-variants)

**Construction or proof.**

1. derivative-invariance places d(D_{r,F}x_{F(r)}) in the G_F-invariants; independence of d follows since two lifts differ by Hom(X_{F(r)}, 𝕎_M), whose values on the invariant element lie in the image of 𝕎_M^{G_F} = ker δ_F.
2. (i): r = 1, D_{1,F} = N_{F(1)/F} and Cor_{F(1)/F}c_{F(1)} = c_F; (ii), (iii) from the definition and the compatibilities of δ.
3. The intrinsic target: with the generators σ_q not fixed, the same construction gives a class in H¹(F, W_M) ⊗ G_r, independent of the generators (derivative-operators, change of generator).

**Uses.**

- Rubin, Theorems IV.5.1 and IV.5.4: the local behaviour of κ_{F,r,M} is what bounds Selmer groups.
- Mazur–Rubin 2004, Appendix A: κ_n = κ_{[ℚ,n,I_n]} are the inputs to the corrected Kolyvagin system.
- HeegnerPointEulerSystems HE.4: derivative classes of Heegner points, with invariants not assumed to vanish.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.derivativeClass` | constructor | κ_{F,r,M} ∈ H¹(F, W_M) for r ∈ R_{F,M}; in intrinsic form an element of H¹(F, W_M) ⊗ G_r. |
| `TauCeti.KolyvaginSystems.derivativeClass_one` | simp | κ_{F,1,M} = image of c_F. |
| `TauCeti.KolyvaginSystems.res_derivativeClass` | characterisation | res_{F(r)/F}(κ_{F,r,M}) = image of D_{r,F}·c_{F(r)} in H¹(F(r), W_M). |
| `TauCeti.KolyvaginSystems.derivativeClass_reduction` | functoriality | For M \| M′: reduction sends κ_{F,r,M′} to κ_{F,r,M}, and multiplication M′/M : W_M → W_{M′} sends κ_{F,r,M} to (M′/M)·κ_{F,r,M′}. |
| `TauCeti.KolyvaginSystems.derivativeClass_cocycle` | characterisation | κ_{F,r,M} is the class of γ ↦ (γ − 1)·f for any lift f of d(D_{r,F}x_{F(r)}). |
| `TauCeti.KolyvaginSystems.derivativeClass_linear` | structure | c ↦ κ_{F,r,M}(c) is O-linear in the Euler system. |
| `TauCeti.KolyvaginSystems.derivativeClass_generator` | compatibility | κ ⊗ (⊗_q σ_q) ∈ H¹(F, W_M) ⊗ G_r does not depend on the generators σ_q. |

**Unit tests.**

- `derivativeClass_zero` (degenerate): Every derivative class of the zero Euler system is zero.
- `derivativeClass_delta_lift` (compatibility): The induced connecting class vanishes for an invariant element lifted from the coinduced module.
- `derivativeClass_conductor_one_nonzero` (non-example): At conductor one, a nonzero initial component remains nonzero if its coefficient reduction on H¹ is injective.

**Acceptance checks.**

- When W^{G_{F(r)}} = 0, κ_{F,r,M} is the unique class restricting to D_{r,F}c_{F(r)}.
- Scalar and quotient compatibility: κ(ac) = aκ(c), and (iii).
- Additional arithmetic check: For r = 1 and F = K with K(1) = K, κ_{K,1,M} = c_K mod M.
- Additional arithmetic check: For K = ℚ, T = ℤ_p(1), M = p^k and ℓ ≡ 1 (mod p^k): κ_{ℚ,ℓ,M} ∈ ℚ^×/(ℚ^×)^{p^k} is the unique class whose image in ℚ(ℓ)^×/p^k is D_ℓ applied to the cyclotomic unit of ℚ(ℓ) (here W^{G_{ℚ(ℓ)}} = 0 for p odd).
- Additional arithmetic check: κ_{F,r,M} is not Cor_{F(r)/F}(c_{F(r)}) = N_r c: corestriction gives the Euler-factor multiple of c_F, which is 0 modulo M for r ∈ R_{F,M} with r ≠ 1, while κ_{F,r,M} is in general nonzero.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.3/derivative-invariance`, `EulerSystemsAndKolyvaginSystems:ES.3/lifting-to-induced-module`, `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`, `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`.

**Sources.**

- rubin-es, Chapter IV, Definition 4.10, p. 66: Definition of the derivative class.
- rubin-es, Chapter IV, Lemma 4.13, p. 67: The three basic properties.

### Local behaviour of derivative classes

`EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties` — theorem.

**Statement.** Let c be an Euler system for T, K ⊂_f F ⊆ K_∞, 0 ≠ M ∈ O. (a) If r ∈ R_{F,M} and w is a place of F not dividing pr, then (κ_{F,r,M})_w ∈ H¹_f(F_w, W_M); equivalently κ_{F,r,M} ∈ S^{Σ_{pr}}(F, W_M). (b) If rq ∈ R_{F,M}, then the image of κ_{F,rq,M} in H¹_s(F_Q, W_M) is φ^fs_q of the localisation of κ_{F,r,M}: (κ_{F,rq,M})^s_q = φ^fs_q(κ_{F,r,M}). (c) If W_M/(Fr_q − 1)W_M is free of rank one over O/M, the order of (κ_{K,rq,M})^s_q in H¹_s(K_q, W_M) equals the order of (κ_{K,r,M})_q in H¹_f(K_q, W_M). (d) If c is trivial at a finite set Σ of primes not dividing p, then κ_{F,r,M} ∈ S_Σ^{Σ_{pr}}(F, W_M). For Euler systems of finite depth (b) holds and (a) holds after multiplying by a constant m independent of M.

**Suggested declarations.** `TauCeti.EulerSystems.derivative_local_unramified`.

**Hypotheses.**

- an Euler system for an admissible tower (so the classes are universal norms)
- r, rq ∈ R_{F,M}

**Construction or proof.**

1. (a): the Euler system classes are unramified outside p (ES.2/classes-unramified-outside-p, Proposition IV.6.1); the local lifts of Proposition IV.6.8 and the local induced modules show the derivative class is locally a coboundary of an unramified element; at archimedean places use Lemma IV.6.3.
2. (b): compute with the cocycle of derivative-class on a decomposition group at q, using the lifted telescoping identity and the key relation Lemma IV.7.3, which expresses (σ̄_q − 1) of the lift through Q_q(Fr_q^{-1}) applied to the Frobenius value of the lift for r.
3. (c): φ^fs_q is an isomorphism by ES.1/finite-singular-comparison; (d): Theorem IX.5.2, using uniqueness of local lifts.
4. Rubin IV §6: build local lifts through T^I/MT^I in Lemma 6.7 and Proposition 6.8. Infinite decomposition groups force the inverse limit of local H⁰ to vanish; compare global and local lifts using uniqueness, then procyclic cohomological dimension one lifts the unramified finite-level class to T^I. At derivative primes Lemma 7.1 gives commutation only inside the decomposition group, and Lemma 7.3 kills the lift discrepancy by passing to a tower with large local degree (pp. 69–76).

**Acceptance checks.**

- For r = 1 and q ∈ R_{K,M}: the singular part of κ_{K,q,M} at q is φ^fs_q(c_K mod M).
- Together (a) and (b) say that (κ_{K,r,M} ⊗ generators)_r is a weak Kolyvagin system for F_can relaxed at p.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.3/derivative-class`, `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`, `EulerSystemsAndKolyvaginSystems:ES.2/classes-unramified-outside-p`, `SelmerIwasawaCohomology:L3/semilocal-cohomology`.

**Sources.**

- rubin-es, Chapter IV, Theorem 5.1, p. 67: Finiteness away from pr.
- rubin-es, Chapter IV, Theorem 5.4, p. 68: The finite–singular relation.
- rubin-es, Chapter IX, Theorem 5.2, p. 140: Triviality at Σ is inherited.

### Kolyvagin's congruence

`EulerSystemsAndKolyvaginSystems:ES.3/congruence` — theorem.

**Statement.** Let c be an Euler system for T, K ⊂_f F ⊆ K_∞, q ∈ R prime and rq ∈ R. For every prime Q of F(rq) above q, (c_{F(rq)})_Q = ((P_q(Fr_q^{-1}) − P_q(N(q)Fr_q^{-1}))/[K(q) : K(1)]) (c_{F(r)})_Q in H¹(F(rq)_Q, T), where P_q(x) = P(Fr_q^{-1} | T^*; x) and (P_q(x) − P_q(N(q)x))/[K(q) : K(1)] ∈ O[x].

**Suggested declarations.** `TauCeti.EulerSystems.kolyvagin_congruence`.

**Hypotheses.**

- an Euler system for an admissible tower

**Construction or proof.**

1. The quotient polynomial is integral because [K(q) : K(1)] divides N(q) − 1.
2. Apply the local computation behind derivative-local-properties(b) to the lift d̂ over the tower F K_∞: H¹(F(rq)_Q, T) is the limit of the finite-level groups, and P_q(N(q)Fr_q^{-1}) annihilates T.

**Acceptance checks.**

- For T = ℤ_p(1) this is the classical congruence between cyclotomic units modulo the primes above q (Example IV.8.2).
- The congruence is a consequence of the definition for towers extending in the p-direction; it is an extra hypothesis in rigidity condition (c).

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties`, `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`.

**Sources.**

- rubin-es, Chapter IV, Corollary 8.1, p. 77: The congruence relation.

### Kolyvagin systems, weak Kolyvagin systems and their limits

`EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module` — definition.

**Statement.** For a Selmer triple (T, F, P): a Kolyvagin system is a family κ = (κ_n)_{n ∈ N(P)} with κ_n ∈ H¹_{F(n)}(K, T/I_nT) ⊗ G_n such that for every prime q with nq ∈ N(P), (κ_{nq})_{q,s} = φ^fs_q(κ_n) in H¹_s(K_q, T/I_{nq}T) ⊗ G_{nq}, where the left side is localisation at q followed by projection to the singular quotient, and the right side is localisation, reduction modulo I_{nq} and φ^fs_q ⊗ 1. KS(T, F, P) is the R-module of Kolyvagin systems. A weak Kolyvagin system has κ_n ∈ H¹_{F^n}(K, T/I_nT) ⊗ G_n with the same relation. The generalised module is K̄S(T, F, P) = lim_k colim_j KS(T/m^kT, F, P ∩ P_j), with a natural map KS → K̄S; every κ̄ ∈ K̄S has a class κ̄_1 ∈ H¹_F(K, T). The order of vanishing of κ ≠ 0 is ord(κ) = min{ν(n) : κ_n ≠ 0}, and L(T) = {κ_1 : κ ∈ KS(T)} ⊆ H¹_F(K, T) is the module of L-values. The blind spot of κ̄ is the set of ideals I with zero image in K̄S(T/I).

**Suggested declarations.** `TauCeti.KolyvaginSystems.KolyvaginSystem`, `TauCeti.KolyvaginSystems.KolyvaginSystem.eval`, `TauCeti.KolyvaginSystems.KolyvaginSystem.singular_eq_finiteSingular`, `TauCeti.KolyvaginSystems.KolyvaginSystem.ext`, `TauCeti.KolyvaginSystems.WeakKolyvaginSystem`, `TauCeti.KolyvaginSystems.KolyvaginSystem.map`, `TauCeti.KolyvaginSystems.GeneralizedKolyvaginSystem`, `TauCeti.KolyvaginSystems.KolyvaginSystem.ord`.

**Hypotheses.**

- a Selmer triple; for the relation, T/I_{nq}T satisfies the hypotheses of the finite–singular comparison at q

**Construction or proof.**

1. KS is the submodule of ∏_n H¹_{F(n)}(K, T/I_nT) ⊗ G_n cut out by the relations: an equaliser, containing 0.
2. Functoriality (Remark 3.1.4): direct sums; change of ring KS(T) ⊗ R′ → KS(T ⊗ R′); restriction to P′ ⊆ P; inclusion KS(T, F′) ⊆ KS(T, F) for F′ ≤ F; and for n ∈ N a map KS(T, F, P) ⊗ Hom(G_n, R/I_n) → KS(T/I_nT, F(n), P(n)).
3. In a Kolyvagin system (κ_{nq})_q is determined by (κ_n)_q (Remark 3.1.7); a weak system determines κ_n only modulo H¹_F(K, T/I_nT) (Remark 3.1.9).

**Uses.**

- Mazur–Rubin 2004, Theorems 4.5.6, 5.2.2, 5.2.12: the bounds and structure theorems are statements about elements of KS(T).
- Mazur–Rubin 2004, Theorem 3.2.4: the Euler-system map lands in K̄S, and in KS under a divisibility hypothesis.
- Howard, Definition 1.2.3; HeegnerPointEulerSystems HE.5: the Heegner point Kolyvagin system is an element of this module over an imaginary quadratic field.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.KolyvaginSystem` | structure | The R-submodule KS(T, F, P) of ∏_{n ∈ N(P)} H¹_{F(n)}(K, T/I_nT) ⊗ G_n defined by the finite–singular relations. |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.eval` | projection | κ ↦ κ_n, R-linear. |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.singular_eq_finiteSingular` | relation | (κ_{nq})_{q,s} = φ^fs_q(κ_n) for nq ∈ N(P). |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.ext` | extensionality | κ = κ′ iff κ_n = κ′_n for all n. |
| `TauCeti.KolyvaginSystems.WeakKolyvaginSystem` | structure | Families in ∏_n H¹_{F^n}(K, T/I_nT) ⊗ G_n with the same relations; KS ≤ weak KS. |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.map` | functoriality | Change of ring, of P, and of F as in Remark 3.1.4, each R-linear and compatible with eval. |
| `TauCeti.KolyvaginSystems.GeneralizedKolyvaginSystem` | constructor | K̄S(T, F, P) = lim_k colim_j KS(T/m^kT, F, P ∩ P_j), with toGeneralized : KS → K̄S and κ̄ ↦ κ̄_1 ∈ H¹_F(K, T). |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.ord` | data | ord(κ) = min{ν(n) : κ_n ≠ 0} ∈ ℕ∞, with ord(0) = ⊤. |

**Unit tests.**

- `KolyvaginSystem.zero_mem` (degenerate): The zero Kolyvagin system has order infinity.
- `KolyvaginSystem.empty_primes` (degenerate): For an empty prime set, evaluation gives KS≃H¹_F(K,T).
- `KolyvaginSystem.not_product` (non-example): A family with zero upper component and nonzero lower finite–singular localization at an edge is not a Kolyvagin system.

**Acceptance checks.**

- The zero family is a Kolyvagin system; a system may have κ_1 = 0.
- For core rank one KS → K̄S is an isomorphism (ES.5); in general it is neither injective nor surjective.
- Additional arithmetic check: κ_1 ∈ H¹_F(K, T) ⊗ ℤ = H¹_F(K, T): the stalk at 1 has I_1 = 0, G_1 = ℤ and F(1) = F.
- Additional arithmetic check: For T = ℤ_p(1), Σ(F) = {p, ∞} relaxed at p, the raw derivative classes of cyclotomic units form a weak Kolyvagin system whose finite parts (κ_n)_{ℓ,f}, ℓ | n, are not zero in general, so it is not a Kolyvagin system (Example 3.1.10).

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`, `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`, `EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal`, `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`, `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`.

**Sources.**

- mr-ks, Definition 3.1.3, p. 20: The concrete definition and relation (5).
- mr-ks, Definition 3.1.6, p. 21: The generalised module and the map to it.
- mr-ks, Definition 3.1.8, p. 21: Weak Kolyvagin systems.

### Derivative classes form a weak Kolyvagin system; their finite parts

`EulerSystemsAndKolyvaginSystems:ES.3/finite-part-formula` — theorem.

**Statement.** Let K = ℚ, R the integers of a finite extension of ℚ_p, F = F_can and P a set of primes ℓ ≠ p, unramified for T, with T/(Fr_ℓ − 1)T cyclic and Fr_ℓ^{p^k} − 1 injective on T for all k ≥ 0. For an Euler system c for (T, P, 𝒦) with 𝒦 containing the maximal abelian p-extension unramified outside p and P, let κ_n = κ_{[ℚ,n,I_n]} ⊗ (generators) ∈ H¹(ℚ, T/I_nT) ⊗ G_n, κ_1 = c_ℚ. (a) If H⁰(ℚ_p, T^*) is divisible, (κ_n) is a weak Kolyvagin system for (T, F_can, P); in general for each k and all large j the images κ_n^{(k)}, n ∈ N_j, form a weak Kolyvagin system for (T/m^kT, F_can, P_j). (b) For ℓ | n, (κ_n)_{ℓ,f} = Σ_{π ∈ S_1(n), π(ℓ) ≠ ℓ} (−1)^{ν(n/d_π)} (κ_{d_π})_{ℓ,f} ⊗ ⊗_{q | (n/d_π)} ρ_q(P_q(Fr_{π(q)}^{-1})), where S_1(n) is the set of permutations of the primes dividing n whose non-fixed primes form a single orbit, d_π = ∏_{π(ℓ)=ℓ} ℓ, and ρ_q : A_{q,I}/A_{q,I}² ≅ G_q ⊗ R/I is σ − 1 ↦ σ ⊗ 1 on the augmentation ideal A_{q,I} of (R/I)[G_q ⊗ R/I].

**Suggested declarations.** `TauCeti.KolyvaginSystems.rawEulerDerivative_finite_part`, `TauCeti.KolyvaginSystems.rawEulerToWeak_dictionary`.

**Hypotheses.**

- K = ℚ
- the two conditions on the primes of P
- 𝒦 contains the maximal abelian p-extension of ℚ unramified outside p and P

**Construction or proof.**

1. (a): derivative-local-properties gives κ_n ∈ H¹_{F^{np}} and relation (5); the condition at p is automatic if H⁰(ℚ_p, T^*) is divisible (Lemma A.1) and holds for the images in T/m^k after restricting to N_j (Proposition A.2).
2. (b): compute the restriction of κ_m to ℚ(ℓ)_ℓ through the ℓ-finite quotient of the universal Euler system and the augmentation filtration (Propositions A.8, A.13, A.15); P_q(Fr_{π(q)}^{-1}) lies in the augmentation ideal because P_q(1) ∈ I_q.

**Acceptance checks.**

- For n = ℓ: S_1(ℓ) has no π with π(ℓ) ≠ ℓ, so (κ_ℓ)_{ℓ,f} = 0.
- For n = ℓq the only π is the transposition, d_π = 1, and (κ_{ℓq})_{ℓ,f} = (κ_1)_{ℓ,f} ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1})).

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties`, `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`, `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`, `EulerSystemsAndKolyvaginSystems:ES.2/universal-euler-system`.

**Sources.**

- mr-ks, Appendix A, Proposition A.2, p. 79: The raw derivative classes form a weak system.
- mr-ks, Appendix A, Theorem A.4, p. 80: The formula for the finite parts.

### The map from Euler systems to Kolyvagin systems

`EulerSystemsAndKolyvaginSystems:ES.3/euler-to-kolyvagin` — construction.

**Statement.** In the setting of finite-part-formula, define for n ∈ N κ′_n = Σ_{π ∈ S(n)} sign(π) κ_{d_π} ⊗ ⊗_{ℓ | (n/d_π)} ρ_ℓ(P_ℓ(Fr_{π(ℓ)}^{-1})) ∈ H¹(ℚ, T/I_nT) ⊗ G_n, the sum over all permutations of the primes dividing n. Then (κ′_n) satisfies the finite–singular relations and (κ′_n)_{ℓ,f} = 0 for ℓ | n. Theorem (Mazur–Rubin 3.2.4): if 𝒦 contains the maximal abelian p-extension of ℚ unramified outside p and P, and (a) T/(Fr_ℓ − 1)T is cyclic and (b) Fr_ℓ^{p^k} − 1 is injective on T for all ℓ ∈ P, k ≥ 0, then c ↦ κ′ is a canonical G_ℚ-equivariant homomorphism ES(T) → K̄S(T, F_can, P) with κ̄_1 = c_ℚ; if moreover H⁰(ℚ_p, T^*) is divisible it is a homomorphism ES(T) → KS(T, F_can, P) with κ_1 = c_ℚ. Variant (3.2.7): if 𝒦 contains the maximal abelian p-extension unramified outside a cofinite set of primes containing P (no p-direction), c_F ∈ H¹_{F_can}(F, T) for all F, and there is γ ∈ G_ℚ with γ − 1 killing μ_{p^∞} and injective on T, the same conclusions hold. The output in K̄S is a generalised Kolyvagin system; the ordinary one needs the local divisibility condition at p. Over a number field K the rank-one case of ES.7/higher-kolyvagin-derivative gives the corresponding map.

**Suggested declarations.** `TauCeti.KolyvaginSystems.correctedClass`, `TauCeti.KolyvaginSystems.correctedClass_one`, `TauCeti.KolyvaginSystems.correctedClass_finite_eq_zero`, `TauCeti.KolyvaginSystems.eulerToKolyvagin`, `TauCeti.KolyvaginSystems.eulerToKolyvagin_one`, `TauCeti.KolyvaginSystems.eulerToKolyvagin_ordinary`, `TauCeti.KolyvaginSystems.eulerToKolyvagin_twist`.

**Hypotheses.**

- K = ℚ, R the integers of a finite extension of ℚ_p
- (a), (b) of Theorem 3.2.4; the Euler factors are P_ℓ(Fr_ℓ^{-1}) with P_ℓ(x) = det(1 − Fr_ℓ x | T)

**Construction or proof.**

1. Relation (5) for κ′ follows from that for κ by inspection of the sum.
2. Group the sum according to π(ℓ) = ℓ or not: κ′_n = Σ_{π(ℓ)=ℓ} sign(π) s_π ⊗ (⋯) with s_π = κ_{d_π} − Σ_{π′ ∈ S_1(d_π), π′(ℓ)≠ℓ} (−1)^{ν(d_π/d_{π′})} κ_{d_{π′}} ⊗ (⋯); finite-part-formula gives (s_π)_{ℓ,f} = 0.
3. Hence κ′_n ∈ H¹_{F(n)}(ℚ, T/I_nT) ⊗ G_n. Without divisibility at p the construction is carried out for T/m^k on N_j, j large, giving an element of the limit K̄S.
4. To use Rubin's Euler systems first change the Euler factors by ES.2/euler-factor-change.

**Uses.**

- Mazur–Rubin 2004, §6.1 and §6.2: the cyclotomic-unit and Kato Kolyvagin systems are images of Euler systems under this map.
- EulerSystemsCyclotomicMainConjecture L1; KatoEulerSystems L4: applications feed their Euler systems through it to apply the bounds of ES.4 and ES.5.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.correctedClass` | constructor | κ′_n = Σ_{π ∈ Perm(primes of n)} sign(π)·κ_{d_π} ⊗ ⊗_{ℓ \| n/d_π} ρ_ℓ(P_ℓ(Fr_{π(ℓ)}^{-1})). |
| `TauCeti.KolyvaginSystems.correctedClass_one` | simp | κ′_1 = c_ℚ, and κ′_ℓ = κ_ℓ for a prime ℓ. |
| `TauCeti.KolyvaginSystems.correctedClass_finite_eq_zero` | characterisation | (κ′_n)_{ℓ,f} = 0 for every ℓ \| n. |
| `TauCeti.KolyvaginSystems.eulerToKolyvagin` | constructor | The R-linear, G_ℚ-equivariant map ES(T, P, 𝒦) → K̄S(T, F_can, P). |
| `TauCeti.KolyvaginSystems.eulerToKolyvagin_one` | characterisation | (eulerToKolyvagin c)_1 = c_ℚ. |
| `TauCeti.KolyvaginSystems.eulerToKolyvagin_ordinary` | other | If H⁰(ℚ_p, T^*) is divisible, the map factors through KS(T, F_can, P) → K̄S. |
| `TauCeti.KolyvaginSystems.eulerToKolyvagin_twist` | compatibility | For a twisted Euler system and the corresponding admissible twisted triple, the conductor-one evaluation of its generalized Kolyvagin system equals the twisted initial class. Full finite-level twisting compatibility uses the coefficient/polynomial/augmentation dictionary. |

**Unit tests.**

- `eulerToKolyvagin_zero` (degenerate): The zero Euler system maps to zero.
- `correctedClass_finite_vanishes` (compatibility): The corrected weak family from an admissible Euler system has vanishing finite part at every conductor prime.
- `WeakKolyvaginSystem.not_kolyvagin` (non-example): A weak family with nonzero finite part at a conductor prime is outside the image of ordinary Kolyvagin systems.

**Acceptance checks.**

- κ′_1 = κ_1 = c_ℚ and κ′_ℓ = κ_ℓ.
- For n = ℓq: κ′_{ℓq} = κ_{ℓq} − κ_1 ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1})).
- Compatibility: with twisting (Remark 3.2.5), with scalars and with T → T/m^k.
- Additional arithmetic check: For n = ℓ: Perm = {id}, κ′_ℓ = κ_ℓ and (κ_ℓ)_{ℓ,f} = 0 by the finite-part formula.
- Additional arithmetic check: For n = ℓq: κ′_{ℓq} = κ_{ℓq} − κ_1 ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1})); the sign of the transposition is −1 and d_π = 1.
- Additional arithmetic check: For T with H⁰(ℚ_p, T^*) not divisible, H¹_{F_can}(ℚ_p, T/IT) can be a proper submodule of H¹(ℚ_p, T/IT) (Lemma A.1), the classes κ′_n need not satisfy the condition at p, and the map is defined only into K̄S: the ordinary and the generalised outputs are different statements.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.3/finite-part-formula`, `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`, `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`, `EulerSystemsAndKolyvaginSystems:ES.2/euler-factor-change`, `EulerSystemsAndKolyvaginSystems:ES.2/twisting`.

**Sources.**

- mr-ks, Theorem 3.2.4, pp. 23–24: The theorem.
- mr-ks, Appendix A, proof of Theorem 3.2.4, (33), p. 80: The corrected classes.
- mr-ks, Theorem 3.2.7, p. 24: The variant without the p-direction.

### The two-prime check of the correction terms

`EulerSystemsAndKolyvaginSystems:ES.3/two-prime-test` — application.

**Statement.** For distinct ℓ, q ∈ P and n = ℓq: (i) (κ_{ℓq})_{ℓ,s} = φ^fs_ℓ(κ_q) and (κ_{ℓq})_{q,s} = φ^fs_q(κ_ℓ); (ii) (κ_{ℓq})_{ℓ,f} = (κ_1)_{ℓ,f} ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1})); (iii) the corrected class κ′_{ℓq} = κ_{ℓq} − κ_1 ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1})) has zero finite part at ℓ and at q and the same singular parts as κ_{ℓq} at ℓ and q, because the correction term κ_1 is unramified at ℓ and q; (iv) κ′_{ℓq} is symmetric in ℓ and q. Hence κ′ satisfies both edge relations of the square 1 — ℓ — ℓq — q — 1.

**Suggested declarations.** `TauCeti.KolyvaginSystems.correctedClass_two_primes`, `TauCeti.KolyvaginSystems.two_prime_corrected_finite`.

**Hypotheses.**

- the setting of euler-to-kolyvagin

**Construction or proof.**

1. (i) is derivative-local-properties(b) with κ′_ℓ = κ_ℓ; (ii) is finite-part-formula for the transposition, with sign (−1)^{ν(n/d_π)} = (−1)² = 1; (iii) subtract; (iv) the correction term is symmetric.

**Acceptance checks.**

- The sign in (iii) is −1 = sign of the transposition, opposite to the sign +1 = (−1)^{ν(ℓq)} in (ii): the two formulas are consistent.
- Omitting the correction leaves (κ_{ℓq})_{ℓ,f} ≠ 0 in general, so κ_{ℓq} ∉ H¹_{F(ℓq)}.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.3/euler-to-kolyvagin`, `EulerSystemsAndKolyvaginSystems:ES.3/finite-part-formula`.

**Sources.**

- mr-ks, Appendix A, Theorem A.4 and (33), p. 80: The two formulas specialised to two primes.

### Derivative classes of χ-anticyclotomic Euler systems

`EulerSystemsAndKolyvaginSystems:ES.3/anticyclotomic-derivative` — theorem.

**Statement.** Let χ : G_K → ℤ_p^× have order d | p − 1, K′ the field cut out by χ, and c a χ-anticyclotomic Euler system for T. For a power M of p let R_{K′,M} be the squarefree ideals of K divisible only by primes q ∤ N with M | [K′(q)_χ : K′(1)_χ] and M | P(Fr_q^{-1} | T^*; 1). The construction of derivative-class gives κ_{K′,r,M} ∈ H¹(K′, W_M) for r ∈ R_{K′,M}, satisfying the analogues of derivative-local-properties (a) and (b): loc^s_q(κ_{K′,rq,M}) = φ^fs_q(κ_{K′,r,M}). The map φ^fs_q : H¹_f(K′_q, W_M) → H¹_s(K′_q, W_M) is not Gal(K′/K)-equivariant: it sends the χ^i-part into the χ^{i−1}-part.

**Suggested declarations.** `TauCeti.EulerSystems.antiDerivative`, `TauCeti.EulerSystems.antiDerivative_unramified`.

**Hypotheses.**

- d | p − 1
- one of the rigidity conditions (a), (b), (c) of the anticyclotomic definition

**Construction or proof.**

1. Proceed as in Chapter IV §4 with K′(q)_χ in place of K(q); the generator σ_q of Gal(K′(q)_χ/K′(1)_χ) is an eigenvector for χ under conjugation by Gal(K′/K), which shifts eigenspaces by one.
2. For d = 1 this is derivative-class.

**Acceptance checks.**

- For d = 2 (Heegner points): the derivative classes for r with an even number of primes lie in the same eigenspace as c_{K′}, and with an odd number in the opposite one.
- The finite–singular relation with the tensor factor G_q retained is equivariant; the shift is the action of Gal(K′/K) on G_q through χ.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.3/derivative-class`, `EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties`, `EulerSystemsAndKolyvaginSystems:ES.2/rigidity-variants`.

**Sources.**

- rubin-es, Chapter IX, Remark 4.4, p. 139: The eigenspace shift of the finite–singular map.
- rubin-es, Chapter IX §4, p. 138: Derivative classes exist for χ-anticyclotomic systems.

## ES.4. Selmer sheaves and bounded-error descent

**Planets:** Selmer sheaf; Core vertex; Stub Selmer sheaf; Kolyvagin system bound; Rubin's bound with error terms.

### The Selmer graph and the Selmer sheaf

`EulerSystemsAndKolyvaginSystems:ES.4/selmer-sheaf` — construction.

**Statement.** A sheaf S of R-modules on a graph X assigns a module S(v) to each vertex, a module S(e) to each edge and a map ψ_v^e : S(v) → S(e) whenever v is an endpoint of e; a global section is a family (κ_v) with ψ_v^e(κ_v) = ψ_{v′}^e(κ_{v′}) for every edge e = {v, v′}; Γ(S) is the module of global sections. For a Selmer triple (T, F, P), X(P) is the graph with vertex set N(P) and an edge joining n and nq whenever n, nq ∈ N(P) with q prime. The Selmer sheaf ℋ = ℋ_{(T,F,P)} has ℋ(n) = H¹_{F(n)}(K, T/I_nT) ⊗ G_n; for the edge e joining n and nq, ℋ(e) = H¹_s(K_q, T/I_{nq}T) ⊗ G_{nq}; ψ_{nq}^e is localisation at q followed by projection to H¹_s; and ψ_n^e is localisation at q, reduction to T/I_{nq}T and φ^fs_q ⊗ 1. Then KS(T, F, P) = Γ(ℋ). The sheaf ℋ̂ with ℋ̂(n) = H¹_{F^n}(K, T/I_nT) ⊗ G_n and the same edges has Γ(ℋ̂) the weak Kolyvagin systems, and ℋ ⊆ ℋ̂.

**Suggested declarations.** `TauCeti.KolyvaginSystems.conductorGraph`, `TauCeti.KolyvaginSystems.GraphSheaf`, `TauCeti.KolyvaginSystems.GraphSheaf.sections`, `TauCeti.KolyvaginSystems.GraphSheaf.mem_sections`, `TauCeti.KolyvaginSystems.selmerSheaf`, `TauCeti.KolyvaginSystems.sections_selmerSheaf`, `TauCeti.KolyvaginSystems.GraphSheaf.Subsheaf`.

**Hypotheses.**

- a Selmer triple

**Construction or proof.**

1. The maps are well defined: classes in H¹_{F(n)} are finite at q ∤ n, and φ^fs_q applies because I_q kills T/I_{nq}T.
2. Γ(ℋ) = KS: the compatibility at the edge {n, nq} is relation (5) of ES.3/kolyvagin-system-module.
3. Functoriality in (T, F, P) as in Remark 3.1.4; restriction to P′ ⊆ P is restriction to the full subgraph X(P′).

**Uses.**

- Mazur–Rubin 2004, §3.4 and Chapter 4: monodromy and hubs of the stub subsheaf compute Γ(ℋ).
- Mazur–Rubin 2016, Definition 10.3: the rank-r Selmer sheaf on the same graph.
- Burns–Sakamoto–Sano II, Definition 5.12: the core graph X⁰.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.conductorGraph` | constructor | X(P): the simple graph on N(P) with n adjacent to m iff m = nq or n = mq for a prime q ∈ P. |
| `TauCeti.KolyvaginSystems.GraphSheaf` | structure | Vertex modules, edge modules and vertex-to-edge maps on a simple graph. |
| `TauCeti.KolyvaginSystems.GraphSheaf.sections` | data | Γ(S), the submodule of ∏_v S(v) of compatible families. |
| `TauCeti.KolyvaginSystems.GraphSheaf.mem_sections` | characterisation | κ ∈ Γ(S) iff ψ_v^e(κ_v) = ψ_{v′}^e(κ_{v′}) for every edge e = {v, v′}. |
| `TauCeti.KolyvaginSystems.selmerSheaf` | constructor | ℋ_{(T,F,P)} on X(P). |
| `TauCeti.KolyvaginSystems.sections_selmerSheaf` | equivalence | Γ(ℋ) = KS(T, F, P) as submodules of ∏_n ℋ(n). |
| `TauCeti.KolyvaginSystems.GraphSheaf.Subsheaf` | structure | Subsheaves: submodules of the stalks and edge modules stable under the maps; Γ of a subsheaf is a submodule of Γ. |

**Unit tests.**

- `conductorGraph_two_prime_nonedge` (non-example): For distinct q₁,q₂, the vertices 1 and q₁q₂ are not adjacent.
- `sections_one_vertex` (degenerate): On a one-vertex graph, sections equal the sole stalk.
- `sections_ne_product` (non-example): A family whose two restrictions at an edge disagree is not a section.

**Acceptance checks.**

- For P = {q}: X has two vertices and one edge, and Γ(ℋ) = {(κ_1, κ_q) : (κ_q)_{q,s} = φ^fs_q(κ_1)}.
- X(P) is the 1-skeleton of the cube on P; it is connected.
- Additional arithmetic check: For P = {q₁, q₂}, X(P) is the 4-cycle 1 — q₁ — q₁q₂ — q₂ — 1.
- Additional arithmetic check: ℋ(1) = H¹_F(K, T) and ℋ̂(1) = H¹_F(K, T).

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`, `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`, `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`, `mathlib:SimpleGraph`.

**Sources.**

- mr-ks, Definition 3.1.2, pp. 19–20: The graph and the sheaf.
- mr-ks, Definition 3.1.1, p. 19: Sheaves on graphs and global sections.

### Locally cyclic sheaves, hubs, monodromy and primitive sections

`EulerSystemsAndKolyvaginSystems:ES.4/sheaf-monodromy` — definition.

**Statement.** Let S be a sheaf of R-modules on a graph X. S is locally free of rank r if all S(v), S(e) are free of rank r and all ψ_v^e are isomorphisms; locally cyclic if all S(v), S(e) are cyclic and all ψ_v^e are surjective. For S locally cyclic, a surjective path from v to w is a path (v = v₁, …, v_k = w) such that each ψ_{v_{i+1}}^{e_i} is an isomorphism; it induces a surjection ψ_P : S(v) → S(w). A vertex v is a hub if every vertex is reached from v by a surjective path. S has trivial monodromy if for surjective paths P, P′ from v to w, w′ joined by an edge e, ψ_w^e ∘ ψ_P = ψ_{w′}^e ∘ ψ_{P′}. A global section κ is primitive if κ_v generates S(v) for every v. Proposition: if S is locally cyclic and v is a hub, then Γ(S) → S(v), κ ↦ κ_v, is injective, and surjective iff S has trivial monodromy; Γ(S) is isomorphic to a submodule of the cyclic hub stalk S(v). It is isomorphic to an ideal of R if the hub stalk is free of rank one, or if R is principal artinian (every cyclic module is then isomorphic to an ideal). The ideal conclusion is false for a general complete noetherian local R; and if κ_u ≠ 0 generates m^iS(u) for some u then κ_w generates m^iS(w) for every w.

**Suggested declarations.** `TauCeti.KolyvaginSystems.GraphSheaf.IsLocallyCyclic`, `TauCeti.KolyvaginSystems.GraphSheaf.IsHub`, `TauCeti.KolyvaginSystems.GraphSheaf.HasTrivialMonodromy`, `TauCeti.KolyvaginSystems.GraphSheaf.eval_injective_of_isHub`, `TauCeti.KolyvaginSystems.GraphSheaf.eval_surjective_iff`, `TauCeti.KolyvaginSystems.GraphSheaf.IsPrimitive`, `TauCeti.KolyvaginSystems.GraphSheaf.generates_of_generates`.

**Hypotheses.**

- R local with maximal ideal m

**Construction or proof.**

1. Fix surjective paths P_w from the hub; then κ_w = ψ_{P_w}(κ_v), which gives injectivity; trivial monodromy is exactly the condition for w ↦ ψ_{P_w}(c) to be a section.

**Uses.**

- Mazur–Rubin 2004, Theorem 4.3.4 and Corollary 4.3.5: the stub Selmer sheaf is locally cyclic with every core vertex a hub, so KS(T) is free of rank one.
- Mazur–Rubin 2016, Theorem 11.7: the same argument for the rank-r stub sheaf.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.GraphSheaf.IsLocallyCyclic` | structure | All stalks and edge modules cyclic, all vertex-to-edge maps surjective. |
| `TauCeti.KolyvaginSystems.GraphSheaf.IsHub` | structure | v is a hub: every vertex is the end of a surjective path from v. |
| `TauCeti.KolyvaginSystems.GraphSheaf.HasTrivialMonodromy` | structure | The compatibility of ψ_P along surjective paths. |
| `TauCeti.KolyvaginSystems.GraphSheaf.eval_injective_of_isHub` | characterisation | For S locally cyclic and v a hub, κ ↦ κ_v is injective on Γ(S). |
| `TauCeti.KolyvaginSystems.GraphSheaf.eval_surjective_iff` | characterisation | For v a hub, κ ↦ κ_v is surjective iff S has trivial monodromy. |
| `TauCeti.KolyvaginSystems.GraphSheaf.IsPrimitive` | structure | κ_v generates S(v) for all v. |
| `TauCeti.KolyvaginSystems.GraphSheaf.generates_of_generates` | relation | If κ_u ≠ 0 generates m^i S(u) then κ_w generates m^i S(w) for all w (S locally cyclic with a hub). |

**Unit tests.**

- `monodromy_trivial_loop` (characterisation): Trivial monodromy forces every surjective loop transport to be the identity.
- `sections_zero_hub` (characterisation): A section of a locally cyclic sheaf vanishing at a hub is zero.
- `isPrimitive_zero_module` (degenerate): If every stalk is zero, the zero section is primitive.

**Acceptance checks.**

- A locally free sheaf of rank one on a connected graph is locally cyclic and every vertex is a hub.
- A locally cyclic sheaf with a hub has a primitive section iff it has trivial monodromy.
- Additional arithmetic check: If S is locally free of rank one on a connected graph then every vertex is a hub.
- Additional arithmetic check: For the constant sheaf R with identity maps on a connected graph, Γ = R and every nonzero section generating at one vertex is primitive iff it is a unit.
- Additional arithmetic check: On the triangle graph with all modules R = 𝔽₃ and all maps the identity except one vertex-to-edge map equal to −1, the sheaf is locally free of rank one but has nontrivial monodromy, Γ = 0, and evaluation at a hub is not surjective.
- Additional arithmetic check: On the one-vertex graph, take R=ℤ_p and S(v)=ℤ_p/p. The vertex is a hub and monodromy is trivial, but Γ(S)=ℤ/p cannot be isomorphic to any ideal of the domain ℤ_p. Injectivity into S(v) does not identify S(v) with an ideal.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.4/selmer-sheaf`.

**Sources.**

- mr-ks, Definition 3.4.2 and Proposition 3.4.4, pp. 26–27: Hubs, monodromy and the evaluation map.

### Selmer lengths across an edge

`EulerSystemsAndKolyvaginSystems:ES.4/vertex-step` — lemma.

**Statement.** Let R be principal artinian of length k and (T, F, P) satisfy (H.0)–(H.6) with P ⊆ P_k. Put λ(n, T) = length H¹_{F(n)}(ℚ, T) and λ(n, T^*) = length H¹_{F(n)^*}(ℚ, T^*). (a) λ(n, T) − λ(n, T^*) is independent of n ∈ N. (b) For nℓ ∈ N the four inclusions H¹_{F_ℓ(n)} ⊆ H¹_{F(n)}, H¹_{F(nℓ)} ⊆ H¹_{F^ℓ(n)} have cyclic cokernels of lengths c, d, a, b with 0 ≤ a, b, c, d ≤ k, a + c = b + d, a ≥ d, b ≥ c, and dually a^* + a = b^* + b = c^* + c = d^* + d = k. (c) |λ(nℓ, T) − λ(n, T)| ≤ k; if H¹_{F(n)}(ℚ, T) → H¹_f(ℚ_ℓ, T) is surjective then H¹_{F(nℓ)^*}(ℚ, T^*) = H¹_{F^ℓ(n)^*}(ℚ, T^*); the images of m^{λ(n,T^*)}H¹_{F(n)} under φ^fs_ℓ ∘ loc_ℓ and of m^{λ(nℓ,T^*)}H¹_{F(nℓ)} under loc_ℓ in H¹_s(ℚ_ℓ, T) are equal; and if both localisations H¹_{F(n)}(ℚ, T)[m] → H¹_f(ℚ_ℓ, T) and H¹_{F(n)^*}(ℚ, T^*)[m] → H¹_f(ℚ_ℓ, T^*) are nonzero then λ(nℓ, T̄) = λ(n, T̄) − 1 and λ(nℓ, T̄^*) = λ(n, T̄^*) − 1.

**Suggested declarations.** `TauCeti.KolyvaginSystems.vertex_step`.

**Hypotheses.**

- (H.0)–(H.6), R principal artinian of length k, P ⊆ P_k

**Construction or proof.**

1. (a): Corollary 2.3.6 — by ES.0/selmer-length-difference the difference only depends on the lengths of the local conditions, and H¹_f and H¹_tr at ℓ | n have the same length (ES.1/finite-singular-comparison).
2. (b): the local modules at ℓ are free of rank one, giving the bounds; the dual relations are global duality (SelmerIwasawaCohomology L2/selmer-structure-poitou-tate) for the pairs (F(n), F^ℓ(n)) etc.
3. (c): read off from the two diamonds of inclusions.

**Acceptance checks.**

- For n a core vertex with λ(n, T^*) = 0 and surjective localisation at ℓ, nℓ is again a core vertex.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.0/selmer-length-difference`, `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`, `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`, `SelmerIwasawaCohomology:L2`, `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004`.

**Sources.**

- mr-ks, Lemma 4.1.7, p. 37: How the Selmer lengths change along an edge.
- mr-ks, Corollary 2.3.6, p. 17: Invariance of the length difference.

### Core vertices and leading vertices

`EulerSystemsAndKolyvaginSystems:ES.4/core-vertices` — definition.

**Statement.** In the setting of vertex-step, a vertex n ∈ N is a core vertex if λ(n, T) = 0 or λ(n, T^*) = 0 (equivalently for T̄). Theorem: for every n there is a noncanonical isomorphism H¹_{F(n)}(ℚ, T) ⊕ R^r ≅ H¹_{F(n)^*}(ℚ, T^*) ⊕ R^s with r, s ≥ 0 independent of n and rs = 0; at a core vertex H¹_{F(n)}(ℚ, T) and H¹_{F(n)^*}(ℚ, T^*) are free, of ranks χ(T) and χ(T^*), which are the core ranks of ES.0/core-rank. With r₀ = min{dim H¹_F(ℚ, T̄), dim H¹_{F^*}(ℚ, T̄^*)}: every core vertex has ν(n) ≥ r₀, there are core vertices in N_j with ν(n) = r₀ for every j ≥ k, and every m ∈ N_j divides a core vertex. If χ(T) > 0, a leading vertex is a core vertex with ν(n) = dim_k H¹_{F^*}(ℚ, T̄^*). Over a number field with the 2016 hypotheses a core vertex is an n with λ(n) = length H¹_{F(n)^*}(K, T^*) = 0.

**Suggested declarations.** `TauCeti.KolyvaginSystems.selmerLength`, `TauCeti.KolyvaginSystems.IsCoreVertex`, `TauCeti.KolyvaginSystems.isCoreVertex_iff_residual`, `TauCeti.KolyvaginSystems.free_of_isCoreVertex`, `TauCeti.KolyvaginSystems.exists_isCoreVertex_dvd`, `TauCeti.KolyvaginSystems.IsLeadingVertex`, `TauCeti.KolyvaginSystems.selmerLength_sub`.

**Hypotheses.**

- (H.0)–(H.6), R principal artinian of length k, P ⊆ P_k

**Construction or proof.**

1. The structure theorem is ES.0/core-rank applied to (T, F(n)), which satisfies the hypotheses by Lemma 3.7.4, with independence of n from vertex-step(a).
2. Existence: if m is not a core vertex, ES.1/chebotarev-nonvanishing gives ℓ ∈ P_j at which nonzero classes of H¹_{F(m)}(ℚ, T̄) and of H¹_{F(m)^*}(ℚ, T̄^*) localise nontrivially; by vertex-step(c) both residual lengths drop by one. Iterate.
3. ν(n) ≥ r₀ at a core vertex because each step changes λ(·, T̄) by at most one.

**Uses.**

- Mazur–Rubin 2004, Corollary 4.5.2(iii): for core rank one, evaluation at a core vertex identifies KS(T) with the free rank-one stalk.
- Mazur–Rubin 2016, Theorem 11.6; Burns–Sakamoto–Sano II, Hypothesis 4.2 and Definition 5.8: existence and connectivity of core vertices in higher rank and over Gorenstein rings.
- Mazur–Rubin 2004, Theorem 5.1.3: leading vertices realise every line of the Selmer group as a stalk.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.selmerLength` | data | λ(n, T) and λ(n, T^*) as elements of ℕ. |
| `TauCeti.KolyvaginSystems.IsCoreVertex` | structure | λ(n, T) = 0 or λ(n, T^*) = 0. |
| `TauCeti.KolyvaginSystems.isCoreVertex_iff_residual` | characterisation | n is a core vertex for T iff it is one for T̄ = T/mT. |
| `TauCeti.KolyvaginSystems.free_of_isCoreVertex` | characterisation | At a core vertex, H¹_{F(n)}(ℚ, T) is free of rank χ(T) and H¹_{F(n)^*}(ℚ, T^*) is free of rank χ(T^*). |
| `TauCeti.KolyvaginSystems.exists_isCoreVertex_dvd` | other | Every m ∈ N_j (j ≥ k) divides a core vertex in N_j, and there are core vertices with exactly r₀ prime factors. |
| `TauCeti.KolyvaginSystems.IsLeadingVertex` | structure | Core vertices with ν(n) = dim_k H¹_{F^*}(ℚ, T̄^*), for χ(T) > 0. |
| `TauCeti.KolyvaginSystems.selmerLength_sub` | relation | λ(n, T) − λ(n, T^*) = k·(χ(T) − χ(T^*)) for every n. |

**Unit tests.**

- `isCoreVertex_dual_zero` (degenerate): A vertex of zero dual Selmer length is core.
- `not_isCoreVertex_both_positive` (non-example): If both Selmer lengths are positive, the vertex is not core.
- `isCoreVertex_free_rank` (compatibility): Under finite MR admissibility, level-zero conductor ideals and core rank 1, a core vertex has free rank-one Selmer module.

**Acceptance checks.**

- If H¹_{F^*}(ℚ, T^*) = 0 then 1 is a core vertex and the only leading vertex.
- The core rank computed at any core vertex equals the integer of ES.0/core-rank computed at n = 1.
- Additional arithmetic check: For χ(T) > 0, 1 is a core vertex iff H¹_{F^*}(ℚ, T^*) = 0.
- Additional arithmetic check: For R = k and χ(T) = 1, n is a core vertex iff dim H¹_{F(n)}(ℚ, T) = 1 iff H¹_{F(n)^*}(ℚ, T^*) = 0.
- Additional arithmetic check: If ν(n) < min{dim H¹_F(ℚ, T̄), dim H¹_{F^*}(ℚ, T̄^*)} then n is not a core vertex.
- Additional arithmetic check: rank H¹_{F(n)}(ℚ, T) at a core vertex equals ES.0's χ(T, F), defined from n = 1.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.4/vertex-step`, `EulerSystemsAndKolyvaginSystems:ES.0/core-rank`, `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing`, `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`.

**Sources.**

- mr-ks, Definition 4.1.8 and Corollary 4.1.9, p. 38: Core vertices and their existence.
- mr-ks, Theorem 4.1.10 and Definition 4.1.11, p. 38: Freeness at core vertices and the core rank.
- mr-higher, §11, p. 22: Core vertices over a number field.

### Leading vertices through a prescribed submodule

`EulerSystemsAndKolyvaginSystems:ES.4/leading-vertices` — theorem.

**Statement.** In the setting of core-vertices suppose χ(T) > 0, 1 is not a core vertex, (H.4a) holds and the image of R → End(T) is contained in the image of ℤ_p[[G_ℚ]]. If L ⊆ H¹_F(ℚ, T) satisfies dim_k L[m] = χ(T), there are infinitely many leading vertices n with L ⊆ H¹_{F(n)}(ℚ, T). For R = k and χ(T) = 1: for every line L in H¹_F(ℚ, T) there is a leading vertex n with κ_n generating L ⊗ G_n for any nonzero κ ∈ KS(T).

**Suggested declarations.** `TauCeti.KolyvaginSystems.leading_vertices_through_submodule`.

**Hypotheses.**

- (H.0)–(H.6), (H.4a), image of R in End(T) inside that of ℤ_p[[G_ℚ]]

**Construction or proof.**

1. Choose homomorphisms φ_i on H¹_F(ℚ, T) with common kernel L and ψ_i on H¹_{F^*}(ℚ, T^*) with common kernel 0; ES.1/chebotarev-prescribed-kernels gives primes ℓ_i realising them; n = ∏ℓ_i is a leading vertex by vertex-step(c).

**Acceptance checks.**

- Fails without the End(T) hypothesis: only 𝔽_p-rational subspaces occur (Remark 4.1.17).

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.4/core-vertices`, `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-prescribed-kernels`.

**Sources.**

- mr-ks, Theorem 4.1.16, p. 39: Leading vertices through L.

### The sheaf of stub Selmer modules

`EulerSystemsAndKolyvaginSystems:ES.4/stub-sheaf` — definition.

**Statement.** In the setting of core-vertices, the stub subsheaf ℋ′ ⊆ ℋ has ℋ′(n) = m^{λ(n,T^*)}ℋ(n) = m^{λ(n,T^*)}H¹_{F(n)}(ℚ, T) ⊗ G_n, ℋ′(e) the image of ℋ′(n) in ℋ(e) for e joining n and nℓ, and the restricted maps, which are surjective. ℋ′(n) = 0 if λ(n, T^*) ≥ k, and otherwise ℋ′(n) is free of rank χ(T) over R/m^{k−λ(n,T^*)}. Theorems: (Howard) Γ(ℋ′) → ℋ′(n) is surjective for every n; if χ(T) = 1, Γ(ℋ′) contains a free R-module of rank one, and if χ(T) > 1 it contains free modules of every rank. If χ(T) = 1, ℋ′ is locally cyclic, the core subgraph X⁰ (vertices the core vertices) is connected, every n with λ(n, T^*) = 0 is a hub, ℋ′ has trivial monodromy and Γ(ℋ′) is free of rank one. If χ(T) = 1, or R is a field, or (H.4a) holds with the End(T) condition, then Γ(ℋ′) = Γ(ℋ): every Kolyvagin system has κ_n ∈ ℋ′(n). If χ(T) = 0 then KS(T) = 0.

**Suggested declarations.** `TauCeti.KolyvaginSystems.stubSheaf`, `TauCeti.KolyvaginSystems.stubSheaf_stalk_eq_bot`, `TauCeti.KolyvaginSystems.stubSheaf_stalk_free`, `TauCeti.KolyvaginSystems.stubSheaf_isLocallyCyclic`, `TauCeti.KolyvaginSystems.sections_stubSheaf_eq`, `TauCeti.KolyvaginSystems.kolyvaginSystem_eq_bot_of_coreRank_zero`.

**Hypotheses.**

- (H.0)–(H.6), R principal artinian of length k, P ⊆ P_k

**Construction or proof.**

1. Well-definedness and surjectivity of the maps: vertex-step(c), third statement. The description of ℋ′(n): the structure theorem of core-vertices.
2. Local cyclicity and hubs for χ = 1: Theorem 4.3.4 via paths in X⁰ (Lemmas 4.3.8–4.3.9, Propositions 4.3.10–4.3.11, Theorem 4.3.12); then sheaf-monodromy.
3. Γ(ℋ′) = Γ(ℋ): induction on λ(n, T̄^*) using Lemma 4.2.1 and ES.1/chebotarev-nonvanishing (Theorem 4.4.1). χ = 0: Theorem 4.2.2 by the same lemma.
4. Howard's theorem (Appendix B of Mazur–Rubin): construct sections from an element of ∧^{χ+ν(n)} at a core vertex.

**Uses.**

- Mazur–Rubin 2004, Corollary 4.4.5: κ_1 ∈ ℋ′(1) = m^{length H¹_{F^*}}H¹_F is the bound on the dual Selmer group.
- Mazur–Rubin 2016, Definition 11.3: the rank-r stub sheaf S′.
- Howard, Definition 1.5.4: the self-dual stub Selmer module S(n) = m^{λ(n)}H(n).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.stubSheaf` | constructor | ℋ′ as a subsheaf of ℋ, with ℋ′(n) = m^{λ(n,T^*)}·ℋ(n). |
| `TauCeti.KolyvaginSystems.stubSheaf_stalk_eq_bot` | simp | ℋ′(n) = 0 iff λ(n, T^*) ≥ k (for χ(T) > 0). |
| `TauCeti.KolyvaginSystems.stubSheaf_stalk_free` | characterisation | If λ(n, T^*) < k, ℋ′(n) is free of rank χ(T) over R/m^{k − λ(n,T^*)}. |
| `TauCeti.KolyvaginSystems.stubSheaf_isLocallyCyclic` | instance | For χ(T) = 1 the stub sheaf is locally cyclic and every vertex with λ(n, T^*) = 0 is a hub. |
| `TauCeti.KolyvaginSystems.sections_stubSheaf_eq` | equivalence | Γ(ℋ′) = Γ(ℋ) under any of the three conditions of Theorem 4.4.1. |
| `TauCeti.KolyvaginSystems.kolyvaginSystem_eq_bot_of_coreRank_zero` | other | χ(T) = 0 implies KS(T, F, P) = 0. |

**Unit tests.**

- `stubSheaf_core_vertex` (degenerate): If the dual Selmer length at n is zero, the stub stalk is the whole stalk.
- `stubSheaf_zero_of_large` (degenerate): For admissible artinian core rank one, a dual length at least the coefficient length gives the zero stub stalk.
- `stubSheaf_field` (non-example): Over a field, a vertex with positive dual length has zero stub stalk.

**Acceptance checks.**

- At a core vertex with λ(n, T^*) = 0, ℋ′(n) = ℋ(n).
- For χ(T) > 1 the module KS(T) is not finitely generated (Remark 5.1.2), so the rank-one theory uses ℋ′.
- Additional arithmetic check: If λ(n, T^*) > 0 and χ(T) = 1 then ℋ′(n) ≠ ℋ(n): the stalk ℋ(n) ≅ R ⊕ H¹_{F(n)^*}(ℚ, T^*) is not cyclic.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.4/core-vertices`, `EulerSystemsAndKolyvaginSystems:ES.4/sheaf-monodromy`, `EulerSystemsAndKolyvaginSystems:ES.4/vertex-step`, `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing`, `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-prescribed-kernels`.

**Sources.**

- mr-ks, Definition 4.3.1, p. 41: Definition of the stub subsheaf.
- mr-ks, Theorem 4.3.4, p. 41: Local cyclicity and hubs.
- mr-ks, Theorem 4.4.1, p. 45: Kolyvagin systems are stub sections.
- mr-ks, Theorem 4.2.2, p. 40: Vanishing in core rank zero.

### The Kolyvagin system bound

`EulerSystemsAndKolyvaginSystems:ES.4/kolyvagin-bound` — theorem.

**Statement.** (a) (R principal artinian of length k, (H.0)–(H.6), and one of the conditions of Theorem 4.4.1, or κ sufficiently liftable.) For κ ∈ KS(T): length H¹_{F^*}(ℚ, T^*) ≤ sup{i : κ_1 ∈ m^iH¹_F(ℚ, T)} ∈ ℕ∞ (∞ when κ_1=0). (b) (R a discrete valuation ring, (H.0)–(H.5), H¹(ℚ_ℓ, T)/H¹_F(ℚ_ℓ, T) torsion-free for ℓ ∈ Σ(F), P = P_1.) For κ ∈ KS(T) put ∂^{(0)}(κ) = max{j : κ_1 ∈ m^jH¹_F(ℚ, T)} ≤ ∞. Then length_R H¹_{F^*}(ℚ, T^*) ≤ ∂^{(0)}(κ); in particular if κ_1 ≠ 0 then H¹_{F^*}(ℚ, T^*) is finite. The same holds for κ̄ ∈ K̄S(T). The bound concerns the whole dual Selmer group H¹_{F^*}(ℚ, T^*) of the discrete module T^* = Hom(T, μ_{p^∞}), not a cotorsion quotient; for κ_1 = 0 it is vacuous (∂^{(0)} = ∞).

**Suggested declarations.** `TauCeti.KolyvaginSystems.kolyvagin_bound_artinian`, `TauCeti.KolyvaginSystems.kolyvagin_bound`.

**Hypotheses.**

- as stated in (a), (b)

**Construction or proof.**

1. (a): κ_1 ∈ ℋ′(1) = m^{λ(1,T^*)}H¹_F(ℚ, T) by stub-sheaf.
2. (b): ∂^{(0)}(κ) is finite when κ_1 ≠ 0 since H¹(ℚ, T) has no nonzero divisible submodule; the image κ^{(k)} ∈ KS(T/m^k) has κ^{(k)}_1 ∈ m^{∂^{(0)}}H¹_F(ℚ, T/m^k); T/m^k satisfies (H.6) by Lemma 3.7.1(i); apply (a) and H¹_{F^*}(ℚ, T^*)[m^k] = H¹_{F^*}(ℚ, T^*[m^k]) (ES.0/selmer-torsion-identification), then take the union over k.

**Acceptance checks.**

- Kato's Kolyvagin system gives length Sel(E[p^∞]) ≤ the divisibility of the Kato class, under the hypotheses of §6.2.
- Over a DVR, scaling a nonzero initial class by π raises the bound by one; the zero system gives no information.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.4/stub-sheaf`, `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`, `EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification`, `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`.

**Sources.**

- mr-ks, Theorem 5.2.2, p. 56: The bound over a discrete valuation ring.
- mr-ks, Corollary 4.4.5, p. 47: The artinian bound.

### Rubin's hypotheses, index of divisibility and error terms

`EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses` — definition.

**Statement.** Let T be a p-adic representation of G_K over O, V = T ⊗ Φ, W = V/T, W_M = M^{-1}T/T, 𝔭 the maximal ideal of O, k = O/𝔭, K(1) the maximal p-extension of K in the Hilbert class field. Hyp(K, T): (i) there is τ ∈ G_K acting trivially on μ_{p^∞}, on (O_K^×)^{1/p^∞} and on K(1), with T/(τ − 1)T free of rank one over O; (ii) T ⊗ k is an irreducible k[G_K]-module. Hyp(K, V): (i) there is such a τ with dim_Φ V/(τ − 1)V = 1; (ii) V is an irreducible Φ[G_K]-module. For an Euler system c, ind_O(c) = sup{n : c_K ∈ 𝔭^nH¹(K, T) + H¹(K, T)_tors} ≤ ∞. Ω = K(1)K(W)K(μ_{p^∞}, (O_K^×)^{1/p^∞}), and the error terms are n_W = ℓ_O(H¹(Ω/K, W) ∩ S^{Σ_p}(K, W)) and n_W^* = ℓ_O(H¹(Ω/K, W^*) ∩ S_{Σ_p}(K, W^*)), where S^{Σ_p} and S_{Σ_p} are the Selmer groups relaxed and strict at the primes above p. H¹(Ω/K, W) and H¹(Ω/K, W^*) are finite if T ≠ O and T ≠ O(1).

**Suggested declarations.** `TauCeti.EulerSystems.HypKT`, `TauCeti.EulerSystems.HypKV`, `TauCeti.EulerSystems.HypKT.toHypKV`, `TauCeti.EulerSystems.indexOfDivisibility`, `TauCeti.EulerSystems.indexOfDivisibility_eq_top_iff`, `TauCeti.EulerSystems.errorTerm`, `TauCeti.EulerSystems.indexOfDivisibility_smul`.

**Hypotheses.**

- T a p-adic representation unramified outside finitely many primes

**Construction or proof.**

1. Hyp(K, T) holds with τ = 1 when rank T = 1. Hyp(K, T) implies Hyp(K, V).
2. Finiteness of H¹(Ω/K, W): Rubin's Corollary C.2.2 (cohomology of p-adic analytic groups), under irreducibility of V.

**Uses.**

- Rubin, Theorems II.2.2, II.2.3, II.2.10: the statements of the error-tolerant bounds.
- EulerSystemsCyclotomicMainConjecture L1: the cyclotomic application proves n_W = n_W^* = 0 for its characters.
- HeegnerPointEulerSystems HE.7: exceptional primes are those where the hypotheses or the vanishing of the error terms fail.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystems.HypKT` | structure | Hyp(K, T): the element τ with its three triviality conditions and free rank-one coinvariants, and residual irreducibility. |
| `TauCeti.EulerSystems.HypKV` | structure | Hyp(K, V). |
| `TauCeti.EulerSystems.HypKT.toHypKV` | functoriality | Hyp(K, T) implies Hyp(K, V). |
| `TauCeti.EulerSystems.indexOfDivisibility` | data | ind_O(c) ∈ ℕ∞. |
| `TauCeti.EulerSystems.indexOfDivisibility_eq_top_iff` | characterisation | ind_O(c) = ∞ iff c_K ∈ H¹(K, T)_tors. |
| `TauCeti.EulerSystems.errorTerm` | data | n_W and n_W^* ∈ ℕ∞, finite when T ≠ O, O(1) and V is irreducible. |
| `TauCeti.EulerSystems.indexOfDivisibility_smul` | relation | ind_O(π·c) = ind_O(c) + 1 for a uniformiser π. |

**Unit tests.**

- `indexOfDivisibility_zero_system` (degenerate): The zero Euler system has infinite initial divisibility index.
- `HypKT.p_hilbert` (characterisation): Rubin’s τ fixes the maximal p-Hilbert class field.
- `HypKT.roots_and_units` (characterisation): The same τ fixes all p-power roots of unity and all p-power roots of global units.

**Acceptance checks.**

- For T = ℤ_p(1) ⊗ χ^{-1} with χ even nontrivial of order prime to p: n_W = n_W^* = 0.
- The two error terms are distinct; neither is assumed zero.
- Additional arithmetic check: If rank_O T = 1 then Hyp(K, T) holds with τ = 1.
- Additional arithmetic check: For T = O with trivial action, H¹(Ω/K, W) = Hom(Gal(Ω/K), Φ/O) is infinite: the finiteness statement excludes T = O and T = O(1).
- Additional arithmetic check: For K = ℚ, T = ℤ_p(1) ⊗ χ^{-1}, χ ≠ 1, ω of order prime to p: H¹(Ω/ℚ, W) = H¹(Ω/ℚ, W^*) = 0, so n_W = n_W^* = 0.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`, `SelmerIwasawaCohomology:L2/selmer-limits`, `SelmerIwasawaCohomology:L2/galois-selmer-group`.

**Sources.**

- rubin-es, Chapter II §2, p. 24: The two hypothesis packages.
- rubin-es, Chapter II, Definition 2.1, p. 24: The index of divisibility.
- rubin-es, Chapter V, Lemma 3.2, p. 87: Finiteness of the error groups.

### Rubin's bound with error terms

`EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound` — theorem.

**Statement.** Let c be an Euler system for T (admissible tower). (a) If p > 2 and T satisfies Hyp(K, T), then ℓ_O(S_{Σ_p}(K, W^*)) ≤ ind_O(c) + n_W + n_W^*. (b) If V satisfies Hyp(K, V), T is not the one-dimensional trivial representation and c_K ∉ H¹(K, T)_tors, then S_{Σ_p}(K, W^*) is finite (any p). (c) Let H¹_f(K_v, V), H¹_f(K_v, V^*) be orthogonal complements for v | p and loc^s_{Σ_p} : S^{Σ_p}(K, T) → H¹_s(K_p, T) = ⊕_{v|p} H¹_s(K_v, T). If loc^s_{Σ_p}(c_K) ≠ 0: under the hypotheses of (b) and [H¹_s(K_p, T) : O·loc^s_{Σ_p}(c_K)] finite, S(K, W^*) is finite; under those of (a), ℓ_O(S(K, W^*)) ≤ ℓ_O(H¹_s(K_p, T)/O·loc^s_{Σ_p}(c_K)) + n_W + n_W^*. (d) If c is trivial at a finite set Σ of primes not above p, then under the hypotheses of (a), ℓ_O(S_{Σ_p}^Σ(K, W^*)) ≤ ind_O(c) + n_W + n_W^* with n_W = ℓ_O(H¹(Ω/K, W) ∩ S_Σ^{Σ_p}(K, W)) and n_W^* as before. The constants n_W, n_W^* are independent of the torsion exponent M, so the finite-level bounds are uniform in M before passing to W^* = colim W_M^*.

**Suggested declarations.** `TauCeti.EulerSystems.rubin_bound`, `TauCeti.EulerSystems.rubin_bound_rational`.

**Hypotheses.**

- an Euler system for an admissible tower (or rigidity (ii)′ with T^{G_{K(1)}} = 0)
- p > 2 and Hyp(K, T) for (a); Hyp(K, V) for (b)

**Construction or proof.**

1. Fix M with ord_𝔭 M ≥ n + (k + 1)n_W + ind_O(c). ES.1/rubin-prime-selection gives primes q₁, …, q_k adapted to a generating set of S_{Σ_p}(K, W_M^*) and to the derivative classes.
2. Lemma V.2.5: for such a set Σ, the cokernel of loc^s_{Σ,W_𝔪} : S^{Σ∪Σ_p}(K, W_𝔪) → ⊕_{q∈Σ} H¹_s(K_q, W_𝔪) has length ≤ ind_O(c) + n_W; the singular parts of the derivative classes κ_{r_i,M} (ES.3/derivative-local-properties) generate a submodule of bounded index, using Corollary A.2.6 to control Q_q(Fr_q^{-1}) when coinvariants are not free (the 2b term).
3. Global duality (SelmerIwasawaCohomology L2/selmer-structure-poitou-tate): the kernel of S_{Σ_p}(K, W_M^*) → ⊕_{q ∈ Σ} H¹_f(K_q, W_M^*) is dual to that cokernel; the classes dying at all q_i lie in H¹(Ω/K, W_M^*), of length ≤ n_W^*.
4. (b): the same with the losses a + 1 of Lemma V.3.1, bounding the exponent rather than the length. (c): Corollary I.7.5 compares S(K, W^*) and S_{Σ_p}(K, W^*). (d): Theorem IX.5.3.
5. Rubin V Lemma 2.5, pp. 83–86: in the general case distinguish orders d_i after restriction to Ω from d′_i after passage to W. The loss is bounded by n_W. The filtration of derivative localizations telescopes; pass to the m-torsion submodule and retain the kernel contribution from the base class to cancel the accumulated losses. This gives cokernel length ≤ind(c)+n_W without assuming W^{G_K}=0 or H¹(Ω/K,W)=0.

**Acceptance checks.**

- Cyclotomic units: with n_W = n_W^* = 0 the bound is the class-group divisibility of Rubin's Chapter III.
- Each of ind_O(c), n_W, n_W^* is retained; an application may drop an error term only after proving it vanishes.
- The bound is for S_{Σ_p}(K, W^*), strict at p, not for the Bloch–Kato Selmer group; (c) is the passage to S(K, W^*).

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`, `EulerSystemsAndKolyvaginSystems:ES.1/rubin-prime-selection`, `EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties`, `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`, `SelmerIwasawaCohomology:L2`, `SelmerIwasawaCohomology:L2/selmer-limits`.

**Sources.**

- rubin-es, Chapter II, Theorem 2.2, p. 24: The bound with error terms.
- rubin-es, Chapter II, Theorem 2.3, p. 24: Finiteness under Hyp(K, V).
- rubin-es, Chapter V, Lemma 2.5, p. 82: The key estimate on the cokernel of the singular localisation.
- rubin-es, Appendix A, Corollary 2.6, p. 148: The kernel and cokernel of q(σ) on W_M are bounded.

### Bounds for the variants: finite depth and anticyclotomic systems

`EulerSystemsAndKolyvaginSystems:ES.4/variant-bounds` — theorem.

**Statement.** (a) (Finite depth.) Let 0 ≠ M ∈ O and c an Euler system for W_M. Suppose Hyp(K, T) holds, n_W = n_W^* = 0 and W_M^{G_K} = 0. Let m = sup_{q ∤ p} [W^{I_q} : (W^{I_q})_div] and n the order of m·c_K in H¹(K, W_M). Then n·S_{Σ_p}(K, W_M^*) = 0; in particular if m·c_K ≠ 0 then S_{Σ_p}(K, W^*) is finite for a compatible family. (b) (Anticyclotomic.) Let c be a χ-anticyclotomic Euler system for T with H¹(Ω′/K′, W) = H¹(Ω′/K′, W^*) = 0, T ⊗ k irreducible over G_{K′}, and τ ∈ G_K with ε_cyc(τ) = χ(τ), τ^d the identity on K′(1)_χ(μ_{p^∞}, (O_{K′}^×)^{1/p^∞}) and T/(τ − 1)T free of rank one. Then for every i, 𝔭^{ind_O(c, χ^i)} S_{Σ_p}(K′, W^*)^{χ^{1−i}} = 0, where ind_O(c, χ^i) is the index of divisibility of the χ^i-component of c_{K′}. This bounds exponents of eigenspaces, not lengths.

**Suggested declarations.** `TauCeti.EulerSystems.finite_depth_bound`, `TauCeti.EulerSystems.anticyclotomic_exponent_bound`.

**Hypotheses.**

- as stated

**Construction or proof.**

1. (a): derivative classes exist for systems of depth M and satisfy the finite–singular relation; the finiteness away from pr holds after multiplying by m (Corollary IV.6.5); run the argument of rubin-bound for the exponent.
2. (b): ES.3/anticyclotomic-derivative with r = 1 gives classes in the χ^{i−1}-part ramified at one prime, with ramification governed by the χ^i-part of c_{K′}; they annihilate S_{Σ_p}(K′, W^*)^{χ^{1−i}} by global duality.

**Acceptance checks.**

- For d = 1, (b) is the exponent form of rubin-bound with zero error terms.
- For Heegner points (d = 2) the induction to a length bound uses T^* ≅ T and is carried out in ES.5/howard-dvr-theorem.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`, `EulerSystemsAndKolyvaginSystems:ES.3/anticyclotomic-derivative`, `EulerSystemsAndKolyvaginSystems:ES.2/rigidity-variants`.

**Sources.**

- rubin-es, Chapter IX, Theorem 3.3, p. 137: The finite-depth bound.
- rubin-es, Chapter IX, Theorem 4.3, p. 139: The anticyclotomic exponent bound.

### Localisation at abundant tuples with bounded loss

`EulerSystemsAndKolyvaginSystems:ES.4/abundant-localization` — theorem.

**Statement.** Setting of ES.1/abundant-tuples. (a) (Uniform annihilation.) Let R be a lattice with R_ℚ^𝔠 ≅ R_ℚ^∨(1), pure of weight −1 at every nonarchimedean place not above ℓ. For every finite set Σ of places there is m_Σ ≥ 1 such that for every saturated free submodule S of the Bloch–Kato Selmer module with images S^{(m)} modulo λ^m and every m > m_Σ, loc_w(λ^{m_Σ}S^{(m)}) = 0 for every nonarchimedean w ∈ Σ not above ℓ. (b) (Corrected Proposition 2.6.7.) Let S be free of rank r over O_λ/λ^{m−m₀} and (Ψ₁, …, Ψ_r) an (S, γ)-abundant tuple realised by γ-associated places w_i. Put c = 𝔣(r)d_R and let A be the matrix of s ↦ (θ_S(Ψ_i)(s))_i in a basis e₁, …, e_r of S, after identifying the λ^{m−m₀}-torsion of (R̄^{(m)})^{h_γ} with O_λ/λ^{m−m₀}; abundance says that the image of A contains λ^c(O_λ/λ^{m−m₀})^r. Then there is an integral matrix C with AC = CA = λ^c·I in the finite coefficient ring, and the elements s_j = Ce_j ∈ S satisfy loc_{w_i}(s_j) = 0 for i ≠ j and exp_λ(loc_{w_i}(s_i), H¹_ns(F_{w_i}, R̄^{(m)})) ≥ m − m₀ − 𝔣(r)d_R; the s_j span a submodule containing λ^{𝔣(r)d_R}S and form a basis of S when 𝔣(r)d_R = 0. For r = 2 and a primitive v ∈ S one can moreover choose a primitive t ∈ S with loc_{w₁}(t) = 0 and exp_λ(loc_{w₂}(t)) ≥ m − m₀ − 𝔣(2)d_R after possibly interchanging the two places. The printed statement (a basis for every abundant tuple) is false when the loss is positive.

**Suggested declarations.** `TauCeti.ErrorTolerant.uniform_finite_local_annihilation`, `TauCeti.ErrorTolerant.abundant_local_diagonalization`, `TauCeti.ErrorTolerant.scaled_inverse`.

**Hypotheses.**

- as in ES.1/abundant-tuples
- for (a): the purity and polarisation hypotheses

**Construction or proof.**

1. (a): local cohomology H¹_ns at w ∤ ℓ of a pure weight −1 lattice is finite, of exponent bounded independently of m; saturation makes S^{(m)} free and its localisation factor through the torsion of the local group.
2. (b): linear algebra over the discrete valuation ring: use Smith normal form over the DVR: if c < m−m₀, each nonzero diagonal exponent is at most c, giving an integral scaled inverse of a suitable lift and a reduction C with AC=CA=λ^cI; if c ≥ m−m₀ take C=0. An arbitrary matrix over the finite quotient need not be invertible there; for r = 2 take t = (−u₂, u₁) from the first row π^a(u₁, u₂) of A. The localisation statement follows because loc_{w_i} on S factors through θ_S(Ψ_i) (evaluation at Frobenius, ES.1/finite-singular-decomposition).

**Acceptance checks.**

- With d_R = 0: a basis of S diagonalising the localisations, with exp ≥ m − m₀: the clean statement.
- The linear-algebra step of the printed form fails when the loss is positive: for A = (λ, 1; 0, λ) over O_λ/λ^n with n ≥ 3, whose image contains λ²(O_λ/λ^n)², there is no basis s₁, s₂ with A(s_j) supported on the j-th coordinate, since that would write A = D·B with D diagonal and B invertible, and the second row (0, λ) forces det B ∈ λO_λ. The corrected statement uses the scaled inverse C = λ²A^{-1} = (λ, −1; 0, λ).

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.1/abundant-tuples`, `EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth`, `EulerSystemsAndKolyvaginSystems:ES.1/selmer-field-saturation`, `SelmerIwasawaCohomology:L2`.

**Sources.**

- ltxzz, Proposition 2.4.6(2), arXiv v3 p. 17: Uniform annihilation of localisations.
- ltxzz, Proposition 2.6.7, arXiv v3 p. 20: The printed statement, corrected here (PAPER-LIU-ETAL-22/E2 in the register of source mistakes).
- ltxzz, Proposition 2.4.6(2), published pp.130–131; Proposition 2.6.7, published pp.134–135: Published-version collation of the stated result, expressed here in our own words.

### Self-dual descent with explicit error constants

`EulerSystemsAndKolyvaginSystems:ES.4/howard-descent-with-errors` — theorem.

**Statement.** (Castella–Grossi–Lee–Skinner, Theorem 3.2.1.) Let E/ℚ be an elliptic curve of conductor N, p ∤ 2N a prime of good ordinary reduction, K an imaginary quadratic field of discriminant prime to Np with E(K)[p] = 0, Γ the Galois group of the anticyclotomic ℤ_p-extension, R the integers of a finite extension Φ/ℚ_p, α : Γ → R^× a character with α ≠ 1, T_α = T_pE ⊗ R(α), A_α = T_α ⊗ Φ/R, and F_ord the ordinary Selmer structure. If κ_α ∈ KS(T_α, F_ord, 𝓛_E) has κ_{α,1} ≠ 0, then H¹_{F_ord}(K, T_α) has rank one and H¹_{F_ord}(K, A_α) ≅ (Φ/R) ⊕ M_α ⊕ M_α with M_α finite and length_R(M_α) ≤ length_R(H¹_{F_ord}(K, T_α)/R·κ_{α,1}) + E_α, where E_α ≥ 0 depends only on C_α, T_pE and rank_{ℤ_p}R. Here C_α = v_p(α(γ) − α^{-1}(γ)) if α ≠ α^{-1} and 0 otherwise, C_1 = min{v_p(u − 1) : u ∈ ℤ_p^× ∩ im ρ_E|_{G_{K_∞}}}, C_2 is minimal with p^{C_2}End(T_pE) ⊆ ρ_E(ℤ_p[G_ℚ]), and e = rank_{ℤ_p}(R)(C_1 + C_2 + C_α). Inputs: (i) for c₁, c₂, c₃ ∈ H¹(K, T^{(k)}) with Rc₁ + Rc₂ ⊇ 𝔪^{d₁}R^{(k)} ⊕ 𝔪^{d₂}R^{(k)} there are infinitely many ℓ ∈ 𝓛^{(k)} with ord(loc_ℓ c₃) ≥ ord(c₃) − e and R·loc_ℓc₁ + R·loc_ℓc₂ ⊇ 𝔪^{d₁+d₂+2e}(R^{(k)})²; (ii) if N ⊆ M are finitely generated torsion R-modules then their invariant factors satisfy d_i(N) ≤ d_i(M). When ρ_E|_{G_K} is surjective the error can be taken zero; the stronger Howard theorem is a comparison, not a prerequisite of the residual-reducible proof. Residual irreducibility is not assumed. The anticyclotomic character α is residually trivial.

**Suggested declarations.** `TauCeti.KolyvaginSystems.CGLS.howard_descent_with_errors`.

**Hypotheses.**

- as stated; in particular α ≠ 1 and (h1) E(K)[p] = 0
- α is congruent to the trivial character modulo the maximal ideal of R, as in CGLS §3.2 (arXiv v2 p.16).

**Construction or proof.**

1. Use ES.4/weak-cassels-structure (CGLS Proposition 3.3.2): residual-invariant vanishing, cartesian ordinary conditions and conjugate self-duality suffice; no Howard absolute residual irreducibility is assumed.
2. (i) replaces ES.1/chebotarev-nonvanishing: restriction to the field cut out by T^{(k)} has kernel killed by p^{C_1}-type constants, and the O-span of the image of Galois is controlled by C_2 and C_α.
3. Induction on the number of primes as in Howard's proof, using (ii) and the module lemmas 3.3.10–3.3.11; in the branch M = 0 the canonical injection 0 ↪ X is used and no summand is omitted (PAPER-CASTELLA-ETAL-22/E43 in the register of source mistakes).
4. The length of M_α is bounded, not only its exponent.

**Acceptance checks.**

- E_α = 0 when ρ_E is surjective on G_K.
- The bound is uniform in k: the constants C_1, C_2, C_α do not depend on the torsion exponent.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.4/weak-cassels-structure`, `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`, `EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth`.

**Sources.**

- cgls, Theorem 3.2.1, arXiv v2 p. 17: The bound with the error constant.
- cgls, Proposition 3.3.6, arXiv v2 p. 19: The Chebotarev statement with error terms.
- cgls, Lemma 3.3.9, arXiv v2 p. 22: The module lemma used in the induction.

### Cassels structure without residual irreducibility

`EulerSystemsAndKolyvaginSystems:ES.4/weak-cassels-structure` — theorem.

**Statement.** In the elliptic anticyclotomic setting of ES.4/howard-descent-with-errors, assume E(K)[p]=0, cartesianness of the propagated ordinary conditions and the symmetric conjugate-self-dual local pairing of CGLS §3.3. For each k≥1 and n∈N^(k), there is a finite R/m^k-module M^(k)(n) and ε∈{0,1}, independent of k and n, such that H¹_{F_ord(n)}(K,T_α/m^kT_α) ≃ (R/m^k)^ε ⊕ M^(k)(n) ⊕ M^(k)(n). The residual representation may be reducible. This is the specialized weak-hypothesis pairing and parity input; it does not assert the full Howard rigidity theorem under these weaker hypotheses. The anticyclotomic character α is residually trivial.

**Suggested declarations.** `TauCeti.KolyvaginSystems.CGLS.weak_cassels_uniform`, `TauCeti.KolyvaginSystems.SelfDual.weak_cassels_structure`.

**Hypotheses.**

- E/K, p, R, α and T_α are exactly the setting of CGLS §3.2; p∤2N, good ordinary reduction, disc(K) prime to Np.
- E(K)[p]=0; ordinary conditions cartesian; conjugate self-duality as in CGLS §3.3.
- α is congruent to the trivial character modulo the maximal ideal of R, as in CGLS §3.2 (arXiv v2 p.16).

**Construction or proof.**

1. The invariant/torsion identifications use CGLS Lemma 3.3.1, which uses vanishing residual invariants rather than irreducibility.
2. Apply the Cassels pairing argument of Howard Proposition 1.5.5 using only (h1), cartesianness and the symmetric self-dual conditions. CGLS Proposition 3.3.2 verifies these hypotheses in the ordinary twist setting.
3. Howard Lemma 1.5.3 gives parity invariance under the same weak hypotheses; CGLS explicitly records independence of k and n.

**Acceptance checks.**

- The statement retains every displayed hypothesis and the indicated coefficient convention.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`, `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`, `SelmerIwasawaCohomology:L2`.

**Sources.**

- cgls, Proposition 3.3.2 and Lemma 3.3.1, arXiv v2 pp. 18–19: The weaker structure and invariant hypotheses.
- howard, Proposition 1.5.5 and Lemma 1.5.3, pp. 1452–1453: Pairing and parity proof used with the hypotheses specified by CGLS.

### All-prime CM-point descent with bounded error

`EulerSystemsAndKolyvaginSystems:ES.4/nekovar-all-prime-descent` — theorem.

**Statement.** Fix the data of Nekovář §3.1: a totally real field F, a quaternion algebra B split at one real place, its compact Shimura curve N_H, an F-simple GL₂-type quotient A_j of its Jacobian with End_F(A_j)=O_{L_j}, a totally imaginary quadratic K/F admitting an embedding into B, a CM point x, and a finite character α of Gal(K(x)/K) valued in O_L with L⊇L_j. Let β be its faithful factor on H=K(α), and use the integral isogenous O_L-linear variety A and point y of §5.19. Assume A_j acquires no CM over any totally imaginary quadratic extension of F contained in H, and e_β(y) is non-torsion. For each prime ideal 𝔭 of O_L above any rational prime p, choose O_𝔭 and a uniformizer ϖ. There is C(𝔭)≥0, independent of M and zero for all but finitely many 𝔭, such that ϖ^{C(𝔭)}·(S(A/H,A[ϖ^M])^(β)/O_𝔭 κ₁)=0 for all sufficiently large M. Here κ₁=ϖ^{C₁(𝔭)}δ(e_β(y)), and ϖ is the chosen uniformizer, as in §7.2.1. There is no residual irreducibility or odd-prime restriction. The statement is an annihilator/exponent bound, not an equality of lengths or a square-index formula.

**Suggested declarations.** `TauCeti.KolyvaginSystems.Nekovar.all_prime_error_descent`, `TauCeti.KolyvaginSystems.Nekovar.errorConstant_quadratic`, `TauCeti.KolyvaginSystems.Nekovar.errorConstant_nonquadratic`.

**Hypotheses.**

- Exactly the CM-point and GL₂-type setting of §3.1, including the quaternion embedding and the non-CM condition (*).
- e_β(y) non-torsion; p arbitrary; M sufficiently large for the fixed arithmetic data.

**Construction or proof.**

1. Constants C₀ (point divisibility), C₁ (local component groups), C₂ (restriction kernel), C₃ (order/image conductor), C₄ (overlap of β and β⁻¹), C₅=ord_𝔭[H:K], and C₆=ord_𝔭 deg(ϕ) depend on fixed data and 𝔭, not M. Sections 6.1–6.4 bound the restriction and pairing cokernels uniformly.
2. For β²=1 the two annihilation relations of Proposition 7.2.3, detected at successive Chebotarev primes, give C=2C₀+2C₁+4C₂+4C₃+C₅+C₆+21 ord_𝔭(2) (§7.5).
3. For β²≠1, §7.6.4 chooses the second prime using the five-coordinate determinant-avoidance argument of Proposition 6.6.2. The resulting bound is C=4C₀+4C₁+7C₂+7C₃+5C₄+2C₅+2C₆+38 ord_𝔭(2).
4. Every error constant vanishes at almost all 𝔭. ES.4 supplies this finite-level annihilator bound to HeegnerPointEulerSystems HE.7; that owner passes to Mordell–Weil and Sha finiteness in Nekovář Theorem 3.2 using §7.1.2. Noncommutative maximal-order algebra in Proposition 6.4.3 is the exact CA.7 supplier request, not the commutative L6 theory.

**Acceptance checks.**

- The statement retains every displayed hypothesis and the indicated coefficient convention.
- The Lean prototype uses geometric torsion points, their O_L-action, the coefficient completion and the finite Selmer kernel. Nekovář §3.1/§5.19 geometry and condition (*) are explicitly omitted from the prototype because their supplier carrier has no pinned signature; the mathematical statement retains them. The prototype parameters alone are not sufficient hypotheses for the source theorem.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.3/derivative-operators`, `SelmerIwasawaCohomology:L2`, `ClassicalArithmeticCompletion:CA.7/existence-of-maximal-orders`, `ClassicalArithmeticCompletion:CA.7`, `HeegnerPointEulerSystems:HE.7`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Sources.**

- nekovar, Theorem 3.2, pp. 18–19; §5.19; Proposition 6.4.3, pp. 38–40; Theorem 7.3 and §§7.4–7.6, pp. 45–51 (author copy): CM-point finiteness and uniform annihilator bounds including p=2.

## ES.5. Primitivity, module structure and self-dual descent

**Planets:** Primitive Kolyvagin system; Rank-one freeness of Kolyvagin systems; Structure theorem for the dual Selmer group; Howard's hypotheses H.0–H.5; Howard's self-dual Kolyvagin bound.

### Divisibility indices, elementary divisors and primitivity

`EulerSystemsAndKolyvaginSystems:ES.5/divisibility-invariants` — definition.

**Statement.** Let (T, F, P) be a Selmer triple and κ ∈ KS(T). (a) R principal artinian of length k: ∂^{(r)}(κ) = min{k − length(Rκ_n) : n ∈ N, ν(n) = r} and e_i(κ) = ∂^{(i)}(κ) − ∂^{(i+1)}(κ) for i ≥ 0. (b) R a discrete valuation ring: ∂^{(r)}(κ) = max{j : κ_n ∈ m^j H¹_{F(n)}(K, T/I_nT) ⊗ G_n for every n ∈ N with ν(n) = r} ∈ ℕ ∪ {∞}, ∂^{(0)}(κ) = max{j : κ_1 ∈ m^jH¹_F(K, T)}, e_i(κ) = ∂^{(i)}(κ) − ∂^{(i+1)}(κ) for i ≥ ord(κ), and ∂^{(∞)}(κ) = min{∂^{(r)}(κ) : r ≥ 0}. κ is primitive if its image in KS(T/mT) is nonzero. In the DVR case, the index ∂^{(0)}(κ) is ∞ when κ_1=0. In the artinian case use the truncated definition k−length(Rκ_1), which equals k for κ_1=0, not ∞. The two conventions agree through limits for nonzero DVR systems under the rank-one admissibility hypotheses.

**Suggested declarations.** `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndex`, `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndex_zero`, `TauCeti.KolyvaginSystems.KolyvaginSystem.elementaryDivisor`, `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndexInfty`, `TauCeti.KolyvaginSystems.KolyvaginSystem.IsPrimitive`, `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndex_smul`, `TauCeti.KolyvaginSystems.KolyvaginSystem.not_isPrimitive_smul`, `TauCeti.KolyvaginSystems.KolyvaginSystem.ord_eq`.

**Hypotheses.**

- For the definitions: R principal artinian (length k) or a DVR, with its specified Kolyvagin-system carrier.
- For monotonicity, scaling, elementary-divisor and order characterisations: the admissibility hypotheses of rank-one-module-theorem and χ(T)=1; use nonzero κ for DVR elementary divisors.

**Construction or proof.**

1. In the artinian case length(Rκ_n) = k − (largest j with κ_n ∈ m^j of a free stalk); the two definitions agree in the limit: ∂^{(s)}(κ) = lim_k ∂^{(s)}(κ^{(k)}) (Theorem 5.2.12(i)).
2. Primitivity uses the reduction map KS(T) → KS(T/mT) of ES.3/kolyvagin-system-module; for core rank one it is equivalent to κ generating KS(T), and to κ_n generating the stub stalk ℋ′(n) for one n with ℋ′(n) ≠ 0, or for all n (Corollary 4.5.4).

**Uses.**

- Mazur–Rubin 2004, Theorems 5.2.2 and 5.2.12: ∂^{(0)} bounds the length of the dual Selmer group and the e_i give its elementary divisors.
- RankZeroOneBSD BSD.7a; HeegnerPointEulerSystems HE.6: applications separate nonzero, primitive and analytic statements using these invariants.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndex` | data | ∂^{(r)}(κ) ∈ ℕ∞ for r ≥ 0. |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndex_zero` | characterisation | ∂^{(0)}(κ) = sup{j : κ_1 ∈ m^j H¹_F(K, T)}; it is ⊤ iff κ_1 = 0 (R a discrete valuation ring, H¹_F torsion-free). |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.elementaryDivisor` | data | e_i(κ) = ∂^{(i)}(κ) − ∂^{(i+1)}(κ), defined for i ≥ ord(κ). |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndexInfty` | data | ∂^{(∞)}(κ) = inf_r ∂^{(r)}(κ). |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.IsPrimitive` | structure | The image of κ in KS(T/mT) is nonzero. |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.divIndex_smul` | relation | Under the rank-one admissibility hypotheses, over a DVR ∂^{(r)}(πκ)=∂^{(r)}(κ)+1 with ∞+1=∞. Over a principal artinian ring of length k, ∂^{(r)}(πκ)=min(k,∂^{(r)}(κ)+1). |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.not_isPrimitive_smul` | relation | π·κ is not primitive. |
| `TauCeti.KolyvaginSystems.KolyvaginSystem.ord_eq` | characterisation | For nonzero κ under the rank-one admissibility hypotheses: over a DVR ord(κ)=min{r:∂^{(r)}(κ)<∞}; over a principal artinian ring ord(κ)=min{r:∂^{(r)}(κ)<k}. Set ord(0)=∞ in both cases. |

**Unit tests.**

- `divIndex_zero_order` (degenerate): The zero system has infinite order.
- `divIndex_zero_artinian` (degenerate): In a length-k artinian ring, the zero system has partial invariant k at every nonempty conductor-size level.
- `divIndex_scaling` (computation): Over a DVR with torsion-free size-zero stalks, initial index 3 becomes 5 after multiplication by π².

**Acceptance checks.**

- Over a DVR under rank-one admissibility, ∂^{(r)}(πκ)=∂^{(r)}(κ)+1 and e_i(πκ)=e_i(κ) for their finite range. Over length-k artinian rings the values truncate at k, so elementary divisors need not remain unchanged.
- The order uses threshold ∞ over a DVR and k over an artinian ring.
- Additional arithmetic check: For κ=0 over a DVR, ∂^{(r)}=∞ for all r; over a principal artinian ring of length k, ∂^{(r)}=k. In both cases ord(κ)=∞ and κ is not primitive.
- Additional arithmetic check: For R = k a field, κ is primitive iff κ ≠ 0.
- Additional arithmetic check: Over a DVR, for primitive κ₀ with (κ₀)_1≠0, πκ₀ has nonzero initial class and is not primitive. In an artinian quotient the initial class can be killed by π, so nonvanishing must be checked separately.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`, `EulerSystemsAndKolyvaginSystems:ES.4/stub-sheaf`, `mathlib:Module.length`.

**Sources.**

- mr-ks, Definition 5.2.11, pp. 57–58: The invariants over a discrete valuation ring.
- mr-ks, Definition 4.5.5, p. 49: Primitivity.
- mr-ks, Definition 4.5.7, p. 49: The artinian invariants.

### Kolyvagin systems in core rank one

`EulerSystemsAndKolyvaginSystems:ES.5/rank-one-module-theorem` — theorem.

**Statement.** Let (T, F, P) satisfy (H.0)–(H.6) with χ(T) = 1. (a) R principal artinian of length k: KS(T) is free of rank one over R; for a core vertex n, κ ↦ κ_n is an isomorphism KS(T) ≅ ℋ(n); if κ_m ≠ 0 generates m^jℋ′(m) then κ_n generates m^jℋ′(n) for every n; for j ≥ k restriction KS(T, P) → KS(T, P ∩ P_j) is an isomorphism; for j ≤ k reduction KS(T) → KS(T/m^jT) is surjective; and KS(T) → K̄S(T) is an isomorphism. (b) R a discrete valuation ring, (H.0)–(H.5), torsion-free local quotients, P = P_1: KS(T) ≅ lim_k KS(T/m^kT, P_k) ≅ K̄S(T), and KS(T) is free of rank one, generated by a primitive κ. If χ(T) = 0 then KS(T) = 0 in both cases; if χ(T) ≥ 2 and R is artinian, KS(T) contains free modules of every rank.

**Suggested declarations.** `TauCeti.KolyvaginSystems.rank_one_module_artinian`, `TauCeti.KolyvaginSystems.rank_one_module`.

**Hypotheses.**

- (H.0)–(H.6) (artinian), or (H.0)–(H.5) with torsion-free local quotients (discrete valuation ring)
- χ(T) = 1 for the main statements

**Construction or proof.**

1. (a): KS(T) = Γ(ℋ′) (ES.4/stub-sheaf), a locally cyclic sheaf with trivial monodromy and hubs at the core vertices; apply ES.4/sheaf-monodromy.
2. (b): injectivity of KS(T) → lim KS(T/m^k) (Lemma 5.2.7); surjectivity by assembling κ_n from κ^{(j)}_n with j maximal such that n ∈ N_j; the transition maps are surjective by Lemma 5.2.8.

**Acceptance checks.**

- For T = ℤ_p(1) ⊗ ρ^{-1}, ρ even nontrivial: KS(T) is free of rank one, generated up to a unit by the cyclotomic-unit system when that system is primitive.
- Reduction surjectivity: every Kolyvagin system modulo m^j lifts.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.4/stub-sheaf`, `EulerSystemsAndKolyvaginSystems:ES.4/sheaf-monodromy`, `EulerSystemsAndKolyvaginSystems:ES.4/core-vertices`, `EulerSystemsAndKolyvaginSystems:ES.5/divisibility-invariants`.

**Sources.**

- mr-ks, Corollary 4.5.2, p. 48: The artinian statement.
- mr-ks, Theorem 5.2.10, p. 57: The statement over a discrete valuation ring.

### Structure of the dual Selmer group from a Kolyvagin system

`EulerSystemsAndKolyvaginSystems:ES.5/structure-theorem` — theorem.

**Statement.** Let χ(T) = 1 and 0 ≠ κ ∈ KS(T). (a) R = k a field: dim KS(T) = 1, κ_n ≠ 0 iff n is a core vertex, and dim_k H¹_{F^*}(ℚ, T^*) = ord(κ). (b) R principal artinian of length k, κ_1 ≠ 0: ∂^{(0)}(κ) ≥ ∂^{(1)}(κ) ≥ ⋯, e_0(κ) ≥ e_1(κ) ≥ ⋯ ≥ 0 and H¹_{F^*}(ℚ, T^*) ≅ ⊕_{i ≥ 0} R/m^{e_i(κ)}; if κ is primitive and κ_1 ≠ 0 then length H¹_{F^*}(ℚ, T^*) = k − length(Rκ_1) = max{i : κ_1 ∈ m^iH¹_F(ℚ, T)}, and if κ_1 = 0 then length H¹_{F^*}(ℚ, T^*) ≥ k. (c) R a discrete valuation ring: ∂^{(s)}(κ) is nonincreasing and finite for s ≥ ord(κ); the e_i(κ) are nonincreasing, nonnegative and independent of κ ≠ 0, as is ord(κ); corank_R H¹_{F^*}(ℚ, T^*) = ord(κ); H¹_{F^*}(ℚ, T^*)/(H¹_{F^*}(ℚ, T^*))_div ≅ ⊕_{i ≥ ord(κ)} R/m^{e_i(κ)}; its length is ∂^{(ord κ)}(κ) − ∂^{(∞)}(κ); and κ is primitive iff ∂^{(∞)}(κ) = 0. Hence: length H¹_{F^*}(ℚ, T^*) is finite iff κ_1 ≠ 0; length H¹_{F^*}(ℚ, T^*) ≤ ∂^{(0)}(κ) with equality iff κ is primitive; and length H¹_{F^*}(ℚ, T^*) = length(H¹_F(ℚ, T)/L(T)) for the module of L-values L(T).

**Suggested declarations.** `TauCeti.KolyvaginSystems.structure_corank`, `TauCeti.KolyvaginSystems.structure_finite_quotient`.

**Hypotheses.**

- the hypotheses of rank-one-module-theorem in each case
- χ(T) = 1

**Construction or proof.**

1. (b): if κ_m generates m^jℋ′(m), then ∂^{(r)}(κ) = min{k, j + Σ_{i>r} d_i} for H¹_{F^*}(ℚ, T^*) ≅ ⊕R/m^{d_i} (Proposition 4.5.8), because the minimum of λ(n, T^*) over n with ν(n) = r is Σ_{i>r} d_i by ES.4/vertex-step and ES.1/chebotarev-nonvanishing.
2. (c): pass to the limit over T/m^k using rank-one-module-theorem(b) and ∂^{(s)}(κ) = lim ∂^{(s)}(κ^{(k)}).
3. The final equality: KS(T) is generated by a primitive κ, L(T) = Rκ_1, and H¹_F(ℚ, T) is free of rank corank H¹_{F^*} + 1.

**Acceptance checks.**

- Three separate conclusions: κ_1 ≠ 0 gives finiteness and an upper bound; primitivity gives equality; an analytic formula needs in addition an identification of κ_1 with an L-value.
- The higher e_i give every elementary divisor of the dual Selmer group, not only its exponent or length.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.5/rank-one-module-theorem`, `EulerSystemsAndKolyvaginSystems:ES.5/divisibility-invariants`, `EulerSystemsAndKolyvaginSystems:ES.4/kolyvagin-bound`, `EulerSystemsAndKolyvaginSystems:ES.4/vertex-step`, `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing`.

**Sources.**

- mr-ks, Theorem 5.2.12, p. 58: The structure theorem over a discrete valuation ring.
- mr-ks, Corollary 5.2.13, p. 58: Sharpness under primitivity.
- mr-ks, Theorem 4.5.9, p. 50: The artinian structure theorem.

### The Kolyvagin-constructed dual Selmer group

`EulerSystemsAndKolyvaginSystems:ES.5/kolyvagin-dual-selmer` — construction.

**Statement.** Let S be a sheaf on X(P) with isomorphisms S(e_{n,nℓ}) ≅ S(e_ℓ) for all edges (for the Selmer sheaf with I_ℓ = 0 for all ℓ ∈ P, given by generators of the G_ℓ). For a vertex n let ψ_n : S(n) → ⊕_{ℓ | n} S(e_ℓ) be the sum of the vertex-to-edge maps. For a global section κ, Sel^*(κ; n) = (⊕_{ℓ | n} S(e_ℓ))/Σ_{d | n} ψ_d(Rκ_d) and Sel^*(κ) = colim_n Sel^*(κ; n). For the Selmer sheaf there is a canonical map H¹_{F^*}(ℚ, T^*) → Hom(Sel^*(κ), ℚ_p/ℤ_p) with kernel ∩_n H¹_{(F^*)_n}(ℚ, T^*), the classes vanishing at every prime of P. Theorem: if χ(T) = 1, (H.4a) holds, the image of R → End(T) lies in that of ℤ_p[[G_ℚ]] and κ is primitive, this map is an isomorphism. For general (T, F, P), Sel^*_∞(κ) = lim_k Sel^*(κ^{(k)}).

**Suggested declarations.** `TauCeti.KolyvaginSystems.kolyvaginDualSelmer`, `TauCeti.KolyvaginSystems.kolyvaginDualSelmer_map`, `TauCeti.KolyvaginSystems.dualSelmerToKolyvaginDual`, `TauCeti.KolyvaginSystems.ker_dualSelmerToKolyvaginDual`, `TauCeti.KolyvaginSystems.dualSelmerToKolyvaginDual_bijective`.

**Hypotheses.**

- I_ℓ = 0 for ℓ ∈ P (after reduction modulo m^k and restriction to P_k)

**Construction or proof.**

1. Global duality for F_n ≤ F (ES.1/modified-selmer-structures; SelmerIwasawaCohomology L2/selmer-structure-poitou-tate) gives 0 → H¹_{(F^*)_n} → H¹_{F^*} → Hom(⊕_{ℓ|n} H¹_s(ℚ_ℓ, T)/image(H¹_{F^n}(ℚ, T)), ℚ_p/ℤ_p), and κ_d ∈ H¹_{F^n} for d | n.
2. Surjectivity under primitivity: Lemmas 4.5.13–4.5.14 and Proposition 4.5.15, walking through core vertices.

**Uses.**

- Mazur–Rubin 2004, Theorem 4.5.12 and Remark 4.5.16: generators and relations for the dual Selmer group in terms of κ.
- ES.5/structure-theorem: an alternative route to the elementary divisors.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.kolyvaginDualSelmer` | constructor | Sel^*(κ; n) and Sel^*(κ) = colim_n Sel^*(κ; n). |
| `TauCeti.KolyvaginSystems.kolyvaginDualSelmer_map` | functoriality | For n \| m the natural map Sel^*(κ; n) → Sel^*(κ; m). |
| `TauCeti.KolyvaginSystems.dualSelmerToKolyvaginDual` | constructor | The canonical map H¹_{F^*}(ℚ, T^*) → Hom(Sel^*(κ), ℚ_p/ℤ_p). |
| `TauCeti.KolyvaginSystems.ker_dualSelmerToKolyvaginDual` | characterisation | Its kernel is ⨅_n H¹_{(F^*)_n}(ℚ, T^*). |
| `TauCeti.KolyvaginSystems.dualSelmerToKolyvaginDual_bijective` | other | Bijective when χ(T) = 1, (H.4a), the End(T) condition and κ primitive. |

**Unit tests.**

- `kolyvaginDualSelmer_one` (degenerate): The finite dual edge presentation at conductor one is zero.
- `kolyvaginDualSelmer_zero_system` (computation): For κ=0, the presentation is the direct sum of the designated edge modules.
- `kolyvaginDualSelmer_scaled_edge` (non-example): A free DVR edge modulo multiplication by its uniformizer is nonzero; a scaled nonprimitive system cannot force that edge quotient to vanish.

**Acceptance checks.**

- The construction recovers the Pontryagin dual of the whole dual Selmer group, as a module, from the classes κ_n.
- For a non-primitive κ the map need not be surjective.
- Additional arithmetic check: For κ = πκ₀ with κ₀ primitive and H¹_{F^*}(ℚ, T^*) = 0, Sel^*(κ; ℓ) = S(e_ℓ)/πS(e_ℓ) ≠ 0 at a core edge, so the map from 0 is not surjective.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.4/selmer-sheaf`, `EulerSystemsAndKolyvaginSystems:ES.5/divisibility-invariants`, `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`, `SelmerIwasawaCohomology:L2`, `SelmerIwasawaCohomology:L2/pontryagin-dual`.

**Sources.**

- mr-ks, Definition 3.3.1, p. 25: Definition of Sel^*(κ; n).
- mr-ks, Theorem 4.5.12, p. 51: The isomorphism under primitivity.

### Scaling, vanishing leading class and a non-primitive arithmetic system

`EulerSystemsAndKolyvaginSystems:ES.5/sharpness-examples` — application.

**Statement.** (a) Scaling: for κ primitive with κ_1 ≠ 0 over a discrete valuation ring (χ(T) = 1), length H¹_{F^*}(ℚ, T^*) = ∂^{(0)}(κ); for κ′ = πκ, ∂^{(0)}(κ′) = ∂^{(0)}(κ) + 1 > length H¹_{F^*}(ℚ, T^*), the e_i are unchanged and κ′ is not primitive: the bound for κ′ is true and not sharp. (b) A nonzero Kolyvagin system with κ_1 = 0 is a valid element of KS(T); for it ∂^{(0)} = ∞, the bound is vacuous, and by the structure theorem H¹_{F^*}(ℚ, T^*) is infinite when χ(T) = 1. For κ=0 the bound remains vacuous and gives no finiteness conclusion. (c) Kato's Kolyvagin system for T_pE: if L(E, 1) ≠ 0, p satisfies the hypotheses of Mazur–Rubin 2004 Theorem 6.2.4(ii) and p divides a Tamagawa factor c_ℓ for some ℓ ≠ p, then κ^{Kato} is not primitive: it is a Kolyvagin system for the finer structure F_u with unramified conditions away from p, whose dual Selmer group is larger by the Tamagawa defect. The defect is recorded as a length.

**Suggested declarations.** `TauCeti.KolyvaginSystems.scaling_strict_bound`, `TauCeti.KolyvaginSystems.nonzero_zero_initial_infinite`.

**Hypotheses.**

- χ(T) = 1; for (c) the hypotheses of Theorem 6.2.4(ii) of the source

**Construction or proof.**

1. (a), (b): ES.5/divisibility-invariants and ES.5/structure-theorem. (c): Remark A.5 — the classes lie in H¹_{(F_u)(n)}; apply the bound for F_u and compare H¹_{F_u^*} with H¹_{F_can^*}.

**Acceptance checks.**

- A nonzero point or class is not automatically primitive.
- Sharpness is a property of the system, checked through reduction modulo m, not of the representation.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.5/structure-theorem`, `EulerSystemsAndKolyvaginSystems:ES.5/divisibility-invariants`, `EulerSystemsAndKolyvaginSystems:ES.3/euler-to-kolyvagin`.

**Sources.**

- mr-ks, Proposition 6.2.6, p. 75: A naturally occurring non-primitive system.

### Howard's self-dual Selmer triples and hypotheses H.0–H.5

`EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses` — definition.

**Statement.** Let K be an imaginary quadratic field, τ a complex conjugation, R a coefficient ring (complete noetherian local, finite residue field of characteristic p; in §1.5 principal artinian, in §1.6 a discrete valuation ring) and T an R-module with continuous G_K-action. 𝓛₀ is the set of rational primes ℓ inert in K (prime to p and to the ramification of T), λ the prime of K above ℓ; I_ℓ is the smallest ideal of R containing ℓ + 1 for which Fr_λ acts trivially on T/I_ℓT; 𝓛_k = {ℓ ∈ 𝓛₀ : I_ℓ ⊆ p^kR}; G_ℓ = k_λ^×/k_ℓ^×; I_n = Σ_{ℓ | n} I_ℓ and G_n = ⊗_{ℓ | n} G_ℓ. The transverse condition at λ is defined by the maximal p-subextension of K[ℓ]_λ/K_λ, K[ℓ] the ring class field of conductor ℓ. A Selmer triple (T, F, 𝓛) has 𝓛 ⊆ 𝓛₀ disjoint from Σ(F); Kolyvagin systems κ_n ∈ H¹_{F(n)}(K, T/I_nT) ⊗ G_n, n ∈ N(𝓛), satisfy the finite–singular relations at every ℓ with nℓ ∈ N(𝓛). Hypotheses: H.0 T is free of rank two. H.1 T̄ is absolutely irreducible. H.2 there is a Galois extension F/ℚ containing K with G_F acting trivially on T and H¹(F(μ_{p^∞})/K, T̄) = 0. H.3 F is cartesian on Quot(T) at every v ∈ Σ(F). H.4 there is a perfect symmetric R-bilinear pairing ( , ) : T × T → R(1) with (s^σ, t^{τστ^{-1}}) = (s, t)^σ, and F is its own exact orthogonal complement under the induced pairings H¹(K_v, T) × H¹(K_{v̄}, T) → R. H.5 (a) the action of G_K on T̄ extends to G_ℚ and τ splits T̄ into one-dimensional eigenspaces T̄^±; (b) F on T̄ is stable under G_ℚ; (c) the residual pairing satisfies (s^τ, t^τ) = (s, t)^τ.

**Suggested declarations.** `TauCeti.KolyvaginSystems.SelfDual.Hypotheses`, `TauCeti.KolyvaginSystems.SelfDual.inertPrimes`, `TauCeti.KolyvaginSystems.SelfDual.Hypotheses.modify`, `TauCeti.KolyvaginSystems.SelfDual.Hypotheses.baseChange`, `TauCeti.KolyvaginSystems.SelfDual.Hypotheses.ofWeilPairing`.

**Hypotheses.**

- K imaginary quadratic
- p odd

**Construction or proof.**

1. Howard Proposition 1.1.7 gives finite and transverse rank-two local conditions when the inert conductor ideal vanishes. Its ring-class restriction kernel and k_λ×/k_ℓ× reciprocity comparison are imported from HE.0 and CFT. They are distinct from the rank-one-coinvariant Mazur–Rubin polynomial construction; do not instantiate that construction at an inert rank-two prime.
2. Howard Remark 1.3.1 supplies admissible scalar changes and Lemma 1.5.1 supplies modification at primes whose conductor ideal vanishes. The prototype makes same-coefficient modification with I_n=0 and scalar quotient R/I explicit; arbitrary coefficient changes require the corresponding dictionary and retained hypotheses.
3. For R = ℤ_p, T = T_pE and (s, t) = e(s, t^τ) with e the Weil pairing, H.4 holds (Remark 1.3.2).

**Uses.**

- Howard, Theorems 1.6.1 and 2.2.10: the standing hypotheses of the self-dual descent.
- HeegnerPointEulerSystems HE.5–HE.6; GeneralizedHeegnerCycles GH.5: applications verify H.0–H.5 for their representation and import the theorem.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.KolyvaginSystems.SelfDual.Hypotheses` | structure | The record H.0–H.5, one field for each hypothesis, with the pairing of H.4 as data. |
| `TauCeti.KolyvaginSystems.SelfDual.inertPrimes` | data | 𝓛_k(T) for k ≥ 0 and the ideals I_ℓ ∋ ℓ + 1. |
| `TauCeti.KolyvaginSystems.SelfDual.Hypotheses.modify` | functoriality | For n with inert conductor ideal I_n=0, the same-coefficient modification preserves H.0–H.5. |
| `TauCeti.KolyvaginSystems.SelfDual.Hypotheses.baseChange` | functoriality | Admissible quotient R→R/I preserves the displayed Howard hypotheses, with explicit propagated local structures. |
| `TauCeti.KolyvaginSystems.SelfDual.Hypotheses.ofWeilPairing` | example | The Weil pairing combined with conjugation constructs the perfect symmetric pairing data; local exact self-orthogonality is a separate hypothesis for H.4. |

**Unit tests.**

- `SelfDual.conductorIdeal_one` (degenerate): The inert conductor-one ideal is zero.
- `SelfDual.tame_group_inert` (computation): At a rational inert prime ℓ, k_λ×/k_ℓ× has order ℓ+1, not ℓ²−1.
- `SelfDual.conductorIdeal_inert` (characterisation): For q above an inert ℓ in 𝓛_k, ℓ+1 lies in pᵏR.

**Acceptance checks.**

- These hypotheses differ from Mazur–Rubin's by the self-duality H.4 and by the absence of an analogue of (H.4a)/(p > 4): they are a separate record.
- With H.4, χ-type invariants are replaced by the parity ε ∈ {0, 1} of ES.5/cassels-structure.
- Additional arithmetic check: For ℓ ∈ 𝓛_k and R = ℤ/p^k, H¹_f(K_λ, T) and H¹_tr(K_λ, T) are free of rank two, in contrast with rank one at Mazur–Rubin's primes.
- Additional arithmetic check: An inert prime ℓ ∈ 𝓛_k is not in Mazur–Rubin's P_k for K: T/(Fr_λ − 1)T is free of rank two, not one.
- Additional arithmetic check: For R a field H.3 is automatic.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`, `EulerSystemsAndKolyvaginSystems:ES.1/transverse-condition`, `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`, `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`, `EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal`, `HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients`.

**Sources.**

- howard, §1.3, hypotheses H.0–H.5, p. 1446: The hypothesis list.
- howard, §1.3, hypothesis H.4, p. 1446: The self-duality hypothesis.
- howard, Definition 1.2.3, p. 1445: Kolyvagin systems over an imaginary quadratic field.

### The generalised Cassels pairing and the structure R^ε ⊕ M ⊕ M

`EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure` — theorem.

**Statement.** Let R be principal artinian of length k and (T, F, 𝓛) satisfy H.1, H.3 and H.4 (with vanishing residual invariants). (a) For positive integers s, t with s + t ≤ k there is a pairing ( , )_{s,t} : H¹_F(K, T/m^sT) × H¹_{F^*}(K, T^*[m^t]) → R whose left and right kernels are the images of H¹_F(K, T/m^{s+t}T) and of π^s : H¹_{F^*}(K, T^*[m^{s+t}]) → H¹_{F^*}(K, T^*[m^t]). (b) There are an R-module M and ε ∈ {0, 1} with H¹_F(K, T) ≅ R^ε ⊕ M ⊕ M. (c) Under H.0–H.5 with 𝓛 ⊆ 𝓛_k, for n ∈ N(𝓛) write H¹_{F(n)}(K, T) ≅ R^ε ⊕ M(n) ⊕ M(n); then ε ≡ ρ(n) = ρ(n)^+ + ρ(n)^− (mod 2), where ρ(n)^± = dim H¹_{F(n)}(K, T̄)^±, and ε is independent of n: if loc_ℓ(H̄(n)^±) ≠ 0 then ρ(nℓ)^± = ρ(n)^± − 1, and otherwise ρ(nℓ)^± = ρ(n)^± + 1.

**Suggested declarations.** `TauCeti.KolyvaginSystems.SelfDual.cassels_structure`.

**Hypotheses.**

- H.1, H.3, H.4; R principal artinian
- H.0–H.5 and 𝓛 ⊆ 𝓛_k for (c)

**Construction or proof.**

1. (a): Flach's construction of the Cassels–Tate pairing by lifting cocycles; the kernels by global duality.
2. (b): with H = H¹_F(K, T), the spaces V_s = H[m^s]/mH[m^{s+1}] carry nondegenerate alternating pairings induced by ( , )_{s,1} via H.4 and ES.0/selmer-torsion-identification, so are even-dimensional; conclude by the structure theorem for modules over R.
3. (c): Lemma 1.5.3 by global duality for F_ℓ(n) ≤ F(n), F(nℓ) ≤ F^ℓ(n) on each eigenspace.

**Acceptance checks.**

- For T = E[p^k] with the classical structure: Sel_{p^k} ≅ (ℤ/p^k)^ε ⊕ M ⊕ M.
- Self-duality replaces the core rank: ε is a parity, not a rank difference.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`, `EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification`, `SelmerIwasawaCohomology:L2`.

**Sources.**

- howard, Proposition 1.4.1, p. 1448: The pairing.
- howard, Lemma 1.5.3, p. 1450: Parity is constant on the graph.

### Stub Selmer modules in the self-dual setting

`EulerSystemsAndKolyvaginSystems:ES.5/howard-stub` — theorem.

**Statement.** In the setting of cassels-structure(c) put λ(n) = length M(n) and the stub Selmer module S(n) = m^{λ(n)}H¹_{F(n)}(K, T). Then for nℓ ∈ N(𝓛): loc_ℓ(S(n)) = 0 implies loc_ℓ(S(nℓ)) = 0. Moreover, with a, b, δ ≥ 0 the lengths in Howard's Lemma 1.5.8 for the diamond of H_ℓ(n) ⊆ H(n), H(nℓ) ⊆ H^ℓ(n), one has λ(nℓ) = λ(n) + k − a − b − δ.

**Suggested declarations.** `TauCeti.KolyvaginSystems.SelfDual.howard_stub_propagation`.

**Hypotheses.**

- H.0–H.5, R principal artinian of length k, 𝓛 ⊆ 𝓛_k

**Construction or proof.**

1. H^ℓ(n)/(H(n) + H(nℓ)) ≅ (R/m^δ)² (Lemma 1.5.7) and the local modules are free of rank two; compare lengths in the diamond as in ES.4/vertex-step, using the structure R^ε ⊕ M ⊕ M at both vertices.

**Acceptance checks.**

- This is the self-dual replacement for ES.4/vertex-step(c) and Lemma 4.2.1 of Mazur–Rubin.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure`, `EulerSystemsAndKolyvaginSystems:ES.4/vertex-step`.

**Sources.**

- howard, Definition 1.5.4, p. 1451: The self-dual stub module.
- howard, Proposition 1.5.9, proof, p. 1452: Vanishing of localisation propagates along an edge.

### Howard's bound for self-dual Kolyvagin systems over a discrete valuation ring

`EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem` — theorem.

**Statement.** Let R be a discrete valuation ring with fraction field Φ, D = Φ/R, (T, F, 𝓛) a Selmer triple satisfying H.0–H.5 with 𝓛_s(T) ⊆ 𝓛 for s large, and A = T ⊗ D with the propagated structure. If there is a Kolyvagin system κ ∈ KS(T, F, 𝓛) with κ_1 ≠ 0, then H¹_F(K, T) is free of rank one over R and there is a finite R-module M with H¹_F(K, A) ≅ D ⊕ M ⊕ M and length_R(M) ≤ length_R(H¹_F(K, T)/R·κ_1). The conclusion is about the discrete module A: its corank is one and its cotorsion quotient is M ⊕ M, so its length is twice that of M, bounded by twice the index of κ_1. This is the single owner of the self-dual descent used for Heegner points and for generalised Heegner cycles; the Λ-adic version (Howard, Theorem 2.2.10) belongs to layer ES.8.

**Suggested declarations.** `TauCeti.KolyvaginSystems.SelfDual.howard_dvr_theorem`.

**Hypotheses.**

- H.0–H.5
- 𝓛_s(T) ⊆ 𝓛 for s ≫ 0
- κ_1 ≠ 0

**Construction or proof.**

1. Reduce modulo m^k: κ^{(k)} ∈ KS(T^{(k)}, F, 𝓛^{(k)}) and H¹_{F(n)}(K, T^{(k)}) ≅ (R^{(k)})^ε ⊕ M^{(k)}(n) ⊕ M^{(k)}(n) (cassels-structure).
2. Lemma 1.6.4: κ_n ∈ S^{(k)}(n) ⊗ G_n for n ∈ N^{(2k−1)}, by induction using howard-stub and a Chebotarev choice of ℓ at which a class in each τ-eigenspace localises nontrivially (Lemma 1.6.2, from H.1, H.2, H.5).
3. Hence κ_1 ∈ m^{λ^{(k)}(1)}H¹_F(K, T^{(k)}); as κ_1 ≠ 0, ε = 1 and λ^{(k)}(1) is bounded by the index of κ_1; pass to the limit over k.

**Acceptance checks.**

- For T = T_pE and the Heegner point Kolyvagin system: Kolyvagin's theorem, rank one and #Ш[p^∞] dividing the square of the index (Howard, Theorem 1.6.5).
- Distinct from the Mazur–Rubin equality under primitivity: here the bound is an inequality for M with H¹_F(K, A)_{/div} = M ⊕ M, and the factor two comes from self-duality, not from a general principle.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.5/howard-stub`, `EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure`, `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`, `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Sources.**

- howard, Theorem 1.6.1, p. 1453: The theorem.

## ES.6. Stark systems and arithmetic bidual adapters

**Planets:** Selmer exterior bidual; Stark system; Stark systems control Fitting ideals; Regulator isomorphism.

### Exterior biduals of Selmer modules

`EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual` — definition.

**Statement.** For a Selmer structure F on a finite free G_K-representation A over a commutative coefficient ring R, use the exterior bidual supplied by PadicMeasuresIwasawaAlgebras L6 on H¹_F(K,A): B^r_F(A) = Hom_R(⋀^r Hom_R(H¹_F(K,A),R),R). The Selmer specialization of its canonical evaluation map is ξ_F : ⋀^r H¹_F(K,A) → B^r_F(A). For a finite free Selmer module ξ_F is an isomorphism. Evaluation against a wedge of Selmer functionals is the determinant of their values. This node supplies notation and arithmetic adapters; the generic bidual, contraction, functoriality, projective comparison and integral-lattice theory belong to L6.

**Suggested declarations.** `TauCeti.StarkSystems.selmerBidual`, `TauCeti.StarkSystems.selmerToBidual`, `TauCeti.StarkSystems.selmerToBidual_det`, `TauCeti.StarkSystems.selmerToBidual_bijective`.

**Hypotheses.**

- R commutative; A a continuous finite free G_K-representation; F a Selmer structure.

**Construction or proof.**

1. Instantiate the L6 bidual and evaluation map at the actual Selmer kernel H¹_F(K,A).
2. Use the supplied determinant formula and finite-free comparison; no new general exterior algebra is planned in ES.6.

**Uses.**

- Burns–Sakamoto–Sano II, §4.1 and Definition 6.4: Stark systems and higher-rank Euler systems take values in exterior biduals of cohomology.
- Dasgupta–Kakde, §1.2 and Conjecture 1.5: Rubin's lattice is the intersection of an exterior power with ⋂^r_{ℤ[G]} U_{S,T}.
- PadicMeasuresIwasawaAlgebras L6: base-change and denominator lemmas for biduals over Gorenstein orders are owned there.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.StarkSystems.selmerBidual` | constructor | B^r_F(A) is the L6 exterior bidual of H¹_F(K,A). |
| `TauCeti.StarkSystems.selmerToBidual` | constructor | ξ_F : ⋀^r H¹_F(K,A) →ₗ[R] B^r_F(A), the supplied evaluation map. |
| `TauCeti.StarkSystems.selmerToBidual_det` | simp | ξ_F(c₁∧⋯∧c_r)(φ₁∧⋯∧φ_r)=det(φ_i(c_j)). |
| `TauCeti.StarkSystems.selmerToBidual_bijective` | characterisation | If H¹_F(K,A) is finite free, ξ_F is bijective. |

**Unit tests.**

- `TauCeti.StarkSystems.selmerBidual_free_three` (computation): Given H¹_F(K,T)≃R³, its degree-two bidual has rank 3.
- `TauCeti.StarkSystems.selmerBidual_zero_degree` (degenerate): The degree-zero Selmer bidual is R.
- `TauCeti.StarkSystems.selmerBidual_torsion` (non-example): For a Selmer module R⊕R/(a), with a nonzero and its quotient nontrivial, the degree-one determinant map is not injective.

**Acceptance checks.**

- ⋂^r_R R^n ≅ ⋀^r_R R^n, free of rank (n choose r).
- For R = ℤ[G], G finite, and X = ℤ^r with trivial action (r ≥ 1): ⋂^r_R X = |G|^{-(r−1)}·⋀^r_ℤ X inside ℚ ⊗ ⋀^r X; for r ≥ 2 and G ≠ 1 the exterior power is a proper sublattice of index |G|^{r−1}.

**Prerequisites.** `PadicMeasuresIwasawaAlgebras:L6`, `SelmerIwasawaCohomology:L2`.

**Sources.**

- bss2, Definition 2.1, p. 7: The definition, the map ξ and the contraction maps.
- dk, §1.2, p. 8: The lattice form over ℤ[G], in Rubin's original normalisation.

### Selmer contractions and coefficient change

`EulerSystemsAndKolyvaginSystems:ES.6/bidual-functoriality` — theorem.

**Statement.** Let R be a commutative noetherian self-injective local ring and A finite free, with all Selmer modules here finitely generated. If F′≤F and the change-of-condition map H¹_F(K,A) → R^s has kernel H¹_F′(K,A), contraction by its ordered s components maps B^{r+s}_F(A) to B^r_F′(A). For one component v_q, r≥1, B^r_F′(A) identifies with the kernel of v_q:B^r_F(A)→B^{r−1}_F(A). Membership in B^r_F′(A) is detected by every (r−1)-fold contraction. Given a quotient R→S of self-injective rings and the actual coefficient-reduction square into a finite free ambient cohomology module satisfying BSS II Corollary 2.7, the L6 change map induces B^r_F(A)→B^r_G(A⊗S). No assertion of unconditional base-change isomorphism is made.

**Suggested declarations.** `TauCeti.StarkSystems.contractLocalConditions`, `TauCeti.StarkSystems.bidual_local_kernel`.

**Hypotheses.**

- R noetherian and self-injective; every dualized module finitely generated.
- The ordered maps are actual localizations for F′≤F; coefficient change has the free ambient square and injective bottom map of BSS II Corollary 2.7.

**Construction or proof.**

1. Use the exact Selmer change sequence requested from L2 to identify the kernel.
2. Instantiate L6 kernel contraction, rank reduction and coefficient-change maps at this sequence. These generic algebraic results are requested from L6, not re-proved by this node.

**Acceptance checks.**

- For R = k a field these are standard facts about exterior powers.
- The transition maps of Stark systems are instances of (c).

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`, `SelmerIwasawaCohomology:L2`, `PadicMeasuresIwasawaAlgebras:L6`.

**Sources.**

- bss2, Proposition 2.3, p. 8: The map into the bidual of a kernel.
- bss2, Proposition 2.4, p. 8: Rank reduction.
- bss2, Corollary 2.7, p. 10: Coefficient change.

### Stark systems

`EulerSystemsAndKolyvaginSystems:ES.6/stark-systems` — definition.

**Statement.** (a) (Mazur–Rubin 2016; R principal artinian of length k, Selmer data (T, F, P, r) with I_q = 0 for q ∈ P.) For n ∈ N put W_n = ⊕_{q | n} Hom(H¹_tr(K_q, T), R), free of rank ν(n), and Y_n = ⋀^{r+ν(n)} H¹_{F^n}(K, T) ⊗ ⋀^{ν(n)} W_n. For m | n the square of H¹_{F^m} ⊆ H¹_{F^n} with the transverse localisations is cartesian and induces Ψ_{n,m} : Y_n → Y_m, with Ψ_{n′,n″} ∘ Ψ_{n,n′} = Ψ_{n,n″}. SS_r(T) = SS_r(T, F, P) = lim_{n ∈ N} Y_n. For R a discrete valuation ring, SS_r(T) = lim_k SS_r(T/m^kT, P_k). (b) (Burns–Sakamoto–Sano; R self-injective local with finite residue field, A free of finite rank.) SS_r(A, F) = lim_{n ∈ N} ⋂^{r+ν(n)}_R H¹_{F^n}(K, A) with transition maps v_{m,n} = ⋀_{q | m/n} v_q, where v_q : H¹_{F^m}(K, A) → H¹_{/f}(K_q, A) ≅ R, signs chosen so that v_{m′,n} = v_{m,n} ∘ v_{m′,m}. For ε ∈ SS_r(A, F) and i ≥ 0, I_i(ε) = Σ_{ν(n) = i} im(ε_n) ⊆ R, each ε_n being a homomorphism ⋀^{r+ν(n)}H¹_{F^n}(K, A)^* → R. For a local Gorenstein order R and T free over R, SS_r(T, F) = lim_m SS_r(T/p^mT, F) and I_i(ε) = lim_m I_i(ε^{(m)}).

**Suggested declarations.** `TauCeti.StarkSystems.stalk`, `TauCeti.StarkSystems.transition`, `TauCeti.StarkSystems.transition_comp`, `TauCeti.StarkSystems.StarkSystem`, `TauCeti.StarkSystems.StarkSystem.ideal`, `TauCeti.StarkSystems.StarkSystem.eval_one`.

**Hypotheses.**

- as in (a) or (b)

**Construction or proof.**

1. (a): Ψ_{n,m} is contraction against h_{s+1} ∘ loc^tr_{q_{s+1}}, …, h_t ∘ loc^tr_{q_t} tensored with h₁ ∧ ⋯ ∧ h_t ↦ h₁ ∧ ⋯ ∧ h_s; it is independent of the generators h_i and of the ordering (Mazur–Rubin 2016, Proposition A.3).
2. (b): v_{m,n} lands in the bidual of the kernel H¹_{F^n} by ES.6/bidual-functoriality(c).
3. ES.6/stark-comparison identifies the two definitions over principal artinian coefficients: j_n⊗ξ commutes with transitions, and free cofinal core vertices identify the inverse limits.

**Uses.**

- Mazur–Rubin 2016, Theorems 6.10, 7.4, 8.6, 8.9: freeness of rank one and the structure of the dual Selmer group.
- Burns–Sakamoto–Sano II, Theorems 4.6 and 4.12: I_i(ε) = I_∞(ε)·Fitt^i of the dual Selmer module.
- Dasgupta–Kakde, Conjecture 1.5: Rubin–Stark elements are the conjectural source of Stark systems for ℤ_p(1).

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.StarkSystems.stalk` | constructor | Y_n = ⋀^{r+ν(n)} H¹_{F^n}(K, T) ⊗ ⋀^{ν(n)} W_n (Mazur–Rubin), and ⋂^{r+ν(n)} H¹_{F^n}(K, A) (Burns–Sakamoto–Sano). |
| `TauCeti.StarkSystems.transition` | constructor | Ψ_{n,m} : Y_n → Y_m for m \| n, and v_{m,n} on biduals. |
| `TauCeti.StarkSystems.transition_comp` | functoriality | Ψ_{n′,n″} ∘ Ψ_{n,n′} = Ψ_{n,n″} and Ψ_{n,n} = id. |
| `TauCeti.StarkSystems.StarkSystem` | structure | SS_r = the submodule of ∏_n Y_n of families with Ψ_{n,m}(ε_n) = ε_m. |
| `TauCeti.StarkSystems.StarkSystem.ideal` | data | I_i(ε) = Σ_{ν(n)=i} im(ε_n), an ideal of R; I_∞(ε) = ⋃_i I_i(ε). |
| `TauCeti.StarkSystems.StarkSystem.eval_one` | projection | ε ↦ ε_1 ∈ ⋀^r H¹_F(K, T) (resp. ⋂^r H¹_F(K, A)). |

**Unit tests.**

- `TauCeti.StarkSystems.stalk_one` (degenerate): The MR conductor-one Stark stalk is the degree-r exterior power of H¹_F.
- `TauCeti.StarkSystems.rank_one_free_stalk` (computation): A relaxed Selmer module free of rank r+ν(n) makes the degree-r Stark stalk free of rank one.
- `TauCeti.StarkSystems.not_product` (non-example): A family with nonzero component at 1 and zero component at q violates the transition relation.

**Acceptance checks.**

- For n = 1: Y_1 = ⋀^r H¹_F(K, T), and ε_1 is the leading term of the Stark system.
- The zero family is a Stark system.
- Additional arithmetic check: If H¹_{(F^*)_n}(K, T^*) = 0 and r = χ(T), then H¹_{F^n}(K, T) is free of rank r + ν(n) and Y_n is free of rank one.
- Additional arithmetic check: For n = q, m = 1, r = 1 and H¹_{F^q} free with basis c₁, c₂: Ψ_{q,1}(c₁ ∧ c₂ ⊗ h) = h(loc^tr_q c₁)c₂ − h(loc^tr_q c₂)c₁ up to the sign convention, an element of H¹_F(K, T).

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`, `EulerSystemsAndKolyvaginSystems:ES.6/bidual-functoriality`, `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`, `EulerSystemsAndKolyvaginSystems:ES.1/transverse-condition`, `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2016`.

**Sources.**

- mr-higher, Definition 6.8, p. 14: Stark systems over principal artinian rings.
- bss2, §4.1, p. 19: Stark systems in exterior biduals.
- bss2, Definition 4.1, p. 20: The ideals I_i(ε).

### Freeness of Stark systems and control of the dual Selmer group

`EulerSystemsAndKolyvaginSystems:ES.6/stark-structure` — theorem.

**Statement.** (a) (Mazur–Rubin 2016; (H.1)–(H.7), R principal artinian.) SS_r(T) is free of rank one over R, and the image of SS_r(T) → Y_n is Y′_n = m^{length H¹_{(F^*)_n}(K, T^*)} Y_n; for R a discrete valuation ring with (H.1)–(H.6), SS_r(T, P) is free of rank one, generated by ε with nonzero image in SS_r(T/mT), and SS_r(T, P) → SS_r(T/m^k, P_k) is surjective. With φ_ε(n) = max{j : ε_n ∈ m^jY_n}, ∂φ_ε(i) = min{φ_ε(n) : ν(n) = i}, ord(ε) = min{ν(n) : ε_n ≠ 0} and d_ε(i) = ∂φ_ε(i) − ∂φ_ε(i + 1): for R a discrete valuation ring and ε ≠ 0, corank H¹_{F^*}(K, T^*) = ord(ε), H¹_{F^*}(K, T^*)/div ≅ ⊕_{i ≥ ord ε} R/m^{d_ε(i)}, ε is primitive iff ∂φ_ε(∞) = 0, and length H¹_{F^*}(K, T^*) ≤ ∂φ_ε(0) = max{s : ε_1 ∈ m^s ⋀^r H¹_F(K, T)} with equality iff ε is primitive. (b) (Burns–Sakamoto–Sano; Hypothesis 4.2.) For n with H¹_{(F^*)_n}(K, A^*(1)) = 0, SS_r(A, F) → ⋂^{r+ν(n)}H¹_{F^n}(K, A) is bijective, so SS_r(A, F) is free of rank one; for all ε and i: I_i(ε) ⊆ I_{i+1}(ε), I_∞(ε) = R iff ε is a basis, and I_i(ε) = I_∞(ε)·Fitt^i_R(H¹_{F^*}(K, A^*(1))^*). For a local Gorenstein order under Hypothesis 4.7 and Hypothesis 4.2 of fixed rank r for (T/p^mT,F,P_m) at every m≥1, SS_r(T, F) is free of rank one with I_i(ε) = I_∞(ε)·Fitt^i_R(H¹_{F^*}(K, T^∨(1))^∨). The regulator and the ideals commute with the admissible scalar reductions supplied by L6, under its exact coefficient-change hypotheses.

**Suggested declarations.** `TauCeti.StarkSystems.stark_structure_mr`, `TauCeti.StarkSystems.stark_structure`.

**Hypotheses.**

- (H.1)–(H.7) of ES.0/hypotheses-mr2016 for (a)
- Hypothesis 4.2 (finite level) and 4.7 plus 4.2 for every T/p^mT with the same r (orders) of ES.6/bss-hypotheses for (b)

**Construction or proof.**

1. (a): Y_n is free of rank one when H¹_{(F^*)_n} = 0 (Corollary 3.5), such n exist and are cofinal (ES.1/chebotarev-nonvanishing), and Ψ_{n,m}(Y_n) = Y′_m (Lemma 6.9); the structure theorem follows from ∂μ(t) = Σ_{i>t} e_i for H¹_{F^*} ≅ ⊕R/m^{e_i}.
2. (b): Theorem 4.6, combining Burns–Sano and Sakamoto; Fitting ideals of the dual Selmer module are generated by the images of Stark systems at vertices with i primes (Corollary 4.5) using the exact-dual contraction and image-ideal comparison imported from L6.

**Acceptance checks.**

- For r = 1 and R a discrete valuation ring this recovers ES.5/structure-theorem through the regulator isomorphism.
- Over a non-domain order the statement is an equality of ideals, not a valuation formula.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.6/stark-systems`, `EulerSystemsAndKolyvaginSystems:ES.6/bss-hypotheses`, `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2016`, `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing`, `PadicMeasuresIwasawaAlgebras:L6`.

**Sources.**

- mr-higher, Theorem 6.10, p. 15: Freeness over principal artinian rings.
- mr-higher, Theorem 8.9, p. 19: The structure theorem.
- bss2, Theorem 4.6, p. 21: Freeness and Fitting ideals over self-injective rings.

### The Burns–Sakamoto–Sano hypotheses

`EulerSystemsAndKolyvaginSystems:ES.6/bss-hypotheses` — definition.

**Statement.** Let (R, 𝔭) be a self-injective local ring with finite residue field k of characteristic p, A a free R-module of finite rank with continuous G_K-action, M = min{p^n : p^nR = 0}, K_M = K(μ_M, (O_K^×)^{1/M})K(1) and K(A)_M = K(A)K_M. Hypothesis 3.2: (i) A ⊗ k is an irreducible k[G_K]-module; (ii) there is τ ∈ G_{K_M} with A/(τ − 1)A ≅ R; (iii) H¹(K(A)_M/K, A) = H¹(K(A)_M/K, A^*(1)) = 0. Hypothesis 3.3: (A ⊗ k)^{G_K} = ((A ⊗ k)^*(1))^{G_K} = 0. The prime set P is the set of q ∉ S with Fr_q conjugate to τ in Gal(K(A)_M/K). Hypothesis 4.2: there is n ∈ N with H¹_{(F^*)_n}(K, A^*(1)) = 0 and H¹_{F^n}(K, A) free of rank r + ν(n). For a local Gorenstein O-order R and T free over R with T̄ = T/𝔭T, Hypothesis 4.7: (i) T̄ is an irreducible (R/𝔭)[G_K]-module; (ii) there is τ ∈ G_{K_{p^∞}}, K_{p^∞} = ⋃_m K_{p^m}, with T/(τ − 1)T ≅ R (the source prints G_{K(T)_{p^∞}}, a misprint recorded as source issue E1); (iii) H¹(K(T)_{p^∞}/K, T̄) = H¹(K(T)_{p^∞}/K, T̄^∨(1)) = 0. Hypothesis 4.7 implies 3.2 and 3.3 for every T/p^mT. These are properties of (T, F), proved in each application; they do not follow from R being Gorenstein. The structure theorems for Kolyvagin systems additionally require p > 3.

**Suggested declarations.** `TauCeti.StarkSystems.BSSHypothesis32`, `TauCeti.StarkSystems.BSSHypothesis33`, `TauCeti.StarkSystems.BSSHypothesis42`, `TauCeti.StarkSystems.BSSHypothesis47`, `TauCeti.StarkSystems.BSSHypothesis47.toFiniteLevel`, `TauCeti.StarkSystems.BSSHypothesis42.free_of_core`.

**Hypotheses.**

- R self-injective local, or a local Gorenstein order

**Construction or proof.**

1. Each item is a separate field. Hypothesis 4.2 replaces the cartesian condition and the core rank: it asserts the existence of a relaxed core vertex of the expected free rank.
2. Remark 4.3: under 4.2, H¹_{F^m}(K, A) is free of rank r + ν(m) at every m with H¹_{(F^*)_m} = 0. Remark 4.9: 4.7 ⇒ 3.2, 3.3 modulo p^m.
3. For R principal artinian, Hypotheses 3.2 and 3.3 follow from Mazur–Rubin's (H.1)–(H.3), and 4.2 from (H.5)–(H.6) by Corollary 3.5(ii) of Mazur–Rubin 2016.

**Uses.**

- Burns–Sakamoto–Sano II, Theorems 4.6, 4.12, 5.2, 5.25: the standing hypotheses of the Gorenstein theory.
- ES.7/fitting-bounds: the hypotheses for A_F = Ind(T/MT) over R[Gal(F/K)].

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.StarkSystems.BSSHypothesis32` | structure | Fields irreducible, tau, h1Vanishing. |
| `TauCeti.StarkSystems.BSSHypothesis33` | structure | Vanishing of the residual invariants of A and A^*(1). |
| `TauCeti.StarkSystems.BSSHypothesis42` | structure | A vertex n with vanishing strict dual Selmer module and H¹_{F^n} free of rank r + ν(n). |
| `TauCeti.StarkSystems.BSSHypothesis47` | structure | The three conditions for a Gorenstein order. |
| `TauCeti.StarkSystems.BSSHypothesis47.toFiniteLevel` | functoriality | Hypothesis 4.7 for T gives 3.2 and 3.3 for T/p^mT for every m ≥ 1. |
| `TauCeti.StarkSystems.BSSHypothesis42.free_of_core` | characterisation | Under 4.2, H¹_{F^m}(K, A) is free of rank r + ν(m) whenever H¹_{(F^*)_m}(K, A^*(1)) = 0. |

**Unit tests.**

- `TauCeti.StarkSystems.not_bss33_trivial` (non-example): The trivial rank-one representation has nonzero residual invariants and fails Hypothesis 3.3.
- `TauCeti.StarkSystems.bss_rank_one_coinvariants` (computation): Rank-one coefficients have rank-one coinvariants for τ=1.
- `TauCeti.StarkSystems.bss42_strict_dual_zero` (characterisation): A Hypothesis 4.2 vertex has zero strict dual Selmer module.

**Acceptance checks.**

- Satisfied by A = (ℤ/p^m)(1) ⊗ χ^{-1} ⊗ ℤ_p[Gal(F/K)] under the hypotheses of Theorem 7.1.
- Not implied by the ring-theoretic hypotheses: for A with trivial residual representation 3.3 fails over every R.
- Additional arithmetic check: For R principal artinian, (H.1)–(H.3) of ES.0/hypotheses-mr2016 give Hypotheses 3.2 and 3.3 with the same τ.
- Additional arithmetic check: For R = k and χ(A) = r: any core vertex n has dim H¹_{F^n}(K, A) = r + ν(n), so 4.2 holds.
- Additional arithmetic check: If rank_R T = 1 then 4.7(i) holds and 4.7(ii) holds with τ = 1.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2016`, `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`, `PadicMeasuresIwasawaAlgebras:L6`.

**Sources.**

- bss2, Hypothesis 3.2, p. 13: The finite-level hypotheses.
- bss2, Hypothesis 4.2, p. 20: Existence of a relaxed core vertex.
- bss2, Hypothesis 4.7, p. 22: The hypotheses over a Gorenstein order.

### Kolyvagin systems of rank r and the regulator map

`EulerSystemsAndKolyvaginSystems:ES.6/kolyvagin-systems-rank-r` — definition.

**Statement.** (a) (Mazur–Rubin 2016.) The rank-r Selmer sheaf on X(P) has stalks S(n) = ⋀^r H¹_{F(n)}(K, T/I_nT) ⊗ G_n, edge modules S(e) = H¹_tr(K_q, T/I_{nq}T) ⊗ ⋀^{r−1}H¹_{F_q(n)}(K, T/I_{nq}T) ⊗ G_{nq} for e = {n, nq}, and vertex-to-edge maps the contractions against loc^f_q (finite projection followed by φ^fs_q) from n and against loc^tr_q from nq. KS_r(T, F, P) = Γ(S); for r = 1 this is ES.3/kolyvagin-system-module. The stub subsheaf has S′(n) = m^{λ(n)}S(n), λ(n) = length H¹_{F(n)^*}(K, T^*), and KS′_r(T) = Γ(S′). (b) (Burns–Sakamoto–Sano.) KS_r(A, F) is the module of families κ_n ∈ ⋂^r_R H¹_{F(n)}(K, A) ⊗ G_n with v_q(κ_n) = φ^fs_q(κ_{n/q}) in ⋂^{r−1}_R H¹_{F_q(n/q)}(K, A) ⊗ G_n for q | n; with generators of the G_q fixed, I_i(κ) = Σ_{ν(n)=i} im(κ_n). For a Gorenstein order, KS_r(T, F) = lim_m KS_r(T/p^mT, F). (c) The regulator: Reg_r : SS_r(A, F) → KS_r(A, F), ε ↦ (⋀_{q | n} φ^fs_q (ε_n))_n; in Mazur–Rubin's setting Π : SS_r(T) → KS′_r(T), ε ↦ ((−1)^{ν(n)}Π_n(ε_n))_n.

**Suggested declarations.** `TauCeti.StarkSystems.KolyvaginSystemRank`, `TauCeti.StarkSystems.KolyvaginSystemRank.rank_one_equiv`, `TauCeti.StarkSystems.KolyvaginSystemRank.stub`, `TauCeti.StarkSystems.regulator`, `TauCeti.StarkSystems.regulator_eval_one`, `TauCeti.StarkSystems.KolyvaginSystemRank.ideal`.

**Hypotheses.**

- as in ES.6/stark-systems

**Construction or proof.**

1. The edge compatibility of Reg_r(ε): v_q(⋀_{q′ | n} φ^fs_{q′}(ε_n)) = φ^fs_q(⋀_{q′ | n/q} φ^fs_{q′}(v_q ε_n)) = φ^fs_q(κ(ε_{n/q})), using the Stark relation v_q(ε_n) = ε_{n/q}.
2. The contraction maps are those of ES.6/exterior-bidual; the sign (−1)^{ν(n)} in Π fixes the ordering conventions.

**Uses.**

- Mazur–Rubin 2016, Theorems 11.7, 12.4, 13.4: stub Kolyvagin systems are free of rank one and isomorphic to Stark systems.
- Burns–Sakamoto–Sano II, Theorems 5.2 and 6.12: the regulator is an isomorphism for p > 3, and higher Kolyvagin derivatives land in KS_r.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.StarkSystems.KolyvaginSystemRank` | structure | KS_r(T, F, P) = Γ of the rank-r Selmer sheaf; KS_r(A, F) in biduals. |
| `TauCeti.StarkSystems.KolyvaginSystemRank.rank_one_equiv` | equivalence | At a fixed finite coefficient level with I_q=0 for every selected prime and reflexive modified Selmer modules, the degree-one bidual Kolyvagin module is equivalent to the ordinary module. The exterior-power MR version needs no reflexivity in degree one. |
| `TauCeti.StarkSystems.KolyvaginSystemRank.stub` | constructor | KS′_r(T) ≤ KS_r(T), sections of the stub subsheaf. |
| `TauCeti.StarkSystems.regulator` | constructor | Reg_r : SS_r → KS_r, R-linear. |
| `TauCeti.StarkSystems.regulator_eval_one` | simp | Reg_r(ε)_1 = ε_1. |
| `TauCeti.StarkSystems.KolyvaginSystemRank.ideal` | data | I_i(κ) = Σ_{ν(n)=i} im(κ_n). |

**Unit tests.**

- `TauCeti.StarkSystems.regulator_zero` (degenerate): The rank-r regulator takes zero to zero.
- `TauCeti.StarkSystems.rank_system_not_product` (non-example): A family with zero upper localization and nonzero lower localization fails the rank-r edge equation.
- `TauCeti.StarkSystems.stub_stalk_zero_field` (non-example): At field coefficients, positive dual length and a nonzero rank-r exterior stalk give zero stub stalk strictly smaller than the full stalk.

**Acceptance checks.**

- For r = 1: KS_1 = KS and Reg_1(ε)_1 = ε_1.
- Reg_r commutes with R → R/(p^m) and with restriction of P.
- Additional arithmetic check: For r = 1 the edge module is H¹_tr(K_q, T/I_{nq}T) ⊗ G_{nq} ≅ H¹_s ⊗ G_{nq} and the relation is (5) of Mazur–Rubin 2004.
- Additional arithmetic check: For n = q: Reg_r(ε)_q = φ^fs_q(ε_q) ∈ ⋂^r H¹_{F(q)}(K, A) ⊗ G_q, and v_q(Reg_r(ε)_q) = φ^fs_q(ε_1).

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.6/stark-systems`, `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`, `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`, `EulerSystemsAndKolyvaginSystems:ES.4/selmer-sheaf`, `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`.

**Sources.**

- mr-higher, Definition 10.4, p. 21: Kolyvagin systems of rank r.
- bss2, §5.2, p. 25: The regulator map.
- mr-higher, Proposition 12.3, p. 24: The map Π.

### The regulator isomorphism and structure of Kolyvagin systems of rank r

`EulerSystemsAndKolyvaginSystems:ES.6/regulator-isomorphism` — theorem.

**Statement.** (a) (Mazur–Rubin 2016; (H.1)–(H.7), R principal artinian.) There are core vertices; any two are joined by a path through core vertices along which all vertex-to-edge maps are isomorphisms; S′ is locally cyclic with every core vertex a hub and trivial monodromy; KS′_r(T) is free of rank one and κ ↦ κ_n is an isomorphism onto S′(n) at core vertices; Π : SS_r(T) → KS′_r(T) is an isomorphism. For R a discrete valuation ring ((H.1)–(H.6)), KS′_r(T, P) ≅ lim_k KS′_r(T/m^k, P_k) is free of rank one, and for 0 ≠ κ ∈ KS′_r(T) the conclusions of ES.6/stark-structure(a) hold with ε replaced by κ; in particular length H¹_{F^*}(K, T^*) ≤ max{s : κ_1 ∈ m^s ⋀^r H¹_F(K, T)}, with equality iff κ is primitive. (b) (Burns–Sakamoto–Sano; Hypotheses 3.2, 3.3, 4.2 and p > 3.) Reg_r : SS_r(A, F) → KS_r(A, F) is an isomorphism, so KS_r(A, F) is free of rank one; for κ ∈ KS_r(A, F) and n ∈ N, im(κ_n) ⊆ Fitt⁰_R(H¹_{F(n)^*}(K, A^*(1))^*), with equality if κ is a basis; and I_i(κ) ⊆ Fitt^i_R(H¹_{F^*}(K, A^*(1))^*), with equality if R is a principal ideal ring and κ is a basis. The same holds over a local Gorenstein order under Hypothesis 4.7, Hypothesis 4.2 of fixed rank r for every (T/p^mT,F,P_m), and p > 3 for KS_r(T, F) and H¹_{F^*}(K, T^∨(1))^∨. The restriction p > 3 is part of the statements for Kolyvagin systems; it is not needed for Stark systems.

**Suggested declarations.** `TauCeti.StarkSystems.regulator_isomorphism`.

**Hypotheses.**

- as stated; p > 3 in (b)

**Construction or proof.**

1. (a): Theorem 11.6 (proved in §14 by the Chebotarev lemmas) and ES.4/sheaf-monodromy; Π is surjective onto each S′(n) (Lemma 12.2) between free modules of rank one.
2. (b): Theorem 5.2 — connectivity of the core graph X⁰ (Theorem 5.18, where p > 3 is used to find a common prime for two pairs of classes via Lemma 3.9 with s + t < p) and the computation of im(κ_n) at core vertices (Theorem 5.20); pass to the limit for orders (Theorem 5.25).
3. BSS II §§5.4–5.5: Lemmas 5.14–5.17 connect minimal and nonminimal core vertices by detecting at most four classes (p>3); Lemma 5.19 makes edge contractions isomorphisms. Theorem 5.20 obtains surjectivity from Stark evaluation and proves injectivity by induction on residual dual dimension, choosing detecting primes and using rank reduction to force a nonzero edge value. Lemmas 5.22–5.23 then give higher Fitting containments, with equality requiring a faithful Selmer element; the principal-ring argument supplies it.

**Acceptance checks.**

- For r = 1 over a discrete valuation ring: KS(T) free of rank one, as in ES.5/rank-one-module-theorem.
- Over a non-principal Gorenstein ring only the inclusion I_i(κ) ⊆ Fitt^i is asserted for i > 0.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.6/kolyvagin-systems-rank-r`, `EulerSystemsAndKolyvaginSystems:ES.6/stark-structure`, `EulerSystemsAndKolyvaginSystems:ES.6/bss-hypotheses`, `EulerSystemsAndKolyvaginSystems:ES.4/sheaf-monodromy`, `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing`, `PadicMeasuresIwasawaAlgebras:L6`.

**Sources.**

- mr-higher, Theorem 12.4, p. 25: Stark systems and stub Kolyvagin systems.
- bss2, Theorem 5.2, pp. 25–26: The regulator isomorphism and Fitting bounds.
- bss2, Theorem 5.25, p. 36: The statement over a Gorenstein order.

### T-modified S-units, the order map and Rubin's lattice

`EulerSystemsAndKolyvaginSystems:ES.6/rubin-lattice` — definition.

**Statement.** Let H/F be a finite abelian CM extension with F totally real, G its Galois group and c complex conjugation. Let S₀ contain the infinite and ramified places, let T be a disjoint finite smoothing set, and let V={v₁,…,v_r} be r≥1 finite primes splitting completely in H, disjoint from S₀∪T, with chosen primes w_j above v_j. Assume the T-modified unit group is torsion-free. Distinguish S₀, used in the Stickelberger element, from V, used in the unit group: U_{V,T} consists of elements congruent to 1 above T whose valuations vanish outside primes above V. On the rational minus component, the order map ord_G sends u₁∧⋯∧u_r to det(Σ_{σ∈G}[σ⁻¹]ord_{w_j}(σu_i))_{i,j} and is an isomorphism onto ℚ[G]⁻. Rubin’s lattice is the rational minus component intersected with the integral ℤ[G]-exterior bidual of the full U_{V,T}; membership means every determinant of r integral group-ring functionals has coefficients in ℤ. The integral dual is taken before the minus projection, so the definition does not use the nonintegral idempotent (1−c)/2.

**Suggested declarations.** `TauCeti.RubinStark.modifiedUnits`, `TauCeti.RubinStark.ordG`, `TauCeti.RubinStark.ordG_ιMulti`, `TauCeti.RubinStark.ordG_bijective`, `TauCeti.RubinStark.rubinLattice`, `TauCeti.RubinStark.rubinLattice_rank_one`.

**Hypotheses.**

- H/F abelian, H CM and F totally real; c is actual complex conjugation.
- r≥1; the v_j are distinct, split completely, and lie outside S₀∪T.
- The T-congruence subgroup is torsion-free.

**Construction or proof.**

1. ord_G is the determinant of the ℚ[G]-linear maps u ↦ Σ_σ [σ^{-1}] ord_{w_j}(σu); on minus parts the unit group of H contributes nothing, so ℚU_{S,T}^− is free of rank r over ℚ[G]^− on a basis dual to the w_j, which gives the isomorphism.
2. The bidual description is ES.6/exterior-bidual (equivLattice) for R = ℤ[G] and X = U_{S,T}.

**Uses.**

- Dasgupta–Kakde, Conjecture 1.5 and Theorem 1.6: u_RBS ∈ 𝓛 is Rubin's conjecture, proved away from 2.
- IntegralIwasawaTheory I.7: imports these definitions for the proof of Theorem 1.6.
- ES.7/rubin-brumer-stark: the element whose integrality is conjectured.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.RubinStark.modifiedUnits` | constructor | U_{V,T} as a ℤ[G]-module. |
| `TauCeti.RubinStark.ordG` | constructor | ord_G : ⋀^r_{ℚ[G]} ℚU_{V,T}^− → ℚ[G]^−. |
| `TauCeti.RubinStark.ordG_ιMulti` | simp | ord_G(u₁ ∧ ⋯ ∧ u_r) = det(Σ_σ [σ^{-1}]·ord_{w_j}(σ u_i)). |
| `TauCeti.RubinStark.ordG_bijective` | characterisation | ord_G is an isomorphism of ℚ[G]-modules. |
| `TauCeti.RubinStark.rubinLattice` | constructor | 𝓛 = (⋀^r ℚU^−) ⊓ ⋂^r_{ℤ[G]} U_{V,T}. |
| `TauCeti.RubinStark.rubinLattice_rank_one` | example | For r = 1, 𝓛 = U_{V,T}^−. |

**Unit tests.**

- `TauCeti.RubinStark.rubinLattice_nonintegral_functional` (non-example): A nonintegral coefficient of a determinant functional excludes a rational minus element from the Rubin lattice.
- `TauCeti.RubinStark.modifiedUnits_T_condition` (non-example): A unit failing congruence to 1 at a prime over T is not an (S,T)-unit.
- `TauCeti.RubinStark.rubinLattice_half_determinant` (computation): Over ℚ[C₂], half of (1−c)² equals 1−c; integral determinant testing therefore differs from requiring an integral minus projector.

**Acceptance checks.**

- For r = 1, 𝓛 = U_{S,T}^− (U_{S,T} is reflexive), and membership of the element is the Brumer–Stark statement.
- For r ≥ 2 the lattice 𝓛 is in general strictly larger than the image of ⋀^r_{ℤ[G]} U_{S,T}^−.
- Additional arithmetic check: Replacing w_j by g·w_j multiplies ord_G by [g]^{±1} ∈ G (a unit of ℚ[G]); so 𝓛-membership statements do not depend on the w_j.
- Additional arithmetic check: For G = 1: ⋂^r_ℤ U = ⋀^r_ℤ U for U free, and 𝓛 = ⋀^r_ℤ U^−.
- Additional arithmetic check: Algebraic minus-part test: let G=C₂=⟨σ⟩ act by −1 on X=ℤ². Then Hom_{ℤ[G]}(X,ℤ[G]) has values in ℤ(1−σ), and (1−σ)²=2(1−σ). Thus the determinant-integrality lattice in ⋀²_{ℚ[G]}ℚX is (1/2)⋀²_ℤX, strictly larger than the exterior-power image. This tests the minus-part normalization without claiming X is a specific arithmetic unit lattice.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`.

**Sources.**

- dk, §1.2, (8)–(10), p. 8: The unit group and the order map.
- dk, §1.2, p. 8: Rubin's lattice.

### Comparison of exterior-power and bidual Stark systems

`EulerSystemsAndKolyvaginSystems:ES.6/stark-comparison` — comparison.

**Statement.** Let R be principal artinian local, A finite free over R, F cartesian, signed core rank r≥0, and Q an infinite subset of the admissible Kolyvagin primes of sufficient level admitting core vertices, in the setting of Sakamoto §4.5 and Mazur–Rubin 2016. Let W′_n=⊕_{q|n}Hom_R(H¹_tr(K_q,A),R), W_n=⊕_{q|n}Hom_R(H¹(K_q,A)/H¹_f(K_q,A),R), and j_n:det W′_n≃det W_n be induced by the inverse of the transverse-to-singular restriction isomorphism. The component map C_n=j_n⊗ξ_{H¹_{F^n}} commutes with Stark transitions and induces a canonical R-linear isomorphism SS^MR_r(A,F,Q)≃SS^bidual_r(A,F,Q). Component maps need only be isomorphisms at the cofinal free core vertices; they are not claimed bijective at every vertex.

**Suggested declarations.** `TauCeti.StarkSystems.starkComparison`, `TauCeti.StarkSystems.starkComparison_eval`.

**Hypotheses.**

- Sakamoto §4.5 hypotheses: principal artinian R, cartesian F, r=χ(F)≥0, Q infinite of sufficient level with core vertices.

**Construction or proof.**

1. Lemma 4.13 proves that ξ commutes with the one-dimensional kernel contraction; its proof decomposes the finite module as Rm⊕N₀ with N=Im⊕N₀ and checks the determinant formula.
2. Apply it successively to localizations to obtain transition compatibility of j_n⊗ξ.
3. At a core vertex the relaxed Selmer module is free and ξ is bijective; cofinality and evaluation of both inverse limits at such vertices give Proposition 4.14.

**Acceptance checks.**

- The statement retains every displayed hypothesis and the indicated coefficient convention.
- The comparison prototype is between arithmetic inverse systems, with explicit determinant-evaluation maps and commuting transitions; it is not an equivalence between arbitrary abstract inverse systems.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.6/stark-systems`, `EulerSystemsAndKolyvaginSystems:ES.6/stark-structure`, `PadicMeasuresIwasawaAlgebras:L6`.

**Sources.**

- sakamoto, Lemma 4.13 and Proposition 4.14, pp. 2313–2314: The compatible comparison of the two Stark definitions.

## ES.7. Higher-rank derivatives and conditional class-group bounds

**Planets:** Higher-rank Euler system; Higher Kolyvagin derivative; Fitting-ideal control; Rubin–Brumer–Stark element.

### Euler systems of rank r

`EulerSystemsAndKolyvaginSystems:ES.7/higher-rank-euler-systems` — definition.

**Statement.** Let R be a semilocal Gorenstein O-order in a finite-dimensional semisimple commutative algebra over a finite extension of ℚ_p, T a free R-module of finite rank with continuous R-linear G_K-action, S ⊇ S_∞ ∪ S_p ∪ S_ram(T) finite, P_q(x) = det(1 − Fr_q^{-1}x | T^*(1)) for q ∉ S, 𝒦/K an abelian pro-p extension in which all archimedean places split completely, Ω(𝒦/K) the set of finite subextensions, S(F) = S ∪ S_ram(F/K) and 𝒢_F = Gal(F/K). Hypothesis 6.1: (i) H¹(O_{F,S(F)}, T) is a reflexive R[𝒢_F]-module for every F (equivalently free over O); (ii) H⁰(F, T) = 0 for every F. An Euler system of rank r for (T, 𝒦) is a family c_F ∈ ⋂^r_{R[𝒢_F]} H¹(O_{F,S(F)}, T), F ∈ Ω(𝒦/K), with Cor_{F′/F}(c_{F′}) = (∏_{q ∈ S(F′)∖S(F)} P_q(Fr_q^{-1})) c_F in ⋂^r_{R[𝒢_F]} H¹(O_{F,S(F′)}, T) for F ⊆ F′. ES_r(T, 𝒦) is the R[[Gal(𝒦/K)]]-module of such families. Hypothesis 6.7: 𝒦 contains K(q) for every q ∉ S and a ℤ_p^d-extension of K in which no finite place splits completely. For r = 1 on the common towers satisfying Hypothesis 6.7, under Hypothesis 6.1(i) and the universal-norm/unramified comparison, ⋂^1 H¹ = H¹ and ES_1(T, 𝒦) is ES.2/euler-system-module with coefficients R.

**Suggested declarations.** `TauCeti.EulerSystems.HigherEulerSystem`, `TauCeti.EulerSystems.HigherEulerSystem.eval`, `TauCeti.EulerSystems.HigherEulerSystem.rank_one_equiv`, `TauCeti.EulerSystems.BSSHypothesis61`, `TauCeti.EulerSystems.BSSHypothesis61.iff_free`, `TauCeti.EulerSystems.HigherEulerSystem.cor_eval`.

**Hypotheses.**

- R a semilocal Gorenstein order
- Hypothesis 6.1 for the comparison with rank one

**Construction or proof.**

1. Cor on biduals is induced by corestriction H¹(O_{F′,S(F′)}, T) → H¹(O_{F,S(F′)}, T), which is R[𝒢_{F′}]-linear onto an R[𝒢_F]-module; functoriality of ⋂^r (ES.6/exterior-bidual, map) and change of group ring.
2. Reflexivity fails for torsion unit examples (T = ℤ_p(1) with μ_p ⊆ F); then a T-modified cohomology is used, with its own comparison (Remark 6.3). This packet states the theory under Hypothesis 6.1.

**Uses.**

- Burns–Sakamoto–Sano II, Theorem 6.12: the source of higher Kolyvagin derivatives.
- Burns–Sakamoto–Sano II, Theorem 7.1; Dasgupta–Kakde §1.2: Rubin–Stark elements conjecturally form an Euler system of rank r for ℤ_p(1) ⊗ χ^{-1}.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystems.HigherEulerSystem` | structure | ES_r(T, 𝒦) ≤ ∏_F ⋂^r_{R[𝒢_F]} H¹(O_{F,S(F)}, T), cut out by the corestriction relations. |
| `TauCeti.EulerSystems.HigherEulerSystem.eval` | projection | c ↦ c_F. |
| `TauCeti.EulerSystems.HigherEulerSystem.rank_one_equiv` | equivalence | On common towers satisfying 6.7, under 6.1 and the universal-norm/unramified comparison, ES_1(T,𝒦)≃ES(T,𝒦,N), with N containing the finite primes of S. The comparison includes the transport from S(F)-ramified cohomology to global H¹ and the coefficient/Euler-polynomial dictionaries. |
| `TauCeti.EulerSystems.BSSHypothesis61` | structure | Reflexivity of H¹(O_{F,S(F)}, T) over R[𝒢_F] and H⁰(F, T) = 0, for all F. |
| `TauCeti.EulerSystems.BSSHypothesis61.iff_free` | characterisation | 6.1(i) holds iff every H¹(O_{F,S(F)}, T) is free over O. |
| `TauCeti.EulerSystems.HigherEulerSystem.cor_eval` | relation | Cor_{F′/F}(c_{F′}) = (∏_{q ∈ S(F′)∖S(F)} P_q(Fr_q^{-1}))·c_F. |

**Unit tests.**

- `TauCeti.EulerSystems.HigherEulerSystem.zero_mem` (degenerate): The zero higher-rank family satisfies every norm relation.
- `TauCeti.EulerSystems.HigherEulerSystem.rank_one_zero` (compatibility): The rank-one bidual-to-Rubin Euler-system comparison takes zero to zero under all stated hypotheses.
- `TauCeti.EulerSystems.not_BSSHypothesis61_torsion` (non-example): A nonzero ramified-cohomology class annihilated by a nonzero scalar contradicts the torsion-free form of Hypothesis 6.1(i).

**Acceptance checks.**

- For R = O = ℤ_p, T = ℤ_p(1): Hypothesis 6.1(i) says the p-completion of O_{F,S(F)}^× is torsion-free for all F.
- The zero family is an Euler system of rank r.
- Additional arithmetic check: For r = 1, R = O and Hypothesis 6.1: the relation is Rubin's, with P_q(x) = det(1 − Fr_q^{-1}x | T^*(1)) = P(Fr_q^{-1} | T^*; x) in Rubin's notation.
- Additional arithmetic check: For T = ℤ_p(1) and F ⊇ μ_p, H¹(O_{F,S(F)}, T) ⊇ μ_{p^∞}(F) has torsion, so Hypothesis 6.1(i) fails: reflexivity is not automatic.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`, `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`, `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`, `PadicMeasuresIwasawaAlgebras:L6`.

**Sources.**

- bss2, Definition 6.4, p. 37: The definition.
- bss2, Hypothesis 6.1, p. 37: Reflexivity and vanishing of invariants.

### The higher Kolyvagin derivative

`EulerSystemsAndKolyvaginSystems:ES.7/higher-kolyvagin-derivative` — construction.

**Statement.** Assume Hypotheses 6.1, 6.7 and 6.11 (Fr_q^{p^k} − 1 is injective on T for every q ∈ P and k ≥ 0). Fix a power M of p, a field E ∈ Ω(𝒦/K) unramified outside S with K(1) ⊆ E, and put R̄ = R/(M), ℛ = R̄[Gal(E/K)], A = Ind_{G_E}^{G_K}(T/MT), a free ℛ-module. For n ∈ N let E(n) = E·K(n), H_n = Gal(E(n)/E), B=T/MT (uninduced), c_n=c_{E(n)}, and c̄_n its image in ⋂^r_{R̄[Gal(E(n)/K)]} H¹(O_{E(n),S_n},B). The reduction is the map (9) of §6.3. The full Galois group ring is used; no splitting Gal(E(n)/K)≃Gal(E/K)×H_n is assumed. H_n-invariant descent identifies the resulting class with ⋂^r_ℛ H¹(O_{E,S_n},B), then with ⋂^r_ℛ H¹(O_{K,S_n},A) by Shapiro. Then D_n·c̄_n is H_n-invariant and defines the Kolyvagin derivative κ′(c_n) = D_n·c̄_n ∈ ⋂^r_ℛ H¹(O_{K,S_n}, A). With 𝓘_n the augmentation ideal of ℤ[H_n] and G_n ≅ ⟨∏_{q | n}(σ_q − 1)⟩ ⊆ 𝓘_n^{ν(n)}/𝓘_n^{ν(n)+1}, write P_q^m for the image of P_q(Fr_q^{-1}) in R̄⊗𝓘_m/𝓘_m² when q∤m. For m=q₁⋯q_t define Δ_m=det(B_m), where (B_m)_{ij}=0 if i=j and P_{q_j}^{q_i} otherwise; put Δ_1=1 (empty determinant) and Δ_q=0. Define κ(c)_n=Σ_{d|n}(κ′(c_d)⊗∏_{q|d}(σ_q−1))Δ_{n/d}, transporting κ′(c_d) to S_n and multiplying the disjoint augmentation factors. This is the explicit correction formula of §6.4, p.41; and Theorem: κ(c)_n ∈ ⋂^r_ℛ H¹_{F_can(n)}(K, A) ⊗ ⟨∏_{q | n}(σ_q − 1)⟩ and v_q(κ(c)_n) = φ^fs_q(κ(c)_{n/q}) for every q | n; so κ(c) ∈ KS_r(A, F_can). For a subfield F of E/K and A_F = Ind_{G_F}^{G_K}(T/MT) this gives the canonical homomorphism D_r = D_r^F : ES_r(T, 𝒦) → KS_r(A_F, F_can), independent of E and of the generators σ_q, with D_r(c)_1 = c_F (mod M).

**Suggested declarations.** `TauCeti.EulerSystems.rawHigherDerivative`, `TauCeti.EulerSystems.higherDerivative`, `TauCeti.EulerSystems.higherDerivative_one`, `TauCeti.EulerSystems.higherDerivative_singular`, `TauCeti.EulerSystems.higherDerivative_indep`, `TauCeti.EulerSystems.higherDerivative_rank_one`.

**Hypotheses.**

- Hypotheses 6.1, 6.7, 6.11
- M a power of p

**Construction or proof.**

1. Invariance: (σ_q − 1)D_q = |G_q| − N_{G_q} (ES.3/derivative-operators) and the Euler system relation, as in ES.3/derivative-invariance, now in the bidual (Lemma 6.9); descent to K uses Hypothesis 6.1 (Proposition 6.10): reflexivity and H⁰ = 0 identify invariants of the bidual with the bidual over the base.
2. Local properties and the correction: reduce to rank one by the rank-reduction formalism (the L6 compatible-functional-lift and contraction contract) applied to Φ ∈ ⋀^{r−1}, then use ES.3/derivative-local-properties and the correction of ES.3/euler-to-kolyvagin (Mazur–Rubin Appendix A), whose hypothesis (b) is Hypothesis 6.11.
3. Independence of generators: the class is recorded in the tensor factor ⟨∏(σ_q − 1)⟩ ≅ G_n.
4. BSS II §6.5, Lemma 6.20: lift each (r−1)-fold functional at a finite level first across E(n)/E using self-injective duality, then through coefficient reduction, then to a compatible global tower family. Rank reduction tests all these functionals. Rank-one local compatibility proves membership and the finite–singular edge relation, whose contraction sign (−1)^{r−1} occurs on both sides and cancels. The norm/functional-lift input is Sano 2014 Lemma 2.10 and Remark 2.12, generalized by the exact L6 contract.

**Uses.**

- Burns–Sakamoto–Sano II, Corollaries 6.15, 6.17, 6.18: Fitting-ideal bounds for Selmer modules from higher-rank Euler systems.
- ES.3/euler-to-kolyvagin: the rank-one map over a number field K.

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.EulerSystems.rawHigherDerivative` | constructor | κ′(c_n) = D_n·c̄_n ∈ ⋂^r_ℛ H¹(O_{K,S_n}, A). |
| `TauCeti.EulerSystems.higherDerivative` | constructor | D_r^F : ES_r(T, 𝒦) → KS_r(A_F, F_can). |
| `TauCeti.EulerSystems.higherDerivative_one` | characterisation | D_r(c)_1 = c_F modulo M, under ⋂^r_{R[𝒢_F]} H¹(O_{F,S}, T/M) ≅ ⋂^r_{R̄[𝒢_F]} H¹(O_{K,S}, A_F). |
| `TauCeti.EulerSystems.higherDerivative_singular` | relation | v_q(D_r(c)_n) = φ^fs_q(D_r(c)_{n/q}) for q \| n. |
| `TauCeti.EulerSystems.higherDerivative_indep` | compatibility | For fixed E, the corrected classes are independent of cyclic generators in the intrinsic tame tensor factor. Auxiliary-E independence at fixed target F is the additional Corollary 6.13 dictionary in the supplier request. |
| `TauCeti.EulerSystems.higherDerivative_rank_one` | compatibility | At conductor one in rank one, the raw descended class agrees with coefficient reduction of the Rubin initial component under Shapiro and bidual evaluation. Full corrected MR-family comparison is the exact coefficient/Euler/augmentation dictionary in the supplier request. |

**Unit tests.**

- `TauCeti.EulerSystems.higherCorrection_empty` (degenerate): The empty correction determinant Δ₁ equals 1.
- `TauCeti.EulerSystems.higherCorrection_one_prime` (computation): For one prime, the zero-diagonal correction determinant is zero.
- `TauCeti.EulerSystems.higherDerivative_two_primes` (computation): For two primes, Δ=−P_{q₂}^{q₁}P_{q₁}^{q₂}, retaining the negative cross-term in the corrected derivative.
- `TauCeti.EulerSystems.higherDerivative_zero` (degenerate): The higher derivative takes the zero Euler system to zero.
- `TauCeti.EulerSystems.higherDerivative_needs_611` (non-example): A nonzero trivial rank-one representation fails Frobenius injectivity 6.11 at every selected prime.

**Acceptance checks.**

- For r = 1, K = ℚ, R = O, E = ℚ: D_1 is the map of ES.3/euler-to-kolyvagin reduced modulo M, after the dictionary P_q(Fr_q^{-1}) between the conventions (ES.2/euler-factor-change).
- D_r is R[[Gal(𝒦/K)]]-semilinear through Gal(𝒦/K) → Gal(F/K).
- Additional arithmetic check: For n = 1: κ′(c_1) = c̄_E, the image of c_E.
- Additional arithmetic check: For n = q: κ(c)_q = κ′(c_q) ⊗ (σ_q − 1), with singular part φ^fs_q(c_F mod M) at q.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.7/higher-rank-euler-systems`, `EulerSystemsAndKolyvaginSystems:ES.6/kolyvagin-systems-rank-r`, `EulerSystemsAndKolyvaginSystems:ES.6/bidual-functoriality`, `EulerSystemsAndKolyvaginSystems:ES.3/derivative-operators`, `EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties`, `EulerSystemsAndKolyvaginSystems:ES.3/euler-to-kolyvagin`, `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`, `EulerSystemsAndKolyvaginSystems:ES.2/euler-factor-change`.

**Sources.**

- bss2, Theorem 6.12, p. 41: The derivative classes form a Kolyvagin system of rank r.
- bss2, Corollary 6.13, p. 42: The homomorphism D_r.
- bss2, Proposition 6.10, p. 40: The uncorrected derivative.

### Fitting-ideal control from higher-rank Euler systems

`EulerSystemsAndKolyvaginSystems:ES.7/fitting-bounds` — theorem.

**Statement.** Let p > 3, r ≥ 1, c ∈ ES_r(T, 𝒦), F = F_can, F a subfield of E/K and A_F = Ind_{G_F}^{G_K}(T/MT). Assume Hypotheses 6.1, 6.7, 6.11 and Hypotheses 3.2, 3.3, 4.2 for A_F and F_can, and let κ(c) = D_r^F(c). Then (i) for n ∈ N, im(κ(c)_n) ⊆ Fitt⁰_{R̄[𝒢_F]}(H¹_{F(n)^*}(K, A_F^*(1))^*); in particular im(c_F) ⊆ Fitt⁰_{R̄[𝒢_F]}(H¹_{F^*}(K, A_F^*(1))^*); (ii) for every i ≥ 0, I_i(κ(c)) ⊆ Fitt^i_{R̄[𝒢_F]}(H¹_{F^*}(K, A_F^*(1))^*). In (i), equality holds whenever κ(c) is a basis of KS_r, without a principal-ring assumption. For the higher I_i in (ii), equality for a basis is asserted when R̄[𝒢_F] is a principal ideal ring. These are containments of ideals of the group ring R̄[𝒢_F], which is not a domain: they are not valuation formulas and do not reduce to orders of underlying groups.

**Suggested declarations.** `TauCeti.EulerSystems.higherEuler_fitting_bound`, `TauCeti.EulerSystems.higherEuler_fitting_equality_zero`.

**Hypotheses.**

- p > 3
- Hypotheses 6.1, 6.7, 6.11; 3.2, 3.3, 4.2 for A_F

**Construction or proof.**

1. Apply ES.6/regulator-isomorphism(b) to κ(c) ∈ KS_r(A_F, F_can), with κ(c)_1 = c_F.

**Acceptance checks.**

- For the Rubin–Stark setting (Theorem 7.1): im(η^χ_{L/K,S}) ⊆ Fitt⁰_O((ℤ_p ⊗ Cl(O_L))^χ), conditionally on the Rubin–Stark conjecture.
- For r = 1 over a discrete valuation ring this is the bound of ES.4/kolyvagin-bound in Fitting-ideal form.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.7/higher-kolyvagin-derivative`, `EulerSystemsAndKolyvaginSystems:ES.6/regulator-isomorphism`, `EulerSystemsAndKolyvaginSystems:ES.6/bss-hypotheses`, `PadicMeasuresIwasawaAlgebras:L6`.

**Sources.**

- bss2, Corollary 6.15, p. 42: The Fitting-ideal bounds.

### The Rubin–Brumer–Stark element and Rubin's conjecture

`EulerSystemsAndKolyvaginSystems:ES.7/rubin-brumer-stark` — construction.

**Statement.** In the setting of ES.6/rubin-lattice let Θ_{S₀,T} ∈ ℚ[G]^− be the Stickelberger element for S₀ ⊇ S_∞ ∪ S_ram and T. The Rubin–Brumer–Stark element is the unique u_RBS ∈ ⋀^r_{ℚ[G]} ℚU_{V,T}^− with ord_G(u_RBS) = Θ_{S₀,T}. It depends on the choice of the w_j only up to multiplication by an element of G. Rubin's conjecture is the proposition u_RBS ∈ 𝓛; its validity is independent of the w_j. It is stated here as a proposition and is a hypothesis of any application of the higher-rank machinery to these elements: a conjectural Rubin–Stark element is an Euler system of rank r only once its integrality (membership in the bidual lattices) and its norm relations along Ω(𝒦/K) are proved. The prime-to-2 part of the conjecture is a theorem of Dasgupta–Kakde, owned by IntegralIwasawaTheory I.7.

**Suggested declarations.** `TauCeti.RubinStark.rubinBrumerStark`, `TauCeti.RubinStark.ordG_rubinBrumerStark`, `TauCeti.RubinStark.rubinBrumerStark_change_w`, `TauCeti.RubinStark.RubinConjecture`, `TauCeti.RubinStark.rubinConjecture_indep`.

**Hypotheses.**

- as in ES.6/rubin-lattice
- Θ_{S,T} ∈ ℚ[G]^− defined by the partial zeta values at 0

**Construction or proof.**

1. Existence and uniqueness: ord_G is an isomorphism (ES.6/rubin-lattice).
2. Dependence on w_j: replacing w_j by g·w_j multiplies ord_G by a group element.

**Uses.**

- Dasgupta–Kakde, Theorem 1.6: u_RBS ∈ 𝓛 ⊗ ℤ[1/2].

**API.**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.RubinStark.rubinBrumerStark` | constructor | u_RBS = ord_G⁻¹(Θ_{S,T}). |
| `TauCeti.RubinStark.ordG_rubinBrumerStark` | simp | ord_G(u_RBS) = Θ_{S,T}. |
| `TauCeti.RubinStark.rubinBrumerStark_change_w` | relation | For another choice of the w_j, u_RBS changes by multiplication by an element of G. |
| `TauCeti.RubinStark.RubinConjecture` | structure | The proposition u_RBS ∈ 𝓛, with no instance provided. |
| `TauCeti.RubinStark.rubinConjecture_indep` | characterisation | RubinConjecture does not depend on the choice of the w_j. |

**Unit tests.**

- `TauCeti.RubinStark.rubinBrumerStark_zero` (degenerate): Zero Θ gives zero Rubin–Brumer–Stark element and satisfies the integrality conjecture.
- `TauCeti.RubinStark.rubinBrumerStark_unique` (characterisation): Any minus element with ord_G(x)=Θ equals the Rubin–Brumer–Stark element.
- `TauCeti.RubinStark.rubinConjecture_not_projector` (non-example): The minus projector (1−c)/2 over ℚ[C₂] is not the coefficientwise image of an integral group-ring element.

**Acceptance checks.**

- For r = 1: u_RBS is the Brumer–Stark unit and Rubin's conjecture is the Brumer–Stark conjecture.
- ES.7/rubin-stark-minus-comparison records the dictionary and the parity boundary; BSS Theorem 7.1 is a separate conditional application.
- Additional arithmetic check: For r = 1, u_RBS is the element of ℚU_{S,T}^− with Σ_σ [σ^{-1}] ord_w(σu) = Θ_{S,T}: the Brumer–Stark unit, and RubinConjecture is u ∈ U_{S,T}.
- Additional arithmetic check: RubinConjecture is not the statement u_RBS ∈ image of ⋀^r_{ℤ[G]} U_{S,T}^−: exterior-bidual integrality can be weaker when r≥2. Use the explicit minus-part lattice computation of rubin-lattice as an algebraic witness; strictness is not asserted for every arithmetic unit lattice.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.6/rubin-lattice`, `EulerSystemsAndKolyvaginSystems:ES.7/higher-rank-euler-systems`.

**Sources.**

- dk, §1.2, p. 8: Definition of u_RBS.
- dk, Conjecture 1.5, p. 8: Rubin's conjecture.

### Rank-one specialisation of the higher-rank theory

`EulerSystemsAndKolyvaginSystems:ES.7/rank-one-comparison` — comparison.

**Statement.** On common admissible towers satisfying 6.7, under Hypothesis 6.1 and the universal-norm/unramified comparison, ES_1(T, 𝒦) is the module of ES.2/euler-system-module with coefficients R, with the dictionary P_q(x) = det(1 − Fr_q^{-1}x | T^*(1)) = Rubin's P(Fr_q^{-1} | T^*; x); KS_1(A, F) is ES.3/kolyvagin-system-module for A; D_1 is the map of ES.3/euler-to-kolyvagin modulo M (over ℚ) and supplies that map over a general number field K under Hypotheses 6.1, 6.7 and 6.11; and for R a discrete valuation ring the bound I_0(κ) ⊆ Fitt⁰ is length H¹_{F^*} ≤ ∂^{(0)}(κ) of ES.4/kolyvagin-bound. The conventions differ in two places, both explicit: the Euler factor (ES.2/euler-polynomial) and the identification G_q ≅ ⟨σ_q − 1⟩ ⊆ 𝓘/𝓘² (Mazur–Rubin's ρ_q).

**Suggested declarations.** `TauCeti.EulerSystems.higherDerivative_rank_one`, `TauCeti.StarkSystems.KolyvaginSystemRank.rank_one_equiv`.

**Hypotheses.**

- Hypotheses 6.1 and 6.7 on a common tower, plus the cohomology/unramified and coefficient dictionaries.
- Hypothesis 6.11 for the derivative comparison; rank-one admissibility and a DVR for the length/Fitting comparison.

**Construction or proof.**

1. ⋂^1 = identity on reflexive modules (ES.6/exterior-bidual); compare definitions termwise.
2. The correction terms of Theorem 6.12 for r = 1 are those of Mazur–Rubin's Appendix A, cited by the source.

**Acceptance checks.**

- For T = ℤ_p(1) ⊗ χ^{-1} over ℚ both constructions give the cyclotomic-unit Kolyvagin system modulo M.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.7/higher-kolyvagin-derivative`, `EulerSystemsAndKolyvaginSystems:ES.3/euler-to-kolyvagin`, `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`, `EulerSystemsAndKolyvaginSystems:ES.4/kolyvagin-bound`.

**Sources.**

- bss2, Remark 6.5, p. 37: Rank-one Euler systems are the classical ones.

### Euler-system and Rubin–Stark class-group bounds

`EulerSystemsAndKolyvaginSystems:ES.7/rubin-stark-class-group` — application.

**Statement.** Let p be odd, χ a nontrivial finite character of G_K of order prime to p with χ≠ω, L its fixed field, O=ℤ_p[im χ], T_χ=O(1)⊗χ⁻¹, and r=|S_∞(K)|. Every archimedean place of K splits in L. Fix S⊇S_∞(K)∪S_ram(L/K), |S|>r, an ordered set of archimedean places and places above them, and the pro-p abelian tower 𝒦/K of BSS II §7 satisfying Hypothesis 6.7 for S∪S_p. No p-adic place splits completely in L/K, and p>3 or χ²≠ω. Write C_χ=(ℤ_p⊗Cl(O_L))^χ and I_i(T_χ) for the O-ideal generated by I_i(κ(c)) as c ranges over every rank-r Euler system on this tower. Then I_i(T_χ)⊆Fitt^i_O(C_χ) for every i≥0. If no finite place of S splits completely in L/K, equality holds for every i and C_χ≃⊕_{i≥0}I_{i+1}(T_χ)/I_i(T_χ). If Rubin–Stark Conjecture B′ holds for LF/K for every finite F⊆𝒦, its elements have integral χ-components in the cohomological biduals and the norm relations make a rank-r Euler system c^RS; hence im(η^χ_{L/K,S})⊆Fitt⁰_O(C_χ). Only this last conclusion assumes the conjecture. No Leopoldt hypothesis is imposed.

**Suggested declarations.** `TauCeti.RubinStark.ClassGroups.rubin_stark_class_group_bound`, `TauCeti.RubinStark.ClassGroups.class_group_fitting_bound`, `TauCeti.RubinStark.ClassGroups.class_group_fitting_equality`.

**Hypotheses.**

- Every displayed character, archimedean splitting, tower, S, and p hypothesis.
- The Rubin–Stark conclusion assumes the full Conjecture B′ at every finite LF/K, including rationality and integral bidual membership of the elements characterized by the ordered archimedean regulator. Integrality at L alone is insufficient.

**Construction or proof.**

1. Kummer theory identifies the canonical dual Selmer module with the χ-class group of O_L[1/p] (BSS equation (14)). The no-p-splitting condition makes its projection from C_χ an isomorphism.
2. Rank-one T_χ and χ≠1,ω verify the representation and freeness conditions; the archimedean splitting and local non-splitting give core rank r and the local hypotheses of Corollary 6.18.
3. Apply Corollary 6.18(i) for inclusion, and (iii) with no finite split S-place for equality and invariant factors.
4. Conjecture B′ at every tower level gives rational Rubin–Stark elements characterized by the ordered archimedean regulator, with integral χ-components. Their source norm relations and the unit/Kummer dictionaries give c^RS. Apply the zeroth Fitting bound at its base component. The prototype records a rational family with norm relations as input, then the integral-range predicate; it does not construct that family unconditionally from complex L-values.

**Acceptance checks.**

- The statement retains every displayed hypothesis and the indicated coefficient convention.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.7/fitting-bounds`, `EulerSystemsAndKolyvaginSystems:ES.7/higher-rank-euler-systems`, `EulerSystemsAndKolyvaginSystems:ES.6/bss-hypotheses`, `SelmerIwasawaCohomology:L2`, `IntegralIwasawaTheory:I.7`.

**Sources.**

- bss2, §7, equation (14) and Theorem 7.1(i)–(iii), pp. 48–50; Remarks 7.2–7.3, p. 50: Character assumptions, class-group identification, unconditional all-system ideals and conditional Rubin–Stark element.

### Archimedean and minus-unit Rubin–Stark dictionaries

`EulerSystemsAndKolyvaginSystems:ES.7/rubin-stark-minus-comparison` — comparison.

**Statement.** The two constructions share the integral bidual condition but have different character and regulator data. BSS II §7 takes T_χ=O(1)χ⁻¹, r=|S_∞(K)| and χ trivial on every real decomposition group: for totally real K these are even characters and the ordered regulator uses archimedean places. DK §1.2 takes a CM abelian H/F with F totally real, projects to the minus part (characters odd on complex conjugation), and rank r counts chosen finite split primes; ord_G is the determinant of their valuations and u_RBS=ord_G⁻¹Θ_{S₀,T}. Their lattice is the rational minus component intersected with the integral ℤ[G]-bidual, followed by p-adic/character projection for odd p. Thus DK Theorem 1.6 supplies the specialized minus-unit integrality owned by IntegralIwasawaTheory I.7; it is not an instance of BSS Theorem 7.1. Applying the general higher-rank derivative/Fitting machinery to DK families requires separate integrality at every level, actual norm relations, and the appropriate Selmer/tower hypotheses. Neither an equality between the two elements nor a class-group bound from Theorem 7.1 is inferred across these incompatible parity hypotheses.

**Suggested declarations.** `TauCeti.RubinStark.cm_not_archimedean_split`, `TauCeti.RubinStark.even_character_kills_minus`.

**Hypotheses.**

- The BSS §7 setting for the first dictionary; the CM minus and finite split-prime DK setting for the second.
- p odd when projecting DK integrality away from 2; no assertion at p=2.

**Construction or proof.**

1. Read the regulator-defining equations in BSS §7 and DK §1.2: archimedean splitting forces even real character parity, whereas the minus projector forces odd parity.
2. Use the L6 integral bidual lattice identification to express both integrality conditions; the chosen ranks and regulator maps remain those of their separate arithmetic inputs.
3. DK Theorem 1.6 yields membership after inverting 2. General Euler-system applications still require a norm-compatible integral family and the BSS hypotheses, not just a base-level unit.

**Acceptance checks.**

- The statement retains every displayed hypothesis and the indicated coefficient convention.

**Prerequisites.** `EulerSystemsAndKolyvaginSystems:ES.6/rubin-lattice`, `EulerSystemsAndKolyvaginSystems:ES.7/rubin-brumer-stark`, `EulerSystemsAndKolyvaginSystems:ES.7/rubin-stark-class-group`, `PadicMeasuresIwasawaAlgebras:L6`.

**Sources.**

- bss2, §7, pp. 48–50: Archimedean splitting, χ, r and conditional tower elements.
- dk, §1.2, equations (8)–(10), Conjecture 1.5 and Theorem 1.6, pp. 7–9: Minus units, finite split primes, valuation regulator and away-from-2 integrality.

## Exact supplier requests

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields

Existence of the ray class field of K modulo a prime q, with Gal(K[q]/K) ≅ the ray class group Cl_q(K), and the description of its ramification; used to define K(q), K(1) and Γ_q.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower`, `EulerSystemsAndKolyvaginSystems:ES.2/conductor-presentation`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors

The absolute local Artin map, normalized by arithmetic Frobenius, and its restriction to finite tame extensions, identifying the p-primary tame inertia quotient with residue-field units (or the relative residue-unit quotient at Howard’s inert primes). Local Tate duality is supplied separately by Layer 5.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`, `EulerSystemsAndKolyvaginSystems:ES.1/transverse-duality`.

### tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev

The Chebotarev density theorem for a finite Galois extension of number fields in Dirichlet-density form: the primes with a given Frobenius class have density |C|/|G|; in particular infinitely many, also after removing a finite set.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`, `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing`, `EulerSystemsAndKolyvaginSystems:ES.1/rubin-prime-selection`, `EulerSystemsAndKolyvaginSystems:ES.1/abundant-tuples`, `EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem`.

### PadicMeasuresIwasawaAlgebras:L6

Own the generic exterior bidual and ξ determinant map, projective comparison and integral lattice; for commutative noetherian self-injective artinian R and finitely generated modules, exact R-duality, reflexivity, kernel contractions, rank reduction and the free-ambient coefficient-change square of BSS II Proposition 2.4/Corollary 2.7. For finite abelian Γ→Γ/H and Gorenstein orders, supply group-ring change, invariants descent and the integral transfer map of BSS II §6.3 map (9): its normalization is i(N_H^{∧r}x)=N_H x, as Sano 2014 Remark 2.12, not ordinary functoriality of M^H→M. Supply compatible functional lifts along towers (Sano Lemma 2.10) and the modulo-M comparison used by BSS Lemma 6.9. Generic Fitting ideals are already in current Tau Ceti and are not a new L6 target. Include the larger-auxiliary-field to target-field projection of BSS Corollary 6.13 and its compatibility with reduction, augmentation factors, corestriction and Shapiro; identify the full rank-one corrected family with MR04 Appendix A after both Euler conventions are transported. The prototype tests raw rank-one base evaluation and generator independence, with the wider comparisons retained as supplier contracts.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.6/bidual-functoriality`, `EulerSystemsAndKolyvaginSystems:ES.6/stark-structure`, `EulerSystemsAndKolyvaginSystems:ES.6/bss-hypotheses`, `EulerSystemsAndKolyvaginSystems:ES.6/regulator-isomorphism`, `EulerSystemsAndKolyvaginSystems:ES.7/higher-rank-euler-systems`, `EulerSystemsAndKolyvaginSystems:ES.7/fitting-bounds`, `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`, `EulerSystemsAndKolyvaginSystems:ES.6/stark-systems`, `EulerSystemsAndKolyvaginSystems:ES.7/higher-kolyvagin-derivative`.

### SelmerIwasawaCohomology:L2

General-coefficient extension of the existing O-adic Selmer layer: canonical continuous H¹ on TopRep over complete noetherian local R; quotient and discrete Cartier-dual carriers, local Tate pairings compatible with quotient/submodule propagation, unramified and transverse exact annihilators; MR04 Theorems 2.3.3–2.3.4 (finite global length formula and change-of-condition sequence); BSS II Theorem 3.1 over commutative noetherian self-injective local R, with finitely generated modules and dual Hom_R(−,R). The compact DVR case retains the discrete torsion dual. Each R-general consumer points to this requested stage rather than an O-only node. Also supply the actual cocycle formula for the induced integral local map: its image propagates the lattice canonical condition at p and infinity, rather than replacing that image by the full finite-coefficient local H¹. Retain the finite-level reflexivity and zero-conductor conditions in the rank-one bidual/ordinary Kolyvagin comparison. Supply the finite-localization criterion used in LTXZZ Proposition 2.4.6: purity of weight −1 and conjugate self-duality imply finite torsion local lattice conditions away from ℓ, uniformly annihilated before reduction modulo λ^m. The prototype states the resulting finite-torsion criterion and its uniform consequence explicitly.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`, `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`, `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-formula`, `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-independence-of-modulus`, `EulerSystemsAndKolyvaginSystems:ES.0/quotient-category`, `EulerSystemsAndKolyvaginSystems:ES.0/quotient-dual-propagation`, `EulerSystemsAndKolyvaginSystems:ES.0/selmer-length-difference`, `EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification`, `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`, `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`, `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`, `EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth`, `EulerSystemsAndKolyvaginSystems:ES.1/transverse-duality`, `EulerSystemsAndKolyvaginSystems:ES.4/howard-descent-with-errors`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`, `EulerSystemsAndKolyvaginSystems:ES.4/vertex-step`, `EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure`, `EulerSystemsAndKolyvaginSystems:ES.5/kolyvagin-dual-selmer`, `EulerSystemsAndKolyvaginSystems:ES.6/bidual-functoriality`, `EulerSystemsAndKolyvaginSystems:ES.6/stark-structure`, `EulerSystemsAndKolyvaginSystems:ES.4/abundant-localization`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality

Perfect local Tate pairings for finite p-primary unramified coefficients at places of residue characteristic different from p, with the cup/invariant normalization, restriction-corestriction adjointness and the exact-annihilator statement used for the transverse condition. Mixed-characteristic p-adic lattice/discrete extensions are requested from SelmerIwasawaCohomology L1/L2.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`, `EulerSystemsAndKolyvaginSystems:ES.1/transverse-duality`.

### ClassicalArithmeticCompletion:CA.7

Extend its existing noncommutative order/maximal-order interface by the exact algebraic lemma used in Nekovář Proposition 6.4.3: for an order Λ in a finite-dimensional semisimple Q_p-algebra, choose a maximal order containing Λ and a fixed conductor power; identify torsion-free lattices over the maximal order, compare Hom into the coefficient quotient with its maximal-order dual, and bound the pairing cokernel by that conductor power uniformly in the torsion exponent. Use characteristic zero. The commutative Gorenstein L6 theory cannot discharge this; no claim of reading Curtis–Reiner is made.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.4/nekovar-all-prime-descent`.

### HeegnerPointEulerSystems:HE.7

For the all-prime CM-point application supply Nekovář §3.1 arithmetic data and §5.19 O_L-linear isogeny: compact quaternionic Shimura curve/Jacobian quotient of GL₂ type, CM points and their Hecke norm/congruence relations, the non-CM condition (*), polarization/complex-conjugation pairing, and the fixed uniform component-group, image-order and character-overlap constants of §§6.1–6.6. ES.4 owns the conditional bounded-error descent, not these geometric constructions or verification of their hypotheses. Supply the classical elliptic local Kummer-image/Weil-pairing realization used by MR04 §6.2, so its classical Selmer structure and canonical core-rank comparison have actual local-point dictionaries.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.4/nekovar-all-prime-descent`, `EulerSystemsAndKolyvaginSystems:ES.0/example-elliptic`.

### HeegnerPointEulerSystems:HE.0/ring-class-tower-quotients

Howard §1.1 inert ring-class local dictionary: the conductor-ℓ ring class field, its maximal p-subextension and totally ramified local restriction subgroup at λ, normalized reciprocity k_λ×/k_ℓ× of order ℓ+1, and the rank-two finite/transverse comparison of Proposition 1.1.7. This is not the MR rank-one-coinvariant comparison. Generic CFT remains its supplier; HE owns the ring-class specialization.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`.

### IntegralIwasawaTheory:I.7

Part II for archimedean Rubin–Stark elements, distinct from the finite-place CM minus construction: ordered infinite places and chosen extensions, the determinant logarithmic regulator, rationality in the full S-unit exterior/bidual lattice, Conjecture B′ integrality at every LF/K, and the character/Kummer and norm transports into Tχ cohomology. Supply these as input to ES.7’s conditional class-group application. The DK finite-place ord_G isomorphism is not this archimedean regulator.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.7/rubin-stark-class-group`, `EulerSystemsAndKolyvaginSystems:ES.7/rubin-stark-minus-comparison`.

## Gaps and bounded source coverage

### Kolyvagin's article was not read

V. A. Kolyvagin, 'Euler systems', The Grothendieck Festschrift II (1990), is not publicly available. As in the reviewed extraction PAPER-KOLYVAGIN-90, Rubin's book is used as the public statement of the method; no claim is made about the wording of Kolyvagin's article.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.3/congruence`, `EulerSystemsAndKolyvaginSystems:ES.2/rigidity-variants`.

### General coefficient Selmer duality is still only an open supplier request

The cited SelmerIwasawaCohomology L1/L2 duality and Cartier-dual nodes use O-adic lattices/discrete modules. The abstract L2/selmer-data carrier alone does not prove MR04 artinian/global-length identities or BSS self-injective-ring duality. Fulfil the enlarged L2 request and link each generalized coefficient consumer to it; no O-only theorem may discharge a general-R hypothesis.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`, `EulerSystemsAndKolyvaginSystems:ES.0/quotient-category`, `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`, `EulerSystemsAndKolyvaginSystems:ES.0/quotient-dual-propagation`, `EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification`, `EulerSystemsAndKolyvaginSystems:ES.0/selmer-length-difference`, `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-independence-of-modulus`, `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`, `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-formula`, `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`, `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`, `EulerSystemsAndKolyvaginSystems:ES.1/transverse-duality`, `EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth`, `EulerSystemsAndKolyvaginSystems:ES.4/vertex-step`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`, `EulerSystemsAndKolyvaginSystems:ES.5/kolyvagin-dual-selmer`, `EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure`.

### Nekovář maximal-order input

The owner is ClassicalArithmeticCompletion CA.7, whose maximal-order existence target is linked directly. Its exact request now specifies the missing uniform lattice-dual pairing-cokernel bound of Nekovář Proposition 6.4.3. Generic commutative L6 algebra is insufficient. Filling the supplier lemma remains prerequisite implementation work; the source proof and all-prime theorem are planned here.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.4/nekovar-all-prime-descent`.

### L6 transfer implementation and coefficient dictionaries

The source normalization is verified against Sano 2014 Proposition 2.4, Lemma 2.10 and Remark 2.12, pp.4–7: i(N_H^{∧r}x)=N_Hx. BSS II map (9), invariant descent and compatible-functional lifts now have an exact L6 request and arithmetic prototype maps. Their proofs and implementation in the supplier remain supplier implementation obligations. The displayed higherDerivative_indep checks generators at fixed E; Corollary 6.13 additionally requires the target-field projection and independence of larger auxiliary E. The rank-one prototype checks the raw base component; the full corrected MR comparison is retained as the exact dictionary below.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.7/higher-kolyvagin-derivative`, `EulerSystemsAndKolyvaginSystems:ES.6/bidual-functoriality`.

### Omitted geometric and archimedean prototype conditions

PROTOCOL §13 permits leaving an unavailable condition out of a suggested signature and forbids opaque Prop substitutes. The Nekovář §3.1/§5.19 CM-point/quaternionic and non-CM condition (*) and the ordered archimedean regulator characterization of Rubin–Stark elements are left out of the prototype and retained in the mathematical statements and exact HE.7/I.7 requests. Do not infer source theorems from the displayed prototype data alone. These are supplier-carrier implementation boundaries, not omitted mathematical hypotheses. The classical elliptic Kummer/Weil-pairing realization and the purity/polarization realization of the local finite-torsion criterion are also supplier geometry. Their arithmetic consequences have typed interfaces, while the full geometric conditions remain in the packet and the HE.7/L2 requests.

Consumers: `EulerSystemsAndKolyvaginSystems:ES.4/nekovar-all-prime-descent`, `EulerSystemsAndKolyvaginSystems:ES.7/rubin-stark-class-group`, `EulerSystemsAndKolyvaginSystems:ES.0/example-elliptic`, `EulerSystemsAndKolyvaginSystems:ES.4/abundant-localization`.

## Source findings retained from the independent review

The findings are scoped to the versions actually inspected. The historical review verdicts remain unchanged. The following descriptions paraphrase the source claim and the correction.

### EulerSystemsAndKolyvaginSystems/E1

bss2, Hypothesis 4.7(ii), p. 22 of arXiv:1805.08448v1.

**Claim at that location.** Condition (ii) requires some τ ∈ G_{K(T)_{p^∞}} for which T/(τ − 1)T ≃ R as R-modules.

**Correction.** τ should be taken in G_{K_{p^∞}}, where K_{p^∞} = ⋃_m K_{p^m} and K_{p^m} = K(μ_{p^m}, (O_K^×)^{1/p^m})K(1): 'there exists τ ∈ G_{K_{p^∞}} such that T/(τ − 1)T ≃ R'.

**Reason.** K(T) is by definition the minimal Galois extension of K such that G_{K(T)} acts trivially on T, so every τ ∈ G_{K(T)_{p^∞}} ⊆ G_{K(T)} acts trivially on T and T/(τ − 1)T = T, which is isomorphic to R only when T has rank one. The finite-level Hypothesis 3.2(ii) takes τ ∈ G_{K_M}, and Remark 4.9 says that Hypothesis 4.7 'clearly' gives Hypotheses 3.2(i) and (ii) for T/p^mT, which is true for τ ∈ G_{K_{p^∞}} ⊆ G_{K_{p^m}} and false in rank at least two for the printed group.

**Publication status.** new

### EulerSystemsAndKolyvaginSystems/E2

rubin-es, 1999 course draft Chapter IX §1, p.133; also book-format author copy §9.1 p.175 (PDF p.181).

**Claim at that location.** The source takes the largest abelian extension of K with ramification confined to N.

**Correction.** For the isolated-initial-class example take the maximal abelian extension unramified at every prime dividing N.

**Reason.** The printed extension contains the cyclotomic Z_p-extension because p divides N, contrary to the following parenthesis. For a nontrivial extension ramified only at N, the Euler-factor product is empty, hence is 1, and the family c_F=0 for F≠K requires c_K=0. With no ramification at N and class number one, every nontrivial finite abelian extension ramifies at a prime outside N, where the stipulated factor vanishes; the claimed arbitrary c_K family then works.

**Publication status.** new

### EulerSystemsAndKolyvaginSystems/E3

mr-ks, Archived author copy, Proposition 3.4.4(ii), p.27 (PDF p.33).

**Claim at that location.** The source asserts that Γ(S) admits an isomorphism, without a canonical choice, to an ideal of R.

**Correction.** Evaluation identifies Γ(S) with a submodule of the cyclic hub stalk. It is isomorphic to an ideal if the hub stalk is free of rank one, or if R is principal artinian. The unrestricted complete noetherian local assertion needs such additional hypotheses.

**Reason.** Let R=Z_p and take the graph with one vertex and no edges, with S(v)=R/pR. The sheaf is locally cyclic, its vertex is a hub and monodromy is trivial. Γ(S)=R/pR is nonzero torsion, whereas every ideal of the domain R is torsion-free. The proof’s injection into a cyclic module does not imply injection into R.

**Publication status.** new

## Structure and consumer routing

### rescope — EulerSystemsAndKolyvaginSystems, EulerSystemsCyclotomicMainConjecture, KatoEulerSystems

Red-team finding RT-AREA-iwasawa-1/36: the application adapters import this roadmap's carriers and bounds but have no stage edge from it. ES.2 plans the Euler-system carrier with Rubin's Definition II.1.1 hypotheses, the conductor presentation, the Euler polynomial dictionary and twisting (the request of EulerSystemsCyclotomicMainConjecture L0 is met by ES.2/euler-system-module, conductor-presentation, euler-polynomial and twisting); ES.4 plans Rubin's Theorem II.2.2 (ES.4/rubin-bound).

Add the stage edges EulerSystemsAndKolyvaginSystems:ES.2 → EulerSystemsCyclotomicMainConjecture:L0, ES.2 → KatoEulerSystems:L2, ES.4 → KatoEulerSystems:L4 and ES.8 → KatoEulerSystems:L4; drop EulerSystemsCyclotomicMainConjecture:L0 → KatoEulerSystems:L2 and EulerSystemsCyclotomicMainConjecture:L2 → KatoEulerSystems:L4 unless a KatoEulerSystems node cites a cyclotomic-unit statement. All added edges are acyclic.

### rescope — EulerSystemsAndKolyvaginSystems, HeegnerPointEulerSystems, GeneralizedHeegnerCycles

Red-team finding RT-AREA-iwasawa-1/10: Howard's abstract self-dual Kolyvagin-system theory had no owner. This packet makes ES.5 its single owner: ES.5/howard-hypotheses (H.0–H.5 and the Kolyvagin-system relations twisted by G_n), ES.5/cassels-structure (Proposition 1.4.1, Theorem 1.4.2, Lemma 1.5.3), ES.5/howard-stub (Proposition 1.5.9) and ES.5/howard-dvr-theorem (Theorem 1.6.1). The Λ-adic Theorem 2.2.10 belongs to ES.8, outside this packet's scope.

HeegnerPointEulerSystems HE.6 keeps only the verification of H.0–H.5 for T_p(E) (Howard Theorem 1.6.5) and applies ES.5/howard-dvr-theorem; add the stage edges ES.5 → GeneralizedHeegnerCycles:GH.5 and ES.8 → GeneralizedHeegnerCycles:GH.5, and HeegnerPointEulerSystems:HE.6 → HE.8. The follow-up job for ES.8 plans Howard's Theorem 2.2.10 as a generic node.

### split — EulerSystemsAndKolyvaginSystems

ES.4 and ES.6 are each too broad to read as one star.

ES.4 into three sub-layers: 'Selmer sheaf and core vertices' (selmer-sheaf, sheaf-monodromy, vertex-step, core-vertices, leading-vertices, stub-sheaf, kolyvagin-bound); 'Rubin's error-tolerant bound' (rubin-hypotheses, rubin-bound, variant-bounds); 'Bounded-error localisation' (abundant-localization, weak-cassels-structure, howard-descent-with-errors, nekovar-all-prime-descent). ES.6 into two: 'Rubin lattice and arithmetic bidual adapters' (rubin-lattice and the arithmetic specializations of exterior-bidual/bidual-functoriality, importing generic algebra from PadicMeasuresIwasawaAlgebras L6) and 'Stark systems and the regulator' (stark-systems, stark-structure, bss-hypotheses, kolyvagin-systems-rank-r, regulator-isomorphism, stark-comparison). ES.1 may likewise separate 'Error-tolerant Chebotarev inputs' (reducibility-depth, selmer-field-saturation, abundant-tuples) from the clean theory.

### extend — IntegralIwasawaTheory, EulerSystemsAndKolyvaginSystems

Integral Iwasawa theory, Part II: archimedean Rubin–Stark regulator inputs. Its first prerequisite is IntegralIwasawaTheory I.7, which supplies the finite-place CM minus construction and prime-to-2 DK theorem. The ordered archimedean regulator, rationality and all-level Conjecture B′ inputs are a distinct extension, with ES owning the conditional class-group descent.

Extend I.7 in that direction and add IntegralIwasawaTheory:I.7 → EulerSystemsAndKolyvaginSystems:ES.7 for the exact input contract of rubin-stark-class-group and rubin-stark-minus-comparison. This records a proposal, without changing live stage edges or rebuilding DK’s theorem.

- tauceti:TauCetiRoadmap/ClassFieldTheory: The atlas alias UPSTREAM:ClassFieldTheory needs native Layer 13 for Hilbert/ray/ring class fields (applications of Layer 12’s global existence), Layer 7 for the absolute local Artin map and Layer 5 for finite local Tate duality. Chebotarev’s alias resolves to native Layer 10. These are upstream observations; the upstream documents and edges were not edited.
- tauceti:TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants, PadicMeasuresIwasawaAlgebras:L6: Current Tau Ceti has TauCeti.fittingIdeal and its presentation/base-change API in RingTheory/FittingIdeal/Basic and BaseChange; the current determinant roadmap consumes it. This declaration postdates the atlas pin f790474 and is not asserted available in that pin. ES only consumes generic Fitting ideals. The generic exterior-bidual algebra stays with L6; accepted ES node IDs now describe arithmetic specializations.
- HeegnerPointEulerSystems:HE.7, EulerSystemsAndKolyvaginSystems:ES.4, EulerSystemsAndKolyvaginSystems:ES.5: RT-AREA-iwasawa-1/10 and /36 remain generic/application boundaries: Howard self-dual algebra stays ES.5; CGLS conditional error descent and the Nekovář annihilator machinery stay ES.4. CM-point geometry, dyadic input verification, and passage to full Sha finiteness stay HE.7. The accepted restructuring proposal is recorded without editing live atlas edges.
