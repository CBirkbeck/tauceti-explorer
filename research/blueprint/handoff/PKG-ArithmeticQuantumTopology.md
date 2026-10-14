# PKG-ArithmeticQuantumTopology — handoff

Worker: Claude (Opus), session `claude-gWFnvH`, issue #7889, 2026-10-13/14.
Branch: `claude-gWFnvH-pkg-arithmetic-quantum-topology`.

## Result

The package is complete in the 2026-10-12 shape (PACKAGE_REVIEW.md, "Shape of a roadmap"):

- `README.md` (229 KB, 3,793 lines): rebuilt from the accepted packet, one prose subsection per
  target with its statement, hypotheses, proof sketch with source locators, *Needs:* line, API list
  and **Checks.** list; opening `**Summary.**`, Scope and ownership, Conventions, Exact supplier
  contracts, How to read the build, Layers 0–7 (= packet stages QT.0–QT.7) each ending with
  Examples and Dependencies, Downstream consumers, Corrections to the sources, References.
- `Suggested.lean` (593 lines): rewritten from scratch. It holds only light real-bodied definitions
  over pinned carriers, layer milestones proved by `sorry`, and proved `example`s. The previous file
  (5,704 lines) developed theory in Lean and contained sorry'd data (`qPower := ⟨_, sorry⟩`,
  `tildeColorBasis := sorry`, a `Field` instance resting on a sorry'd irreducibility); none of it
  was kept except the ribbon-category structure and the framed-braid negative control.
- `metadata.toml`: `topic = "math.GT"`.

