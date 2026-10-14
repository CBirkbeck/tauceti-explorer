# Independent review of R17.5, revision 2

**Verdict: accepted, with planned coverage.** Reviewer: Codex, session `codex-sPeoxc`, 14 October 2026. Refs [#9767](https://github.com/CBirkbeck/tauceti-explorer/issues/9767). I did none of the original plan, its first review, or the revision reviewed here. This is a finished independent review.

The [packet](../packets/GL2AutomorphicRepresentationsAndTransfer--R17.5.json) and [reader](../readmes/GL2AutomorphicRepresentationsAndTransfer--R17.5.md) now distinguish a complete target-level pass from completed proofs. The existing [suggested file](../suggested/GL2AutomorphicRepresentationsAndTransfer--R17.5.lean) required no change and independently elaborates at the pins. Every node has a justified statement and deduction from its stated inputs, including exact recorded gaps where needed. Acceptance does not assert implementation or closed prerequisite chains.

## Counts

| Item | Result |
|---|---:|
| Nodes | 39: 32 theorems, 3 lemmas, 1 definition, 1 construction, 2 applications |
| Node verdicts | 26 verified, 13 corrected, 0 added, 0 unverifiable |
| Nodes added / removed | 0 / 0 |
| Pinned baseline declarations | 16 confirmed; none removed or renamed |
| Distinct direct external blueprint node suppliers | 41 independently read |
| Tau Ceti layer requests | 16 checked |
| API items / unit tests | 14 / 8 |
| Explicit remaining gaps | 2: retained G2 and added G7 |
| Source issues | 8 confirmed, 2 rejected; all 10 judged by this review |
| Planets | 1 here, 6 with the 5 inherited from R17.3 |
| Coverage | 1 planned stage, 0 closed stages |
| Suggested file | 508 lines; 25 proof-placeholder warnings |

## Revision requirements and corrections

The [first review](REV-GL2AutomorphicRepresentationsAndTransfer--R17.5.md) asked for six explicit proof contracts and a reliable octahedral collation. The revision supplies 24 additional targets at the required granularity. I checked their statements, hypotheses, sketches, direct prerequisites and acceptance tests, together with all 15 retained targets.

- **G1:** The open-subgroup, Euclidean, compact, real-times-compact and idele extension targets supply the character-extension argument. Current CompactGroups supplies Peter–Weyl separation and Haar orthogonality. Stone–Weierstrass turns these into compact character restriction-surjectivity. The isolation subgroup has the topology of the product supported on S; norm slabs and discreteness of principal ideles justify closedness before extension.
- **G2:** The preliminary Brauer/Hecke functional equation is explicit and precedes higher-dimensional local epsilon existence. The product of local induction constants remains an exact gap with trace characters, archimedean factors and Tamagawa measures. Deligne 5.11 states the final equation but does not furnish the missing comparison in the cited short proof. The proposed order is preliminary equation → local existence → induction-constant product → final equation. Owner integration is still necessary.
- **G3:** Complete splitting systems, projective lifting, p-singular vanishing, the projective Brauer–Hom formula and the p-regular class count supply recognition. An abstract Cartan/Euler pairing is not substituted for its character interpretation. Current Tau Ceti's `Representation.instProjectiveAsModuleLinHom` already supplies the projective Hom helper; I added a current-library note so implementation consumes it. This is not a pinned-baseline claim or an implementation of the Brauer pairing.
- **G4:** The modular inertia and mixed-index correspondences, determinant-order and p-rational extension targets retain the full strengthened Isaacs 5.4 induction, its automorphism stabilizer assertion and its characteristic-subgroup degree condition. I added **G7** to expose three existing exact requests absent from current InductionRestriction: invariant complex irreducibles extend over a cyclic quotient; ordinary relative degrees divide the normal-subgroup index; and prime-to-p cyclotomic membership agrees with the character-field/Galois formulation of p-rationality. These inputs remain InductionRestriction Part II obligations. Current ordinary Clifford theory is not attributed modular Maschke-free correspondence.
- **G5:** Finite-algebra splitting and split-simple scalar extension give descent over an arbitrary algebraically closed characteristic-p field **up to isomorphism**. Matrix entries need not be algebraic over the prime field. Complete modular systems and lattice/Brauer comparison then give the integral lift with the exact kernel. I replaced a stale description of G5 as still missing with the explicit supplied targets.
- **G6:** I independently read all three pages of the archived AMS Tunnell PDF. Its hash agrees with the packet's publisher record. The weak descent uses the non-normal cubic/GL₃ supplier and cubic base-change comparison, rather than determinant alone. This removes the prior unverifiable-source obstacle; it does not discharge the inherited GL₃ proof obligation.

The retained conventions are correct: unitary unshifted geometric reciprocity; applying geometric automorphy to the dual for arithmetic-Frobenius attachment; U⁰ equal to the full unit subgroup; finite global reciprocity and local Weil groups rather than a nonexistent global Weil carrier; real norm-power shifts for quasi-characters; and cancellation of raw local factors after removing conductor completion. The general-domain Brauer reduction API retains split spectrum. Oddness uses an involution determinant with square one in a domain and nonzero 2, so characteristic two is excluded where required.

The following locator corrections are applied in both packet and reader:

| Topic | Correct locator in the collated version |
|---|---|
| Webb splitting definition / scalar extension | §9.2 p. 142, remarks p. 144; §9.8 Exercises 4 and 8(a), pp. 165–166 |
| Webb Artin–Wedderburn | Theorem 2.1.3, pp. 15–16, replacing the unrelated 7.1.2 locator |
| Webb projective reduction / Hom | Propositions 9.4.3 and 9.4.5, pp. 149–152; proof of 10.2.1, p. 175. There is no Hom reduction Lemma 9.4.11 |
| Webb p-group projectives | 8.1.1–8.1.3, pp. 120–121 |
| Webb projective tensor product | **Proposition** 8.1.4, pp. 121–122 |
| Isaacs cyclotomic Galois notation | §4, p. 177, replacing §2 p. 172 |
| Deligne–Serre 4.11 | **Remark** 4.11, p. 517, following Theorem 4.10 |

Errata-search records now describe the independently checked author/publisher pages. In particular, no linked correction list for Dikranjan's notes was found; the former claim that one was read is removed. The historical source records are preserved and a distinct revision-2 independent-read record names this reviewer.

## Node verdicts

The common node prefix is `GL2AutomorphicRepresentationsAndTransfer:R17.5/`. “Verified” includes deductions conditional on the exact recorded inputs; it does not mean their proofs have been implemented or their owner requests completed.

| Node | Verdict | Check |
|---|---|---|
| open-subgroup-character-extension | verified | Divisibility/Zorn gives extension; continuity follows on the open subgroup. Checked Dikranjan 2.1.10 and 12.3.5(b). |
| closed-euclidean-subgroup-structure | verified | Small vectors produce a line; a maximal vector part has a discrete orthogonal complement. Checked 8.1.2 and §8.2. |
| euclidean-character-extension | verified | Angles on a lattice basis and real linear extension give the continuous character; checked 8.0.7 and 12.2.4. |
| compact-character-extension | verified | Current Peter–Weyl separation plus Stone–Weierstrass and character orthogonality supplies the compact restriction-surjectivity argument. |
| real-compact-open-character-extension | verified | Compact-kernel projection is closed; factor off a compact-character extension and extend the real quotient, then the open subgroup. |
| idele-character-extension | verified | The ideles have an open real-times-compact subgroup from current GlobalNumberFields; closed character extension is the preceding explicit target. |
| isolation-subgroup-topology | verified | Norm slabs are compact, principal ideles are discrete, and the supported-on-S product embeds properly; checked JL70 12.5. |
| preliminary-artin-functional-equation | verified | Deligne 3.12 gives the Brauer/Hecke preliminary exponential before local epsilon existence; this avoids the previous cycle. |
| global-induction-constant-product | verified | The target keeps trace characters, infinity and measures explicit; the noncircular comparison is honestly retained as G2. |
| finite-algebra-splitting-field | verified | Webb 9.2.6 and 9.2.5 support finite splitting; existing radical/block/idempotent owners supply the algebra inputs. |
| split-simple-scalar-extension | corrected | Corrected splitting-field, scalar-extension exercises and Artin–Wedderburn locators; the split-block/radical argument is sound. |
| finite-field-simple-descent | corrected | Corrected the scalar-extension exercise locator; finite-field descent is up to isomorphism for arbitrary algebraically closed coefficients. |
| complete-splitting-modular-system | verified | Finite unramified residue extension and cyclotomic compositum give a complete system; only prime-to-p roots are identified on reduction. |
| projective-modular-lift | corrected | Replaced nonexistent Hom reduction Lemma 9.4.11 citation with the projective comparison proof; read 9.4.3/9.4.5 in full. |
| projective-character-vanishing | corrected | Corrected 8.1.1–8.1.3 pagination; cyclic restriction and projective-lift vanishing match 9.6.2. |
| projective-brauer-hom | corrected | Corrected Proposition 8.1.4 name/pages and noted current Tau Ceti projective Hom helper; 10.2.1 supports the pairing with arbitrary U. |
| brauer-class-count | verified | Checked Webb 9.3.1–9.3.6, including cyclic-word Frobenius modulo commutators and p-regular independence. |
| p-rational-character | corrected | Corrected cyclotomic notation to Isaacs §4 p.177 and recorded the absent fixed-field adapter as G7. |
| modular-clifford-correspondence | verified | Isaacs 5.1 and characteristic-free restriction semisimplicity give the inertia argument; no Maschke correspondence is imported. |
| coprime-index-lift-correspondence | corrected | Verified Isaacs 2.2/3.1/5.2; explicitly retained the extra ordinary-character interfaces in G7. |
| p-group-index-lift-comparison | corrected | Verified Isaacs 4.1; G7 records the remaining ordinary-character refinements rather than attributing them to current Clifford theory. |
| determinant-order-extension | corrected | Verified Isaacs 4.2/4.7 for all primes; cyclic extension remains an explicit Part II obligation G7. |
| p-rational-p-group-extension | corrected | Verified Isaacs 4.3–4.5 and the odd-prime hypothesis; G7 exposes the ordinary/cyclotomic inputs. |
| equivariant-fong-swan | corrected | Verified the full 5.4 induction, automorphism stabilizer and degree alternative; ordinary relative-degree divisibility remains G7. |
| gl2-twist-stability | verified | JL70 3.8 gives the required conductor bounds depending on each representation and equality under equal central characters. |
| gl2-local-converse | verified | JL70 2.18/2.19 and cleared BH06 27.1–27.2,27.8 confirm the stated local converse and real norm-shift reduction. |
| isolating-twist-character | verified | JL70 12.5 supports the supported-on-S construction with U⁰=O× and the strict conductor inequality. |
| artin-twisted-functional-equation | verified | Finite reciprocity plus Brauer/Hecke and local constants give the final equation conditional on G2; quasi-characters use a real norm shift. |
| artin-all-place-upgrade | verified | Checked JL70 12.2 cancellation of raw local factors, unitary geometric rec, determinant equality and the finite-place isolation. |
| tetrahedral-artin-all-places | verified | Langlands §2 A–C and §3(i), with JL70 12.1, give archimedean matching through cyclic cubic split places. |
| octahedral-artin-all-places | verified | All three archived Tunnell pages were independently collated; the weak cubic comparison and real odd/determinant argument support this refinement. |
| brauer-character | verified | Webb 10.1.1–10.1.3 supports compatible root lifts and the API; general-domain reduction retains split spectrum. |
| brauer-character-recognition | verified | Projective Hom pairing and class count explicitly supply Webb 10.2.2–10.2.3; 9.4.8 supplies lattice independence. |
| fong-swan | verified | Isaacs 5.4 supplies existence for every prime and §6 proves odd-prime uniqueness with its simultaneous restriction assertion; owner gaps remain explicit. |
| solvable-integral-lift | corrected | Corrected Webb exercise locators; cyclotomic splitting, lattice reduction, irreducibility and exact kernel follow under the stated lifting input. |
| involution-oddness-under-reduction | verified | The determinant has square one; a domain and nonzero 2 make reduction distinguish the signs. The real Lean proof agrees. |
| odd-solvable-residual-lift | verified | Finite quotient, same-kernel integral lift, absolute irreducibility and involution lemma supply the target; odd p is necessary. |
| solvable-residual-modularity | verified | Apply geometric automorphy to ρ∨ to attach arithmetic ρ; π₁ at each real place is RT83 weight one. Supplier gaps remain. |
| q-solvable-residual-weight-one | corrected | Corrected DS74 4.11 to a remark; 4.1/4.6/4.10 and DP21 1.3 support the arithmetic convention and conductor-level form. |

## Baseline and existing owners

Every baseline statement was read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; the Tau Ceti pin is `f790474821cf4256814db967cb154e7af3d0c369`. All 16 names, modules and hypotheses are appropriate. No baseline entry was added, removed or renamed by this review.

| Pinned declaration | Module under Mathlib | Needed interface |
|---|---|---|
| Group.IsSolvable | GroupTheory/Solvable | The class of solvable groups (Group.IsSolvable; the root alias IsSolvable is deprecated at the pin); finite solvable groups are p-solvable for every p. |
| IsDedekindDomain.HeightOneSpectrum | RingTheory/DedekindDomain/Ideal/Lemmas | Nonzero prime ideals of a Dedekind domain, used for the prime λ of O_E above p. |
| Localization.AtPrime | RingTheory/Localization/AtPrime/Basic | The localisation of a commutative ring at a prime ideal; (O_E)_λ, a discrete valuation ring since O_E is Dedekind. |
| Matrix.GeneralLinearGroup | LinearAlgebra/Matrix/GeneralLinearGroup/Defs | GL(n, R) as the unit group of n×n matrices over a semiring; the carrier of every matrix representation here. |
| Matrix.GeneralLinearGroup.det | LinearAlgebra/Matrix/GeneralLinearGroup/Defs | The determinant as a group homomorphism GL(n, R) → Rˣ for commutative R. |
| Matrix.GeneralLinearGroup.map | LinearAlgebra/Matrix/GeneralLinearGroup/Defs | A ring homomorphism R → S induces the group homomorphism GL(n, R) → GL(n, S); used for reduction of integral representations. |
| Matrix.charpoly | LinearAlgebra/Matrix/Charpoly/Basic | The characteristic polynomial det(X·1 − M) of a square matrix; its roots with multiplicity are the eigenvalues summed in the Brauer character. |
| Representation.IsIrreducible | RepresentationTheory/Irreducible | Irreducibility of a representation as simplicity of its lattice of subrepresentations; applied to the k-linear representation of Γ on kⁿ. |
| rootsOfUnity | RingTheory/RootsOfUnity/Basic | The subgroup of units ζ with ζ^m = 1 of a commutative monoid; μ_m(k) and μ_m(C) in the Brauer character. |
| ContinuousMonoidHom | Topology/Algebra/ContinuousMonoidHom | Continuous group-homomorphism carrier used for unit-circle character extension. |
| ContinuousMap.starSubalgebra_topologicalClosure_eq_top_of_separatesPoints | Topology/ContinuousMap/StoneWeierstrass | Uniform density for a separating star subalgebra of complex continuous functions on a compact space. |
| IsArtinianRing.isNilpotent_jacobson_bot | RingTheory/Artinian/Ring | Nilpotence of the radical of an Artinian ring, including noncommutative finite-dimensional algebras. |
| IsArtinianRing.isSemisimpleRing_iff_jacobson | RingTheory/Artinian/Module | An Artinian ring is semisimple iff its Jacobson radical is zero. |
| Circle | Analysis/Complex/Circle | The topological unit-circle group, with its complex coercion. |
| Nat.factorization | Data/Nat/Factorization/Defs | Prime multiplicities and the ordCompl notation for the prime-to-p part of a finite group order. |
| IntermediateField.adjoin | FieldTheory/IntermediateField/Adjoin/Defs | The intermediate field generated by a set of complex roots of unity over Q. |

The reviewed AUDIT-14/library-coverage record does not mark R17.5 built. I read current InductionRestriction and GlobalNumberFields in full, and the relevant current CompactGroups, QuiverRepresentations, SemisimpleAlgebras, GrothendieckEulerForms, ClassFieldTheory, LocalFieldsRamification and ModularForms contracts. All 41 distinct direct external blueprint suppliers were checked from their current packet statements and proof sketches. Each of the 16 requests specifies its needed interface. Existing finite-algebra covers, blocks, cyclotomic splitting and harmonic-analysis targets are imported.

Current TauCetiRoadmap was checked at `0d144d044dacebca17b654695b6f1ad58f159b27`, and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine post-snapshot roadmap directions were checked for duplication. Current characteristic-free restriction semisimplicity is distinguished from ordinary correspondence under Maschke hypotheses. Current projective Hom helpers are recorded separately from the pinned baseline. Neither read-only checkout was built or modified.

## Source collation and findings

All 12 sources were independently read at every node locator and every source-issue locator, in the versions identified by the packet. The 11 public PDFs match their recorded hashes. Bushnell–Henniart was read only in the maintainer-cleared library copy; nothing from that file was copied. No verbatim passage or source-by-source narrative was added to the repository. Exact URLs, editions, hashes and all detailed locators remain in the packet and reader.

| Source | Principal checked locators |
|---|---|
| [Jacquet–Langlands, IAS retypesetting](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf) | 2.18–2.19 pp. 37–40; 3.8 pp. 57–58; 11.1 p. 179; 12.1–12.5 pp. 206–212 |
| [Langlands, author's version](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf) | §2 A–F p. 14; §3 pp. 15–19 |
| [Deligne](https://publications.ias.edu/sites/default/files/Number20.pdf) | 3.11–3.12 pp. 532–534; 4.1 p. 535; 4.12–4.14 pp. 544–545; 5.11 p. 551 |
| [Webb, dated author prepublication](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf) | 2.1.3 pp. 15–16; 8.1.1–8.1.4 pp. 120–122; §9.2–9.4 pp. 142–156; 9.6.2 pp. 163–164; §9.8 pp. 165–166; §10.1–10.2 pp. 170–177 |
| [Isaacs](https://msp.org/pjm/1974/53-1/pjm-v53-n1-p15-s.pdf) | Definition 1.1 and 1.2/1.4 pp. 171–172; 2.2, 3.1, 4.1–4.7, 5.1–5.4 and §6 pp. 173–181 |
| [Bushnell–Henniart](https://doi.org/10.1007/3-540-31511-X) | 27.1–27.2 p. 170; 27.8 pp. 175–176; 30.8–30.9 pp. 197–199 |
| [BCGP](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf) | Proposition 10.1.3 and proof pp. 473–474 |
| [Deligne–Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) | 4.1 pp. 513–514; 4.6 p. 514; 4.9–4.11 pp. 515–517 |
| [Tunnell, archived publisher PDF](https://web.archive.org/web/20231206042832id_/https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf) | All three pages, 173–175 |
| [Dieulefait–Pacetti v2](https://arxiv.org/pdf/2108.07577v2) | §1.1, Theorem 1.3 and proof p. 3 |
| [Rogawski–Tunnell](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0007.pdf) | §1, π₁ and weight-one definition, p. 4, checked as an image |
| [Dikranjan, 26 February 2018 notes](https://users.dimi.uniud.it/~dikran.dikranjan/ITG.pdf) | 2.1.10–2.1.11 pp. 3–4; 7.2.3 p. 47; 8.0.7 and §8.1–8.2 pp. 50–54; 11.3.4 p. 76; 12.2.4 p. 87; 12.3.5 p. 90; 12.4.11 pp. 94–95 |

All ten source issues have fresh verdicts and reasons naming this job:

- **E16–E17 rejected:** the cited sources assert lifts of the residual representation itself. Expanding the standard finite-group input is useful, but does not prove a source error or show that an arbitrary projective lift was substituted.
- **E18–E19 confirmed:** Webb's prepublication root-of-unity remarks need prime-to-p orders; its projective-lift uniqueness criterion repeats the first module where the second is intended. The potentially vacuous hypothesis of 9.2.7 is not declared a false theorem.
- **E20–E24 confirmed:** Dikranjan's extension formula/sign, repeated compact factor, fractional-part coordinates, cyclic-intersection/lift indices and approximating directions need the recorded corrections.
- **E25 confirmed:** the early open-image claim fails for the zero map into the real line before the additional openness hypothesis. The later containment belongs in the quotient image. The stated lifting lemma survives these proof corrections.

The [Webb book page](https://www-users.cse.umn.edu/~webb/RepBook/index.html) and linked Typos file were checked; its published-edition pagination is distinguished from the collated prepublication. Dikranjan's author home/Teaching Activities pages and author-domain searches yielded no correction list for the dated notes. Publisher/arXiv records were checked for BCGP and Dieulefait–Pacetti. No claim is made about uncollated later printed editions.

## API, tests, suggested file and handed findings

The Brauer-character construction has ten API items and four tests, with roots and multiplicities, conjugation, additivity, restriction, tensor/dual and integral reduction compatibility. Its rank-p identity value, the characteristic-two order-three example with value −1, and rank-one reductions distinguish it from a lifted modular trace. The p-rational predicate has four API items and four tests: coprime cyclic characters are admitted; nontrivial characters of C_p for odd p are excluded; both C₂ characters at p=2 are admitted; and the trivial character is admitted. The cyclotomic adapter required for its ordinary-character interpretation is G7. These are meaningful tests of the definitions.

The suggested file contains real-bodied light definitions, stated milestones and examples at the pins, without placeholder data. Signature inspection confirmed that the characteristic and algebraic-closure hypotheses remain present. The elementary involution oddness argument and its completed examples are retained. Heavy carriers are full reader targets. No further Lean development is needed for this review.

The named Fong–Swan planet is central and source-based. Together with the five inherited R17.5 planets, it respects the six-planet limit. Target-level proof steps have not been split into an artificial collection of lemma nodes.

**RT-AREA-automorphic-1/1:** the GL₂ refinement retains R17.3's genuine non-normal cubic/GL₃ and JPSS supplier obligations and the R17.4a/AL.3b owner proposal. They are not discharged by renaming them or duplicated here.

**RT-AREA-automorphic-1/11:** explicit R16.3–R16.6 inputs, the global functional equation, strong multiplicity one and the classical Q weight-one comparison are retained with the required normalization adapter. The same-roadmap wiring remains a maintainer integration task. Both inherited supersessions stay pending and `closesGaps` stays empty.

## Validation and orchestrator actions

- Packet checker with the pinned declaration index: **0 errors, 0 warnings**.
- `lean-check` of the actual suggested file: **exit 0**, 25 warnings, all proof placeholders, with no other warnings or errors. Available memory before compilation was 89 GiB. This checks elaboration and the completed elementary proofs, not the placeholder theorem proofs.
- Submission file checks, independent verdict/source-issue coverage, packet/reader consistency, absence of source excerpts and private paths, and whitespace checks passed.

No further revision of the checked targets is requested. The orchestrator should retain planned coverage and assign G2's exact product comparison and G7's three precise InductionRestriction Part II refinements. Integrate the existing owner-move proposals and retarget local epsilon existence to the preliminary equation before claiming the final analytic chain closed. Keep inherited GL₃/JPSS, classical Hilbert weight-one and finite-order multi-place prescription obligations with their suppliers. There are no unanswered questions needed to finish this review; these are explicit follow-up contracts. No other packet, atlas data or upstream roadmap was edited or promoted.
