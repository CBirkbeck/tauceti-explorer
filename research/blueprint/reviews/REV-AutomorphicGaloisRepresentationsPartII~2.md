# Independent review: Automorphic Galois Representations Part II, revision 2

Review job `REV-AutomorphicGaloisRepresentationsPartII~2`, issue #10008. Claude, session `claude-4kbXWw`, 2026-10-16.
This session wrote and reviewed none of the earlier work on this roadmap. Those jobs are `BP-AutomorphicGaloisRepresentationsPartII` (codex-y94Tyw), its first review (codex-4MPfgD), revision 2 (codex-1KTNLb), the part packets and their reviews. An earlier checkpoint of this review job (codex-P5lc4w) gave no verdict; this report replaces it.

**Verdict: accepted.** The specification is now 124 contracts: 16 physical nodes and 108 `importChecks` contracts on targets of the accepted AG2.0 and AG2.6 parts. With the corrections below, it is a sound target-level plan. Every stage is planned, and every chain ends in the pinned libraries, a named lower-tier supplier or a precise gap. The packet status is corrected to `complete`.

The installation of the imported contracts over the historical parts is an action for the maintainer, recorded as gap 18 and in the orchestrator questions below. It does not show a gap or an error in the plan.

## What was checked

| Item | Result |
| --- | --- |
| Contracts read in full | 124 (14 definitions, 24 constructions, 64 theorems, 6 lemmas, 16 comparisons) |
| API items / unit tests | 189 / 139; every definition and construction has at least three tests |
| Planets | 46, at most six per layer |
| Sources | 26 records plus one added; every file re-downloaded or read in place, all SHA-256 digests match |
| Source locators | 166 locator entries located in the identified versions; corrections listed below |
| Pinned baseline | 15 Mathlib declarations read at `082e2d3`; all exist with the stated statements; none removed |
| Prerequisites | all resolve to a node, a stage with a request, a pinned declaration or a Tau Ceti layer; none cites a higher tier (AG2 is tier 17) |
| Graphs | the specified target graph and its contraction to the ten layers are acyclic |
| Source issues | 16 confirmed at their locators; 1 added (EAG27-1) |
| Requests / gaps | 49 / 18, all precise; request 20 corrected |
| Red-team findings | the 11 assigned findings are handled, as tabulated below |
| Nodes added / baseline citations removed | 0 / 0 |

How the sources were read: the public PDFs were fetched to private scratch space and their hashes compared with the catalog. The three maintainer-cleared PDFs (ACC+, Liu–Tian–Xiao–Zhang–Zhu, Pilloni) were read in place. Nothing from them was copied into the repository.

A retrieval pass located each locator. I then read the passage behind every flagged item, and behind every contract that carries a convention, a sign or a numbered result. These include BLGGT §2.1 and §5.1, ACC+ §2.2.5, Definition 4.3.1 and §7.1, CH §§1–4, Shin §§2.3, 5.1 and 7.1, TY §2, CS §5.5, Caraiani's Theorem 7.4 in both versions, HLTT §1.1 and Appendix A.1, and Varma §§8–10. I also recomputed the numerical checks in the contracts: the weight and Hodge–Tate examples, the polynomial identities for n=2 and n=3 (including Δ at 2), twists and duals, the multiplier sign, the projector denominators, the HLTT dimensions and slope shift, the genericity examples over F₃, F₅ and F₇, and the lattice examples.

## Corrections made

