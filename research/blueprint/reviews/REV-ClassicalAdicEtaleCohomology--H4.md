# Independent review: the classical analytic cohomology inputs to diamonds, H4–H5

Job `REV-ClassicalAdicEtaleCohomology--H4`, issue #368. Reviewer: Claude (Opus 5.5), session `claude-t7fgMY`, 6 October 2026. This session did not write the input: the planning pass `BP-ClassicalAdicEtaleCohomology--H4` was done by Codex, session `codex-aFUJt5` (PR #6672, issue #693).

**Verdict: accepted.** After the corrections below, every node is corrected and justified, all baseline citations are confirmed at the pins, and no contradiction remains. The packet stays `complete`; H4 and H5 are `planned`, not `closed`, and that is the right status: six gaps and eleven requests remain, each precise. This accepts a plan. It certifies no implementation and does not close the proofs in Huber's book, which neither the planning job nor the review could read.

## Counts

| Item | Input | After review |
| --- | --- | --- |
| Nodes | 39 (2 definitions, 8 constructions, 26 theorems, 3 applications) | 39, all corrected; none added, none removed |
| Baseline declarations | 9 | 14: the 9 confirmed, 5 added |
| API items / unit tests | 36 / 32 | 46 / 32 (10 API items added; 1 API statement and 2 tests corrected) |
| Source citations with a literal excerpt | 0 of 52 | 81 of 81 |
| Requests / gaps | 15 / 7 | 11 / 6 |
| Source issues | 1 | 2: the one confirmed (and corrected), 1 added |
| Planets | 12 (six per stage) | 12, unchanged |
| Suggested Lean file | exit 0, 52 warnings, all "declaration uses `sorry`" | exit 0, 61 such warnings and nothing else |

## Corrections made in place

1. **Excerpts.** Every one of the 52 source citations had a placeholder as its excerpt: "B(ε)", "annulus", "standard", "i", "disc", "Kummer", "D*", "extracting", "smooth", "pullback", "C′+", "torsion ring", "vanishes", "char(k)", "finite", "ni", "surjective", "inclusion", "locally", "embed", "direct" and the like. These verify nothing. Each is now a literal passage of at most 300 characters read at its locator, and citations were split where one locator covered several results (81 in all). For Huber's book, which is not public, the three nodes that cite it carry again the excerpts of the reviewed decomposition (`data/decompositions/ClassicalAdicEtaleCohomology.json`), which the packet had replaced by single words.
2. **Locators.**
   - The biduality passage is the proof of ECD **Theorem 25.1** (pp. 159–160). The packet called it "Proposition 25.3" in ten places; 25.3 is a remark about coefficient rings.
   - ECD cites Hub96 6.2.2 on p. 152, not p. 153.
   - Ito defines B(a,b) on p. 31 (and p. 46), B(ε) on p. 35 and D(ε) on p. 37; the packet gave "pp. 35, 37" for all three.
   - Berkovich's degree deg_D is defined after Lemma 6.2.2 on p. 112, not on "pp. 113–118". The Berkovich citation of the comparison theorem is split into 7.5.3 (p. 150), 7.4.9 (p. 145) and 7.1.4 (pp. 129–130).
