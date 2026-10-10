# BP-PrismaticCohomology--PR.8~2 — completed target-level revision

Issue #7002; agent Codex; session `codex-Sddj4f`; 10 October 2026.
Branch: `codex-Sddj4f-prismatic-log-revision`.

The revision pass is complete. Packet status is **complete** and the sole stage, `PrismaticCohomology:PR.8`, is **planned**, with precise gaps and supplier requests. This is a planning completion, not a closed-stage, implementation or acceptance claim. The previous independent `needs_changes` review object is unchanged; the existing per-node and source-finding verdicts remain historical review records. The new reviewer must assess the revised content independently.

## Deliverables and verification

All four deliverables are synchronized: packet, reader, suggested Lean file and this handoff. All 76 original IDs and all six planets remain. Three targets were added: `fs-log-adic-kummer-foundations`, `p-kummer-local-systems`, and `p-kummer-monodromy-criterion`.

- 79 nodes: 20 definitions, 14 constructions, 8 lemmas, 36 theorems, 1 application.
- 219 API items and 137 unit tests. All 356 names have typed planning forms; all 137 tests are anonymous examples. Every one of the 34 definition/construction nodes has at least three tests.
- 6 planets, 20 pinned baseline declarations, 3 gaps, 14 supplier requests.
- Structural checker: zero errors, zero warnings. Local dependency graph: acyclic. Original IDs, independent review and unchecked implementation statuses were checked for preservation.
- Suggested file **compiled** with `lean-check` at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; admission warnings only. Available memory was checked before each single compile. No language server or library build was used.

## What the revision resolves

The full author copy of the 2026 Inoue–Koshikawa–Yao corrigendum was obtained and read, closing the former source-access gate. Its Lemma 1 and Definition 2, pp. 1–2, define the p-Kummer restriction by universal compatible-chart pullbacks, with the local p-root and strictly totally disconnected formulations. Definition 4 and Proposition 5, pp. 3–4, identify this with pro-p local inertia for noetherian fs log adic spaces. Theorem 7, p. 4, corrects both Laurent equivalences. The introduction, p. 1, maps published Theorems 7.35–7.36 to preprint 7.36–7.37 and preserves published Proposition 7.37 (preprint 7.38), including smooth proper pushforward. The target categories, API, tests and downstream statements now use that correction. A p-power root-cover pushforward has p-Kummer inertia; a prime-to-p root cover of degree greater than one gives the excluded permutation local system. The correction does not assert that perfect saturated log prisms have roots of every order.

The §13 signature deficit is closed at the planning-form level. This includes free δ_log constructions, actual non-rank-one Frobenius values, length-two Witt section coordinates, prism axioms, associated logs and exactification; geometric sites and comparisons; QSyn/QRSP adapters, derived/Nygaard interfaces; log diamonds and corrected coefficient categories. Conditions that the supplier fixtures cannot encode are omitted explicitly, never assumed through an arbitrary proposition-valued field. The reader's signature-limitations register and local Lean comments enumerate them. In particular, the file is not a claim that the full E∞/sheaf/formal geometry contracts are implemented.

The q=1 comparison now uses a separate reduced PD-base interface with arbitrary PD ideal, rather than wrongly restricting to the crystalline prism ideal (p). The log q-Frobenius retains [p]_q on dlog coordinates. The absolute-site test compares the strict trivial-log variant to PR.5. The Laurent non-example tests inversion before p-completion. Exactification remains algebraic before completion and uses M_B→M′, not a nonexistent N→M′. The corrected period diagram retains a B_dR^+ map which becomes an isomorphism after inverting t.

Proof-interior inputs were kept inline at target level: KY Proposition 2.47 and Lemmas 4.18, 4.20, 6.6, 6.9–6.10, 6.17–6.18, 8.5–8.6; K1 Appendix B.4 including its proof. Exact current PR.4 and PR.7 contracts replace the obsolete broad scope requests. DD.6 remains the owner of QSyn/QRSP, cotangent and log derived de Rham notions; PR.8's retained IDs are adapters.

## Tier move and ownership actions

Move down from tier-16 `HodgeTateAndCanonicalSubgroups:T6:log-sites` to tier-13 `PrismaticCohomology:PR.8/fs-log-adic-kummer-foundations`:

- `log-adic-space`;
- `kummer-etale-site`;
- `kummer-etale-higher-direct-images`.

The packet plans their general locally noetherian fs étale-log definitions, finite-free coefficient conventions and local inertia/exterior-power contracts at the lower owner. Redirect T6 and higher consumers to PR.8. No T6 files were edited. T6's existing DLLZ source issue E3 supplies the Tate-twist correction; it is cited rather than duplicated. Log-diamond saturation and perfectoid charts remain distinct PR.8 targets. The full all-root finite-level adic/diamond comparison is Inoue Proposition B.4, pp. 66–68, rather than Lemma B.3.