1. **Normalization of Shin's and Caraiani's correspondence.** The AG2.5 dictionary node said that Shin's and Caraiani's L_n is the geometric normalization used for the good polynomial. It is not. Shin §2.3, p.10, defines L_n(π) as rec of the contragredient, twisted by |·|^{−(n−1)/2}, and Caraiani's published Theorem 1.1, pp.1597–1598, writes it the same way. Chenevier–Harris p.5 says that their representation of Π is Harris–Taylor's representation of Π^∨. So a source representation normalized by L_n is attached, in the AG2.0 sense, to Π^∨≅Π^c. The node now states this and cites all three places, with an n=1 check. Proof steps applying the construction to π^∨ were added to `AG2.2/shin-regular-geometric-existence` and `AG2.5/caraiani-upgrade-away-from-p-and-temperedness`. The statements of the targets were already in the right convention; only their derivation from the sources needed the step.
2. **Caraiani's numbering.** In the cited arXiv version the stratum trace formula is Lemma 5.7 (p.60), and 5.8 is Theorem 5.8 (Iwahori temperedness, pp.60–64). There is no Proposition 5.8. Corrected in `AG2.5/caraiani-stratum-concentration` (statement and locator), `AG2.5/racsdc-temperedness` (proof step and locator) and request 20.
3. **The published Caraiani copy.** `AG2.5/pure-weil-deligne-comparison` cites the binomial argument of the published proof of Theorem 7.4, pp.2410–2411, but the copy had no source record here. It was recorded only in the AG2.0 part's version list. A source record `caraiani-monodromy-away-published` (author copy, hash recorded) was added, and the match now describes the argument as the source gives it.
4. **Locators and matches**:
   - HLTT: notation in the introduction, pp.1–3 (dictionary); §1.1, p.13, and §3.1, p.84 (unitary datum); §§3–5, pp.84–191 (boundary instance); Lemma 6.10, p.205 (finite slope).
   - Shin: Mant_{b,μ} is defined in §2.2, pp.8–9.
   - Varma: Theorem (1) is on p.1.
   - TY: §1 begins on p.2.
   - CH §3.1: the restriction conditions precede Proposition 3.1.1.
   - BLGGT p.34: the justification after Theorem 2.1.1 is unlabelled. Two locators now name it, and the twisting remark is identified.
   - Finite p-adic realization: the BLGGT and Calegari–Geraghty matches now say what those pages contain.
   - LTXZZ: Corollary D.1.4 uses CH Proposition 3.2.5.
   - AHTW: Theorem 5.2.9 is on p.76.
   - BLGGT §5.1: it defines operations memberwise and states no preservation results.
   - CH §4: Theorem 4.2 is distinguished from the uniqueness argument.
5. **HLTT lattice test.** The test now names HLTT's own self-dual lattice (D^{−1})^n⊕O_F^n.
6. **Suggested file.** Five theorems were renamed to the packet's API names: `DominantWeight.isInW_baseChange`, `isGenericEigenvalues_smul`, `isGenericEigenvalues_reindex`, `isGenericEigenvalues_inverse` and `isGeneric_frobenius_independent`. Every statement in the 221-line file was checked by hand and is true.
7. **Reader.** It now carries every correction. Three wording differences from the packet were removed. The introduction states this verdict and what installation remains.
8. **Packet bookkeeping.**
   - Status is `complete`, and the summary describes the mathematics.
   - Gap 18 is restated as an installation action.
   - Imported contracts changed here carry a contract status saying that they are reviewed corrections to install.

None of these corrections adds a difference in statement, hypotheses, prerequisites, parent, realises, API or tests between an imported contract and its historical part. The only changed statement belongs to a contract that already differed. The revision-2 probe, rerun on the corrected packet, still gives 35 such differences, a production merge of 129 declarations and 54 planets, and a specified graph of 124 and 46.

## Source issues

All sixteen recorded issues were confirmed at their locators in the identified versions; the packet gives each verdict and reason, with the earlier verdicts kept in `reviewHistory`.

The checks were:

- BLGGT: the sign condition of p.32 and the unlabelled step on p.34, which fail for odd w.
- BCGP21 p.189: the maximal-rank uniqueness claim. The recorded six-dimensional example was recomputed: N³ has ranks 1 and 0 for the two rank-four operators.
- CH: the isogeny on p.12 and the non-negative weights on p.4.
- Caraiani p.84: the factor weight 2n−2, repeated on p.2409 of the published copy.
- ACC+ pp.922 and 927: the sign and degree slips.
- HLTT p.231: the zero block assigned to Std.
- Varma pp.19 and 27: cross-references that do not exist in v1.
- ACC+ p.972: the projective-invariance remark.
- Caraiani's published §3A: the three index and dimension slips, read on the page images of pp.1609–1611.

One issue was added. EAG27-1: in CH §4, Theorem 4.2(c)–(d) speak of a prime of K and of GL(n, K_v) in the totally real setting, and the proof cites a nonexistent Theorem 3.2.5 (Theorem 3.2.3 is meant). It is a misprint and affects nothing.

## Assigned red-team findings

