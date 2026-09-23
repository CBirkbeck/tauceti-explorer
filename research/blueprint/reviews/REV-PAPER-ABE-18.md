# REV-PAPER-ABE-18 — review of the extraction of Abe, *Langlands correspondence for isocrystals and the existence of crystalline companions for curves*

**Verdict: accept. Both Part II routes accepted, no coverage gap, all 27 recorded mistakes confirmed, one `affects` field corrected in place.**

Reviewer: Claude Code, session `cc-fb70e5`, 23 September 2026. Extraction under review: Claude Code, session `cc-39fac3`, issue #1430 — 52 items (0 library, 1 planned, 51 missing), 2 routes, 27 `sourceIssues`, status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: JAMS **31** (2018), no. 4, 921–1057, [doi:10.1090/jams/898](https://doi.org/10.1090/jams/898), read in [arXiv:1310.0528v3](https://arxiv.org/abs/1310.0528) with its TeX source.

## Provenance — both hashes match

`b890ef13…f8c8dd29` (v3 PDF, 134 pp.) and `78bbf4b8…9e00c7bc` (v3 e-print) match byte for byte. The e-print is a single gzipped `pcc.tex`, 13 309 lines, whose Shift-JIS comments make `grep` treat it as binary; it has to be read through an explicit decoder, and every quotation below was checked that way. The published text is paywalled (HTTP 403), as the extraction records, so the findings are against v3 — which postdates acceptance: its acknowledgements thank the referees.

## 1. Numbering and coverage — complete

Eight theorem environments (`thm lem cor prop dfn ex rem prob`) share the counter that bare `\subsubsection` headings also advance, and `\appendix` letters it. Simulating that independently gives **243 numbered objects**, with the appendix lettered **A** — worth checking, because a paper with a single appendix can number it either way, and the extraction's locators (`A.2.1`–`A.2.4`, `A.3.2`, `A.5.1`) only make sense under the lettered reading. They do.

**Every numbered object that carries a statement appears in an item locator.** The ten uncovered numbers are nine bare subsubsection headings (which carry no statement, only running text) and one remark.

## 2. Statuses

No `library` items, which is right for this subject — nothing here is close to Mathlib. The single `planned` item cites `GlobalShtukasAndFunctionFieldLanglands:GS.6` and `:GS.2`; both exist in `data/atlas.json`.

## 3. Routes — two Part IIs, both accepted

**`PadicDifferentialEquationsPartIIArithmeticDModules`** (parent `PadicDifferentialEquationsAndRigidCohomology`). The title reproduces the parent's exactly before the colon, as PROTOCOL §15 requires. It is not a rival roadmap: `PAPER-XU-ZHU-22` already proposes the same Part II with the same parent, so this extraction joins an existing proposal. The parent runs RD.0–RD.7 through Robba-ring and p-adic-weight theory and stops short of Berthelot's arithmetic `D^†`-modules, which §§1–2 of this paper build.

**`GlobalShtukasPartIICrystallineCompanions`** (parent `GlobalShtukasAndFunctionFieldLanglands`). Title again verbatim. The parent's GS.0–GS.7 are ℓ-adic throughout — shtukas, their moduli, excursion operators, the ℓ-adic parametrisation — and an atlas-wide search for "isocrystal", "companion" and "overconvergent" turns up nothing covering this paper (the only "companion" hits are the Tau Ceti companion lemmas and automorphic material). The p-adic correspondence and crystalline companions are unclaimed, and a Part II is the right home.

## 4. Mistakes in the paper — 27 of 27 confirmed

Every entry was read at its locator in `pcc.tex`. **All 27 quote the source verbatim** (E7 writes `varphi` where the paper writes `\phi`; nothing else differs), and all 27 are accepted. The full per-entry verdicts are in the `review` field of each `sourceIssue`. The ones worth naming:

### Settled by the paper against itself

- **E1** — the Corollary of §4.3.3 (line 10450) writes "the multiplicity of `E′(−t)` in `E`"; the Proposition it is drawn from, three lines above (line 10417), writes `E′(t)` with the same `Re(t) = (m−n)/2` and the same pole at `Z = q^{t−dim Y}`. A sign, printed twice, once each way.
- **E15** — `Tr_f` lies in `Ext⁰`, so in `E_1^{p,q} = Ext^q(f_{p+}L^ω_{X_p}, L^ω_{Y_p}) ⇒ Ext^{p+q}` it can only come from `E_1^{0,0}`; the text says `p = 1`. The next sentence — "`(Tr_f)_p` is nothing but `Tr_{f_p}`" — is the statement that the family is determined by the `p = 0` term.
- **E22** — Theorem A.3.2 sums `Tr(F_x^n)` over `x ∈ X(k_n)`. But A.3.1 defines `F_x` on `ι_x̄(E) ∈ D^b_hol(k(x)/𝔗_{k(x)})`, whose base tuple has `s′ = [k(x):k]·s`, so `F_x` is the `q^{deg x}`-Frobenius — and the appendix's own L-function, `L_x(E,Z) = det(1 − Z^{deg(x)}F_x)^{−1}`, pairs `F_x` with `Z^{deg x}` for exactly that reason. The exponent must be `n/deg x`.
- **E10** — (Var 3) writes `Tr_{f∘g}` in degree `d+e` without requiring `f∘g ∈ 𝔐_{d+e}`; §1.5.7 refers to "(Var 2) and (Var 3)" holding "when the homomorphisms in the diagrams are defined". The author reads his own diagram as conditional.
- **E5**, **E6**, **E7**, **E9**, **E16**, **E17**, **E21**, **E23** — each fails a definedness or direction check inside its own sentence. E7 is the sharpest: as printed, `Hom(X,Y) = {φ : (a⊗1)φ = (1⊗a)φ = 0 ∀a ∈ L}` gives `φ = 0` at `a = 1`, so every Hom-set would be zero.