RS-01 is still a pending, unaccepted restructuring correction. Its proposal is not authority to change current ownership. C0 and the other same/lower-tier requested interfaces retain their current suppliers.

## Exact work required before PR.8 can be closed

1. Assign an owner to the full bounded algebraic Witt-Frobenius Riemann–Hilbert correspondence and its extension-by-zero compatibility. KY Lemma 8.5 uses bounded algebraic Frobenius W_n(O_C♭)-modules, the full bounded derived category of étale Z/p^n-sheaves, and Rj_! for Spec C♭→Spec O_C♭. The perfected modules need not be perfect as ring-modules. PR.7's lisse/perfect F_p statement does not supply this input.
2. Assign an owner to the arc-descent input used by KY Theorem 7.25, specifically Bhatt–Mathew Corollary 6.17 after inverting p on p-complete bounded-torsion rings. The extraction routes name ArcTopologyAndDescent, but there is no present roadmap/stage contract supplying it. The affected consumer is `kummer-etale-vs-qpket`.
3. Finish the supplier extensions grouped in the third gap: completed untilt/condensed interfaces (C0); non-fine integral formal log algebra and arbitrary PD-base crystalline comparisons (CR.5); formal cotangent/sheafification adapters (DD.6); proper Cartier-type O_C rational Hyodo–Kato base change (CR.6); and commuting-endomorphism cochain Koszul/sign/completion adapters (AI.1/DD.1).
4. Instantiate the explicitly documented suggested-signature fixtures and omitted higher/sheaf/geometry conditions against those interfaces. Verify the canonical normalizations, complete period diagrams and all clauses of the definitive packet contracts. Run the existing acceptance tests and compile again after those changes.

These are recorded dependencies of a planned stage, not an unfinished source-reading pass. Independent review must now check the correction, the tier move and the honest signature limits; it must not reuse the retained historical verdict as a new acceptance.

## Supplier requests retained in the packet

- `CrystallineCohomology:CR.5:log-algebra`: Remaining extension beyond the present fine and finite semistable contracts: arbitrary integral monoid exactification and exact surjections, relatively coherent/small charts, and Koshikawa Appendix A smoothness for possibly non-fine integral bases, including its exact-immersion lifting, chart independence and étale localisation on (p,I)-adic formal schemes. Current CR.5 exports prelog-ring, integral-monoid, associated-log and fine-model smoothness; those exports are used where sufficient and do not establish the full Appendix A comparison.
- `CrystallineCohomology:CR.5`: Log PD envelopes (p-completed), the small and big log crystalline sites with étale topology and log crystalline cohomology Ru^crys_*O over a p-adic PD base with a log structure, its computation by Čech nerves of log PD envelopes and by log de Rham complexes with coefficients in the envelope (Beilinson 2013 §1.6–1.8), the comparison of the big site with the small sites mod p^m and in the limit (Koshikawa I Remark 6.7), and the explicit log differential module of the standard semistable chart O_K⟨x_1, …, x_d⟩/(x_1⋯x_r − π) with chart N^r.
- `CrystallineCohomology:CR.6`: Hyodo–Kato theory over the log Witt base (W(k), N → W(k), 1 ↦ 0): log crystalline cohomology of the log special fibre of a semistable (or Cartier-type fs smooth) model and the Hyodo–Kato isomorphism with crystalline cohomology over (A_crys, M_crys) after inverting p and choosing a section k → O_C/p (log analogue of BMS1 Proposition 13.21), as used in Koshikawa–Yao II Proposition 8.9.
- `DerivedDeRhamCohomology:DD.6`: Remaining extension/verification beyond the exact DD.6 nodes now imported: Gabber cotangent sheafification on non-fine integral log formal schemes, discreteness for Koshikawa smooth charts and the formal log-étaleness lifting criterion used in KY Lemma 2.40. The supplier already owns animated Gabber complexes, transitivity, log de Rham, hlf descent and the log quasisyntomic/QRSP notions; PR.8 does not reconstruct them.
- `DerivedDeRhamCohomology:DD.5`: BMS2's quasisyntomic site QSyn and its quasiregular semiperfectoid basis (BMS2 Definitions 4.10, 4.20, Lemma 4.25–4.26, Proposition 4.31, Corollary 4.8 on bounded p^∞-torsion of p-completely flat algebras), which the log quasisyntomic site of PR.8 restricts to on trivial pre-log structures.
- `DiamondsAndVStacks:D1`: Strictly totally disconnected perfectoid spaces (qcqs with every étale cover split), every affinoid perfectoid admitting an affinoid pro-étale surjection from one (Scholze, Étale cohomology of diamonds, Lemma 7.18), and triviality of étale line bundles on them.
- `DiamondsAndVStacks:D4`: Diamonds and locally spatial diamonds, quasi-pro-étale (locally separated) maps and quotients of perfectoid spaces by pro-étale equivalence relations (Scholze Propositions 11.8, 11.24), fibre products of locally spatial diamonds.
- `DiamondsAndVStacks:D6`: The diamond Spd(R, R^+) of an arbitrary (possibly non-sheafy) Huber pair over (Q_p, Z_p) and the diamond generic fibre X^♦_η of a p-adic formal scheme, functorial in maps.
- `DiamondEtaleCohomology:C0`: The quasi-pro-étale site Y_qproét of a diamond with its completed structure sheaves Ô_Y, Ô^+_Y (Mann–Werner), the morphism to ∗_proét giving condensed coefficients, and quasi-pro-étale descent for torsion and Z_p coefficients.
- `PerfectoidQuotients:Q2`: Perfectoidization of integral algebras over a perfectoid ring (Bhatt–Scholze Theorem 1.17(1)), used to construct saturations of log perfectoid spaces in Koshikawa–Yao II Lemma 7.7.
- `AInfCohomology:AI.0`: A_inf = W(O_C♭) with θ, ξ, μ = [ε] − 1, ξ̃ = φ(ξ), and A_crys as the completed PD envelope of ker θ, with the Frobenius conventions of BMS1 §3; the perfect prism (A_inf, (ξ)).
- `AInfCohomology:AI.6`: Česnavičius–Koshikawa's semistable A_inf-cohomology AΩ_X for semistable formal schemes over O_C with canonical log structure, its local Koszul-complex description in the charts R^□_Σ × ∏_λ R_λ (ČK19 5.17–5.19) and the comparison diagram ČK19 6.8 with log crystalline and B_dR^+ cohomology.
- `EnhancedDerivedSheaves:E5:animation`: Animated (simplicial) commutative rings and sifted left Kan extension from polynomial algebras; the animated pre-log rings of DD.6 are built on it.
- `AInfCohomology:AI.1`: The commuting-endomorphism Koszul cochain interface used in K1 Constructions 7.15–7.16 and its décalage calculation. Current AI.1/koszul-decalage-calculation supplies the scalar divisibility calculation and requests the general carrier from DD.1. Current DD.1/koszul-complex is the homological exterior complex of a linear form, with scalar cochain version in [−r,0]; the log q-derivatives require commuting module endomorphisms with cochain degrees [0,r]. Obtain that carrier through the owner, with polynomial-operator/scalar and degree/sign adapters, finite-coordinate functoriality and the required completion/colimit bounds. PR.8 owns only the log q-derivatives.