`lean-check research/blueprint/packages/ArithmeticQuantumTopology/Suggested.lean`: exit 0; the
only warnings are 19 "declaration uses `sorry`" (all theorems; no sorry'd data). Every README
pointer in the Lean docstrings (`README k.n`) and every `*Lean:*` line of the README was checked
against the other file by script. `python3 research/blueprint/intake.py check-files` on the three
files: 0 problems.

PR #8460 (an earlier Codex checkpoint, still open and unmerged) edits the same two files in the
old form; this package supersedes it.

## Notions planned here because no roadmap supplies them

The accepted plan requested several inputs from suppliers that do not exist or do not plan them
("GeometricTopology, Part II", "QSeries … Part II", "PDE, Part II", AutomorphicSpectralTheory AS.0
for operator theory). The previous checkpoint treated this as a blocker. Following WORKERS.md
("plans that notion itself") they are now targets of this package, each with a free source:

| README | Target | Was requested from |
| --- | --- | --- |
| 0.1 | linking numbers and the linking matrix | GeometricTopology Layer 4 / Part II |
| 0.2 | H₁(surgery) = coker A, integral homology sphere iff det A = ±1 (uses AlgebraicTopology Stage 3) | GeometricTopology Layer 5 / Part II |
| 0.4 | Kirby, Fenn–Rourke moves; Lickorish–Wallace and Kirby's theorems | GeometricTopology Part II |
| 0.8 | stable diagonalisation now cites TauCetiRoadmap IntegralLattices 6A | GeometricTopology Part II |
| 1.6 | framed tangles in the cube (bottom tangles) | GeometricTopology Layer 4 |
| 1.7 | coloured ribbon graphs as the domain of the RT functor | GeometricTopology Layer 4 |
| 1.9 | universal invariant of a topological ribbon Hopf algebra ([HL] §2.7) | packet gap G2 |
| 4.12 | highest-weight colours of U_h(g), quantum Weyl dimension ([HL] §§8.2–8.3.1) | packet gap G2 |
| 5.2 | cusped hyperbolic structures, ideal triangulations, Thurston gluing, Mostow–Prasad, Epstein–Penner, ordered hybrid refinements | GeometricTopology Layer 7 / Part II |
| 6.11 | Schrödinger pair on L²(ℝ), Schwartz core, p + q = e^(−iπx²) p e^(iπx²) | AutomorphicSpectralTheory AS.0 (now cites SelfAdjointSpectralTheory Parts C–E) |
| 6.15 | finite ordered pseudo-3-manifolds (combinatorial) | GeometricTopology Layer 1 |
| 6.16 | Schwartz kernel theorem, wavefront sets, product and contraction of tempered distributions ([AK] App. B) | AS.0 / PDE Part II |
| 7.13 | the matrix-valued cocycle notion | QSeriesPartitionsAndMockModularForms QM.5 / Part II |

If GeometricTopology or QSeriesPartitionsAndMockModularForms later plans any of these, the
corresponding target here should be replaced by a citation. Polylogarithms P.2 already plans the
ideal-tetrahedron volume (Milnor's formula), so no request there remains.

## Reorganisation relative to the packet

- The planning-boundary node `QT.7/proved-cases-conjectures-and-the-executable-boundary` is not a
  mathematical target; its status labels are in Conventions, its Lean description in How to read
  the build.
- For dependency order, five boundary remarks moved layer: `root-of-unity-categories…` (QT.1 →
  4.14), `rational-homology-spheres…` (QT.3 → 4.9), `the-asymptotic-series…` (QT.6 → 7.2),
  `formal-and-analytic…` (QT.6 → 7.3), `what-is-exported…` (QT.6 → 7.17). The Kashaev function
  (id under QT.6, parent QT.2) is 2.15. No `*Needs:*` line points forward (checked by script).
- `the-example-ledger` is rendered as the worked example 7.18 with its table.

## Corrections made while packaging

- The old README's ledger gave the 5₂ Kashaev value at order 2 as 13; it is ±7 = det(5₂) (the
  reduced Jones polynomial at t = −1). Removed and replaced by the determinant check.
- Merged the reviewed refinements of the old README that check out: the integral coefficients of
  ω± in the P̃′ basis (q^(n(n+1)/2) and (−1)ⁿq⁻ⁿ, recomputed), the Drinfeld–Jimbo relations with
  a_ij the transpose of Mathlib's `Base.cartanMatrix` (checked: `cartanMatrix i j = ⟨α_i, α_j∨⟩`),
  the uniform all-orders form of the quantum modularity conjecture, and the tweaked automorphy
  factor.
- The 22 source errata of the packet are listed in own words under "Corrections to the sources".
- The HL §6.2.2 empty-tensor display noted by the previous worker is resolved as there: G^⊗0 is
  the two-element central group (§6.2.1).

## Sources checked

Read in the arXiv texts (statement and page): [Hab08] §3.1 pp. 11–12 (Hopf structure, R, r, κ),
Theorem 4.1, Proposition 6.3, Theorem 6.4, Theorem 8.2, Lemma 8.5, §9.1 Propositions 9.1–9.2,
Theorem 9.4, (10.1), Lemma 10.3, Theorem 11.1, Theorem 12.6, Lemma 12.7, §16.3; [HabK] Theorem 1.1
(p. 1287), Theorem 2.1 (p. 1290), Corollary 5.1 (p. 1309), §1 (p. 1286); [HL] §2.7 pp. 19–20,
Theorem 2.29 pp. 34–35, §1.3 p. 7, Proposition 1.6, §8.2 pp. 90–91, (177) p. 91; [Neu]
Definition 2.2, Lemma 2.3, Proposition 2.5, Theorem 2.6, Definition 3.1, Lemma 3.4, Definition 4.4,
Theorem 4.5, Theorem 12.1, Theorem 14.2 (PDF pages as given); [AK] Definitions 1, 11, 15, Theorem 4,
Theorem 5, Proposition 2, (47), (50); [GZ] (1.1), (1.5), Lemma 3.1, (3.6), (3.9), (3.13), (3.14),
(3.16), (3.18), (5.1), Conjecture 5.1 — the packet's [GZ] pages are the printed SIGMA pages of
arXiv v3, and all matched; [GSW] Theorem 1.1, (14)–(15).

Not re-read (locators carried from the accepted packet): [Saw], [MM], [DG], [DG2], [GSWZ], [BD],
[RT], [HabC], and [AK] Appendix B, [GSW] §2.3. The classical references added for the new targets
([Kir78], [FR79], [Thu] Chapter 4, [Pra73], [EP88], [Hör] Chapters 5 and 8) are cited at paper or
chapter level only; the statements themselves are located in [HabK] §5, [Hab08] §10.1, [GSW] §§2.2–2.3,
[Neu] §14 and [AK] Appendices A–B.

## Adversarial checks (instances computed)

| Statement | Instance | Result |
| --- | --- | --- |
| handle-slide matrix PᵀAP, P = I + E_ji | Hopf [[0,1],[1,0]] | [[2,1],[1,0]] (also proved in Lean); I₂ ↦ [[2,1],[1,1]] |
| coker invariance under slides | singular A | holds for all square A (P invertible over ℤ) |
| Fenn–Rourke framing change | (+1)-unknot, lk = ℓ | f ↦ f − ℓ² |
| qdim V_n = [n+1], V₂ = X² − 1 | n = 0, 1, 2 | Chebyshev S, proved examples |
| σ_i kills V_n for i > n | C² on V_n = q^(n+1) + 2 + q^(−n−1) | factor i′ = n vanishes |
| J_K(V_n) coefficient of a_i | n = i = 1 | {3}{2}, matches [2] + {3}{2}a₁ (Lean example) |
| ⟨4₁⟩_N | N = 1…6 | 1, 5, 13, 27, 46+2√5, 89 (hand computation; N = 2 in Lean) |
| first divisor of J_M − 1 | expansion at q = 1 | 6(q − 1) (Lean example) |
| Kirby colour Ω_r | r = 2, 3 | V₀, V₀ + [2]V₁ (Lean examples) |
| shapes | z = e^(πi/3) | z′ = z″ = z, product −1 (product proved in Lean) |
| NZ Hessian | A = 0, B = 1, z = 1/2, ν = 1 | 2; gluing (1 − 2) = −1 (Lean) |
| λ_γ cocycle | (S, T, 0), (S, S, 1) | 1 = 1 + 0, 0 = −1 + 1; general identity c + c′d″ = c″d′ |
| figure-eight descendants | q = −1; cube root | 1 + 4(−1)^m (Lean m = 0, 1); 13 |
| Q₂ Taylor | t = q − 1 | t − t²/2 + O(t³): not integral |
| quantum dimension (HL (177)) | sl₃, ω₁ | [3] = v² + 1 + v⁻² |
| tilting quotient at r = 3 | V₂ | simple Steinberg, qdim [3] = 0, negligible |
| Faddeev strip | b > 0 | line height (π/2)min(b,1/b) below poles iπb, iπ/b; Φ_b = Φ_(1/b) |

The matrix-cocycle theorem's hypotheses were narrowed to the point used (invertibility of J at γ′x
and the cocycle law of j̃ at (γ, γ′, x)); global hypotheses would be unsatisfiable for the real
automorphy factor because Lean's division gives junk values at poles.

## For the next worker (review)

Read the moved-down targets 0.1, 0.2, 0.4, 1.6, 1.7, 1.9, 4.12, 5.2, 6.11, 6.15, 6.16 and 7.13
first: they are new relative to the accepted plan. The rest of the README is the accepted packet
in prose, with the edits above.
