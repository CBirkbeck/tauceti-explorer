# EXT-15 handoff — Iwasawa theory and special values

Worker: external tmux session, 15 September 2026.
Assignment: `EulerSystemsCyclotomicMainConjecture`, `GeneralizedHeegnerCycles`,
`GrossZagierAndArithmeticHeights`, `HeegnerPointEulerSystems`, `IntegralIwasawaTheory`,
`KatoEulerSystems`, `ModularIwasawaMainConjectures` (68 atlas stages).

Status: **in progress.** Updated after every packet.

## Files written so far

| packet | nodes | links | gaps | coverage |
|---|---|---|---|---|
| `KatoEulerSystems.json` | 22 | 15 (1 cross-roadmap) | 6 | 5 stages, all `partial` |
| `EulerSystemsCyclotomicMainConjecture.json` | 16 | 16 (2 cross-roadmap) | 6 | 5 stages, all `partial` |

All packets are `status: partial`; every node is `implementationStatus: unchecked`.

## Sources actually read

- **Kato, *p-adic Hodge theory and values of zeta functions of modular forms*,
  Astérisque 295 (2004), pp. 117–290** (Numdam `AST_2004__295__117_0`,
  sha256 `3c6e14b1…c605d`). Read: Introduction; §1 (pp. 121–124) in full incl. the
  proof of Prop. 1.3; §2 (pp. 125–133) incl. proofs 2.11–2.13; §8 (pp. 180–185)
  incl. the proof of Lemma 8.5; §9 (pp. 186–189); §10 opening (p. 189); §12
  (pp. 219–224); §13 (pp. 224–227); §17.1–17.5 (pp. 272–274).
- **Rubin, *Euler systems* (author course draft, 1999 AWS)**
  (sha256 `de47655d…73d50`). Read: contents; Ch. II §2 (pp. 24–26) and §3
  (pp. 26–29); Ch. III §1 closing (p. 33), §2 (pp. 33–39) in full, §3 (pp. 39–40).
- **Greither, *Class groups of abelian fields, and the main conjecture*,
  Ann. Inst. Fourier 42 (1992) 449–499** (Numdam, sha256 `8e4db974…623da`).
  Read: §1 (pp. 451–454); §2 statements (pp. 458–466); §3 (pp. 468–470) incl.
  the full proof of the implication 3.1 ⇒ 3.2.
- **Rodrigues Jacinto–Williams, *An introduction to p-adic L-functions*,
  arXiv:2309.15692v2** (sha256 `efa1e101…39c4`). Read: §13.2–13.4 (pp. 66–68).

## Corrections and confirmations to existing atlas statements

1. **`EulerSystemsCyclotomicMainConjecture:L0` — the "torsion" warning is CORRECT.**
   The stage text warns that the displayed `c_m = (ξ_m⁻¹−1)/(ξ_m−1) = −ξ_m⁻¹` is
   torsion. Checked against the sources: Rubin's system is
   `c̃_{m∞} = N_{Q(μ_{mp})/Q(μ_m)}(ζ_{mp}−1)`, `c̃_m = N_{Q(μ_m)/Q(μ_m)⁺}(c̃_{m∞})`
   (Ch. III 2.1, p. 34), and Kato's Example 13.2 (p. 225) uses
   `(1−ζ_m)(1−ζ_m⁻¹)`. No text change needed; the warning has now been *checked*
   rather than assumed.
2. **`EulerSystemsCyclotomicMainConjecture:L2` — naming dictionary, not an error.**
   The stage cites "Rubin III.2.7: char(Y_∞^χ) divides char(E_∞^χ/C_∞,χ)". In the
   draft actually read, Thm. III.2.7 is stated with `A_∞ = lim A_n` (inverse limit
   of ideal class groups). `A_∞` and the atlas's `Y_∞` agree under class field
   theory. Recorded in the packet so a later reader does not "fix" one of them.
3. **`EulerSystemsCyclotomicMainConjecture:L2` — the source proof produces a `J²`
   intermediate.** Rubin's proof first gets `char(A_∞^χ) | J² char(E_∞^χ/C_∞,χ)`
   and then removes `J` using Leopoldt for the real abelian field `L`; he gives
   that last step **as a sketch only**. The stage text's requirement to "carry the
   augmentation corrections through and prove their removal" is therefore not
   discharged by the source as read.
4. **`KatoEulerSystems:L4` — Kato Thm. 13.4 is an import, not his own theorem**,
   and its hypothesis package `(i)–(v)` is **not literally** Rubin's
   `Hyp(K_∞,T) + Hyp(K_∞/K)`: Kato's irreducibility (iv) is over `Gal(Q̄/Q)`,
   Rubin's is over `Gal(Q̄/Q(μ_{p^∞}))`, and Kato's bounded object `H²(T)₀` versus
   Rubin's `X_∞` requires a Poitou–Tate identification that neither source performs
   in the sections read. Recorded as a gap on the proposed `ES.8 →` edge.