## Source and library record

All repository statements are in our own words, with theorem/section and page numbers. No source passages, PDFs, private library files or scratch files are copied into the repository.

The prior October 6 access history and hashes remain; the October 10 revision records identify additional reading accurately. K1 §§2–7 and Appendix B correcting passages were rechecked, including the full B.4 proof, p. 62. KY algebraic/perfect-log, QSyn/QRSP, Nygaard and log-diamond/Kummer passages and the listed proof interiors were rechecked. Kato II Definitions 2.1–2.3, pp. 6–7; Ogus draft I.4.3.17(1), pp. 92–93; and Česnavičius–Koshikawa §6.7/Proposition 6.8, pp. 65–67, were read for the corrected inputs. DLLZ definitions, chart/site and local inertia passages, plus §6.3 finite-free coefficients, were read; Inoue Appendix B.2–B.4, printed pp. 66–68, was read including the comparison proof. The complete five-page corrigendum was read.

The public correcting text is [the author attachment](https://researchmap.jp/7000017226/misc/53305261/attachment_file.pdf), SHA-256 `005ee338ad8f6cb0adb297dfadcb7bca06bea7e817e5b97dc09ac0e5ea686b1f`, DOI [10.1016/j.aim.2026.111223](https://doi.org/10.1016/j.aim.2026.111223). The full 2025 publisher PDF and publisher-hosted corrigendum PDF remain unread; this does not block the corrected targets because the complete author copy supplies them. The packet records the distinction.

The reviewed library audit has no direct PR.8 row. The current upstream roadmap and library screen initially used TauCetiRoadmap `0a56d1b5303c26887a4042db834f46d9079ac593` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The final roadmap screen used `48cda9fcc5dbdc8f8d51e717f6a3090e0c4cd688`; its intervening changes concern smooth representations, Hecke determinants, reductive and adelic groups and add no PR.8 target. Existing Tau Ceti pro-p group theory is imported at the pinned commit instead of re-planned. AdicSpaces and ProfiniteProPGroups were read for upstream style.

The next worker needs only the four deliverables and their linked public sources. The run's scratch is disposable and supplies no required handoff material.