3. **Annuli over an arbitrary plus ring: a recorded gap that an existing node closes.** The packet declared the comparison of annulus cohomology over Spa(C, C⁺) with Spa(C, O_C) an open gap and asked `H1:valuation-exports` for it. The last clause of `H3/curve-cohomology-finiteness` (H^q(X, F) ≅ H^q(X_η, F) for a quasi-compact smooth curve over any C⁺) is exactly this statement for ordinary cohomology, which is all ECD 19.5 uses. `annulus-geometric-plus-ring` is now a theorem with that prerequisite; the gap and the request are removed, and the proper-support case is left to H3's own recorded gap.
4. **Hub96 6.2.2 over a non-closed base field is not needed.** The packet asked H3 for the theorem over a perfectoid, non-algebraically-closed field, because ECD's wording of 24.1 (ii) uses K = F_p((ϖ^{1/p^∞})). The same proof (p. 152) notes that a strictly totally disconnected space maps to Spa(C, O_C) for the completed algebraic closure C, and `H2/finite-type-approximation-of-perfectoid-affinoids` approximates over the geometric pair. So Ito's form (K algebraically closed) suffices. `perfectoid-base-constructibility-transfer` is restated as a precise theorem. Its step "by H0 pullback stability" did not follow from the supplier, whose stability statement needs a locally noetherian source; the short argument on a strictly totally disconnected space is now written out.
5. **`perfectoid-support-image-comparison` was not a mathematical statement** ("the desired isomorphism is conditional on …"). It is now a contract with the right-hand side defined, a proof route through H0's tilde-limit nodes, and the request to H3 kept.
6. **The compactification branch.**
   - Lütkebohmert's Proposition 5.4 asserts only an ample relative Cartier divisor. That the divisor contains the boundary and lies in the smooth locus is Lemma 5.5 (d), at each level n. The node stated both as 5.4; they are now separate. Checked on the scans of pp. 197–198.
   - The third clause of Definition 5.6 ("S-compactifiable over U") is added as an API item; the proof of Theorem 5.3 uses it.
   - ECD's argument needs only **local** embeddings: the cone is a direct sum of contributions at finitely many frontier points, and each is computed in a neighbourhood. `curve-boundary-direct-summand` is restated with an embedding of a neighbourhood of each frontier point (ECD's global embedding is the case V = X), and `geometric-curve-compactification-export` separates the local form from the global sentence. This removes the globalisation half of the recorded gap.
   - Lütkebohmert's **Remark 6.7** (p. 211), which the packet did not cite, says the valuation is assumed discrete throughout and asserts without proof that the paper extends to height-one valuations. The remaining gap is exactly this nondiscrete case.
   - `curve-compactification-duality` lacked the prerequisite `H3/curve-cohomology-finiteness`, on which its reduction to N = F_ℓ rests. The compatibility of the biduality map with the Poincaré pairing, which ECD leaves to the reader (registered as PAPER-SCHOLZE-17/E72), is now an explicit proof step.
7. **Stage-level prerequisites where finer nodes exist** (PROTOCOL §3). Replaced by the nodes that supply the need, all read:
   - `R1/analytification-separated-proper` (ii′) for Huber's Lemma 3.7.3;
   - `R1/analytic-affine-space` and `A2/analytification-relative-polydisc-comparison` for the exhaustion of affine space by balls. `ball-exhaustion` planned that exhaustion again; it now imports it and keeps only what it adds (fractional radii through chosen roots, the closure statement, the set-level core);
   - `R4/analytification-etale-site`, `R0/smooth-morphism`, `R2/admissible-formal-scheme`, `R2/admissible-blow-up`, `R2/flattening-by-blow-up`, `R2/raynaud-theorem`;
   - `P7/perfection-tilde-limit` and `P7/etale-topos-invariance-under-inseparable-towers` for coordinate perfection (the packet asked P5 and H0);
   - `H0/stalk-formula-strict-localisation`, `H0/strict-localisation-tilde-limit`, `H0/tilde-limit-base-change`, `H2/finite-type-approximation-of-perfectoid-affinoids` (the packet asked P6), `D1/strictly-totally-disconnected`.
   The requests to R1, P5, P6 and H1:valuation-exports are thereby discharged and removed.
