# Independent review: tensor displays and ordinary lifts

Job: REV-DESIGN-FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (#3531). Reviewer: Codex, session codex-pYyERQ. Date: 2026-10-19. The design was written by session codex-kr62kA; this reviewer did not write it.

Verdict: **accepted after corrections**. This accepts a completed target-level planning pass, with seven stages **planned**, nine explicit gaps and seven supplier requests. No stage is closed and no implementation is claimed. The packet records 36 verified and 56 corrected node verdicts (the latter include citation attribution and test-kind corrections), plus a separate verdict for each of its nine source findings. There are no added nodes or removed baseline declarations.

## Scope and counts

| Item | Reviewed result |
| --- | --- |
| Nodes | 92: 14 definitions, 20 constructions, 5 lemmas, 41 theorems, 10 comparisons, 2 applications |
| API items | 114, including three additions |
| Unit tests | 103, with two substantive replacements and all kinds classified under PROTOCOL §12 |
| Planets | 34; respectively 5, 4, 6, 4, 6, 5, 4 in TD.0–TD.6 |
| Baseline declarations | Five, all confirmed at the pinned Mathlib commit |
| Public sources | Eleven exact PDF versions; all recorded SHA-256 values independently matched |
| Node-source references | 124, with composite citations separated by source |
| Coverage | TD.0–TD.6 planned; none closed |
| Supplier obligations | G1–G9 and seven requests remain open |

Every stage target has a corresponding node. The graph remains acyclic after correcting direct dependencies. Its ends are pinned declarations, existing supplier nodes, explicitly requested stages or recorded gaps. The mathematical statements, proof outlines, definition uses, APIs, tests and planet choices were checked individually; this is not an implementation review.

The ten original briefs retain all their item IDs. Direct comparison with the paper route lists gives 19 + 3 + 6 + 63 + 52 + 36 = 179 tensor items, with no missing or extra IDs. The split ledger preserves 12 + 19 + 2 = 33 Lubin–Tate items and all 153 divisible-module-period items. The split preserves independent carrier developments and their original briefs rather than declaring their mathematics completed here.

## Mathematical and API corrections

Node suffixes in this report have prefix `FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:`.

| Node | Correction and evidence |
| --- | --- |
| TD.0/frame | Added the direct Zink-ring dependency used by `Frame.ofWitt`; added `Frame.ext` on a fixed ring and ideal. KPZ26 §§5.1.1–5.1.2, pp.47–49. |
| TD.0/perfect-dieudonne | Specified σ-linearity of F and σ⁻¹-linearity of V. Lau14 Lemma2.4, p.2216 and Theorem5.3, p.2243; the perfect-ring comparison uses finite projective modules. |
| TD.0/normal-pair | Added `NormalPair.hom_ext`: preservation of the submodule is a property of the underlying linear map. This supports changes of normal coordinates. |
| TD.0/display | Added `Display.hom_iff`, including the isomorphism criterion for an invertible pair map commuting with Ψ. Hoff23 Definition1.10, p.10. |
| TD.0/pd-logarithm | Replaced the prose-only Teichmüller warning by the explicit additive logarithmic-coordinate equation. KPZ26 §5.1.1(b), p.48; Hoff23 Lemma1.21, p.13. |
| TD.2/horizontal-tensors | Replaced the overbroad assertion about every nonzero graph direction by the concrete calculation cE₁₁c⁻¹=E₁₁+εE₂₁ for c=1+εE₂₁. This is an ambient transport-equation test, not a claimed counterexample arising from a good local model. |
| TD.3/D-PEL | Added the ambient nonexceptional theorem applied to GSp, isomorphic sums and summand descent. The source uses very-goodness of GSp before imposing endomorphism equations and taking the smooth generic-neutral GO⁺ closure. KPZ26 proof of Theorem6.2.3, pp.68–69. |
| TD.3/D-central-cover | Added product, summand and ambient GSp very-goodness dependencies. The proof now uses the scheme-theoretic intersection of GO⁺×GO⁺ with GSp and the union of their horizontal cutting families. Scalar enlargement alone does not supply this step. KPZ26 Corollary6.2.10 and proof, pp.69–70. |
| TD.3/A-central-cover | Added product and ambient GSp very-goodness dependencies; explained the same tensor-union intersection argument for (G×G)∩GSp. Retained the correctly indexed paired chain. KPZ26 Corollary6.3.5 and proof, p.71. |
| TD.4/cocharacter-splitting | Removed the claim that the representative must be defined over K₀. The integral frame gives a representative over K, compared to the canonical generic filtration by G(K); its geometric conjugacy class can have a ramified reflex field. A cocharacter valued in G over K₀ need not be K₀-rational. KP18 Corollary3.3.10 and §3.3.11, pp.180–181; KZ25 Proposition3.3.2(2), p.25. |
| TD.5/lattice-specialization | Specified that G acts on L=Hom(T_pH,Z_p), and the new dual Tate lattice is gL; the Tate lattice is (gL)∨. This removes ambiguity in the inverse notation and fixes the sign tested by scalar p. Kisin17 §§1.2.16–1.2.18, pp.15–16. |
| TD.6/central-bk-lift | Removed the dependency on the crystalline-representation tensor-frame theorem, which would require the representation before it is constructed. Used the elementary filtration-lattice tensor torsor for the Newton Levi instead, with G2 purity explicitly retained. KZ25 proof of Theorem3.4.5, pp.27–28. |

The remaining 101 tests were checked without changing their mathematical content. All 103 now have one of the five documented test kinds. In particular the tests continue to distinguish full fixers from connected parahorics, linear-dual Tate modules from Cartier duals without their twist, the invariant tilde module from its Frobenius image on a torsion base, and rational quasi-isogenies from integral automorphisms.

## Citation and metadata corrections

All node matches now describe the mathematical contribution in the reviewer's own words. Secondary citations do not silently become primary proofs: G5 and G7 remain explicit. Composite locators now attribute the secondary result to its own sourceId. No source excerpts are included.

| Node or record | Correct locator in the version read |
| --- | --- |
| TD.0/frame | KPZ26 §§5.1.1–5.1.2, pp.47–49 |
| TD.1/universal-filtered-pair | KP18 §3.1.8, pp.165–166 |
| TD.2/filtration-lattice and filtration-tensor-torsor | KP18 Lemma3.2.6, pp.171–172 |
| TD.2/bk-witt-lattice-comparison | KP18 Lemma3.2.9 and (3.2.10), pp.172–173 |
| TD.2/tilde-tensor-torsor | KP18 Lemmas3.2.6,3.2.9 and Corollary3.2.11, pp.171–173; the former proposition/lemma numbers were inaccurate |
| TD.2/adapted-deformation | KZ25 Definition3.2.4, pp.22–23; KP18 Proposition3.2.17, pp.175–177 supplies its antecedent conditions, not a nonexistent §3.2.15 definition |
| TD.3/A-standard | KPZ26 §§6.3.1–6.3.3, pp.70–71; Theorem3.3.25, p.26 for the cited good-embedding input |
| TD.4/integral-tensor-frame | KP18 Lemma3.3.5 and Corollary3.3.6, pp.179–180 |
| TD.4/tensor-section | KZ25 §§3.2.5–3.2.6, p.23; corrected KP18 §3.2.12 with KPZ26 §7.1.4(1), p.73 |
| TD.4/cocharacter-splitting | KZ25 Proposition3.3.2(2), p.25 |
| TD.4/etale-adaptedness and E04 | KZ25 Proposition3.3.4, p.25 |
| TD.5/integral-connection | Kisin17 §1.4.5 and Lemma1.4.6, pp.24–25 |
| TD.5/framed-hyperspecial-data | KZ25 §3.4.1, p.26 |
| E03 | KPZ26 §7.1.4(1), p.73 explicitly discusses the omission in KP18/KZ25; §7.3.2, p.87 concerns the related Pappas argument |
| vanHoften24 metadata | Published volume 12, **e20**, as printed on the fetched title page; the DOI ends fmp.2024.22 |

The reader was rebuilt from the reviewed node records, preserving its introduction, supplier material and route ledgers, and the definition's source inventory was synchronized. Its first-order quotient, variance, central-filtration construction and rational-action endpoint agree with the packet. The compact suggested file already follows the newer fixed shape in WORKERS.md; it does not need heavy carriers added to express these prose corrections.

## Baseline and ownership

The following actual declarations and surrounding hypotheses were read in Mathlib at `082e2d37e8b0463410cdb532e111cd43d5a66174`:

| Reference | Source module | Finding |
| --- | --- | --- |
| `WittVector` | RingTheory/WittVector/Defs.lean | The natural-number-indexed Witt carrier, not a display or Zink subring |
| `WittVector.frobenius` | RingTheory/WittVector/Frobenius.lean | Ring homomorphism under the prime and commutative-ring hypotheses; not an arbitrary-base inverse |
| `WittVector.verschiebung` | RingTheory/WittVector/Verschiebung.lean | Additive Verschiebung and its shifted coordinates |
| `DividedPowers` | RingTheory/DividedPowers/Basic.lean | Structure on an ideal with support conditions; not a PD envelope |
| `WittVector.frobenius_verschiebung` | RingTheory/WittVector/Identities.lean | F(V(x))=xp in the required convention |

No baseline citation was removed or substituted. Tau Ceti's pin is `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library-coverage file has no entry for this continuation. Searches of the current Tau Ceti library found Witt, general tensor and lattice infrastructure but no existing integral-display or adapted-deformation theory duplicating these targets.

Current upstream AlgebraicVectorBundles and ReductiveGroupsPartII were read for the relevant interfaces and README form. RG2.3.5 supplies the classical integral lattice/fixer constructions and their stated representation restrictions; this roadmap owns only the new very-good display consequences. Current Suggested.lean files were also screened across AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory (its subroadmaps), OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry. General vector-bundle tensors and existing orthogonal-group theory remain imports; no duplicate theory is proposed here.

Actual supplier statements were checked in the base finite-flat packet, BunGAndNewtonStrata, the SF.0/SF.4 split packets, the CR.0/CR.5 split packets and current RG2.3.5. In particular, R07.4's crystalline-to-Barsotti–Tate theorem is stated for finite K/Q_p, which does not discharge G6; SF torsor representability does not discharge G4; the Fontaine-envelope carrier does not discharge G5. The current CR.7 evaluation and GM interfaces preserve contravariance and nilpotent-PD hypotheses. No upstream files were changed or built.

## Source findings

All nine findings have independent `confirmed` verdicts, with their scope made precise in the packet and reader:

- E01: the noninjective p-torsion square cannot determine c; the relative-frame construction fixes it. KPZ26 Lemma5.1.15 and Remark5.1.17, pp.50–52.
- E02: the published topology correction and logarithmic contraction justify convergence. KPZ26 §7.3.1(2), p.86.
- E03: corrected the locator to the explicit KP18/KZ25 correction in KPZ26 §7.1.4(1), p.73. Very-goodness precedes smooth tensor-section lifting.
- E04: confirmed the proof's unchecked smooth integral-stabilizer hypothesis, with fixed integral tensor type as a sufficient correction. This does **not** assert a counterexample to either recognition conclusion. KP18 pp.180–182; KZ25 p.25.
- E06: the published connection errata impose Frobenius-stability, use Lie(G), and delete the old Lemma1.5.3. Kisin17 Errata E.1–E.4, p.96.
- E07: confirmed the unsupported use of the integral-frame theorem outside its stated residue-field range, without claiming a counterexample. Kisin17 Theorem1.1.4(2), Corollary1.1.7 and their later uses, pp.7–12.
- E08: the contravariant representation is the linear dual Tate module, with the Cartier-dual twist retained. Kisin17 footnote8, p.7 and Proposition1.1.13, p.9.
- E09: gave an explicit GL₂ matrix in the reason: a bounded, integrally σ-conjugate b can have a Hodge line different from the independently fixed μ-line. Zhu17 §3.2, pp.460–461.
- E10: confirmed the missing localization for g₀ and also the later g̃ in the **same** proof. Both belong to rational groups in general; the scalar-p check detects both omissions. Kisin17 proof of Lemma1.2.18, p.16. The second occurrence was added to this finding rather than inventing a duplicate entry.

Public source URLs, editions and hashes remain in the packet and reader. Anschütz22 Proposition10.3, p.33 was checked as an extension theorem for connected parahoric torsors, not as an automatic full-fixer vanishing theorem. Wintenberger97 Proposition4.5.3 and its following unnumbered corollary, pp.1331–1332, supply the rational torsor comparison; they do not prove integral frames or the toral subobject inequalities. Zhou20 arXiv v2 §5.5, pp.18–19 was compared with vanHoften24 AppendixA.4.3, pp.64–65, retaining the specified M-filtration and the general-basic-Levi distinction.

## Open supplier work and maintainer decisions

Acceptance leaves the following obligations visible; it does not mark their consumers proved:

| Gap | Exact outstanding boundary |
| --- | --- |
| G1 | Registered owner and precise statements for integral parahoric local-model geometry, good embeddings and tangent spanning; the routed name has no registered packet |
| G2 | Connected parahoric torsor extension/triviality in the stated two-dimensional ring range, full-fixer component descent and the specified patching theorem |
| G3 | Separate normal-section extension and pointwise-flatness criteria, with their actual de Jong and Raynaud–Gruson hypotheses |
| G4 | Integral Tannakian recognition for the exact faithful representation functor on the punctured disc |
| G5 | Primary-source relative p-divisible comparison and filtered Frobenius constants in the normal geometric-cover setting |
| G6 | Extension of the base realization theorem beyond finite K/Q_p to the stated perfect-residue range |
| G7 | Primary proof of the toral weak-admissibility criterion with this inverse-cocharacter normalization; no uncleared Rapoport–Zink copy was used |
| G8 | Global absolute-Hodge realization, extension and specialization input with its integral-model owner |
| G9 | Specified M-filtration and corrected very-good input for the nonordinary basic-Levi application |

The orchestrator should resolve the two proposed independent continuations, assign the missing local-model and global-Hodge owners, and retain the source-access obligation for G7. Existing supplier requests remain the actionable statements for those owners. None of these decisions requires a second job to be claimed by this worker.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII.json`: zero errors and zero warnings.
- The unchanged 106-line suggested file elaborated through `lean-check` at the pinned build, exit 0, with only its 13 expected `declaration uses sorry` warnings. Available memory was checked before that run. Elaboration establishes only the small native-carrier fragment.
- `scripts/check_sorry_data.py` accepted the suggested file; all three data definitions have actual bodies and the file is below 5,000 lines.
- JSON parsing, reader/node synchronization, route-ID equality, test-kind membership, unique review coverage and whitespace checks passed.

The review report and packet contain everything needed for the next stage; scratch PDFs and extracted source text are not deliverables.
