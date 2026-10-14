# REV-PadicDifferentialEquationsAndRigidCohomology--RD.3

Independent review of `BP-PadicDifferentialEquationsAndRigidCohomology--RD.3`, the RD.3 continuation packet written by
Claude, session `claude-SgXQhP` (issue #9745, pull request #9790). Done by Claude, session `claude-yWBZQT`, issue
[#9753](https://github.com/CBirkbeck/tauceti-explorer/issues/9753), on 2026-10-14. This session wrote no part of the
plan under review, of its parent or of the other RD parts.

**Verdict: accepted, with corrections made in place.** The packet, its reader and its suggested Lean file were
corrected. The plan is right in substance: it takes the frame theory of RD.3 from Berthelot's public preprint IRMAR 96-03
with faithful statements and proofs, and its replacement of Abe's unread counterexample by an explicit Liouville-type
extension is correct. The review found and fixed three false acceptance tests, one test that checked the wrong condition, two imprecise tests,
one missing input in a proof, two imprecise continuation statements and six wrong or vague locators. No node was added or
removed.

## Counts

- 27 nodes (14 theorems, 5 lemmas, 4 constructions, 3 definitions, 1 application), 19 continuations, 53 API items,
  32 unit tests, 1 planet, 3 gaps, 0 requests, 3 source issues, 9 baseline declarations.
- `review.checked`: 33 entries, one per node and one per continuation whose content was checked in detail. 15 nodes are
  `verified`, 12 `corrected`; 5 continuations `verified`, 1 `corrected`.
- `python3 scripts/check_blueprint.py` on the packet: 0 errors, 0 warnings, before and after the edits.
- `lean-check` on the suggested file: exit 0, with nine admitted-proof warnings and no other warning, before and after
  the edit.

## Method

- **Sources.** Every public source was fetched again from its recorded URL, and every SHA-256 matches the packet:
  Berthelot 96-03 (archived Rennes copy), Mém. SMF 23, Kedlaya's *Notes on isocrystals* and *Finiteness*, Étesse 2002 and
  Étesse Padova 2002, Elkik 1973, Guo–Reinecke v3, D'Addezio v4, Chiarellotto–Tsuzuki, Tsuzuki 2003 and Shiho.
  - Berthelot 96-03 §§1.2–2.5 (pp. 32–89) was read in full by the reviewer against every node and continuation that
    cites it. Two points needed the page images: the conormal hypothesis of (1.3.7) and the radius names in (1.3.5).
  - For the other sources, three Haiku helpers located each cited statement and returned page and label. The reviewer
    then read every statement a verdict depends on (Kedlaya pp. 2–7 and Finiteness pp. 23–24; Guo–Reinecke pp. 15–16;
    D'Addezio pp. 6 and 11; Étesse p. 592; Elkik p. 580; Chiarellotto–Tsuzuki pp. 84–85).
- **Baseline.** The nine Mathlib declarations were read at 082e2d3 (`Algebra.FormallyEtale` with `iff_comp_bijective`,
  `Algebra.Etale`, `AlgebraicGeometry.Etale`, `AlgebraicGeometry.IsProper`, `PadicInt`, `Padic`, `WittVector.Isocrystal`,
  `WittVector.StandardOneDimIsocrystal`, `WittVector.isocrystal_classification`). All exist and provide what the citing
  nodes use. Two "provides" texts claimed more than the files hold and were sharpened: `FormallyEtale` is defined through
  the cotangent complex, with the lifting form in `iff_comp_bijective`, and the scheme-level `Etale` file has no
  descent.
- **Closure and suppliers.** Every prerequisite resolves. Outside this packet there are 31 nodes of five other
  roadmaps and 2 RD.0 nodes. The other roadmaps are AdicSpacesPartII, CrystallineCohomology, SchemeAndStackFoundations,
  PerfectoidSpaces and InverseGaloisAndArithmeticFundamentalGroups, all of lower tier than this roadmap's tier 12 in
  `upstream/CaraianiNewton.md`. The reviewer read the supplier statement of each cross-roadmap prerequisite whose
  adequacy was not obvious. The union of all RD packets with the continuation edges (501 nodes) is acyclic, and no RD.3
  node depends on RD.4 or later.
- **Library and duplication.** The audit (AUDIT-37) records RD.3 as not built, with only Mathlib's point isocrystals
  present, and the packet cites those. Current Tau Ceti (a91d3aaf) and the TauCetiRoadmap checkout contain no tubes,
  overconvergent sheaves, isocrystal categories or weak completions. No other atlas packet defines convergent
  (F-)isocrystals, unit-root F-isocrystals or the Katz–Crew correspondence, so the ownership this part claims duplicates
  nothing.
- **Adversarial pass.** Every acceptance test and unit test with a computed value was recomputed. The table below lists
  those that changed something.

| Statement | Instance tried | Outcome |
|---|---|---|
| Dwork F-isocrystal is unit-root, "Frobenius exp π(t̂ − t̂^p) = 1 at Teichmüller points" | t̂ = 1 | False: Dwork's θ(1) = ζ_p ≠ 1. exp(πt) and exp(−πt^p) diverge on \|t\| = 1, so the substitution t̂^p = t̂ is illegitimate. The object is unit-root because it has rank one and θ(0) = 1. Test and acceptance rewritten. |
| Liouville contrast: "for λ = −1/2 the numbers n + λ are units for all n, \|f_n\| = p^{−n}" | p = 3, n = 2 | False: 2n − 1 = 3. Restated with v_p(2n − 1) ≤ log_p(2n), which still gives overconvergence. |
| Counterexample contrast: "an exponent with \|n + λ\| bounded below by a constant" | any λ ∈ ℤ_p ∖ ℤ | No such λ exists, since ℕ is dense in ℤ_p. Restated with v_p(n + λ) = O(log n); the counterexample has limsup v_p(n + λ)/n = 1. |
| Dwork connection overconvergent via the coordinate criterion | chart Spf O⟨s⟩ at ∞ | The test computed only on the chart at 0, where Z is empty, which tests convergence. Added the chart at ∞: Taylor series exp(πτ/(s(s+τ))), coefficient norms ≤ η^{−2k}, so η² > λ suffices. |
| F-crystal point test (W(k), p^m σ) ↦ slope m | m = −1 | Not an F-crystal. Restricted to m ≥ 0. |
| Liouville counterexample, Frobenius obstruction | needs K_{pλ} ≇ K_λ | Needs λ ∉ ℚ, which the lemma did not state. Added, from the non-periodic digit expansion (gaps m_{k+1} − m_k → ∞). |
| Liouville construction | p = 2: N_1 = 4, N_2 = 12, m_3 = 10 | Correct: \|f_4\| = 2^{−1}, \|f_12\| = 2^{−2}. |
| Counterexample overconvergence | ∂^{[k]}e_1 on both charts | Correct: norm ≤ kη^{−k}; h(1/s) is bounded on \|s\| ≥ 1/p. |
| Kummer isocrystal | iso criterion, sections, t ↦ t^N, Frobenius | Correct: e_b ↦ t^{b−a}e_a; Frobenius t^{(p−1)a} iff (p−1)a ∈ ℤ, as in Berthelot (2.3.8)(iii). |
| Kummer descent along s ↦ s^{p−1} | eigenline s^j | Correct: ∇(s^j) = (j/(p−1)) s^j dt/t and Frobenius t^j. |
| Katz–Crew point test (ℚ_p, Φ = u) | Φ-fixed v ∈ K̂^ur | Correct: σ(v) = u^{−1}v, so arithmetic Frobenius ↦ u^{−1}. For Φ = p there is no fixed vector. |
| Unit-root tests at a point | slope 0 and slope 1 standard isocrystals | Correct, also over a perfect domain, by p-adic valuation on W(k). |

## Corrections made

**Packet** (`research/blueprint/packets/PadicDifferentialEquationsAndRigidCohomology--RD.3.json`):

1. **`unit-root-f-isocrystal`.** Acceptance 1 and the test `FIsoc.dwork_isUnitRoot` claimed that the Dwork Frobenius is 1
   at Teichmüller points. They now use θ(1) = ζ_p, with unit-rootness argued from rank one and θ(0) = 1 (Kedlaya,
   *Notes*, Remark 3.5).
2. **`liouville-exponent-sequence`.** The false λ = −1/2 contrast was corrected. The statement and proof now say that
   λ ∉ ℚ.
3. **`liouville-extension-counterexample`.** The impossible "bounded below" contrast was corrected. The Frobenius step
   now cites the irrationality of λ.
4. **`taylor-series-convergence-criterion`.** The Dwork acceptance test now checks overconvergence on the chart at ∞.
5. **`f-crystal-to-convergent-f-isocrystal`.** The point test and acceptance are restricted to m ≥ 0.
6. **`weak-completion-henselian-descent`.** Closure: lifting smooth algebras over the henselian pair (A†, π) is Elkik,
   Théorème 6, p. 580. No cited supplier states it, and the node did not cite it. It is now a source and the basis of
   proof step (2); Elkik's reading list gains §4.
7. **`convergent-f-isocrystals-are-crystalline`.** New hypothesis: Kedlaya states Theorem 2.2 for a = 1, D'Addezio uses
   F^n-structures, and Berthelot's proof covers F^a.
8. **`underlying-bundle-of-convergent-isocrystal`.** New hypothesis relating Ogus's convergent site of 𝔛_{p=0}, which
   Guo–Reinecke use, to convergent isocrystals on 𝔛_s (Berthelot (2.3.4); tubes depend only on the reduced
   subscheme).
9. **`isocrystals-glued-from-local-frames`.** The test `IsocDagger.gluing_single` claimed equality "on the nose". It now
   says that the forgetful functor is an isomorphism of categories, because φ is forced to equal the Taylor isomorphism.
10. **Continuation of `RD.3/strong-fibration-theorem`.**
    - Berthelot (1.3.7) needs the conormal basis over X, not over X̄.
    - (1.3.8)(ii) gives the strict neighbourhood upstairs as a union of products ⋃_n([Y]_{λ_n} ∩ U_{η_n}) × D(0,
      λ_n^+)^d, whose fibre over a point outside the tube is a closed polydisc of radius < 1. The continuation now says
      that the main node's "V′ ≅ V × D(0,1^−)^n over V" is to be read in this sense.
11. **Locators.**
    - Kedlaya, *Notes*: Remark 3.10 is on p. 7 and Remark 2.3 on p. 3 (`crew-unit-root-correspondence`).
    - Kedlaya, *Finiteness*: the differential isomorphism is in the proof of Proposition 3.4.5, which itself is about
      cohomology (`finite-etale-lifting-of-mw-algebras`).
    - Guo–Reinecke: Construction 2.11 is on p. 15 (`convergent-isocrystal`).
    - Étesse: Théorème 7 is on pp. 599–600 (sources).
    - Berthelot 96-03 edition: its page numbers are the global numbers at the foot of each page, equal to the PDF pages;
      the running heads are per chapter (p. 39 = 1.15).
12. **Baseline.** The `provides` texts of `Algebra.FormallyEtale` and `AlgebraicGeometry.Etale` now say what the pinned
    files contain.
13. **`sourceIssues`.** E301 (independence of gluing choices left to the reader, (2.3.2)(iii)), E302 (cross-reference
    to (2.2.17) in the proof of (2.3.5) should be the remark after (2.2.11)) and E303 (Mém. SMF 23 Théorème 5 announced
    without proof, proved as Tsuzuki 2003 Theorem 4.1.1) were each checked at the locator and **confirmed**. No further
    source mistake was found.

**Reader** (`research/blueprint/readmes/PadicDifferentialEquationsAndRigidCohomology--RD.3.md`): every changed packet
string was replaced in the reader. Because the reader reproduces the packet text, a script swapped each old string for
its new form and reported any that were absent. Two hypothesis bullets, the Elkik reading list and a verification line
under each of the three source corrections were then added by hand. The reader says nothing the corrected packet
contradicts.

**Suggested Lean file** (`research/blueprint/suggested/PadicDifferentialEquationsAndRigidCohomology--RD.3.lean`): the
docstring of the λ = −1/2 contrast example repeated the false "unit for every n" claim; it now gives the logarithmic
bound. The statement itself is true and unchanged. The file states only what the pins can carry (growth conditions,
the one-variable convergence condition and the unit-root condition on Mathlib's isocrystals). Its definitions have
real bodies, it has no placeholder propositions, and its closing comment lists the targets left to the reader.

## What was checked and found right

- The frame theory: the étale tube and strict-neighbourhood isomorphisms, the j† calculus, coherent j†-modules and their
  gluing, overconvergence as a property, the coordinate criterion, the gluing construction and the Zariski stack.
  Statements, hypotheses and proof outlines match Berthelot (1.2)–(2.3), including the independence-of-covering argument
  the packet supplies for (2.3.2)(iii).
- The Monsky–Washnitzer description and Dwork–Berthelot overconvergence ((2.5.1)–(2.5.8)), including the q-power form
  of Dwork's trick.
- The convergent model ((2.4.1)–(2.4.2), Guo–Reinecke 2.11–2.17, Kedlaya 2.1–2.2) and the unit-root and Katz–Crew nodes
  (Kedlaya 3.3, 3.7; D'Addezio 3.3.3–3.3.4).
- Étesse's direct-summand and étale-descent theorems (Théorèmes 1–3, 6; Propositions 6, 9′, 10, 10′), with the Ogus
  inputs recorded as a gap.
- The replacement of Raynaud–Gruson I 5.7.14 in the continuation of `RD.3/independence-of-compactification`: applying
  SF.4/modification-domination twice and using two-out-of-six is a correct argument.
- Granularity is at target level, as `detail.json` sets it. Every definition and construction has an API outline and
  at least three discriminating tests. The single planet ("Convergent F-isocrystal") brings RD.3 to six with the main
  packet's five.
- The coverage record (`planned`, with a precise `remaining` list), the three gaps and the two restructure proposals are
  honest.

## Questions for the orchestrator

1. **Main packet, `RD.3/strong-fibration-theorem`.** Its statement "V′ ≅ V × D(0,1^−)^n over V" is stronger than what
   Berthelot proves, which is (1.3.8.1). The continuation now records the precise form. At assembly the main node's
   statement should be replaced by it.
2. **AdicSpacesPartII, `F1/mw-lift-existence-uniqueness`.** This node records Elkik's Théorème 6 as unread (a gap).
   Elkik 1973 is free on Numdam (URL and SHA-256 in this packet's sources), and Théorème 6 is on p. 580. That gap can be
   closed by a fix job.
3. **Suppliers under revision.** Three suppliers are cited from packets whose own reviews returned `needs_changes`:
   - `SchemeAndStackFoundations:SF.0/henselian-*` and `SF.4/modification-domination` (SchemeAndStackFoundations is
     merged into Tau Ceti);
   - `PerfectoidSpaces:P3/elkik-noetherian-henselian-approximation`.

   Their statements as written supply what RD.3 uses. At package time they should be mapped to the Tau Ceti roadmap
   items or to the accepted revisions.
4. **Assembly.** The handoff's notes still apply:
   - the 19 continuations;
   - the dual normalisations of the Dwork isocrystal (here ∇(1) = −π dt with Frobenius θ = exp π(t − t^p); the main
     document's tests use the dual);
   - the RD.1 upward citations of `RD.3/restriction-to-convergent`;
   - the RD.5/RD.7 hand-offs.

   Any assembled test about Dwork Frobenius values must use θ(1) = ζ_p.
