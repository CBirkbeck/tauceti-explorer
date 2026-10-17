# FIX-RT-RS-01~2 — R07/R06 proof ownership

Issue [#8931](https://github.com/CBirkbeck/tauceti-explorer/issues/8931). Agent: Codex, session `codex-4EkcIG`, 17 October 2026. Complete fix submission, pending the independent review REV-FIX-RT-RS-01~2.

RT-RS-01/30 now has explicit suppliers: **R07.3 proves rational Fontaine–Laffaille admissibility; R06.3 proves general Colmez–Fontaine.** R06.4 imports the former, and R07.4 imports the latter while retaining its Kisin finite-height construction and comparison. R06.2 supplies the statement interface and early formalism, not the general proof. This resolves the bounded decision requested by [REV-FIX-RT-RS-01](../reviews/REV-FIX-RT-RS-01.md); its other 31 assessments were not repeated.

## Finding disposition

The verified red team has 32 findings, of which /25, /26 and /29 were rejected. The previous independent review checked the other fixes and sent back only /30. Its corrections remain the starting point, including corrections made directly in the JSON during that review.

| Findings | Action in this round |
|---|---|
| /1–24 | Retain the first fix and independent review’s corrections. No new verdict or source-proof audit is claimed for them. The reports’ historical counts and “only two narrowed stages” / “external consumers untouched” claims are qualified to reflect this round. |
| /25 | Retain rejection; no repair required. |
| /26 | Retain rejection; no repair required. |
| /27–28 | Retain the previously checked semistable/integral-recovery and cross-theory comparison corrections. |
| /29 | Retain rejection; no repair required. |
| /30, Fontaine–Laffaille | Retain the unsplit early R07.3 proof; make R06.4 an import interface, forward its consumers and remove its local reconstruction/proof. |
| /30, Colmez–Fontaine | Put the actual general proof at R06.3, distinguish it from R06.2’s proposition and finite-Q_p Berger, and give R07.4 the proof import while preserving its finite-height comparison. |
| /31–32 | Retain the independently checked prismatic-owner and pinned-library-locator corrections. |

The old review objects and review histories in both JSON files are unchanged. In particular, the restructuring still carries the independent `needs_changes` verdict of 10 October until its next reviewer acts. P7’s later independent packet review also remains unchanged; it does not certify these edits. The historical REV-RS-01 text is corrected as a fixer’s dated notice, not rewritten as a new independent acceptance.

## Fontaine–Laffaille contract

`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-admissibility`, using `fl-period-comparison`, remains the unique supplier of Theorem 8.4(i)–(ii). Let k be perfect of characteristic p and K = K_0 = W(k)[1/p], so e = 1. For every prime p, a weakly admissible filtered φ-module D with Fil^j D = D and Fil^{j+p} D = 0 is crystalline-admissible. After normalizing j = 0, the contravariant FL functor U_{S_K}(D) is naturally V_cris(D)^∨. In the packet’s covariant convention HT(χ_p) = +1, V_cris(D) has weights opposite to the filtration jumps; the dual U has the jumps as weights.

The rational theorem permits filtration span p−1. It does not imply unrestricted torsion full faithfulness at [0,p−1]; the safe shifted torsion interval remains [0,p−2], with the separate endpoint restrictions. At p = 2 rational span 1 is allowed, while the unrestricted torsion safe interval is [0,0]. Proposition 7.17 proves the dimension/injective-evaluation input, not essential surjectivity onto all stable lattices. That separate gap remains.

P7’s `R06.4/fontaine-laffaille-crystalline-comparison` now imports the precise `fl-admissibility` and `fl-period-comparison` nodes. Its old local A_cris comparison argument is removed. `small-weight-admissibility` imports `fl-admissibility` and the local sign dictionary. Their IDs, statements and acceptance cases remain; R06.4 keeps its convention translations, endpoint distinctions and applications. The sign dictionary now states admissibility as an assumption outside the small-span theorem and limits the U_{S_K} comparison to the shifted rational FL range. The early `R07.3/fl-lattice-correspondence` keeps its local FL admissibility prerequisite. No R07.3 split or R06.4 → R07.3 import is proposed.

The supplier’s proof obligation is explicit: FL Theorem 8.4 uses the Barsotti–Tate ring and its identification from Fontaine [F2] §4. That source proof was not read in this run, and the period-ring comparison with R06.1 must still be proved at the stated normalization. Selecting R07.3 does not erase this gap or replace it with the removed local A_cris argument.

## General Colmez–Fontaine contract

The proof supplier is `PadicHodgeTheory:R06.3/colmez-fontaine-perfect-residue`. Let K have characteristic zero, be complete discretely valued with perfect residue field k of characteristic p, and let K/K_0 be finite totally ramified, K_0 = W(k)[1/p]. Every weakly admissible finite-dimensional filtered (φ,N)-module D has a continuous semistable realization V_st(D), of Q_p-dimension dim_{K_0}D, with its natural filtered (φ,N)-comparison D_st(V_st(D)) ≅ D. Early full faithfulness gives the exact tensor equivalence; N = 0 gives the crystalline form. Neither finite k nor finite [K:Q_p] is assumed.

The existing `R06.3/colmez-fontaine-proof-via-robba` remains the finite-K/Q_p Berger route, with its P7/PG.2/RD.2 inputs. It cannot justify the Q̆_p specialization. `R06.2/colmez-fontaine-theorem` continues to define the proposition and its elementary equivalent forms. It acquires no backwards proof prerequisite.

The new general target follows the original CF first proof. Its initial admissible filtration on a simple underlying module has span at most 1, so early R07.3 applies for every prime, including 2. The specialized lifting lemma transfers admissibility across neighboring filtrations; the filtration-distance/length induction then yields the theorem. The packet adds the key lifting target separately, with the exact finite-kernel hypothesis of CF Corollary 2.6. Its proof sketch retains the specialized analytic dichotomy and Hensel/open-image argument of Proposition 2.1, rather than assuming a later period-domain or Banach–Colmez equivalence. U is notation for a filtered period eigenspace, not a second construction of period rings.

The early filtered-module/weak-admissibility and admissible-subobject contracts now state the required perfect-residue scope and carry the original CF locators. Developing the lifting proof and checking the full early period/invariant/full-faithfulness chain at this scope remain named proof-closure obligations. P7 retains 25 gaps; this fix does not assert complete proof closure or formalization.

`R07.4/semistable-finite-height` must import the actual general R06.3 theorem for its weak-admissible-implies-admissible clause. It keeps the canonical G_{K∞}-equivariant comparison between Hom_{𝔖,φ}(M,𝔖^ur)⊗Q_p and Hom_{Fil,φ,N}(D,B_st^+), as well as its finite-height construction, dimension/height conclusions, full faithfulness and classifications. Their effective-filtration, height, ramification and individual dyadic restrictions remain. General CF supplies admissibility; it does not construct Kisin’s comparison map. The precise external-packet edit is recorded in RS-01 because that packet is not a deliverable here.

Two existing nodes requiring the perfect-residue realization theorem now have parent R06.3: `R06.2/crystalline-equivalence-over-breve-base` and `R06.2/fixed-bound-fiber-functor-triviality`. Their old IDs are retained. The former specializes the actual general theorem with N = 0. The latter retains its independent fixed-bound G-torsor gap: a basis does not trivialize that torsor. Dat–Orlik–Rapoport’s needed book is not cleared in the reference-library index and was not used.

## Ownership and consumer forwarding

RS-01 adds five layer records, two owners and nineteen links: **27 layer records, 23 owners, 50 links** in total. Four layers are now narrowed: CP.0, CP.5, R06.4 and R07.4. The seven member roadmaps and all 61 member stage identities remain; the two R07 stages receive explicit cross-family records. P7 restructure entries 8 and 12 carry the same decisions.

The proof order is R06.2 → R07.3 → R06.3 → R07.4 → R06.4. Only the early R06.2 formalism is used at R07.3; the proposition interface is not a hidden instance of CF.

Every direct consumer of the two newly narrowed stages has a direct link from its supplier in the final assembly:

| Narrowed stage | New supplier | All current direct consumers |
|---|---|---|
| R06.4 | R07.3 | AutomorphicGaloisRepresentationsPartII:AG2.6; CohomologyComparisons:CP.5; LocalGaloisDeformationRings:R08.5; PadicHodgeTheory:R06.5; PotentialAutomorphyInfrastructure:PA.1; PotentialModularityAndCompatibleSystems:R23.3 |
| R07.4 | R06.3 | AInfCohomology:AI.7; AutomorphicGaloisRepresentations:R19.5; CohomologyComparisons:CP.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5; HeegnerPointEulerSystems:HE.3; HilbertModularVarietiesAndShimuraCurves:R18.2; LocalGaloisDeformationRings:L7, R08.3, R08.4, R08.5; PadicHodgeTheory:R06.4; PrismaticCohomology:PR.7 |

Some forwarding links were already supplied by other overlays; new records add those absent from the current assembly as well as those visible in the older family extracts. The identified essential-surjectivity uses at L7 and R24.5:operations also receive R06.3. Ordinary early-formalism consumers of R06.2 do not all receive that later prerequisite.

## Source and library evidence

Public versions were read on 17 October 2026. All mathematical prose is original paraphrase. The readings below support the two decisions; this was not a new audit of the other 31 findings.

| Source | Checked locators and purpose |
|---|---|
| [Fontaine–Laffaille, published scan](https://www.numdam.org/item/ASENS_1982_4_15_4_547_0.pdf) | §§7.12–7.18, pp. 592–594, and §§8.1–8.5, pp. 595–596: rational dimension/evaluation, duality, admissibility and the distinct torsion range. |
| [Colmez–Fontaine, author copy](https://webusers.imj-prg.fr/~pierre.colmez/CF.pdf) | Base and Theorem A, p. 2; period/logarithmic inputs, §§1.3–1.6, pp. 6–12; Proposition 2.1, Lemmas 2.2–2.5 and Corollary 2.6, pp. 12–17; filtration distance and simplicity, Propositions 3.2/3.5, pp. 19/22; bigness and admissible subobject, Theorem 4.3/Proposition 4.5, pp. 23–25; exactness and lifting-to-admissibility, Propositions 5.1–5.3/5.6–5.8, pp. 26–31; first proof, §6.1, pp. 31–33. This is the 35-page author version, not journal pagination. |
| [Brinon–Conrad, CMI notes](https://math.stanford.edu/~conrad/papers/notes.pdf) | Proposition 11.3.3 and Remark 11.3.4, pp. 182–183, and the crystalline comparison argument following them: separating Kisin’s comparison from its general CF consequence. The Kisin 2006/2008 locators retained in RS-01 come from the existing R07 packet, not a newly claimed reading of those entire papers. |

SHA-256: FL `c049a7bff113a45f8bbcffc93118bd2e651e84f8b4a38305f7cb24b34c2011a2`; CF `f0b5c51191831415b39cd363cc9eb5ba759d1ea7e46d9b4c1d15cea0a7aa6490`; Brinon–Conrad `f27d508bc64b3c9e2e9de5041429b2cb6a909b2cd72ff8096c20493f27b5a187`. The CF version and reading date are also recorded in P7.

I checked `data/library-coverage.json` and the relevant AUDIT-37 records/review. The promoted coverage file has these audit batches pending rather than exact promoted R06/R07 entries; no implemented-status claim is inferred from their proposals. At pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, `WittVector.Isocrystal` (Isocrystal.lean, lines 65–115) already supplies the fraction-Witt carrier with semilinear Frobenius, and `IsocrystalHom` (lines 130–135) its equivariant linear maps. P7 reuses those actual declarations; filtered modules with N and the CF/FL equivalences are additional targets, not second isocrystal carriers. The Tau Ceti pin remains `f790474821cf4256814db967cb154e7af3d0c369`.

I also searched the current read-only roadmap/library trees at TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and TauCeti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Targeted AdicSpaces/LocalGaloisGroups readings preserve their existing generic perfectoid/Witt and cyclotomic-character work; those are imported, not re-planned. The search found no arithmetic CF/FL proof target already implemented there. This is a targeted check, not a complete new audit of either tree. No build or edit was made there.

## Checks and practical limits

- `check_blueprint.py` at the pinned declaration baseline: **0 errors, 0 warnings**. P7 has 302 nodes, 640 API items and 373 definition unit tests. All original 300 node IDs remain; every existing API/test record is unchanged. Two key theorem targets were added for the supplier proof. No `excerpt` fields remain.
- `check_restructure.py`: **ok**. All 50 links have RS-01 application evidence, none is skipped, and all consumer-forwarding checks above pass.
- Read-only `scripts/build.py` assembly with this RS-01 substituted in memory: **5,054 edge-incident vertices, 15,132 edges, acyclic**, versus 15,110 baseline edges. At the RS-01 application point, 44 links are inserted. These replacement-versus-promoted counts also include earlier unpromoted corrections; they are not a count of this round’s nineteen added proposal records alone.
- Add every raw restructuring and link-map proposal, including endpoints for proposed stages: **5,103 vertices, 15,359 edges, acyclic**. No generated atlas data was written.
- Project P7 prerequisites onto stages: the incoming 300-node packet already closes **VB3:general-BC → VB4 → R06.2 → VB3:general-BC**. The updated projection retains that existing cycle; no edge newly introduced by the replacement/P7 edit lies in a cycle. There is no path R06.4 → R07.3 or R06.3 → R06.2. Accordingly this report does not repeat the older snapshot’s claim that the whole newer P7 projection is acyclic.
- The full external R07 draft also has existing cycles before this edit, including R07.3’s late residual-weight example taking R07.5 inputs. Recursing specifically through `fl-admissibility` and `fl-lattice-correspondence` finds only R06.1/R06.2 and library inputs outside R07.3, with no later R06.3/R06.4/R07.4/R07.5 proof prerequisite. The selected early proof route is independent of those late examples; the external draft’s broader scheduling still needs its own normalization.
- `intake.py check-files` and `git diff --check`: pass on the six submitted files. No Lean file is a deliverable or changed; no Lean compilation was run.

The deliverables finish the owner/import decision. They do not claim that every relocated proof is implemented, that the packet’s source-proof gaps are closed, or that out-of-scope reader/suggested files have been synchronized. The [handoff](../handoff/FIX-RT-RS-01~2.md) gives the exact subsequent edits for the independent reviewer and owning roadmap jobs.
