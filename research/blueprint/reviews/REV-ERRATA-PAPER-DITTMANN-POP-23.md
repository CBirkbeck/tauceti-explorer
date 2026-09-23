# REV-ERRATA-PAPER-DITTMANN-POP-23 — review of the mistakes recorded in Dittmann–Pop (2023)

Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The errata job ERRATA-PAPER-DITTMANN-POP-23 was done by Claude Code, session `cc-fb70e5`; this reviewer took no part in it or in the paper's extraction.

**Source read.**
- **Paper.** P. Dittmann and F. Pop, *Characterizing finitely generated fields by a single field axiom*, Annals of Mathematics 198 (2023), 1203–1227.
- **Version.** arXiv 2012.01307v2 (27 April 2023), the version the errata name, downloaded fresh from arXiv. Its SHA-256 matches the recorded `f9f26f7d8d6b5cb6bf86d04bf97f8f99069d8d676623cebe706e90ea8dcb2c1f`.
- **How it was read.** Pages 4, 6, 7, 12, 14, 16 and 17 were read as page images. The remaining pages were read in the text layer.
- **Not collated.** The published Annals text is behind a paywall and was not collated, as the errata say.

**Existing corrections looked for.**
- The Annals article page links no erratum.
- arXiv v2 is the latest version.
- The later literature citing the paper was not searched beyond these.

## Verdicts on the recorded findings

- **E1 (misprint): confirmed.** In characteristic 2 the printed Pfister form tensors quadratic forms ⟨⟨a_j⟩⟩ = x₁² − a_j x₂². Quadratic forms have no tensor product there, and these ones are totally singular. [EKM, 9.B], which the paper cites, uses bilinear Pfister factors acting on ⟨⟨a₀]], and the later nonsingular 2^{i+1}-dimensional form needs that reading.
- **E2 (misprint): confirmed.** u_i² − u_i − ε_i = u_i²(1 − 1/u_i − ε_i/u_i²), so the printed "+" is wrong. Either sign gives a principal w̃-unit, so the argument stands.
- **E3 (misprint): confirmed.** W_T is defined on p. 16 with rank-one divisors, but V_T and Lemma 5.3 use full-rank flags whose residue field is the number field κ[ζ]. The second use must mean {w ∈ D^e_{K|κ} : T ⊂ O_w}, which is definable in the same way.
- **E4 (gap): confirmed.** A nonvanishing point of ḡ may have zero coordinates, and those are not roots of unity. Nonzero coordinates are also needed later: t_i ↦ ζ_i must be a unit so that w_{v′}(t_i) ⩾ 0, and ζ_i needs a Teichmüller lift. The repair is to choose ζ on the torus, which is possible because T₁⋯T_e·ḡ ≠ 0.

## Findings added by this review (all confirmed, all reaching nothing)

- **E5.** p. 4: "completion of k" and "real closure of k" should both read k₁.
- **E6.** p. 4: ∂ₓ : H^{i+1}(K) → H^d(κ(x)) should be H^{d+1}(K) → H^d(κ(x)).
- **E7.** p. 4: K_v̂ := K k₁v̂ := Quot(K ⊗_{k₁} k₁v) should end with k₁v̂. As printed, K_v̂ equals the K_v of the next sentence, which is meant to be a subfield of it; Jannsen's F_v is the completion.
- **E8.** p. 7: "the projective smooth Kw-variety" should read Fw-variety.
- **E9 (gap).** p. 7: the chain cd(E′_{v′}) ⩽ cd(E′) ⩽ dim(E′) + 1 fails at its middle step when E′ is formally real, which can happen. The bound cd₂(E′_{v′}) ⩽ cd₂(k′_{v′}) + td ⩽ dim(E′) + 1 gives the same conclusion.
- **E10.** p. 11: "the neighborhood V_{E|F} of q_a" should read "of w".
- **E11.** p. 14, twice: D_{K|k_a} should read D_{K|k_t}.
- **E12.** p. 18: three bibliography page ranges, checked against Crossref: [Du] 808–823, [Ka] 493–510, [P1] 385–408.

`python3 scripts/check_errata.py research/blueprint/errata/PAPER-DITTMANN-POP-23.json` reports `ok`.

**Checked and not recorded.**
- **Claim 2 and Theorem 4.2, 1).** The inequalities in Claim 2 of Proposition 3.10 were checked, as was the identity a_d = (a_dβ/τ)²(1 − 1/β) in the proof of Theorem 4.2, 1).
- **Riemann–Roch.** So was the Riemann–Roch choice of a_d = 1/f in Theorem 4.2, 2).
- **Stabilizer equality.** So was the stabilizer equality O_a = ∩ O_w, which the errata job rightly did not list.
- **Language slips.** Slips without mathematical content ("For an field", "there is there is", "that that", "Complèxe") are not recorded.

## Question for the orchestrator

**Collating the published text.** All twelve findings are located in arXiv v2. The published Annals text was not collated by either job. If a subscriber copy becomes available, E5–E12 should be checked against it, since some of these slips may have been corrected at the copy-editing stage.