### Settled by computation

- **E4** — the display in Remark 1.1.2 asserts `F^*(M^σ) ≅ F′^*(M^{σ′})`. For the Dwork module `(O, d + π dx)` with `σ(π) = π` and `σ′(π) = ωπ`, a horizontal comparison is multiplication by `exp((ω−1)πx)`, whose coefficient of `x^n` has absolute value `p^{−s_p(n)/(p−1)}`. That does not tend to 0 (take `n = p^m`), so the function is not a section over the closed unit disc and the isomorphism does not exist.
- **E24** — Theorem A.5.1 is stated "for any `n > 0`" with the right-hand side summed over `[𝔛(F_q)]` only. Take `𝔛 = Spec F_{q²}` over `F_q` and `M` the unit: at `n = 2` the left side is `Tr(F²) = 2` on the two-dimensional `H⁰_c`, and `[𝔛(F_q)] = ∅` makes the right side `0`.
- **E13** — Lemma 2.2.16 gives `E_1^{i,j} ⇒ H^{i+j}`, so a weight bound on an `E_1` term in cohomological degree `j` yields `weight ≥ w − w′ + j` for something contributing to total degree `i + j`: short by the simplicial index `i`. The reach is correctly traced — Theorem 2.3.38 is introduced as "a direct consequence of" this subsection and is what §§4.3.3, 4.3.11, 4.3.14 and 4.3.20 use.
- **E18** — `d_{Γ′∘Γ} = d_Γ·d_{Γ′}` fails for `G = Z/2`, `𝔛 = BG`, `Γ = Spec k` with `c_Γ = (u,u)`: `d_Γ = 2`, while `Γ∘Γ = Spec k ×_{BG} Spec k` is two copies of `Γ`, each of generic degree 2, not 4. So `norm` is not a ring homomorphism.
- **E12** — Lemma 2.2.4(iii) omits "surjective": the empty morphism is finite and flat over any `𝔆′` and has `f_+f^+M = 0`, while the proof's composite (unit, then trace) is multiplication by the degree.
- **E19**, **E20**, **E14**, **E8** — each a hypothesis that is not available where it is used: a dense open on which `Γ` is flat over `𝔛` (false for `Γ = S×{0}×P¹`, which lies in a divisor); a normal *cone* that is a bundle for an l.c.i. morphism that is not an immersion (the rank would be negative for `A¹ → Spec k`); a section of a smooth surjection onto `Spec k(s)` with `k(s)` finite; and the tuple `(k′,R′,K′,K′,s,id)`, which is not arithmetic for `k′ = F_{q^n}`, `n > 1`, because `id` does not lift the `s`-th Frobenius there — the Corollary's *other* tuple uses `s′ = [k′:k]·s` precisely to avoid this.
- **E26** — Lemma A.2.2 has no finite-presentation or qcqs hypothesis and cites "[EGA VI, 8.10.5]". There is no EGA VI; 8.10.5 is in EGA IV, and it is the result carrying those hypotheses.

### One correction in place

**E4's `affects`** was `nothing`; I set it to **`the proof`**. The display *is* the justification of Remark 1.1.2, and the remark is invoked inside the proof of Lemma 1.4.11 ("By Remark `\ref{Frobnotdep}`, we get (i)"). The remark's conclusion is not in doubt, and the entry's proposed repair — `σ^N = σ′^N` for some `N`, from the finiteness of `Aut(K/Frac W(k))` — is a reasonable route to it, but it is a sketch: it needs `σ` to normalise that group and the twisted product `τ·στσ^{−1}···` to collapse. The review reason says so rather than asserting the repair.

### Two accepted with a reservation recorded

- **E10**'s counterexample depends on reading "flat of relative dimension `d`" fibrewise-equidimensionally, which the definition of `𝔐_d` does not settle. The finding survives anyway, on §1.5.7's phrasing.
- **E27**'s second clause — that with `L`-coefficients the pole order is `μ·dim_L End(F)` — is correct, and is one of the "obvious changes" the proof waves at, but it does not damage A.4.1: the same factor appears on both sides of the comparison and cancels.

## 5. What this extraction does well

The 27 findings are not a harvest of typos. Fourteen of them (E4, E5, E8, E10, E11, E12, E13, E14, E17, E18, E19, E20, E24, E25) are hypotheses or arguments that do not hold as written, each with a stated counterexample, and in every case the entry separates the defect from its reach — most say outright that the statement is expected to hold and name the place where the proof really works. That is the right shape for a finding about a 137-page paper whose main theorem nobody doubts.

## Tools

An inventory simulator for the shared counter (243 objects, appendix lettered), a locator audit against it, and a decoder for the Shift-JIS source. Kept in the session scratchpad.
