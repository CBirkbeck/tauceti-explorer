# Handoff: PAPER-KISIN-PAPPAS-18

Issue #1460. Agent Codex, session `codex-c83e7a`. Partial checkpoint, complete read of the main paper.

## Completed

Read all98 published PDF pages (printed121–218), including proofs and all75 references. Visually checked printed122 and162: finite type versus finite, and half-rank Hodge Grassmannian. Read Hu2013 PDF29/printed1946, Theorem4.5, and Pappas–Zhu arXiv1110.5588v4 PDF71–76. The latter uses §9 numbering rather than the published §10 cited by KP18. The immediately preceding job read all89 published KPZ26 pages; its relative-frame/display and §7.3 corrections are applied here. URLs, hashes and exact read scopes are in the JSON.

Extracted171 items:14 library carriers,13 planned imports,144 missing. All48 definitions/constructions have three API statements and three specified tests. Ten routes assign each missing item exactly once. Reuse the existing integral representation, arithmetic torsor, local-model, display and integral Shimura candidates. The arithmetic-torsor candidate gains a separate parahoric punctured-disc branch, not a false specialization of reductive Grothendieck–Serre. The new `SmoothRepresentationsPartIIParahoricCenters` supplies the exact Bernstein center maps and same-type Hecke algebra comparison, beyond SR.4 and distinct from the unitary-spherical candidate.

Pinned libraries: Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; TauCeti f790474821cf4256814db967cb154e7af3d0c369. The22 baseline declaration statements were read at these pins earlier in this session and their source digests are verified. The302-record current input manifest includes the atlas, audit and relevant extraction/roadmap records. A candidate route is not an installed stage or implemented theorem.

Seven exact arithmetic diagnostics pass: half-rank Grassmannian; SL2 lattice root valuations; mod-p tilde kernel; semisimple trace versus invariants; Haar idempotent; IC shift/half twist; conjugated component level. No Lean file was authorized or compiled. API tests remain specifications.

## Resume in this order

1. `Q-purity`: close the original Gabber/Kato, Serre-II, flasque cyclic-lattice, induced-torus/Brauer and boundary-factorization inputs. Lemma1.4.6’s dimension-two argument is used over algebraically closed k. Finite k has prime-to-p cd3; preserve Proposition1.4.3 Step4 descent. This diagnostic does not disprove the finite-k lemma conclusion.
2. `Q-display` and `Q-comparison`: use the corrected free relative τ, residual-to-universal canonical map and very-good first-order tensor condition. The image comparison diag(1,p) is not injective on p-torsion. Use the p-adic-lattice topology after inverting p, linear dual of Tp, and punctured-disc exactness of the crystalline functor. Read Lau/Kisin/Breuil/Broshi/Wintenberger and Raynaud–Gruson4.1.2. Close the interpolation image/intersection continuity step rather than assuming it.
3. `Q-nearby` and `Q-hecke`: reconcile original published PZ §10 with v4 §9 and its erratum. Read Haines2009 Theorem3.1.1/change-of-parahoric, Lusztig normalization and PZ central-sheaf/Wakimoto suppliers. Keep geometric Frobenius, μ_h versus inverse, Haar volume and both shift sign and half-Tate twist. An equality of coset sets is insufficient for a Hecke algebra isomorphism.
4. `Q-local`, `Q-representation`, `Q-models`: read Landvogt/BT/Jantzen/Tits/Satake, split all primary symplectic cases and Proposition2.3.7’s three steps. Distinguish finite-prime-to-p central quotients, connected parahorics and full fixers. Seshadri[68] supplies polynomial bundle freeness; Raynaud–Gruson[65] is the different tensor-torsor flatness input.
5. `Q-siegel`, `Q-shimura`, `Q-twisting`, `Q-components`, `Q-cover`: build the actual parahoric Siegel moduli; close absolute-Hodge/analytic comparisons, A-linear isogeny twisting, arithmetic star products, potentially infinite free kernel quotient and corrected jKp°j^-1 indexing. Keep the five separate cover outputs and abelian-type hypothesis.
6. `Q-independence`: read compactification, automorphic line and common-Proj arguments for Proposition4.6.28 only. General choice independence and G°-torsor reduction are conjectures in this paper, later theorems in the sequel. The extension property is at the full prime-to-p tower.
7. Split remaining multi-page constructions and bibliographic supplier groups into declaration-sized statements and explicit dependencies before setting complete. Preserve existing item ids and read every route brief before changing ownership.

## Checks

Final paper/intake, route/graph, current-input and source-digest checks are recorded in the JSON and PR. Only the result JSON, report and this handoff are submitted. This is not a closed recursive blueprint and does not claim formalization.
