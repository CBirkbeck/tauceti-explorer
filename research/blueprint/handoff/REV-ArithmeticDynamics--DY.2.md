# Handoff: REV-ArithmeticDynamics--DY.2

Complete independent review for #9274 by Codex, session `codex-SL7Vxv`, 14 October 2026. Accepted a correct complete planning pass with **planned**, not closed, DY.2 coverage. No implementation is claimed. The original author was session `codex-rwzYQG`.

The packet, reader and suggested-file inventory are synchronized. There are 31 targets (three added), 16 independently confirmed baseline declarations, 20 API items, 12 tests, six planets, eight supplier requests and six explicit gaps. The review report and every `review.checked` entry record the source checks and corrections. The parent and suppliers were read but not edited. The added targets are:

- `berkovich-julia-iterate`: measure equality from parent escape-rate iteration, then Julia-support comparison; use it downstream of support equality.
- `complex-repelling-periodic-density`: Lyubich p.355 states the theorem; its full reverse-inclusion proof is the new explicit gap.
- `complex-bowen-net-bound`: the full-sphere O(m⁵d^m) net estimate consumed by entropy and uniqueness; its fixed omitted-net branch control uses requested spherical Montel.

No work remains for this review submission. To close the roadmap in a subsequent authorized planning job, resume at the packet’s six `gaps` and eight `requests`, in this dependency order:

1. Complete the native sphere and finite-degree supplier interfaces. Current ConformalMapping L0 owns Hurwitz. The Belyi §8.1 sphere/meromorphic bridge belongs to successor BelyiAnalyticCovers; route it there once its id is published. Complete TB.0/TB.1 analytic carriers, arbitrary rational disc expansions, full-degree annuli and measure pullbacks; do not use the parent good-reduction-only expansion for arbitrary maps.
2. Supply spherical meromorphic Montel through ConformalMappingPartII V0 and read a full proof of repelling-periodic density. Outline that density proof under the new DY.2 node without using downstream blowing up as its premise. Lyubich §3, pp.355–358 identifies the input and its consumers.
3. Supply the complex Banach relatively-compact-orbit contraction splitting (OperatorTheory, Part II). Complete the sphere difference-of-subharmonic Riesz/Laplacian contract (PDE, Part II), including the exact normalized signs. Then the corrected transfer-limit/support comparison supplies the parent archimedean measure support endpoint.
4. Supply generic partition entropy, fibre conditional entropy, measure/topological comparison, Shannon–McMillan–Breiman positive-set bound and ergodic entropy decomposition (ProbabilisticAndMetricNumberTheory, Part II). Import existing PM.4 Birkhoff. Use the explicit Bowen-net estimate for the entropy upper bound and maximizing-measure uniqueness; retain the separation from balanced-measure uniqueness.
5. Prove the nilpotent quadratic-preparation algebra contract in the Zieve gap; a complete-valued-field Weierstrass theorem is insufficient. Read author thesis Lemma 41, printed pp.29–30. The p=2 jet inequalities and rational-cycle unit-denominator adapter are already explicit.
6. Apply the reader’s parent refinement map only after those contracts are reviewed: update the parent’s archimedean endpoints and Zieve dependency routes by importing these targets. Do not duplicate the parent’s canonical measures or period theorem. Only then reassess closed coverage.

E801/E802 are independently confirmed against Benedetto’s 9 March 2010 AWS notes. E803 records the mismatched Zieve proof headings on printed pp.37–38; it affects no mathematics. All source URLs, exact versions, hashes and locator details are in the packet and reader. Zieve’s PDF printed page n is PDF page n+5; its encoded text is unreliable, so read rendered pages. No scratch source file is needed by the next worker.

Validation: packet checker has 0 errors and 0 warnings; the suggested file elaborated with `lean-check` at the Mathlib pin, exit 0, with only 29 proof-placeholder warnings. Its seven data definitions have real bodies. Two unavailable-carrier APIs and two tests are reader targets named in comments; all remaining endpoints are named in the omission inventory. The current upstream and library audit commits are in the review report. No tier move, supplier modification or second job was taken.