## Shared-supplier requests

- **`ColemanPowerSeries:L4` owner.** Requested: a source-read statement of the
  local-unit index `char(U_∞^χ/C_{∞,χ}) = L_χ Λ` (Rubin Thm. III.2.9(ii)) or its
  plus-part form `U_{∞,1}⁺/C_{∞,1}⁺ ≅ Z_p[[G⁺]]/(I(G⁺)ζ_p)` (RJW Thm. 12.23).
  Rubin *cites* this rather than proving it (his App. D §2 has the computation);
  Greither §2 (Thms. 2.4/2.6/2.8/2.13, Cor. 2.14) gives an independent route valid
  for abelian `F` unramified at `p`, **including `p = 2`**. An edge
  `ColemanPowerSeries:L4 → EulerSystemsCyclotomicMainConjecture:L3/local-unit-index-…`
  is proposed in the packet with the exact output and consumer use recorded.
- **`EulerSystemsAndKolyvaginSystems:ES.8` owner.** An edge
  `ES.8 → KatoEulerSystems:L4/imported-euler-system-bound-…` is proposed. Please
  check that ES.8's stated interface actually yields Kato's `(i)–(v)`; see
  correction 4 above. The single reading that would discharge this for **both**
  EXT-15 packets is Rubin Ch. VII §1 and §4 plus Ch. I §7 (global duality) — all
  present in the supplied draft.
- **`IntegralIwasawaTheory:L1` owner** (same worker, EXT-15): an edge to
  `…L3/main-conjecture-endpoint-…` is proposed, refining the existing stage-level
  prerequisite by naming the consuming node.

## Acquisition requests (sources absent from the supplied library)

Checked `CATALOGUE.json`: these have catalogue records but **no resolved file**.

- Washington, *Introduction to Cyclotomic Fields*, 2nd ed. (1997) — needed for
  `f(T,ψ)` (pp. 122–125) and Thm. 13.56; blocks the Greither/Rubin
  factor-of-two normalisation dictionary.
- Rubin's appendix to Lang, *Cyclotomic Fields I and II* (`[Ru3]` Thm. 4.2,
  p. 414) — the analytic class-number upgrade from divisibility to equality at
  both finite and infinite level.
- Kato, *Generalized explicit reciprocity laws* (`[KK3]`) — the load-bearing
  external theorem behind Kato Thm. 9.5. A `CATALOGUE.json` search for
  "Generalized explicit reciprocity" returned nothing.
- Mazur–Wiles, *Class fields of abelian extensions of Q* — the PDF **is** present
  (`ADD_MazurWiles_AbelianExtensions.pdf`, sha256 `4cb3aa50…63d9`) but it is a
  **scan with no text layer** (`pdftotext` yields only the GDZ front matter). OCR
  or a different copy is needed before `[MW] §1.6` can be read.

## Unresolved cross-job dependencies

- `EulerSystemsAndKolyvaginSystems` (ES.0–ES.8) is another job's roadmap; the two
  edges proposed into/out of it are recorded with reasons and source locators but
  the supplier's own decomposition has not been read.
- `ColemanPowerSeries:L4`, `ModularCurvesPartII:R14.1/R14.5`,
  `K2SymbolsBrauer:T.3:localization-comparison`, `PadicHodgeRegulators:L3`,
  `ModularSymbolsPadicLFunctions:L3`, `SelmerIwasawaCohomology:L1/L2/L3` are
  cited by the Kato stage texts. Their atlas *descriptions* were read to check
  scope, but **no** edge to them is proposed from this packet, because the
  corresponding source statements were not read here.

## Next actions

1. `GrossZagierAndArithmeticHeights` (10 stages) — Gross–Zagier Invent. Math. 84,
   YZZ Shimura-curve book, Conrad's *Gross–Zagier revisited*, Zhang's *Heights of
   Heegner points*; all present as text extractions.
2. `HeegnerPointEulerSystems` (12) — Gross's Kolyvagin paper, Howard, Cornut,
   Vatsal, Cornut–Vatsal.
3. `GeneralizedHeegnerCycles` (9) — Bertolini–Darmon–Prasanna, Castella–Hsieh,
   Longo–Vigni, Castella.
4. `ModularIwasawaMainConjectures` (7) — Skinner–Urban, Wan, CLW, Kobayashi–Ota.
5. `IntegralIwasawaTheory` (20) — RJW §§11–13 and App. A, Greither, Dasgupta–Kakde,
   DKSW, Kurihara.