| Finding | Disposition checked |
| --- | --- |
| langlands-1/2 | The raw fixed-point identity takes the Fujiwara–Varshavsky refinement from EDC.8 through request 15 and gap 11. Nothing comes from ET.5. |
| langlands-1/3 | The Mantovan functor, the global formula and Shin's Propositions 2.2–2.3 are AG2.1b nodes, with ET.6a requested for the local inputs. |
| langlands-1/4 | Compact Drinfeld and Igusa models and compact EL cohomology are AG2-owned instances. Shin's Theorem 6.1 is its own node. The IG.0 prerequisite is gone, and the ET.5/ET.7b requests name Shin's datum. |
| langlands-1/5 | Polarized PEL effectivity is requested from PEL M4 (request 9, gap 2); unpolarized Honda–Tate is not used. |
| langlands-1/16 | The AHTW v1 theorem, its monodromy corollary and the nonselfdual export are planned with preprint status and their supplier gaps (13, 17). |
| langlands-1/18 | Arbitrary-regular polarized existence and the discrete export sit in AG2.3 and AG2.7. Changing the higher-tier TorsionCohomologyInfrastructure edges belongs to that roadmap. |
| langlands-1/19 | GSp₄ material goes to the proposed dedicated owner, with three historical targets excluded (gap 5). |
| langlands-1/20 | AG2.6 owns the compatible-family carrier, since PotentialModularityAndCompatibleSystems is tier 22. The opposite import proposed by the finding would cite upward. |
| langlands-1/26 | Interpolation and factor separation import IHG.4; the quotient-versus-injection mismatch is gap 7. |
| padic-2/22 | AG2.6 owns the higher-rank automorphic comparison and imports R06.5's generic comparison (request 23). |
| padic-2/32 | RD.4, RD.5 and RD.6 are prerequisites of the AG2.4 boundary nodes (requests 31–33). |

## Integration (gap 18)

`scripts/blueprints.py` merges physical nodes only. Until the maintainer installs the `importChecks` contracts, the parent moves and the five exclusions over the two historical part packets, the live atlas will show the historical contracts.

I checked what promotion would do now. An in-memory merge gives 129 declarations, 54 planets and no skipped links. The merger adds no edge between this roadmap's own layers, so the historical AG2.2 placement of the CS discrete normalization creates no atlas cycle; the specified graph is acyclic. Promotion of accepted packets has not run since 2026-10-09, so the accepted whole-roadmap packets carrying `importedNodes` or `importChecks` metadata are all waiting for it. AInfCohomology, DeligneWeightsAndPurity and PotentialModularityAndCompatibleSystems--R24.5 are examples. This review follows those acceptances.

Holding the plan back for installation would not help. No worker job may edit the merger, the historical parts or the consumer packets, so a third revision round could change nothing.

## Questions for the orchestrator

1. Install the specification over the historical parts:
   - apply every `importChecks` contract (full dictionaries, not only prerequisites) and the `parentReconciliation` moves;
   - remove the five `excludedReusedNodes`;
   - keep the stable ids and the earlier review provenance.
2. Redirect, in the same step, the six external prerequisites that cite the two excluded generic ideal targets:
   - `IgusaVarietiesAndTorsionConcentration:IG.7/cs-generic-maximal-ideal` and `IG.7/cohomologically-generic`;
   - `PotentialAutomorphyInfrastructurePartII:PL.2/unitary-hecke-algebra`.

   Each cites both targets, in both research and promoted packets. Point them at IntegralHeckeAndGaloisDeterminants IHG.3, upstream Layer 3b (`Spherical.IsGaloisType`, `Spherical.IsNonEisenstein`).
3. The roadmap is TauCetiRoadmap pull request #1006, where its README is authoritative. The L_n normalization correction above should be checked against that README's Shin and Caraiani citations.

## Checks run

- `python3 scripts/check_blueprint.py --index <baseline declarations> research/blueprint/packets/AutomorphicGaloisRepresentationsPartII.json`: 0 errors, 0 warnings, status complete.
- `lean-check` on the suggested file: exit 0, 31 placeholder-proof warnings, no errors or other warnings.
- Reader agreement, by script: every statement, hypothesis, proof step, check, API item, test, source line, request line, gap and source-issue verdict of the 124 effective contracts appears verbatim in the reader.
- Revision-2 integration probe rerun on the corrected packet: all its assertions pass, with production 129/54, specification 124/46, 35 semantic differences, acyclic graphs and six external references.
- Closure script: no unresolved prerequisite, no upward-tier citation, acyclic target and layer graphs.