8. **Scheme-side suppliers.** Scheme proper base change, constructibility of R^q f_! and Deligne's generic base change were requested from `EDC.0` and `L2`. `EDC.0` imports these and `L2` is the non-noetherian compactification of qcqs schemes. The atlas names `SchemeAndStackFoundations:SF.2` as their integration owner, and the H0–H3 packet of this roadmap uses SF.2. The request now goes to SF.2. Projective models of curves over a field (Lemma 5.5) go to Tau Ceti's AlgebraicCurves Layer 12 instead of L2.
9. **Unjustified prerequisites removed.** `proper-open-excision` does not use Theorem 3.7.2; `extend-curve-compactifications` does not use Proposition 5.4; the three boundary nodes do not use the annulus computations or (two of them) curve duality; `radius-restriction-stabilization` does not use H3 or E1; `finite-polydisc-cohomology` cited H3's bound on R f_! for a boundedness statement that the packet's own request says it does not give.
10. **Proof sketches.** Six groups of nodes shared one sketch verbatim (for instance the disc theorem carried the sketch of the annulus theorem). Each node now has its own, written from the source's proof.
11. **Small statement fixes.** `closedAnnulus = R({T}/b) ∩ R({a}/T)` needs no unit hypothesis (T outside the support and T ≤ b put b outside the support). The garbled "R_→S" in 3.7.2 is corrected. Tameness is defined as in Berkovich (geometric ramification index at every point). The sign convention of the Kummer degree is stated (deg_D for the inner disc; the outer disc and H3's residue give the opposite sign). In Huber's convention H⁰_c of the closed disc is 0, which the disc node now says.
12. **Requests** are rewritten as precise statements. The H3 request for the suffix of RT-AREA-etale/5 now states Huber's scope as the verifier asked: separated, taut, smooth of pure dimension d, quasi-separated target, every d ≥ 0, torsion prime to the residue characteristics; and Zavyalov's transport for partially proper morphisms of taut spaces and overconvergent sheaves.

## Red-team finding RT-AREA-etale/5

The packet gets it right, in three places that agree: `comparison-over-nonarchimedean-fields-3-8-1` says that the characteristic-p proof consumes relative duality for smooth morphisms of every pure dimension and takes A^m_C, m = 2, as its acceptance case; the request to H3 asks for the suffix `H3:smooth-duality` (Hub96 5.7.2, 7.2.2, 7.5.1–7.5.3) and keeps the curve prefix for S4 and S5; the restructuring proposal adds the edge `H3:smooth-duality → H5`. The gap "All-dimension relative duality supplier not yet planned" keeps the dependency visible until H3 has the suffix. Read against Berkovich: Lemma 7.5.2 (p. 147) applies Theorem 7.4.9 (p. 145) for arbitrary d, and 7.5.3 (p. 150) requires torsion prime to the **residue** characteristic, which is why Berkovich's route covers Huber's 3.8.1 only in characteristic p. The reader document has a section on the finding that says the same, without the words taut and quasi-separated target that the request now carries; see question 1 for its other divergences.

## Source issues

| Finding | Verdict | Check |
| --- | --- | --- |
| `E-H4-1` (was `E1`): ECD cites [Lüt95, Theorem 5.3] for an embedding over an algebraically closed C | confirmed, with corrections | Read at ECD p. 160 and, on the GDZ scan, Lütkebohmert's Theorem 5.3 (p. 197) and Remark 6.7 (p. 211). The citation does not cover a nondiscretely valued field, and the paper says so itself. |
| `E-H4-2` (new): "we continute to denote" | confirmed | Same sentence, p. 160. A spelling slip. |

Corrections to the first finding: the locator said "Proposition 25.3"; Remark 6.7 was not cited; `known` carried a sentence instead of `new`, so the register would have listed it as already corrected in print; and its second point (a local compactification is not a global embedding) is true of the sentence but does not affect the proof, which needs only neighbourhoods of the frontier points. The id `ClassicalAdicEtaleCohomology/E1` was already used by the H0–H3 packet of the same roadmap, so the finding is now `E-H4-1`.

Two registered findings bear on nodes and are now cited there: PAPER-SCHOLZE-17/E55 (the annulus in the proof of 19.5 is over Spa(C′, C′⁺), not Spa(C, C⁺)) and PAPER-SCHOLZE-17/E72 (the last paragraph of the proof of 25.1).

## Mathematics checked

- **Radial loci.** All set-level identities checked against the pinned definitions of `spa`, `rationalSubset` and `comap`. Ito's Example A.1 confirms the packet's central distinction: the rank-two points η(R) and η(r)′ satisfy the strict inequalities and lie in no smaller closed annulus, and D(ε) = {|T| < ε} is closed, not open.
- **Cohomology of discs and annuli**, recomputed:
  - closed disc: (Λ, 0, 0); closed annulus: (Λ, Λ(−1), 0) from O(A)^×/n = ℤ/n and Pic(A) = 0;
  - proper support in Huber's convention, by duality and independently through the universal compactification (boundary points of rank two with cohomology Λ, Λ(−1)): closed or open disc (0, 0, Λ(−1)); closed or open annulus (0, Λ, Λ(−1)); punctured disc (0, Λ, Λ(−1));
  - these agree with Ito's Lemma 6.12, whose vanishing statements concern half-open pseudo-adic loci, which are different spaces.
- **The tower of ECD 19.5.** For L ⊂ L′ the coordinates satisfy t_L = u·t_{L′}^e with u a unit of the integers of L′, hence an ℓ-th power, so the transition on H¹ is multiplication by e: zero for ℓ | e, an isomorphism for p-power roots.
- **ECD 24.1.** The base K = F_p((ϖ^{1/p^∞})) has residue field F_p, so O_K and O_C map into R⁺ for every affinoid perfectoid (R, R⁺) of characteristic p without nonsplit finite étale covers, including those with higher-rank points; the approximating bases are then Spa(S_I, S_I°) of topologically finite type over C.
- **ECD 27.2.** The automorphisms t ↦ tⁿ of C exist for n ∈ ℤ[1/p]_{>0}; surjectivity of finitely many restriction maps plus equal finite cardinality gives isomorphy; the closure of B_1 is the intersection of the B_n, n > 1.
- **Berkovich §§6.2–6.4, 7.1, 7.3–7.5** read on the page images (the text layer is unreliable): 6.2.1, 6.2.2, 6.2.10, 6.3.1–6.3.6, 6.4.1–6.4.2, 7.1.4, 7.3.1, 7.4.9, 7.5.1–7.5.4 and the proofs of 6.3.5 and 7.5.1.
- **Lütkebohmert §5 and §7** read on the GDZ transcription, with pp. 197, 198 and 200 on the scans: 5.3–5.8 with the proofs of 5.5, 5.7 and 5.3, Remark 6.7, 7.1–7.6.
- **Mieda** §3.3.1 and the proof of Proposition 3.38; **Zavyalov** 1.1.3, 5.3.3, A.1–A.19.

## Baseline, closure, requests

- **Baseline.** The 9 declarations were read at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` (from the commit object) and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Each exists under its name with the stated content; `Sheaf.H` is an `abbrev`, and `classicalPoint_vle` needs a complete Hausdorff nonarchimedean uniform ring, as the packet says. The format's `kind` field was missing and is added. Five pinned declarations that the radial API rests on are added: `comap`, `comap_mem_spa`, `comap_preimage_rationalSubset_inter_spa` (the base change of the closed-disc locus is this theorem for a singleton numerator and a unit radius), `isOpen_val_preimage_rationalSubset` and `rationalSubset_image_mul_right`.
- **Closure.** Every prerequisite chain ends in the baseline, in an own node, in a cited node of another packet (statements read), in a requested stage or in a recorded gap. The packet's graph is acyclic, and no cited stage lies downstream of H4 or H5 in `stageEdges`.
- **Cross-roadmap nodes.** 84 prerequisite citations go to nodes of other packets: the H0–H3 packet of this roadmap (still `partial` and unreviewed), the accepted AdicSpacesPartII and AdicEtaleGeometry blueprints, PerfectoidSpaces--P0 (`needs_changes`) and DiamondsAndVStacks (unreviewed). The ids follow PROTOCOL §3, but statements of unreviewed packets may still change.
- **Library audit.** AUDIT-18 finds H4 and H5 not built; nothing the audit shows in the libraries is planned. RS-05's ownership (R1 for analytification, R2 for formal models) is respected.
- **Coverage.** Every target of both stage texts is realised. The targets "base-field change" and "transfer to perfectoid limits" of H4 are `valuation-radial-exports`, `annulus-geometric-plus-ring`, `tame-tower-annulus-acyclicity` and the two perfectoid-base nodes.

## Suggested Lean file

Compiled with `lean-check` in the shared build (Mathlib `082e2d37e8`, the pin; the build's Tau Ceti checkout is `cf386627`, newer than the pin; the Tau Ceti modules the file imports directly, `Spa.Comap` and `Spa.RationalSubset.Basic`, and `ValuationSpectrum` are unchanged between the two commits). Input: exit 0, 52 warnings, all "declaration uses `sorry`". Reviewed file: exit 0, 61 such warnings and nothing else.

- Nine declarations added for the new API items: `closedDisc_subset_spa`, `closedDisc_mono`, `closedDisc_mul_unit`, `isOpen_closedDisc`, `closedAnnulus_mono`, `puncturedDisc_eq_iUnion_closedAnnulus`, `openDisc_eq_of_cofinal`, `openAnnulus_eq_of_cofinal`, `radiusBall_pow`. The tenth, `FormalCurve.IsSCompactifiableOver`, joins the omitted formal-curve inventory.
- `closedAnnulus_eq_inter` no longer takes units.
- The test `Radial.classical_point` compared two statements that are both always true (radius 1). It now has a constant radius b.
- The two signatures that need the pinned `Spa.Polydisc` module stay in comments, because that module has no object file in the shared build. The review elaborated both, and the strengthened test, against a scratch copy of the pinned module's source: they typecheck.
- The analytic theorems and the two formal-curve definitions remain named omissions, as section 13 requires when the carriers do not exist.

## Questions for the orchestrator

1. **Reader document.** `research/blueprint/readmes/ClassicalAdicEtaleCohomology--H4.md` is outside this review's edit paths and still shows the input: "Proposition 25.3", the removed plus-ring gap and requests (P5, P6, R1, EDC.0, L2, H1:valuation-exports), the global form of the compactification export, the conflated Proposition 5.4, the unit hypothesis in `closedAnnulus_eq_inter`, and none of the ten added API items. It needs a follow-up edit to agree with the reviewed packet.
2. **Source-issue id.** `data/source-issues.json` holds two entries named `ClassicalAdicEtaleCohomology/E1`, one from each packet. The H4 finding is renamed `E-H4-1` here; the register should lose the stale entry at its next run. The planning job's handoff note still says "E1" and "25.3".
3. **SF.2.** The scheme-side request moved from EDC.0 and L2 to SF.2, following the atlas's integration-owner record. If the maintainer prefers another owner for Deligne's generic base change, only that request changes.
4. **H3:smooth-duality** does not exist in the atlas yet. Until it does, 3.8.1 in characteristic p is planned but not closable beyond curves.
5. **Lütkebohmert over a nondiscrete field.** The request to R2 now includes his §5 and §7 over the non-noetherian ring of integers of C. This may be more than R2 intends; a citation of a theorem that covers smooth curves over algebraically closed fields would close the gap more cheaply.
6. **Unreviewed suppliers.** If the review of the H0–H3 packet changes `H3/curve-cohomology-finiteness` (its last clause), `H0/stalk-formula-strict-localisation` or `H2/finite-type-approximation-of-perfectoid-affinoids`, the H4 nodes that use them need re-checking.

## Texts read

| Source | Version and hash (SHA-256) |
| --- | --- |
| Scholze, Étale cohomology of diamonds | author PDF dated 14 April 2026, `4ce3d123…7995a26c1`; pp. 110–112, 124, 152–153, 158–160, 163–164 |
| Ito, Uniform local constancy | arXiv:2008.07794, `0cb1bef9…cb3ddc5`; §4.1, §6, Appendix A.1 |
| Berkovich, Étale cohomology for non-Archimedean analytic spaces | IHÉS 78, digitised author copy, `beaa3630…f8d759`; pages listed above, on the page images |
| Zavyalov, Mod-p Poincaré duality | arXiv:2111.01830, `a984d973…c2c951`; pp. 3, 78, 84–88 |
| Mieda, Zelevinsky involution | author PDF, `dcbfd4e8…383b631`; pp. 12, 19–20 |
| Lütkebohmert, The structure of proper rigid groups | GDZ transcription of pp. 167–168, 196–203, 211–213; scans of p. 197 `b61c8e14…0acd622c`, p. 198 `c03e30a7…fc60c244`, p. 200 `0896396c…3c640c` |
| Huber, Étale cohomology of rigid analytic varieties and adic spaces | not public; not read |
